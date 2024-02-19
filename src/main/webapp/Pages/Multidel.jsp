<%@ page import="Board.BoardDAO" %>
<%@ page import="Board.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String [] bd_no = request.getParameterValues("chk");

    BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.multiDelete(bd_no);
%>
</body>
</html>
