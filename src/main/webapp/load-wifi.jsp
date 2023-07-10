<%@ page import="dto.ApiExplorer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 구하기</title>
    <style>
        h1, p {text-align: center;}
    </style>
</head>
<body>
<h1>
    <%
        ApiExplorer apiExplorer = new ApiExplorer();
        int total = apiExplorer.apiExplorer();
    %>
    <%=total%>개의 WIFI 정보를 정상적으로 저장하였습니다.
<%--    개의 WIFI 정보를 정상적으로 저장하였습니다.--%>
</h1>
<p>
    <a href="index.jsp">홈 으로 가기</a>
</p>
</body>
</html>
