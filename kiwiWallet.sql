--搜尋StringID
SELECT * FROM Kiwi_StringID 
WHERE StringID ='LANGUAGE';

--修改字串內容
UPDATE Kiwi_StringID 
SET String ='日本語' 
WHERE StringID ='LANGUAGE' 
  AND Language ='ja_JP';

--修改 UI PAGE
UPDATE Kiwi_StringID 
SET UI_Page ='Language,INDEX,PRODUCT_LIST,PRODUCT,RETURN,POLICY,TERMS,LOGIN' 
WHERE StringID ='LANGUAGE' 
  AND Language ='ja_JP';

---查詢StringID 沒有出現3次的欄位
SELECT StringID, COUNT(*) AS 出現次數
FROM Kiwi_StringID
GROUP BY StringID
HAVING COUNT(*) <> 3;

------------------------------------------
--建立StringID
INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_TAB_LOGIN','ja_JP','ログイン','LOGIN,REGISTER'),
('WL_TAB_REGISTER','ja_JP','新規登録','LOGIN,REGISTER'),
('WL_TAB_FORGET_PW','ja_JP','パスワード再設定','FORGET_PASSWORD'),
('WL_BACK_LOGIN','ja_JP','ログインに戻る','FORGET_PASSWORD'),
('WL_CONFIRM','ja_JP','確認','FORGET_PASSWORD,REGISTER,CHANGE_PAY_PASSWORD'),
('WL_LOGOUT','ja_JP','ログアウト','HOME,HISTORY,CHANGE_PASSWORD,CHANGE_PAY_PASSWORD,RETURN,DEDUCT,PURCHASE'),
('WL_CANCEL','ja_JP','キャンセル','CHANGE_PAY_PASSWORD'),
('WL_SEND_S','ja_JP','送信成功','FORGET_PASSWORD,REGISTER,CHANGE_PAY_PASSWORD'),
('WL_SEND_F','ja_JP','送信失敗','FORGET_PASSWORD,REGISTER,CHANGE_PAY_PASSWORD'),
('WL_LOGIN_REMIND','ja_JP','お客様の権利を保護するため、KIWI WALLETのご利用にはアカウントへのログインが必要です。便利なサービスをご利用いただくために、ログインをお願いいたします。','LOGIN'),
('WL_U_EMAIL_TITLE','ja_JP','会員メールアドレス','LOGIN,REGISTER,FORGET_PASSWORD'),
('WL_U_EMAIL_HINT','ja_JP','メールアドレスを入力してください','LOGIN,REGISTER,FORGET_PASSWORD'),
('WL_U_EMAIL_MSG_EMPTY','ja_JP','メールアドレスを入力してください','LOGIN,REGISTER,FORGET_PASSWORD'),
('WL_MSG_ERROR','ja_JP','有効なメールアドレス形式を入力してください','LOGIN,REGISTER,FORGET_PASSWORD'),
('WL_U_PASSWORD_TITLE','ja_JP','ログインパスワード','LOGIN,REGISTER'),
('WL_U_PASSWORD_HINT','ja_JP','会員パスワードを入力してください','LOGIN,REGISTER,CHANGE_PAY_PASSWORD'),
('WL_U_PASSWORD_MSG_EMPTY','ja_JP','ログインパスワードを入力してください','LOGIN,REGISTER'),
('WL_U_PASSWORD_MSG_ERROR','ja_JP','パスワードは英数字を組み合わせた8文字以上である必要があります','LOGIN,REGISTER,CHANGE_PASSWORD'),
('WL_FORGET_PW','ja_JP','パスワードをお忘れですか？','LOGIN'),
('WL_FORGET_PAY_PW','ja_JP','取引パスワードをお忘れですか？','CHANGE_PAY_PASSWORD'),
('WL_LOGIN_NOTICE','ja_JP','アカウントをお持ちではありませんか？','LOGIN');

--建立StringID
INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_EOS_TITLE','en_US','KIWIPIN Platform Termination Notice','HOME'), 
('WL_EOS_TEXT_BASE64','en_US','UGxlYXNlIGJlIGFkdmlzZWQgdGhhdCB0aGUgS0lXSVBJTiBwbGF0Zm9ybSB3aWxsIG9mZmljaWFsbHkgY2Vhc2UgYWxsIG9wZXJhdGlvbnMgb24gPHNwYW4gc3R5bGU9ImNvbG9yOiAjOEZCMERDOyBmb250LXdlaWdodDogYm9sZDsiPkp1bmUgMzAsIDIwMjY8L3NwYW4+Ljxicj48YnI+V2Ugd291bGQgbGlrZSB0byByZW1pbmQgeW91IHRoYXQgYW55IHJlbWFpbmluZyBiYWxhbmNlIGluIHlvdXIgS0lXSSBXYWxsZXQgbXVzdCBiZSBmdWxseSB1dGlsaXplZCBwcmlvciB0byB0aGUgdGVybWluYXRpb24gZGF0ZS4gVXBvbiBjZXNzYXRpb24gb2Ygb3BlcmF0aW9ucywgYWxsIHVudXNlZCBwb2ludHMgd2lsbCBiZWNvbWUgaW52YWxpZCwgYW5kIG5vIHJlZnVuZHMgb3IgY2FzaCByZWRlbXB0aW9ucyB3aWxsIGJlIHByb3ZpZGVkLiBUbyBzYWZlZ3VhcmQgeW91ciByaWdodHMgYW5kIGludGVyZXN0cywgcGxlYXNlIGVuc3VyZSB5b3VyIHBvaW50cyBhcmUgdXNlZCBhcyBzb29uIGFzIHBvc3NpYmxlLg==','HOME'), 
('WL_EOS_BTN','en_US','I Understand','HOME'), 
('WL_EOS_TITLE','zh_TW','KIWIPIN 平台結束營運公告','HOME'), 
('WL_EOS_TEXT_BASE64','zh_TW','S0lXSVBJTuW5s+WPsOWwh+aWvDxzcGFuIHN0eWxlPSJjb2xvcjogIzhGQjBEQzsgZm9udC13ZWlnaHQ6IGJvbGQ7Ij4yMDI25bm0NuaciDMw5pelPC9zcGFuPue1kOadn+eHn+mBi++8jOeJueatpOWFrOWRiuOAgjxicj48YnI+5o+Q6YaS5oKo77yM5oKo5biz5oi25YWn5a2Y5ZyoIEtJV0kgV2FsbGV0IOeahOaJgOaciem7nuaVuO+8jOiri+WLmeW/heaWvOe1kOadn+eHn+mBi+WJjeWFqOaVuOS9v+eUqOWujOeVouOAgumAvuacn+Wwh+WFqOaVuOWkseaViO+8jOS4lOS4jeaPkOS+m+mAgOasvuaIluaKmOePvuOAgueCuuS/nemanOaCqOeahOasiuebiu+8jOiri+WEmOmAn+S9v+eUqOWujOeVou+8gQ==','HOME'), 
('WL_EOS_BTN','zh_TW','我知道了','HOME'), 
('WL_EOS_TITLE','ja_JP','KIWIPIN サービス終了のお知らせ','HOME'), 
('WL_EOS_TEXT_BASE64','ja_JP','5bmz57Sg44Gv5qC85Yil44Gu44GU5oSb6aGn44KS6LOc44KK44CB5Y6a44GP5b6h56S855Sz44GX5LiK44GS44G+44GZ44CCPGJyPgrjgZPjga7jgZ/jgbPjgIFLSVdJUElO44OX44Op44OD44OI44OV44Kp44O844Og44Gv44CBPHNwYW4gc3R5bGU9ImNvbG9yOiAjOEZCMERDOyBmb250LXdlaWdodDogYm9sZDsiPjIwMjblubQ25pyIMzDml6U8L3NwYW4+44KS44KC44Gh44G+44GX44Gm44K144O844OT44K544KS57WC5LqG44GV44Gb44Gm44GE44Gf44Gg44GP44GT44Go44Go44Gq44KK44G+44GX44Gf44CCPGJyPjxicj4K44Gk44GN44G+44GX44Gm44Gv44CB44GK5a6i5qeY44GuS0lXSSBXYWxsZXTlhoXjgavmrovpq5jvvIjjg53jgqTjg7Pjg4jvvInjgYzjgZTjgZbjgYTjgb7jgZfjgZ/jgonjgIHlv4XjgZrjgrXjg7zjg5PjgrnntYLkuobliY3jgb7jgafjgavjgZnjgbnjgabkvb/jgYTliIfjgaPjgabjgYTjgZ/jgaDjgY3jgb7jgZnjgojjgYbjgYrpoZjjgYTnlLPjgZfkuIrjgZLjgb7jgZnjgILjgrXjg7zjg5PjgrnntYLkuobmnJ/ml6XjgpLpgY7jgY7jgb7jgZnjgajjgIHjgZnjgbnjgabjga7jg53jgqTjg7Pjg4jjga/lpLHlirnjgajjgarjgorjgIHmiZXjgYTmiLvjgZfjgoTnj77ph5Hjgbjjga7mj5vph5Hjgavjga/lv5zjgZjjgYvjga3jgb7jgZnjga7jgafkuojjgoHjgZTkuobmib/jgY/jgaDjgZXjgYTjgILjgYrlrqLmp5jjga7osrTph43jgarmqKnliKnjgpLkv53orbfjgZnjgovjgZ/jgoHjgIHjgYrml6njgoHjgavjgZTliKnnlKjjgYTjgZ/jgaDjgY3jgb7jgZnjgojjgYbjgYrpoZjjgYTnlLPjgZfkuIrjgZLjgb7jgZnjgII=','HOME'), 
('WL_EOS_BTN','ja_JP','了解いたしました','HOME');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_BTN_GO_REG','ja_JP','新規登録へ','LOGIN'),
('WL_LOGIN_VERIFY_INFO_UNKNOWN','ja_JP','このアカウントは存在しません！','LOGIN'),
('WL_LOGIN_VERIFY_INFO_ERROR','ja_JP','パスワードが間違っています！','LOGIN'),
('WL_FORGET_PW_REMIND','ja_JP','登録済みのメールアドレスを入力してください。システムから認証コードが送信されます。パスワードを再設定するために、その認証コードを正しく入力してください。','FORGET_PASSWORD'),
('WL_SEND_VERIFY_CODE_BTN','ja_JP','認証コードを送信','FORGET_PASSWORD,REGISTER'),
('WL_SEND_VERIFY_CODE_ING','ja_JP','送信中...','FORGET_PASSWORD,REGISTER'),
('WL_SEND_VERIFY_CODE_COUNT','ja_JP','送信済み','FORGET_PASSWORD,REGISTER'),
('WL_SEND_VERIFY_CODE_RESEND','ja_JP','再送信','FORGET_PASSWORD,REGISTER'),
('WL_VERIFY_TITLE_S','ja_JP','認証コードの送信に成功しました','FORGET_PASSWORD,REGISTER'),
('WL_VERIFY_INFO_S','ja_JP','認証コードが送信されました：','FORGET_PASSWORD,REGISTER'),
('WL_VERIFY_TITLE_F','ja_JP','エラーが発生しました！','FORGET_PASSWORD,REGISTER,CHANGE_PAY_PASSWORD,CHANGE_PASSWORD'),
('WL_VERIFY_INFO_F','ja_JP','認証コードの送信に失敗しました：','FORGET_PASSWORD,REGISTER'),
('WL_FORGET_PW_VERIFY_INFO_F','ja_JP','このメールアドレスは使用されていません！','FORGET_PASSWORD'),
('WL_REG_VERIFY_INFO_F','ja_JP','このメールアドレスは既に登録されています！','REGISTER'),
('WL_SUBMIT_TITLE_F','ja_JP','エラーが発生しました','FORGET_PASSWORD,REGISTER'),
('WL_SUBMIT_INFO_F','ja_JP','認証コードが間違っているか、有効期限が切れています！','FORGET_PASSWORD,REGISTER'),
('WL_U_VERIFY_CODE_TITLE','ja_JP','認証コード','FORGET_PASSWORD,REGISTER'),
('WL_U_VERIFY_CODE_HINT','ja_JP','認証コードを入力してください','FORGET_PASSWORD,REGISTER'),
('WL_U_VERIFY_CODE_MSG_EMPTY','ja_JP','認証コードを入力してください','FORGET_PASSWORD,REGISTER');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_FORGET_PW_SUBMIT_TITLE_S','ja_JP','パスワードの変更に成功しました！','FORGET_PASSWORD'),
('WL_FORGET_PW_SUBMIT_INFO_S','ja_JP','新しいパスワードをメールアドレスに送信しました。パスワードを忘れずに、再度ログインしてください。','FORGET_PASSWORD'),
('WL_FORGET_PW_SUBMIT_INFO_F','ja_JP','新しいパスワードの送信に失敗しました：','FORGET_PASSWORD'),
('WL_U_PAY_PASSWORD_TITLE','ja_JP','取引パスワード','REGISTER'),
('WL_U_PAY_PASSWORD_HINT','ja_JP','ウォレットの取引パスワードを入力してください','REGISTER'),
('WL_U_PAY_PASSWORD_MSG_EMPTY','ja_JP','取引パスワードを入力してください','REGISTER,DEDUCT'),
('WL_U_PAY_PASSWORD_MSG_ERROR','ja_JP','6桁の数字を入力してください','REGISTER,CHANGE_PAY_PASSWORD,DEDUCT'),
('WL_U_PAY_PASSWORD_CHECK_TITLE','ja_JP','取引パスワードの確認','REGISTER'),
('WL_U_PAY_PASSWORD_CHECK_HINT','ja_JP','ウォレットの取引パスワードをもう一度入力してください','REGISTER'),
('WL_U_PAY_PASSWORD_CHECK_MSG_EMPTY','ja_JP','取引パスワードをもう一度入力してください','REGISTER'),
('WL_U_PAY_PASSWORD_CHECK_MSG_ERROR','ja_JP','新しいパスワードの再入力が一致しません','REGISTER,CHANGE_PAY_PASSWORD,CHANGE_PASSWORD'),
('WL_AGREE_LABEL','ja_JP','読み、同意する','REGISTER'),
('WL_AGREE_LABEL_LINK1','ja_JP','会員サービス利用規約','REGISTER'),
('WL_AGREE_LABEL_LINK2','ja_JP','プライバシーポリシー','REGISTER'),
('WL_AGREE_HINT','ja_JP','同意にチェックを入れてください','REGISTER'),
('WL_TAB_HOME','ja_JP','概要','HOME,HISTORY,CHANGE_PASSWORD,CHANGE_PAY_PASSWORD'),
('WL_TAB_HISTORY','ja_JP','取引履歴','HOME,HISTORY,CHANGE_PASSWORD,CHANGE_PAY_PASSWORD'),
('WL_TAB_CHANGE_PAY_PASSWORD','ja_JP','取引設定','HOME,HISTORY,CHANGE_PASSWORD,CHANGE_PAY_PASSWORD'),
('WL_TAB_CHANGE_PASSWORD','ja_JP','アカウント設定','HOME,HISTORY,CHANGE_PASSWORD,CHANGE_PAY_PASSWORD'),
('WL_TAB_TOPUP','ja_JP','チャージ','HOME,PURCHASE,API,RETURN,DEDUCT'),
('WL_SUMMARY','ja_JP','ウォレット概要','HOME');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_BALANCE','ja_JP','ウォレット残高','HOME'),
('WL_POINT','ja_JP','ポイント','HOME,RETURN,DEDUCT'),
('WL_HISTORY_DATE','ja_JP','取引日時','HISTORY'),
('WL_HISTORY_CID_NAME','ja_JP','サービス名','HISTORY'),
('WL_HISTORY_PRODUCT_NAME','ja_JP','商品名','HISTORY'),
('WL_HISTORY_COID','ja_JP','注文番号','HISTORY'),
('WL_HISTORY_AMOUNT_ADD_USE','ja_JP','取引ポイント','HISTORY'),
('WL_HISTORY_AMOUNT_AFTER','ja_JP','残りポイント','HISTORY'),
('WL_HISTORY_INFO_EMPTY','ja_JP','取引履歴がありません','HISTORY'),
('WL_RESET_PAY_PW','ja_JP','取引パスワードの変更','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_TITLE','ja_JP','現在の取引パスワード','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_HINT','ja_JP','現在の取引パスワードを入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_MSG_EMPTY','ja_JP','現在の取引パスワードを入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_REMIND','ja_JP','お客様の本人確認のため、会員パスワードを入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_REMIND_INFO_S','ja_JP','新しい取引パスワードをメールアドレスに送信しました。パスワードを忘れずに保管してください。','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_PAY_PASSWORD_REMIND_INFO_F','ja_JP','新しい取引パスワードの送信に失敗しました：','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_HINT','ja_JP','新しい取引パスワードを入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_MSG_EMPTY','ja_JP','新しい取引パスワードを入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_CHECK_HINT','ja_JP','新しい取引パスワードをもう一度入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_CHECK_MSG_EMPTY','ja_JP','新しい取引パスワードをもう一度入力してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_INFO_S','ja_JP','取引パスワードを忘れずに保管してください','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_INFO_F','ja_JP','現在の取引パスワードが間違っています','CHANGE_PAY_PASSWORD'),
('WL_RESET_U_NEW_PAY_PASSWORD_SUBMIT_INFO_S','ja_JP','取引パスワードが変更されました。パスワードを忘れずに保管してください。','CHANGE_PAY_PASSWORD');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_RESET_PWTITLE','ja_JP','アカウントパスワードの変更','CHANGE_PASSWORD'),
('WL_RESET_U_PASSWORD_TITLE','ja_JP','現在のアカウントパスワード','CHANGE_PASSWORD'),
('WL_RESET_U_PASSWORD_HINT','ja_JP','現在のアカウントパスワードを入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_PASSWORD_MSG_EMPTY','ja_JP','現在のアカウントパスワードを入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_HINT','ja_JP','新しいアカウントパスワードを入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_MSG_EMPTY','ja_JP','新しいアカウントパスワードを入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_CHECK_HINT','ja_JP','新しいアカウントパスワードをもう一度入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_CHECK_MSG_EMPTY','ja_JP','新しいアカウントパスワードをもう一度入力してください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_INFO_S','ja_JP','新しいアカウントパスワードを忘れずに保管し、再度ログインしてください','CHANGE_PASSWORD'),
('WL_RESET_U_NEW_PASSWORD_INFO_F','ja_JP','現在のログインパスワードが間違っています','CHANGE_PASSWORD'),
('WL_RESET_NEW_PASSWORD','ja_JP','新しいパスワード','CHANGE_PAY_PASSWORD,CHANGE_PASSWORD'),
('WL_RESET_NEW_PASSWORD_CHECK','ja_JP','新しいパスワードの確認','CHANGE_PAY_PASSWORD,CHANGE_PASSWORD');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_RESET_BTN','ja_JP','変更','CHANGE_PAY_PASSWORD,CHANGE_PASSWORD'),
('WL_RESET_NEW_PASSWORD_TITLE_S','ja_JP','パスワードの変更に成功しました','CHANGE_PASSWORD,CHANGE_PAY_PASSWORD'),
('WL_WALLET_TOPUP','ja_JP','ウォレットへのチャージ','PURCHASE'),
('WL_BACK_BTN','ja_JP','戻る','PURCHASE'),
('WL_WALLET_HOWMANY_POINT','ja_JP','KIWI ウォレット [$$] ポイント','PURCHASE'),
('WL_RETURN_TITLE','ja_JP','チャージ結果','RETURN'),
('WL_NOTIFY_TITLE_S','ja_JP','おめでとうございます！チャージ成功','RETURN'),
('WL_NOTIFY_TITLE_F','ja_JP','チャージ失敗','RETURN'),
('WL_AMOUNT_TITLE','ja_JP','チャージ金額','RETURN'),
('WL_COID_TITLE','ja_JP','注文番号','RETURN'),
('WL_DATE_TITLE','ja_JP','チャージ日時','RETURN'),
('WL_RMSG_CHI_TITLE','ja_JP','注文ステータス','RETURN'),
('WL_BACK_HOME_BTN','ja_JP','概要へ戻る','RETURN'),
('WL_CHECK_PAYMENT','ja_JP','取引確認','DEDUCT'),
('WL_CHECK_PAYMENT_F','ja_JP','取引失敗','DEDUCT'),
('WL_DEDUCT_AMOUNT_TITLE','ja_JP','取引ポイント','DEDUCT'),
('WL_WALLET_AMOUNT_TITLE','ja_JP','ウォレットポイント','DEDUCT'),
('WL_CID_NAME_TITLE','ja_JP','サービス名','DEDUCT'),
('WL_PRODUCT_NAME_TITLE','ja_JP','商品名','DEDUCT'),
('WL_CHECK_U_PAY_PASSWORD_TITLE','ja_JP','取引パスワードを入力してください','DEDUCT'),
('WL_CHECK_U_PAY_PASSWORD_HINT','ja_JP','取引パスワードは6桁の数字です','DEDUCT'),
('WL_CHECK_BTN','ja_JP','取引を確定','DEDUCT'),
('WL_TOPUP_BTN','ja_JP','チャージへ進む','DEDUCT'),
('WL_CANCEL_BTN','ja_JP','取引をキャンセル','DEDUCT'),
('WL_CHECK_REMIND_F','ja_JP','ウォレットの残高が不足しています。先にポイントをチャージしてから取引を行ってください','DEDUCT'),
('WL_CHECK_U_PAY_PASSWORD_HINT_F','ja_JP','取引パスワードは既に [$$] 回間違っています。残り [$$] 回のチャンスがあります','DEDUCT'),
('WL_CHECK_U_PAY_PASSWORD_HINT_F_END','ja_JP','取引パスワードの誤入力回数が上限に達しました','DEDUCT');



--mail string------
INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('MAIL_BUY_SUBJECT','ja_JP','KIWI ポイントカード購入完了','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_INFO_1','ja_JP','購入商品｜KIWI 2000','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_INFO_2','ja_JP','ポイントカードのシリアル番号｜1000004544','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_TEXT','ja_JP','KIWIピンコードをご購入いただき、ありがとうございます。<br>以下のピンコードを使用して、交換してください。','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_PW','ja_JP','PINコード','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_PW_CODE','ja_JP','ACSKPA5NMJ74QLT1','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_START_TIME','ja_JP','有効化日｜2025-02-04 09:27:12','BUY_SUCCESS_TEMPLATE'),
('MAIL_BUY_EXPIRY_TIME','ja_JP','有効期限｜2026-02-04 09:27:12','BUY_SUCCESS_TEMPLATE'),
('MAIL_PAY_SUBJECT','ja_JP','KIWI 取引パスワード再設定','RESET_PAY_TEMPLATE'),
('MAIL_PAY_TITLE','ja_JP','"お客様へ、取引パスワードが変更されました。新しいパスワードは以下の通りです："','RESET_PAY_TEMPLATE');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('MAIL_PAY_NEW','ja_JP','新しい取引パスワード','RESET_PAY_TEMPLATE'),
('MAIL_PAY_NEW_CODE','ja_JP','888666','RESET_PAY_TEMPLATE'),
('MAIL_PAY_REMIND','ja_JP','[取引設定]ページにて、できるだけ早くパスワードを変更することをお勧めします。','RESET_PAY_TEMPLATE'),
('MAIL_USER_SUBJECT','ja_JP','KIWI パスワード再設定','RESET_USER_TEMPLATE'),
('MAIL_USER_TITLE','ja_JP','"お客様へ、アカウントパスワードが変更されました。以下のパスワードを使用してログインしてください："','RESET_USER_TEMPLATE'),
('MAIL_USER_NEW','ja_JP','新しいアカウントパスワード','RESET_USER_TEMPLATE'),
('MAIL_USER_NEW_CODE','ja_JP','epKcb7Y!ixsCNWP^&D^j','RESET_USER_TEMPLATE'),
('MAIL_USER_REMIND','ja_JP','[アカウント設定]ページにて、できるだけ早くパスワードを変更することをお勧めします。','RESET_USER_TEMPLATE'),
('MAIL_VERIFY_SUBJECT','ja_JP','KIWI 認証コード','REGISTER_TEMPLATE,FORGET_PASSWORD_TEMPLATE'),
('MAIL_VERIFY','ja_JP','認証コード','REGISTER_TEMPLATE,FORGET_PASSWORD_TEMPLATE'),
('MAIL_VERIFY_CODE','ja_JP','528971','REGISTER_TEMPLATE,FORGET_PASSWORD_TEMPLATE'),
('MAIL_TIMEOUT','ja_JP','有効期限は10分間です。お早めにご利用ください。','REGISTER_TEMPLATE,FORGET_PASSWORD_TEMPLATE'),
('MAIL_REG_TITLE','ja_JP','"ご登録ありがとうございます。以下に認証コードを入力し、登録を完了してアカウントを有効化してください。"','REGISTER_TEMPLATE'),
('MAIL_PW_TITLE','ja_JP','お客様へ、パスワード再設定の申請を受け付けました。<br>以下の認証コードを入力してください：','FORGET_PASSWORD_TEMPLATE');

INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('WL_REG_SUBMIT_TITLE_S','ja_JP','会員登録が完了しました！','REGISTER'), 
('WL_REG_SUBMIT_INFO_S','ja_JP','登録が完了しました。改めてログインしてください。','REGISTER');


--RCode-------------------------------------------
--建立StringID
INSERT INTO Kiwi_RCODE (RCODE,Language,RMSG,RMSG_CHI)
VALUES
('0000','ja_JP','SUCCESSFUL_APPROVAL_COMPLETION','メッセージ処理成功');



('1001','ja_JP','SECURITY_CHECK_ERROR','認証コードエラー'), 
('1101','ja_JP','FORMAT_CHECK_ERROR','メッセージフォーマットエラー'), 
('1102','ja_JP','FORMAT_CHECK_ERROR_PINCODE_CURRENCY','形式エラー(PINコード通貨エラー)'), 
('1103','ja_JP','FORMAT_CHECK_ERROR_PINCODE_AMOUNT','形式エラー(PINコード金額エラー)'), 
('1109','ja_JP','FORMAT_CHECK_ERROR_CONTENT_CURRENCY','形式エラー(通貨エラー)'), 
('1110','ja_JP','INVALID_AMOUNT_WITH_DECIMAL_FIGURE','この通貨は小数単位に対応していません'), 
('1111','ja_JP','FORMAT_CHECK_ERROR_DATETIME','日付フォーマットエラー'), 
('1121','ja_JP','FORMAT_CHECK_NEED_USER_ACCTID','USER_ACCTID項目が必要です'), 
('1205','ja_JP','NOT_ALLOW_IP_ADDRESS','許可されていないネットワークアドレス (IPアドレス)'), 
('1301','ja_JP','INVALID_PA','不正または存在しない決済機関'), 
('1401','ja_JP','UNABLE_TO_LOCATE_PREVIOUS_MESSAGE','元の注文番号が見つかりません'), 
('1402','ja_JP','DATA_ARE_INCONSISTENT_WITH_ORIGINAL_MESSAGE','取引内容が元の取引と一致しません'), 
('1501','ja_JP','AVAILABLE_AMOUNT_NOT_ENOUGH','残高不足/限度額不足'), 
('1505','ja_JP','NOT_ALLOW_CURRENCY','この通貨の使用は許可されていません'), 
('1601','ja_JP','CONTENT_ID_NOT_YET_ACTIVATE','未有効化の加盟店コード'), 
('1701','ja_JP','PAY_PIN_IS_LOCKED','取引パスワードがロックされています'), 
('2001','ja_JP','TRANSACTION_REPEAT','重複取引'), 
('3001','ja_JP','PA_TRANSACTION_CAN_NOT_FINISH','決済を完了できません'), 
('3004','ja_JP','TRANSACTION_WAIT','消費者の支払確認待ち'), 
('3005','ja_JP','TRANSACTION_TIME_OUT','取引タイムアウト'), 
('3901','ja_JP','PIN_POINT_UNMATCH','チャージポイントの不一致'), 
('3902','ja_JP','PIN_IS_LOCKED','チャージパスワードがロックされています'), 
('3903','ja_JP','PIN_IS_USED','チャージパスワードは既に使用されています'), 
('3904','ja_JP','PIN_IS_ERROR','チャージパスワードエラー'), 
('3905','ja_JP','PIN_NOT_YET_ACTIVATE','チャージパスワードが未有効です'), 
('3906','ja_JP','PIN_IS_FOR_SPECIAL_USE','チャージパスワードは専用カードです'), 
('3907','ja_JP','PIN_NOT_ALLOW_DISTRIBUTOR','許可されていないチャネル'), 
('3908','ja_JP','PIN_NOT_ALLOW_REGION','許可されていない地域'), 
('3909','ja_JP','PIN_CURRENCY_UNMATCH','チャージパスワードの通貨不一致'), 
('3910','ja_JP','PIN_POINT_NOT_ENOUGH','残りポイント不足'), 
('9998','ja_JP','SYSTEM_BUSY','システム混雑中'),
('9999','ja_JP','SYSTEM_ERROR','システム異常');






---查詢StringID 沒有出現3次的欄位
SELECT RMSG, COUNT(*) AS 出現次數
FROM Kiwi_RCODE
GROUP BY RMSG
HAVING COUNT(*) <> 3;



INSERT INTO Kiwi_StringID (StringID,Language,String,UI_Page)
VALUES
('MAIL_EOS_TITLE','en_US','Notice of KIWIPIN Platform Termination of Operations','HOME'), 
('MAIL_EOS_TEXT1','en_US','Dear User,<br><br>Please be advised that the KIWIPIN platform will officially cease all operations on<b style="color: #8FB0DC;">June 30, 2026</b>.<br><br>We would like to remind you that your current KIWI Wallet balance is:<b style="color: #8FB0DC;">','HOME'), 
('MAIL_EOS_POINT','en_US','3456','HOME'), 
('MAIL_EOS_TEXT2','en_US','</b> points.<br>Please ensure that these points are fully utilized prior to the termination date. Upon cessation of operations, all remaining points will become invalid, and no refunds or cash redemptions will be provided. To safeguard your rights and interests, please utilize your points as soon as possible.','HOME'), 
('MAIL_EOS_TITLE','zh_TW','KIWIPIN 平台結束營運通知','HOME'), 
('MAIL_EOS_TEXT1','zh_TW','親愛的用戶，<br><br>本平台將於<b style="color: #8FB0DC;">2026年6月30日</b>結束營運。<br><br>提醒您，您帳戶內存在 kiwi Wallet 的點數剩餘：<b style="color: #8FB0DC;">','HOME'), 
('MAIL_EOS_POINT','zh_TW','3456','HOME'), 
('MAIL_EOS_TEXT2','zh_TW','</b> 點，<br>請務必於結束營運前全數使用完畢。逾期將全數失效，且不提供退款或折現。為保障您的權益，請儘速使用完畢！','HOME'), 
('MAIL_EOS_TITLE','ja_JP','KIWIPIN サービス終了のお知らせ','HOME'), 
('MAIL_EOS_TEXT1','ja_JP','"ユーザーの皆様へ<br><br>平素は格別のご愛顧を賜り、厚く御礼申し上げます。<br>
このたび、KIWIPINプラットフォームは、<b style=""color: #8FB0DC;"">2026年6月30日</b>をもちましてサービスを終了させていただくこととなりました。<br><br>つきましては、現在お客様のKIWI Wallet内にあるポイント残高は<b style=""color: #8FB0DC;"">"','HOME'), 
('MAIL_EOS_POINT','ja_JP','3456','HOME'), 
('MAIL_EOS_TEXT2','ja_JP','</b> ポイント となっております。<br>こちらのポイントは、必ずサービス終了前までにすべて使い切っていただきますようお願い申し上げます。サービス終了期日を過ぎますと、すべてのポイントは失効となり、払い戻しや現金への換金には応じかねますので予めご了承ください。お客様の貴重な権利を保護するため、お早めにご利用いただきますようお願い申し上げます。','HOME');


UPDATE Kiwi_StringID
SET UI_Page = 'END_OF_SERVICE'
WHERE StringID IN (
    'MAIL_EOS_TITLE',
    'MAIL_EOS_TEXT1',
    'MAIL_EOS_CODE',
    'MAIL_EOS_POINT',
    'MAIL_EOS_TEXT2'
);