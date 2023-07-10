<%@ page import="dao.HistoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.HistoryData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #history-list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #history-list td, #history-list th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #history-list tr:nth-child(even){background-color: #f2f2f2;}

        #history-list tr:hover {background-color: #ddd;}

        #history-list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }

    </style>
</head>
<body>
<h1>위치 히스토리 목록</h1>
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

<table id="history-list">
    <thead>
        <tr align="center">
            <th>ID</th>
            <th>X좌표</th>
            <th>Y좌표</th>
            <th>조회일자</th>
            <th>비고</th>
        </tr>
    </thead>
    <tbody>
        <%
            HistoryService historyService = new HistoryService();
            List<HistoryData> historyList = historyService.selectHistory();
            if (historyList.size() == 0) {
        %>
        <tr align="center">
            <td colspan = "17" align="center">위치 히스토리 정보가 없습니다.</td>
        </tr>
        <%  } else {
                for (int i = 0; i < historyList.size(); i++) {
        %>
        <tr>
            <td>
                <%=historyList.get(i).getId()%>
            </td>
            <td><%=historyList.get(i).getMyLat()%></td>
            <td><%=historyList.get(i).getMyLnt()%></td>
            <td><%=historyList.get(i).getCheckDate()%></td>
            <td align="center" onclick="event.cancelBubble=true">
                <button type="button" id="<%=historyList.get(i).getId()%>" onclick="deleteData(this)">삭제</button>
            </td>

        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<script src="./js/DeleteList.js"></script>
</body>
</html>
