<%@ page import="dto.BookMarkGroup" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.BookMarkService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    #bookmark-group {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }

    #bookmark-group td, #history-list th{
      border: 1px solid #ddd;
      padding-top: 20px;
      padding-bottom: 20px;
    }

    #bookmark-group tr:nth-child(even){background-color: #f2f2f2;}

    #bookmark-group tr:hover {background-color: #ddd;}

    #bookmark-group th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: center;
      background-color: #04AA6D;
      color: white;
    }

  </style>
</head>
<body>
<h1>북마크 그룹</h1>
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
<p>
  <button type="button" onclick="location.href='bookmark-group-add.jsp'">북마크 그룹 이름 추가</button>
</p>

<table id="bookmark-group">
  <thead>
  <tr align="center">
    <th>ID</th>
    <th>북마크 이름</th>
    <th>순서</th>
    <th>등록일자</th>
    <th>수정일자</th>
    <th>비고</th>
  </tr>
  </thead>
  <tbody>
    <%
      BookMarkService bookMarkGroup = new BookMarkService();
      List<BookMarkGroup> bookGroups = bookMarkGroup.selectBookGroup();
      if (bookGroups.size() == 0) {
    %>
    <tr align="center">
      <td colspan = "17" align="center">북마크 그룹 정보가 없습니다. 북마크 그룹 정보를 추가해 주세요.</td>
    </tr>
    <%
      } else {
        for (int i = 0; i < bookGroups.size(); i++) {
    %>
  <tr align="center">
    <%
      int groupId = bookGroups.get(i).getBookMarkId();
      String groupName = bookGroups.get(i).getBookMarkNm();
      int groupOrder = bookGroups.get(i).getBookMarkOd();
    %>
    <td><%=groupId%></td>
    <td><%=groupName%></td>
    <td><%=groupOrder%></td>
    <td><%=bookGroups.get(i).getBookMarkRg()%></td>
    <td>
      <%
        if (bookGroups.get(i).getBookMarkERg() == null) {
      %>
        <%=" "%>
      <%
        } else {
      %>
        <%=bookGroups.get(i).getBookMarkERg()%>
      <%
        }
      %>
    </td>
    <td>
      <a href="bookmark-group-edit.jsp?id=<%=groupId%>&order=<%=groupOrder%>&name=<%=groupName%>">수정</a>
      <a> </a>
      <a href="bookmark-delete.jsp?id=<%=groupId%>&order=<%=groupOrder%>&name=<%=groupName%>">삭제</a>
    </td>
  </tr>
  <%
      }
    }
  %>
  </tbody>
</table>
</body>
</html>
