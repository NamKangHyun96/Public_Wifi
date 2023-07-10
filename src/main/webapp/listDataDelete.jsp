<%@ page import="dao.BookMarkService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  BookMarkService bookMarkService = new BookMarkService();
  if (request.getParameter("delData") != null) {
    int id = Integer.valueOf(request.getParameter("delData"));
    int success = bookMarkService.deleteBookList(id);
    if (success > 0) {
%>
<script type="text/javascript">
  alert("북마크 정보를 삭제하였습니다.");
  location.href="bookmark-list.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
  alert("북마크 정보 삭제에 실패하였습니다.");
  location.href="bookmark-list.jsp";
</script>
<%
    }
  }
%>
</body>
</html>
