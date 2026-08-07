const express = require('express');
const cors = require("cors");
const app = express(); //(目前沒用到)
const path = require('path');
const fs = require('fs');
// const cookieParser = require('cookie-parser'); //middleware(目前沒用到)

// 測試機 https://stage-www.kiwipin.com/
const CDN_STAGE = 'https://stage-www-page.kiwipin.com';
const WALLET_CDN_STAGE = 'https://stage-wallet.kiwipin.com';
const WALLET_STAGE = '';
const WALLET_STAGE_T = '';

// 正式機 https://www.kiwipin.com/
const CDN_PROD = 'https://www-page.kiwipin.com';
const WALLET_CDN_PROD = 'https://wallet.kiwipin.com';
const WALLET_PROD = '';
const WALLET_PROD_T = '';

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
// app.use('/scss/zh_TW', express.static(path.join(__dirname, 'scss/zh_TW')));
// app.use('/scss/en_US', express.static(path.join(__dirname, 'scss/en_US')));
app.use('/scss', express.static(path.join(__dirname, 'scss')));
app.use('/assets', express.static(path.join(__dirname, 'assets')));
// app.use(cookieParser());
// app.use(express.static(path.join(__dirname, 'dist')));

// 定義每個頁面的 metadata
// const pageMeta = {
//   'index': { title: 'KIWIPIN' },
//   'product_list': { title: '購買點數 | KIWIPIN' },
//   'point_detail': { title: '購買點數 | KIWIPIN' },
//   'point_add': { title: '購買點數 | KIWIPIN' },
//   'product': { title: '購買點數 | KIWIPIN' },
//   'privacy_policy': { title: '隱私權政策 | KIWIPIN' },
//   'terms_of_service': { title: '會員服務同意書 | KIWIPIN' },
// };
// function normalizeLang(rawLang) {
//   if (!rawLang) return 'en_US';
//   return rawLang.replace('-', '_');
// }
//檔案版好參數
const version = '?v=20250825a';

// 遞迴掃描 views 資料夾內所有 .ejs 檔案（排除 layout 資料夾）
function walkViews(dir, fileList = []) {
  fs.readdirSync(dir).forEach(file => {
    const fullPath = path.join(dir, file);
    const relative = path.relative(path.join(__dirname, 'views'), fullPath);
    if (fs.statSync(fullPath).isDirectory()) {
      if (relative.startsWith('layout')) return;
      walkViews(fullPath, fileList);
    } else if (file.endsWith('.ejs')) {
      fileList.push(relative);
    }
  });
  return fileList;
}

// 抓ejs檔案
const viewFiles = walkViews(path.join(__dirname, 'views'));

// 路由
viewFiles.forEach(relativePath => {
  const templateName = relativePath.replace(/\\/g, '/').replace(/\.ejs$/, '');
  const route = templateName === 'index' ? '/' : '/' + templateName;

  const key = path.basename(templateName); // 抓檔案名稱
  // const meta = pageMeta[key] || { title: 'KIWIPIN' };

  app.get(route, (req,res) => {
    // const rawLang = req.cookies.userLang || req.headers['accept-language'] || 'en-US'; //(目前沒用到)
    // const lang = normalizeLang(rawLang); //(目前沒用到)
    res.render(templateName, {
      // title: meta.title,
      cdn: CDN_STAGE,
      wallet_cdn: WALLET_CDN_STAGE,
      // wallet_cdn: WALLET_CDN_PROD,
      wallet: WALLET_STAGE,
      version:version
    //   lang: lang //(目前沒用到)
    });
  });

  console.log(`✅ 註冊路由: ${route} → views/${templateName}.ejs`);
});

  // app.listen(3000, () => {
  //   console.log('🚀 Server running at http://localhost:3000');
  // });

app.use(cors());           // 允許本地前端跨域
app.use(express.json());   // 解析 JSON body

const PORT = 3000; // 本地 proxy port

app.post("/sendVerifyCode", async (req, res) => {
  try {
    const response = await fetch(WALLET_CDN_PROD+"/sendVerifyCode", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        // 只有在有 token 時再加
        // "Authorization": `Bearer ${req.body.TOKEN || ""}`
      },
      body: JSON.stringify({
        TYPE: req.body.TYPE,
        EMail: req.body.EMail
      })
    });

    const data = await response.json();
    res.json(data); // 將後端回傳的 JSON 直接回給前端
  } catch (err) {
    console.error("Proxy error:", err);
    res.status(500).json({ SendResult: "Fail", SendResult_Message: "Proxy 發生錯誤" });
  }
});
app.post("/forget_pay_password", (req, res) => {
  res.json({
    SendResult: "Success",
    SendResult_Title: "傳送成功",
    SendResult_Message: "新的交易密碼已發送到您的EMAIL",
    token: "MXDTTB491U5K9ZYKPMURNBGR5BPG31GO"
  });
});

app.listen(PORT, () => {
  console.log(`Proxy server running at http://localhost:${PORT}`);
});