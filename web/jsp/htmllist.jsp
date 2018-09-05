<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList htmlFiles = (ArrayList) session.getAttribute("htmlFiles");
%>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .editor-button {
            width: 80px;
            margin-bottom: 1%;
        }

        .list-container {
            margin-top: 2%;
            margin-left: 2%;
        }
    </style>
</head>
<body>
<div class="list-container">
    <a href="${ctx}/editormd">
        <button type="button" class="editor-button">editor</button>
    </a>
    <p/>
    <c:forEach var="htmlFile" items="<%=htmlFiles %>">
        <a href="${ctx}/showhtml?htmlFile=${htmlFile}">${htmlFile}</a>
        <p/>
    </c:forEach>
</div>
</body>
</html>
