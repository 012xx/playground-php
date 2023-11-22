<?php
//XSS対策
function h($s){
    return htmlspecialchars($s, ENT_QUOTES, "UTF-8");
}

//セッションにトークンセット
function setToken(){
    $token = sha1(uniqid(mt_rand(), true));
    $_SESSION['token'] = $token;
}

//セッション変数のトークンとPOSTされたトークンをチェック
function checkToken(): bool{
    $is_token = array_key_exists('token', $_SESSION);
    if (!$is_token) {
        echo 'Not exists csrf token';
        return false;
    }
    if ($_SESSION["token"] !== $_POST["token"]) {
        echo 'Invalid csrf token';
        return false;
    }

    return true;
}

//POSTされた値のバリデーション
function validation($datas,$confirm = true)
{
    $errors = [];

    //ユーザー名のチェック
    if(empty($datas['name'])) {
        $errors['name'] = 'Please enter username.';
    }else if(mb_strlen($datas['name']) > 20) {
        $errors['name'] = 'Please enter up to 20 characters.';
    }

    //パスワードのチェック（正規表現）
    if(empty($datas["password"])){
        $errors['password']  = "Please enter a password.";
    }else if(!preg_match('/\A[a-z\d]{8,100}+\z/i',$datas["password"])){
        $errors['password'] = "Please set a password with at least 8 characters.";
    }
    return $errors;
}
