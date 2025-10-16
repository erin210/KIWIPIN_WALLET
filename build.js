//設定環境變數（移除initFunction用的）
process.env.DISABLE_INIT = "true";

const fs = require('fs');
const ejs = require('ejs');
const path = require('path');

// 測試機 https://stage-www.kiwipin.com/
const CDN_STAGE = 'https://stage-www-page.kiwipin.com';
const WALLET_CDN_STAGE = 'https://stage-wallet.kiwipin.com';
const WALLE_PAGE_STAGE = 'https://stage-wallet-page.kiwipin.com';
const WALLE_PAGE_STAGE_T = 'https://stage-wallet-page-t.kiwipin.com';

// 正式機 https://www.kiwipin.com/
const CDN_PROD = 'https://www-page.kiwipin.com';
const WALLET_CDN_PROD = 'https://wallet.kiwipin.com';
const WALLET_PAGE_PROD = 'https://wallet-page.kiwipin.com/';
const WALLET_PAGE_PROD_T = 'https://wallet-page-t.kiwipin.com/';

//檔案版好參數
const version = '?v=20250825a';

// 輸出資料夾
const viewsDir = path.join(__dirname, 'views');
const outDirs = {
  stage: path.join(__dirname, 'dist1_stage'),
  prod: path.join(__dirname, 'dist2_prod'),
};

// 定義每個頁面的 metadata
const pageMeta = {
  'index': {
    title: 'KIWIPIN'
  },
  'product_list': {
    title: '購買點數 | KIWIPIN'
  },
  'point_detail': {
    title: '購買點數 | KIWIPIN'
  },
  'point_add': {
    title: '購買點數 | KIWIPIN'
  },
  'product': {
    title: '購買點數 | KIWIPIN'
  },
  'privacy_policy': {
    title: '隱私權政策 | KIWIPIN'
  },
  'terms_of_service': {
    title: '會員服務同意書 | KIWIPIN'
  },
};

// 確保輸出資料夾存在
Object.values(outDirs).forEach(dir => {
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir);
  }
});

// 讀取 views 裡所有 .ejs 檔案（忽略 layout 資料夾）
function compileEjsFolder(srcDir, subDir = '') {
  const files = fs.readdirSync(srcDir)
    .filter(file => file.endsWith('.ejs') && !file.startsWith('layout/'));

  files.forEach(file => {
    const templatePath = path.join(srcDir, file);
    const template = fs.readFileSync(templatePath, 'utf-8');
    const baseName = path.basename(file, '.ejs');
    const meta = pageMeta[baseName] || {
      title: 'KIWIPIN WALLET'
    };

    //宣告變數（移除initFunction用的）
    let processedTemplate = template;
    if (process.env.DISABLE_INIT === "true") {
      processedTemplate = processedTemplate.replace(/initFunction\s*\([\s\S]*?\)\s*;?/g, '');
    }

    targets.forEach(target => {
      const outDir = path.join(target.dir, subDir);
      if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

      target.suffixes.forEach((suffix, i) => {
        const wallet = target.wallet[i];

        //跑processedTemplate套用到流程裡（移除initFunction用的）
        const html = ejs.render(processedTemplate, {
          cdn: target.cdn,
          wallet_cdn: target.wallet_cdn,
          wallet: wallet,
          title: meta.title,
          version: version
        }, {
          filename: templatePath,
          views: [viewsDir]
        });

        const outputFileName = `${baseName}${suffix}.html`;
        const outputFile = path.join(outDir, outputFileName);
        fs.writeFileSync(outputFile, html);
        console.log(`✅ 已輸出：${outputFile}`);
      });
    });
  });
}

// 定義 targets (放在最外層)
const targets = [
  {
    dir: outDirs.stage,
    suffixes: ['', '-t'],
    cdn: CDN_STAGE,
    wallet_cdn: WALLET_CDN_STAGE,
    wallet: [WALLE_PAGE_STAGE, WALLE_PAGE_STAGE_T]
  },
  {
    dir: outDirs.prod,
    suffixes: ['', '-t'],
    cdn: CDN_PROD,
    wallet_cdn: WALLET_CDN_PROD,
    wallet: [WALLET_PAGE_PROD, WALLET_PAGE_PROD_T]
  }
];

// 執行編譯：一般頁面
compileEjsFolder(viewsDir);

// 執行編譯：email_template 資料夾
compileEjsFolder(path.join(viewsDir, 'email_template'), 'email_template');
