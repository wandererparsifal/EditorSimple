<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctx}/editormd/css/editormd.preview.min.css"/>
    <link rel="stylesheet" href="${ctx}/editormd/css/editormd.css"/>
    <script src="${ctx}/editormd/js/jquery.min.js"></script>
    <script src="${ctx}/editormd/lib/marked.min.js"></script>
    <script src="${ctx}/editormd/lib/prettify.min.js"></script>
    <script src="${ctx}/editormd/js/editormd.min.js"></script>
</head>
<body>
<div class="panel-body">
    <!-- 用于显示md编辑器的md格式 -->
    <div id="doc-content">
        ${htmlContent}
    </div>
</div>
<script type="text/javascript">
  var testEditor;
  $(function () {
    testEditor = editormd.markdownToHTML("doc-content", {//注意：这里是上面DIV的id
      htmlDecode: "style,script,iframe",
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
