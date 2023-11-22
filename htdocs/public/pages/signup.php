<?php
require_once "../logic/db_connect.php";
require_once "../logic/functions.php";

session_start();

$datas = [
    'name'  => '',
    'password'  => '',
];

if($_SERVER['REQUEST_METHOD'] != 'POST'){
    setToken();
}

if($_SERVER["REQUEST_METHOD"] == "POST"){
    //CSRF対策
    checkToken();

    // POSTされてきたデータを変数に格納
    foreach($datas as $key => $value) {
        if($value = filter_input(INPUT_POST, $key, FILTER_DEFAULT)) {
            $datas[$key] = $value;
        }
    }

    // バリデーション
    $errors = validation($datas);

    //データベースの中に同一ユーザー名が存在していないか確認
    if(empty($errors['name'])){
        $sql = "SELECT id FROM users WHERE name = :name";
        $stmt = $pdo->prepare($sql);
        $stmt->bindValue('name',$datas['name'],PDO::PARAM_INT);
        $stmt->execute();
        if($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $errors['name'] = 'This username is already taken.';
        }
    }
    //エラーがなかったらDBへの新規登録を実行
    if(empty($errors)){
        $params = [
            'user_id' =>null,
            'name'=>$datas['name'],
            'password'=>password_hash($datas['password'], PASSWORD_DEFAULT),
            'created_at'=>null
        ];

        $count = 0;
        $columns = '';
        $values = '';
        foreach (array_keys($params) as $key) {
            if($count > 0){
                $columns .= ',';
                $values .= ',';
            }
            $columns .= $key;
            $values .= ':'.$key;
            $count++;
        }

        //トランザクション処理
        $pdo->beginTransaction();
        try {
            $sql = 'insert into users ('.$columns .')values('.$values.')';
            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $pdo->commit();
            header("location: login.php");
            exit;
        } catch (PDOException $e) {
            echo 'ERROR: Could not register.';
            $pdo->rollBack();
        }
    }
}
?>


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="utf-8">
<title>新規登録</title>
<link rel="stylesheet" href="../css/global.css">
<link rel="stylesheet" href="../css/signup-login.css">
</head>
<body>
<div class="wrapper">
    <h2 class="welcome">playground-phpへようこそ！</h2>
    <p class="text">新規登録して利用を開始しましょう。</p>
    <form action="register.php" method="post" >
        <div class="cp_iptxt">
            <label class="ef">
                <input type="text" placeholder="ユーザー名" name="name" required>
            </label>
        </div>
        <div class="cp_iptxt">
            <label class="ef">
                <input type="password" placeholder="パスワード" name="password" required>
            </label>
        </div>
        <div class="button">
            <button id="firstsignup" type="submit">新規登録</button>
        </div>
    </form>
</div>
</body>
</html>
