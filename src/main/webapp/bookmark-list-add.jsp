<%@ page import="dao.BookMarkService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  BookMarkService bookMarkService = new BookMarkService();
  if (request.getParameter("name") != null && request.getParameter("order") != null) {
    String name = request.getParameter("name");
    int order = Integer.valueOf(request.getParameter("order"));
    int success = bookMarkService.createBookGroup(name, order);
    if (success > 0) {
%>
<script type="text/javascript">
  alert("북마크 그룹 정보를 추가하였습니다.");
  location.href="bookmark-group.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
  alert("북마크 그룹 정보를 추가에 실패하였습니다.");
  location.href="bookmark-group-add.jsp?name=<%=name%>&order=<%=order%>";
</script>
<%
    }
  }
%>
</body>
</html>
