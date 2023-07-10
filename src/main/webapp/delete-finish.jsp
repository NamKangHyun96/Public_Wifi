<%@ page import="dao.BookMarkService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        BookMarkService bookMarkService = new BookMarkService();
        if (request.getParameter("id") != null) {
            int id = Integer.valueOf(request.getParameter("id"));
            String name = request.getParameter("name");
            int order = Integer.valueOf(request.getParameter("order"));
            int success = bookMarkService.deleteBookGroup(id);
            if (success > 0) {
    %>
        <script type="text/javascript">
            alert("북마크 그룹 정보를 삭제하였습니다.");
            location.href="bookmark-group.jsp";
        </script>
    <%
        } else {
    %>
        <script type="text/javascript">
            alert("북마크 그룹 정보를 삭제에 실패하였습니다.");
            location.href="bookmark-delete.jsp?id=<%=id%>&order=<%=order%>&name=<%=name%>";
        </script>
    <%
            }
        }
    %>
</body>
</html>
