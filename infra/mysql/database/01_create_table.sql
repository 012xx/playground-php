USE playground-db

CREATE TABLE IF NOT EXISTS `User` (
    user_id UUID PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(32) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Article` (
    article_id UUID PRIMARY KEY NOT NULL UNIQUE,
    title VARCHAR(64) NOT NULL,
    context VARCHAR(20000) NOT NULL,
    user_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    FOREIGN KEY (user_id)
    REFERENCES User (user_id)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `Image` (
    article_id UUID NOT NULL,
    image_id UUID NOT NULL UNIQUE,
    file_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    PRIMARY KEY (article_id, image_id),
    FOREIGN KEY (article_id)
    REFERENCES Article (article_id)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `Thumbnail` (
    article_id UUID NOT NULL,
    image_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    PRIMARY KEY (article_id, image_id),
    FOREIGN KEY (article_id)
    REFERENCES Article (article_id),
    FOREIGN KEY (image_id)
    REFERENCES Image (image_id)
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `Tag` (
    tag_id UUID PRIMARY KEY NOT NULL UNIQUE,
    name VARCHAR(32) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS `ArticleTag` (
    article_id UUID NOT NULL,
    tag_id UUID NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,

    PRIMARY KEY (article_id, tag_id),
    FOREIGN KEY (article_id)
    REFERENCES Article (article_id),
    FOREIGN KEY (tag_id)
    REFERENCES Tag (tag_id)
    ON DELETE CASCADE
);


