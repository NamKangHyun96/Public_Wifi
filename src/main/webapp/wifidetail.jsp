<%@ page import="dao.WifiService" %>
<%@ page import="dto.WifiData" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.BookMarkService" %>
<%@ page import="dto.BookMarkGroup" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #detail-list {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #detail-list td, #detail-list th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #detail-list tr:nth-child(even){background-color: #f2f2f2;}

        #detail-list tr:hover {background-color: #ddd;}

        #detail-list th {
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
<h1>와이파이 정보 구하기</h1>
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
<%
    String mgrNo = request.getParameter("mgr_No");
    String dist = request.getParameter("distance");

    WifiService wifiService = new WifiService();
    List<WifiData> detail = wifiService.selectDetail(mgrNo);
    BookMarkService bookMark = new BookMarkService();
    List<BookMarkGroup> title = bookMark.selectBookGroup();
%>
<form action="addlist-finish.jsp" method="post" id="list-frm">
    <select name="listNm">
        <option value="none" selected>북마크 그룹 이름 선택</option>
        <%
            for (int i = 0; i < title.size(); i++) {
        %>
        <option value="<%=title.get(i).getBookMarkOd()%>">
            <%=title.get(i).getBookMarkNm()%>
        </option>
        <%
            }
        %>
    </select>
    <input type="submit" value="북마크 추가하기">
    <input type="hidden" id="mgrNo" name="mgrNo" value="<%=mgrNo%>">
</form>

<table id="detail-list">
    <%
        for (WifiData item : detail) {
            String wifiNm = item.getXSwifiMainNm();
    %>
    <tr>
        <th>거리(Km)</th>
        <td><%=dist%></td>
    </tr>
    <tr>
        <th>관리번호</th>
        <td><%=request.getParameter("mgr_No")%></td>
    </tr>
    <tr>
        <th>자치구</th>
        <td><%=item.getXSwifiWrdofc()%></td>
    </tr>
    <tr>
        <th>와이파이명</th>
        <td>
            <a value="<%= wifiNm %>" href="wifidetail.jsp?mgr_No=<%=request.getParameter("mgr_No")%>&distance=<%=request.getParameter("distance")%>">
                <%= wifiNm %>
            </a>
        </td>
    </tr>
    <tr>
        <th>도로명주소</th>
        <td><%=item.getXSwifiAddres1()%></td>
    </tr>
    <tr>
        <th>상세주소</th>
        <td><%=item.getXSwifiAddres2()%></td>
    </tr>
    <tr>
        <th>설치위치(층)</th>
        <td><%=item.getXSwifiInstlFloor()%></td>
    </tr>
    <tr>
        <th>설치유형</th>
        <td><%=item.getXSwifiInstlTy()%></td>
    </tr>
    <tr>
        <th>설치기관</th>
        <td><%=item.getXSwifiInstlMby()%></td>
    </tr>
    <tr>
        <th>서비스구분</th>
        <td><%=item.getXSwifiSvcSe()%></td>
    </tr>
    <tr>
        <th>망종류</th>
        <td><%=item.getXSwifiCmcwr()%></td>
    </tr>
    <tr>
        <th>설치년도</th>
        <td><%=item.getXSwifiCnstcYear()%></td>
    </tr>
    <tr>
        <th>실내외구분</th>
        <td><%=item.getXSwifiInoutDoor()%></td>
    </tr>
    <tr>
        <th>WIFI접속환경</th>
        <td><%=item.getXSwifiRemars3()%></td>
    </tr>
    <tr>
        <th>X좌표</th>
        <td><%=item.getLat()%></td>
    </tr>
    <tr>
        <th>Y좌표</th>
        <td><%=item.getLnt()%></td>
    </tr>
    <tr>
        <th>작업일자</th>
        <td><%=item.getWorkDttm()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
