<?php
//フォームからの値をそれぞれ変数に代入
$name = $_POST['name'];
$password = password_hash($_POST['password']);

if (isset($_POST['login'])) {

}
?>
