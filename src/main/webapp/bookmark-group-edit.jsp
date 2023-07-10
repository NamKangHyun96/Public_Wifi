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
<h1>북마크 그룹 수정</h1>
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

<table id="bookmark-add">
  <tr>
    <th>북마크 이름</th>
    <td>
      <input type="hidden" id="grId" name="grId" value="<%=request.getParameter("id")%>">
      <input type="text" id="bookNm" name="bookNm" value="<%=request.getParameter("name")%>">
    </td>
  </tr>
  <tr>
    <th>순서</th>
    <td><input type="text" id="bookOd" name="bookOd" value="<%=request.getParameter("order")%>"></td>
  </tr>
  <tr>
    <td colspan = "17" align="center">
      <a href="bookmark-group.jsp">돌아가기</a>
      <a> | </a>
      <button type="button" onclick="getEditValue()">수정</button>
    </td>
  </tr>
</table>
<script src="js/additionalChange.js"></script>
</body>
</html>
