<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Markdown Editor</title>
<link rel="stylesheet" href="css/editor.css">
<link rel="stylesheet" href="css/github.css">
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/highlight.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/11.6.0/styles/monokai.min.css">
</head>
<body>
<div id="editor-header">
  <button id="save-draft">下書き保存</button>
  <button id="publish">公開</button>
</div>
<div id="editor-container">
    <textarea id="markdown-editor" placeholder="Markdown形式でここに内容を記入"></textarea>
    <div id="markdown-preview"></div>
</div>
<script src="js/editor.js"></script>
</body>
</html>
