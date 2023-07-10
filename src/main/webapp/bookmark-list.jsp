<%@ page import="dao.BookMarkService" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.BookMarkList" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        #bookmark-list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #bookmark-list td, #history-list th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #bookmark-list tr:nth-child(even){background-color: #f2f2f2;}

        #bookmark-list tr:hover {background-color: #ddd;}

        #bookmark-list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #04AA6D;
            color: white;
        }

    </style>
</head>
<body>
<h1>북마크 목록</h1>
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

<table id="bookmark-list">
    <thead>
    <tr align="center">
        <th>ID</th>
        <th>북마크 이름</th>
        <th>와이파이명</th>
        <th>등록일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%
        BookMarkService bookMarkList = new BookMarkService();
        List<BookMarkList> bookLists = bookMarkList.selectBookList();
        if (bookLists.size() == 0) {
    %>
    <tr align="center">
        <td colspan = "17" align="center">북마크 정보가 없습니다. 북마크 정보를 추가해 주세요.</td>
    </tr>
    <%
        } else {
            for (int i = 0; i < bookLists.size(); i++) {
                int bookId = bookLists.get(i).getBookListId();
                String bookNm = bookLists.get(i).getBookListNm();
                String wifiNm = bookLists.get(i).getWifiNm();
                Date rgDate = bookLists.get(i).getBookListRg();
    %>
    <tr align="center">
        <td><%=bookId%></td>
        <td><%=bookNm%></td>
        <td><%=wifiNm%></td>
        <td><%=rgDate%></td>
        <td>
            <a href="deletelist-finish.jsp?id=<%=bookId%>&bookNm=<%=bookNm%>&wifiNm=<%=wifiNm%>&date=<%=rgDate%>">삭제</a>
        </td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
<script src="js/addBookMarkList.js"></script>
</body>
</html>
