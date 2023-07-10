<%@ page import="dto.BookMarkList" %>
<%@ page import="dto.WifiData" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.WifiService" %>
<%@ page import="dao.BookMarkService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String listNm = request.getParameter("listNm");
    String mgrNo = request.getParameter("mgrNo");

    if (listNm != null) {
        WifiService wifiService = new WifiService();
        List<WifiData> wifiList = wifiService.selectDetail(mgrNo);
        String wifiNm = "";
        for (WifiData item : wifiList) {
            wifiNm = item.getXSwifiMainNm();
        }
        int groupId = Integer.valueOf(listNm);
        BookMarkService bookMarkService = new BookMarkService();
        int success = bookMarkService.createBookList(groupId, wifiNm);
        if (success > 0){
    %>
    <script type="text/javascript">
        alert("북마크 정보를 추가하였습니다.");
        location.href="bookmark-list.jsp";
    </script>
        <%
        } else {
        %>
    <script type="text/javascript">
        alert("북마크 정보를 추가에 실패하였습니다.");
        location.href="bookmark-list.jsp";
    </script>
    <%
            }
        }
    %>
</body>
</html>
