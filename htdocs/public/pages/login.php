<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>ログイン</title>
<link rel="stylesheet" href="../css/global.css">
<link rel="stylesheet" href="../css/signup-login.css">
</head>
<body>
<div class="wrapper">
    <h2 class="welcome">playground-phpへようこそ！</h2>
    <p class="text">ログインして利用を開始しましょう。</p>
    <form method="post" >
        <div class="cp_iptxt">
            <label class="ef">
                <input type="text" placeholder="ユーザー名">
            </label>
        </div>
        <div class="cp_iptxt">
            <label class="ef">
                <input type="password" placeholder="パスワード">
            </label>
        </div>
        <div class="button">
            <button id="firstsignup">ログイン</button>
            <br />
            <a href="/pages/signup.php" class="link">新規登録はこちら</a>
        </div>
    </form>
</div>
</body>
</html>
