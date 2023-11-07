document.getElementById('markdown-editor').addEventListener('input', function() {
    var markdownText = this.value;
    document.getElementById('markdown-preview').innerHTML = marked.parse(markdownText);
});
