<?php
$mysqli = new mysqli("playground-mysql", "root", "root", "playgrounddb");

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}
echo "Hello, World! This is a simple PHP page. Connected successfully🎉";
?>
