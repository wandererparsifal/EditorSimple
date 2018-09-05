<%@ page language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>Simple example - Editor.md examples</title>
    <link rel="stylesheet" href="${ctx}/editormd/css/style.css"/>
    <link rel="stylesheet" href="${ctx}/editormd/css/editormd.css"/>
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon"/>
    <style type="text/css">
        .button-container {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .button-container-bo {
            margin: 0 auto;
        }

        .submit-button {
            width: 80px;
            margin-left: 10px;
            margin-right: 10px;
        }
    </style>
    <script src="${ctx}/editormd/js/jquery.min.js"></script>
    <script src="${ctx}/editormd/js/editormd.js"></script>
    <script type="text/javascript">
      function submitHtml() {
        var mdContent = $("#mdContent").val();
        var htmlContent = $("#htmlContent").val();
        console.log(mdContent);
        console.log(htmlContent);
        if (htmlContent !== "") {
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
        } else {
          alert("请输入内容");
        }
      }
    </script>
</head>
<body>
<div class="button-container">
    <div class="button-container-bo">
        <button type="button" class="submit-button" id="submit" onclick="submitHtml()">submit</button>
        <a href="/htmllist">
            <button type="button" class="submit-button">list</button>
        </a>
    </div>
</div>
<div id="layout">
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
      imageUpload: true,
      imageFormats: ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
      imageUploadURL: "${ctx}/uploadfile",
      saveHTMLToTextarea: true,
      htmlDecode: true,
      emoji: true,
      taskList: true,
      flowChart: true, // 默认不解析
      sequenceDiagram: true, // 默认不解析
      codeFold: true
    });
  });
</script>
</body>
</html>