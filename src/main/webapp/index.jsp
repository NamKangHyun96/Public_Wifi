<%@ page import="dao.WifiService" %>
<%@ page import="dto.WifiData" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.HistoryData" %>
<%@ page import="dao.HistoryService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>와이파이 정보 구하기</title>
    <style>
        #customers {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th{
            border: 1px solid #ddd;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #customers tr:nth-child(even){background-color: #f2f2f2;}

        #customers tr:hover {background-color: #ddd;}

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
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
    String inputLat = request.getParameter("lat") == null ? "0.0" : request.getParameter("lat");
    String inputLnt = request.getParameter("lat") == null ? "0.0" : request.getParameter("lnt");
%>
<form id="frm" method="post" action="index.jsp">
    LAT :
        <input type="text" name="lat" id="lat" value="<%=inputLat%>">
    LNT :
        <input type="text" name="lnt" id="lnt" value="<%=inputLnt%>">
    <button type="button" onclick="getLocation()">내 위치 가져오기</button>
    <input type="submit" value="근처 WIFI 정보 보기">
</form>

<table id="customers">
    <thead>
        <tr>
            <th>거리(km)</th>
            <th>관리번호</th>
            <th>자치구</th>
            <th>와이파이명</th>
            <th>도로명주소</th>
            <th>상세주소</th>
            <th>설치위치(층)</th>
            <th>설치유형</th>
            <th>설치기관</th>
            <th>서비스구분</th>
            <th>망종류</th>
            <th>설치년도</th>
            <th>실내외구분</th>
            <th>WIFI접속환경</th>
            <th>X좌표</th>
            <th>Y좌표</th>
            <th>작업일자</th>
        </tr>
    </thead>
        <%
            if (request.getParameter("lat") == null && request.getParameter("lnt") == null) {
        %>
    <tbody>
        <tr>
            <td colspan = "17" align="center">위치 정보를 입력한 후에 조회해 주세요.</td>
        </tr>
        <%
            } else {
                HistoryData historyData = new HistoryData();
                HistoryService historyService = new HistoryService();
                Double lat = Double.valueOf(request.getParameter("lat"));
                Double lnt = Double.valueOf(request.getParameter("lnt"));
                historyData.setMyLat(lat);
                historyData.setMyLnt(lnt);
                historyService.insertHistory(historyData);

                WifiService wifiService = new WifiService();
                List<WifiData> wifiDataList = wifiService.selectData(lat,lnt);
                for (int i = 0; i < wifiDataList.size(); i++) {
        %>
        <tr>
            <%
                double dist = wifiDataList.get(i).getDistance();
                String mgr = wifiDataList.get(i).getXSwifiMgrNo();
            %>
            <td><%= dist %></td>
            <td><%= mgr %></td>
            <td><%= wifiDataList.get(i).getXSwifiWrdofc() %></td>
            <td>
                <a href="wifidetail.jsp?mgr_No=<%=mgr%>&distance=<%=dist%>">
                <%= wifiDataList.get(i).getXSwifiMainNm() %>
                </a>
            </td>
            <td><%= wifiDataList.get(i).getXSwifiAddres1() %></td>
            <td><%= wifiDataList.get(i).getXSwifiAddres2() %></td>
            <td><%= wifiDataList.get(i).getXSwifiInstlFloor() %></td>
            <td><%= wifiDataList.get(i).getXSwifiInstlTy() %></td>
            <td><%= wifiDataList.get(i).getXSwifiInstlMby() %></td>
            <td><%= wifiDataList.get(i).getXSwifiSvcSe() %></td>
            <td><%= wifiDataList.get(i).getXSwifiCmcwr() %></td>
            <td><%= wifiDataList.get(i).getXSwifiCnstcYear() %></td>
            <td><%= wifiDataList.get(i).getXSwifiInoutDoor() %></td>
            <td><%= wifiDataList.get(i).getXSwifiRemars3() %></td>
            <td><%= wifiDataList.get(i).getLat() %></td>
            <td><%= wifiDataList.get(i).getLnt() %></td>
            <td><%= wifiDataList.get(i).getWorkDttm() %></td>
        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<script src="./js/getLocation.js"></script>
<script src="./js/detailList.js"></script>
</body>
</html>