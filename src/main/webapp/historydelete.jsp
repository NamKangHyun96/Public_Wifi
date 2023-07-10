<%@ page import="dao.HistoryService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  HistoryService historyService = new HistoryService();
  if (request.getParameter("delData") != null) {
      int id = Integer.valueOf(request.getParameter("delData"));
      historyService.deleteHistory(id);
  }
  response.sendRedirect("history.jsp");
%>
</body>
</html>
