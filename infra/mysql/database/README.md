# 各 Table の構造一覧

# user

| Field         | Type             | Null | Key | Default           | Extra                       |
| :------------ | :--------------- | :--- | --- | ----------------- | --------------------------- |
| user_id       | int(10) unsigned | NO   | PRI | NULL              | auto_increment              |
| name          | text(32)         | NO   |     | NULL              |                             |
| password      | text(255)        | NO   |     | NULL              |                             |
| created_at    | timestamp        | NO   |     | CURRENT_TIMESTAMP |                             |
| updated_at    | timestamp        | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |

# article

| Field        | Type             | Null | Key | Default           | Extra                       |
| :----------- | :--------------- | :--- | --- | ----------------- | --------------------------- |
| artcle_id    | int(10) unsigned | NO   | PRI | NULL              | auto_increment              |
| user_id      | int(10) unsigned | NO   | MUL | NULL              |                             |
| title        | text(64)         | NO   |     | NULL              |                             |
| context      | text(20000)      | YES  |     | NULL              |                             |
| created_at   | timestamp        | NO   |     | CURRENT_TIMESTAMP |                             |
| updated_at   | timestamp        | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |

# image

| Field      | Type             | Null | Key | Default           | Extra                       |
| :--------- | :--------------- | :--- | --- | ----------------- | --------------------------- |
| image_id   | int(10) unsigned | NO   | PRI | NULL              | auto_increment              |
| article_id | int(10) unsigned | NO   | MUL | NULL              |                             |
| file_path  | text(255)        | NO   |     | NULL              |                             |
| created_at | timestamp        | NO   |     | CURRENT_TIMESTAMP |                             |
| updated_at | timestamp        | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |

# thumbnail

| Field      | Type             | Null | Key     | Default           | Extra                       |
| :--------- | :--------------- | :--- | ------- | ----------------- | --------------------------- |
| image_id   | int(10) unsigned | NO   | PRI,MUL | NULL              | auto_increment              |
| article_id | int(10) unsigned | NO   | PRI,MUL | NULL              | auto_increment              |
| created_at | timestamp        | NO   |         | CURRENT_TIMESTAMP |                             |
| updated_at | timestamp        | NO   |         | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |


# tag

| Field      | Type             | Null | Key | Default           | Extra                       |
| :--------- | :--------------- | :--- | --- | ----------------- | --------------------------- |
| tag_id     | int(10) unsigned | NO   | PRI | NULL              | auto_increment              |
| name       | text             | NO   |     | NULL              |                             |
| created_at | timestamp        | NO   |     | CURRENT_TIMESTAMP |                             |
| updated_at | timestamp        | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |

# ArticleTag

| Field      | Type             | Null | Key     | Default           | Extra                       |
| :--------- | :--------------- | :--- | ------- | ----------------- | --------------------------- |
| article_id | int(10) unsigned | NO   | PRI,MUL | NULL              |                             |
| tag_id     | int(10) unsigned | NO   | PRI,MUL | NULL              |                             |
| created_at | timestamp        | NO   |         | CURRENT_TIMESTAMP |                             |
| updated_at | timestamp        | NO   |         | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
