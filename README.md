# kenshu-backend-php

## 新卒研修バックエンド　記事投稿サービス

---

要件

- ユーザー登録、ログイン機能を備えている
- ログインしたユーザーは自分の記事の作成、編集、削除ができる
- 記事は”タイトル”、”本文”、”画像”、”タグ”から構成される
  - 画像は複数枚アップロードすることができる
  - アップロードした画像のうち 1 枚をサムネイル画像として指定する
  - タグは複数指定することができる
- ログインしていないユーザーは投稿された記事を閲覧できる

## 使用技術

---

Docker 20.10.5

PHP 7.4

MySQL 5.7

# 環境構築

下記のコマンドを実行し、http://localhost に接続

```
$ make init
```
