<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%
    ArrayList htmlFiles = (ArrayList) session.getAttribute("htmlFiles");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="htmlFile" items="<%=htmlFiles %>">
    <li>${htmlFile}</li>
</c:forEach>
</body>
</html>
