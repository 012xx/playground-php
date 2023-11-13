INSERT INTO article
  (title, context, is_draft, user_id, created_at, updated_at)
VALUES
  ('article01', 'これは、user01が投稿した記事です。', 1, 1, NOW(), NOW()),
  ('article02', 'これは、user02が投稿した記事です。', 1, 2, NOW(), NOW()),
  ('article03', 'これは、user03が投稿した記事です。', 1, 3, NOW(), NOW());
