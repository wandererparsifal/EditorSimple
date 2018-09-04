<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="up_path"
       value="http://${pageContext.request.localAddr}:${pageContext.request.localPort}"/>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>Simple example - Editor.md examples</title>
    <link rel="stylesheet" href="${ctx}/editormd/css/style.css"/>
    <link rel="stylesheet" href="${ctx}/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <script src="${ctx}/editormd/js/jquery.min.js"></script>
    <script src="${ctx}/editormd/js/editormd.js"></script>
    <script type="text/javascript">
      function submitHtml() {
        var mdContent = $("#mdContent").val();
        var htmlContent = $("#htmlContent").val();
        console.log(mdContent);
        console.log(htmlContent);
        $.ajax({
          type: 'post',
          url: "/submithtml",
          data: { mdContent: mdContent, htmlContent: htmlContent },
          success: function (data) {
            console.log(data);
            alert("发布成功");
          },
          error: function () {
            alert("发布失败");
          }
        })
      }
    </script>
</head>
<body>
<div id="layout">
    <header>
        <h1>Simple example</h1>
    </header>
    <button type="button" id="submit" onclick="submitHtml()">submit</button>
    <div id="test-editormd">
        <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="mdContent"></textarea>
        <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
        <textarea class="editormd-html-textarea" name="editormd-html-textarea" id="htmlContent"></textarea>
    </div>
</div>
<script type="text/javascript">
  var testEditor;

  $(function () {
    testEditor = editormd("test-editormd", {
      width: "90%",
      height: 640,
      syncScrolling: "single",
      path: "../editormd/lib/",
      htmlDecode: true,
      emoji: true,
      imageUpload: true,
      imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
      imageUploadURL: "${ctx}/uploadfile",
      saveHTMLToTextarea: true
    });
  });
</script>
</body>
</html>