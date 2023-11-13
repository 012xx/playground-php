// 入力した文字をマークダウンに変換する
document
  .getElementById("markdown-editor")
  .addEventListener("input", function () {
    var markdownText = this.value;
    document.getElementById("markdown-preview").innerHTML =
      marked.parse(markdownText);
  });

// ユーザーが入力したMarkdownテキストをサーバーに送信して保存する
document.getElementById("save-draft").addEventListener("click", function () {
  var content = document.getElementById("markdown-editor").value;
  fetch("save_draft.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ content: content }),
  })
    .then((response) => response.json())
    .then((data) => console.log(data))
    .catch((error) => console.error("Error:", error));
});
