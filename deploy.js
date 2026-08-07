require('dotenv').config(); // 讀取 .env

const AWS = require('aws-sdk');
const fg = require('fast-glob');
const md5File = require('md5-file');
const fs = require('fs');
const path = require('path');
const mime = require('mime-types');

// ===== 1. 環境設定 =====
const env = process.env.NODE_ENV || 'stage'; 

// 根據環境選擇 Bucket: kiwipin-stage 或 kiwipin
const S3_BUCKET = env === 'stage'
    ? process.env.S3_BUCKET_STAGE
    : process.env.S3_BUCKET_PROD;

// 根據環境選擇本地編譯資料夾
const DIST_DIR = env === 'stage'
    ? process.env.DIST_STAGE
    : process.env.DIST_PROD;

// 取得該專案在 S3 的子目錄名稱 (www / wallet / api)
const PROJECT_TARGET = process.env.PROJECT_TARGET; 

const ASSETS_DIR = process.env.ASSETS_DIR;

// ===== 2. AWS 設定 =====
AWS.config.update({
    region: process.env.AWS_REGION,
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
});

const s3 = new AWS.S3();
const cloudfront = new AWS.CloudFront();

// ===== 3. 取得 S3 已有檔案 ETag =====
async function getS3FileETags(prefix) {
    const objects = {};
    let ContinuationToken = null;
    do {
        const res = await s3.listObjectsV2({
            Bucket: S3_BUCKET,
            Prefix: prefix,
            ContinuationToken
        }).promise();

        if (res.Contents) {
            res.Contents.forEach(obj => {
                objects[obj.Key] = obj.ETag.replace(/"/g, '');
            });
        }

        ContinuationToken = res.IsTruncated ? res.NextContinuationToken : null;
    } while (ContinuationToken);

    return objects;
}

// ===== 4. 上傳檔案 =====
async function uploadFile(localPath, s3Key) {
    const content = fs.readFileSync(localPath);
    const contentType = mime.lookup(localPath) || 'application/octet-stream';

    const params = {
        Bucket: S3_BUCKET,
        Key: s3Key,
        Body: content,
        ContentType: contentType,
        // 設定快取策略：HTML 與 CSS 不快取，其餘資源（如帶有 Hash 的 JS/圖片）快取一年
        CacheControl: s3Key.endsWith('.css') || s3Key.endsWith('.html') ? 'no-cache' : 'max-age=31536000'
    };

    await s3.putObject(params).promise();
    console.log(`✅ Uploaded: ${s3Key} (${contentType})`);
}

// ===== 5. CloudFront 清除快取 (預留區) =====

// ===== 6. 增量上傳資料夾 =====
async function deployFolder(localFolder, s3SubPath = '') {
    // 組合最終的 S3 前綴：例如 "wallet" 或 "wallet/assets"
    const finalPrefix = [PROJECT_TARGET, s3SubPath].filter(Boolean).join('/');
    
    const s3Files = await getS3FileETags(finalPrefix);
    const files = await fg([`${localFolder}/**/*`], { onlyFiles: true });

    for (const file of files) {
        // 取得相對於本地資料夾的路徑
        const relativePath = path.relative(localFolder, file).replace(/\\/g, '/');
        
        // 組合最終 S3 Key: PROJECT_TARGET/s3SubPath/relativePath
        const s3Key = [finalPrefix, relativePath].filter(Boolean).join('/');

        const md5 = md5File.sync(file);
        if (s3Files[s3Key] !== md5) {
            await uploadFile(file, s3Key);
        } else {
            console.log(`⚡ Skipped (unchanged): ${s3Key}`);
        }
    }
}

// ===== 7. 主流程 =====
(async () => {
    try {
        // 檢查必要變數
        if (!S3_BUCKET) {
            throw new Error("S3_BUCKET is not defined for this environment");
        }
        if (!PROJECT_TARGET) {
            throw new Error("PROJECT_TARGET is not defined in .env (e.g., www, wallet, or api)");
        }

        console.log(`🚀 Deploying [${PROJECT_TARGET}] to environment: ${env}`);
        console.log(`📦 Target Location: s3://${S3_BUCKET}/${PROJECT_TARGET}/`);

        // 1. 上傳主要編譯後的檔案 (dist)
        const fullDistPath = path.resolve(DIST_DIR);
        if (fs.existsSync(fullDistPath)) {
            await deployFolder(fullDistPath);
        } else {
            console.warn(`⚠️ Warning: DIST_DIR not found at ${fullDistPath}`);
        }

        // 2. 上傳額外的 assets 資源 (如果有設定的話)
        const fullAssetsPath = path.resolve(ASSETS_DIR || '');
        if (ASSETS_DIR && fs.existsSync(fullAssetsPath)) {
            await deployFolder(fullAssetsPath, 'assets');
        }

        console.log(`🎉 [${PROJECT_TARGET}] Deployment complete!`);
    } catch (err) {
        console.error('❌ Deployment failed:', err);
        process.exit(1);
    }
})();