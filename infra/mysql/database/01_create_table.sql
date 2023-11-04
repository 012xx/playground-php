USE playground-db

CREATE TABLE IF NOT EXISTS `User` (
    user_id UUID PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(32) NOT NULL,
    password VARCHAR(255) NOT NULL

    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS `Article` (
    article_id UUID PRIMARY KEY NOT NULL UNIQUE,
    title VARCHAR(64) NOT NULL,
    context VARCHAR(20000) NOT NULL,
    user_id UUID PRIMARY KEY NOT NULL UNIQUE,
    created_at timestamp notnull notnull,
    updated_at timestamp notnull notnull,

    FOREIGN KEY (user_id)
    REFERENCES users (id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS `Image` (
    article_id UUID PRIMARY KEY NOT NULL UNIQUE,
    image_id UUID PRIMARY KEY NOT NULL UNIQUE,
    file_path VARCHAR(255) NOT NULL,
    created_at timestamp notnull notnull,
    updated_at timestamp notnull notnull,

    PRIMARY KEY (article_id, image_id)
    FOREIGN KEY (article_id, image_id)
    REFERENCES  Image(image_id)
    REFERENCES Article (article_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS `Thumbnail` (
    article_id UUID PRIMARY KEY NOT NULL UNIQUE,
    image_id UUID PRIMARY KEY NOT NULL UNIQUE,
    created_at timestamp notnull notnull,
    updated_at timestamp notnull notnull,

    PRIMARY KEY (user_id, image_id)
    FOREIGN KEY (user_id, image_id)
    REFERENCES User (user_id)
    REFERENCES Article (article_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS `Tag` (
    tag_id UUID PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(32) NOT NULL,
    created_at timestamp notnull notnull,
    updated_at timestamp notnull notnull,

    PRIMARY KEY (tag_id)
)

CREATE TABLE IF NOT EXISTS `ArticleTag` (
    article_id UUID PRIMARY KEY NOT NULL UNIQUE,
    tag_id UUID PRIMARY KEY NOT NULL UNIQUE,
    created_at timestamp notnull notnull,
    updated_at timestamp notnull notnull,

    PRIMARY KEY (article_id, tag_id)
    FOREIGN KEY (article_id, tag_id)
    REFERENCES Article (article_id)
    REFERENCES Tag (tag_id)
    ON DELETE CASCADE
)

