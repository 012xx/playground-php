USE playground-db;

CREATE TABLE IF NOT EXISTS `user` (
    user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `article` (
    article_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(64) NOT NULL,
    context TEXT NOT NULL,
    is_draft tinyint(1) NOT NULL,
    user_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id)
    REFERENCES user (user_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `image` (
    article_id INT UNSIGNED NOT NULL,
    image_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    file_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    FOREIGN KEY (article_id)
    REFERENCES article (article_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `thumbnail` (
    article_id INT UNSIGNED NOT NULL,
    image_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    PRIMARY KEY (article_id, image_id),
    FOREIGN KEY (article_id)
    REFERENCES article (article_id),
    FOREIGN KEY (image_id)
    REFERENCES image (image_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `tag` (
    tag_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS `articletag` (
    article_id INT UNSIGNED NOT NULL,
    tag_id INT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    PRIMARY KEY (article_id, tag_id),
    FOREIGN KEY (article_id)
    REFERENCES article (article_id),
    FOREIGN KEY (tag_id)
    REFERENCES tag (tag_id)
    ON DELETE CASCADE
);
