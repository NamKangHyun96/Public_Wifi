<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #bookmark-add {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #bookmark-add td, #detail-list th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #bookmark-add tr:nth-child(even){background-color: #f2f2f2;}

        #bookmark-add tr:hover {background-color: #ddd;}

        #bookmark-add th {
            padding-top: 12px;
            padding-bottom: 12px;
            width: 400px;
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }
    </style>
</head>
<body>
<h1>북마크 삭제</h1>
<p>
    <a href="index.jsp">홈</a>
    <a> | </a>
    <a href="history.jsp">위치 히스토리</a>
    <a> | </a>
    <a href="load-wifi.jsp">OPEN API 정보 가져오기</a>
    <a> | </a>
    <a href="bookmark-list.jsp">북마크 보기</a>
    <a> | </a>
    <a href="bookmark-group.jsp">북마크 그룹 관리</a>
</p>

<p>북마크를 삭제하시겠습니까?</p>
<table id="bookmark-add">
    <%
        int deleteId = Integer.valueOf(request.getParameter("id"));
        String bookNm = request.getParameter("bookNm");
        String wifiNm = request.getParameter("wifiNm");
        String date = request.getParameter("date");
    %>
    <tr>
        <th>북마크 이름</th>
        <td><%=bookNm%></td>
    </tr>
    <tr>
        <th>와이파이명</th>
        <td><%=wifiNm%></td>
    </tr>
    <tr>
        <th>등록일자</th>
        <td><%=date%></td>
    </tr>
    <tr>
        <td colspan = "17" align="center" onclick="event.cancelBubble=true">
            <a href="bookmark-list.jsp">돌아가기</a>
            <a> | </a>
            <button type="button" id="<%=deleteId%>" onclick="location.href='listDataDelete.jsp?delData=<%=deleteId%>'">삭제</button>
        </td>
    </tr>
</table>
</body>
</html>
