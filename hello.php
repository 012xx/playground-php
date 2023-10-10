<?php

  if(!empty($_POST['submit'])){
    echo $_POST['username'];
    echo $_POST['comment'];
  }

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PHP掲示板</title>
  <link rel="stylesheet"; href="style.css">
</head>
<body>
  <h1>PHPで掲示板</h1>
  <hr>
  <div class="boardWrapper">
    <section>
    <article>
      <div class="wrapper">
        <div class="nameArea">
          <span>名前：</span>
          <p class="username">shinCode</p>
          <time>:
            2020/07/01 12:00</time>
          </div>
          <p class="comment">手書きコメントです</p>
        </div>
    </article>
    </section>
    <form class="formWrapper" method="POST">
      <div>
        <input type="submit" value="書き込む" name="submit"/>
        <label for="">名前：</label>
        <input type="text" name="username" />
      </div>
      <div>
        <textarea class="commentTextArea" name="comment" ></textarea>
      </div>
</body>
</html>