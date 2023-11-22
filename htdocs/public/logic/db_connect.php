<?php

declare(strict_types=1);

class DbConnect
{
    /*　データベースの接続情報を定数に格納する */
    private const DSN = 'mysql:dbname=playground-db;host=playground-mysql';
    private const USER = 'root';
    private const PASSWORD = 'root';

    public static function getPdo(): PDO
    {
        return new PDO(self::DSN, self::USER, self::PASSWORD, [
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_EMULATE_PREPARES => false
        ]);
    }
}
