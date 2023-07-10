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
        int id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        int order = Integer.valueOf(request.getParameter("order"));
        int success = bookMarkService.updateBookGroup(id, order, name);
        if (success > 0) {
    %>
        <script type="text/javascript">
            alert("북마크 그룹 정보를 수정하였습니다.");
            location.href="bookmark-group.jsp";
        </script>
    <%
        } else {
    %>
        <script type="text/javascript">
            alert("북마크 그룹 정보를 수정에 실패하였습니다.");
            location.href="bookmark-group-edit.jsp?id=<%=id%>&order=<%=order%>&name=<%=name%>";
        </script>
    <%
        }
    }
    %>
</body>
</html>

