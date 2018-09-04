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
</head>
<body>
<div id="layout">
    <header>
        <h1>Simple example</h1>
    </header>
    <div id="test-editormd">
                <textarea style="display:none;">[TOC]

#### Disabled options

- TeX (Based on KaTeX);
- Emoji;
- Task lists;
- HTML tags decode;
- Flowchart and Sequence Diagram;

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/     
            editormd.js
            ...

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
</textarea>
    </div>
</div>
<script src="${ctx}/editormd/js/jquery.min.js"></script>
<script src="${ctx}/editormd/js/editormd.min.js"></script>
<script type="text/javascript">
  var testEditor;

  $(function () {
    testEditor = editormd("test-editormd", {
      width: "90%",
      height: 640,
      syncScrolling: "single",
      path: "../editormd/lib/",
      htmlDecode : true,
      htmlDecode : "style,script,iframe,sub,sup|on*"
    });

    /*
    // or
    testEditor = editormd({
        id      : "test-editormd",
        width   : "90%",
        height  : 640,
        path    : "../lib/"
    });
    */
  });
</script>
</body>
</html>