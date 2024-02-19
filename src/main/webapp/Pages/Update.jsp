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
    int bd_no = Integer.parseInt(request.getParameter("bd_no"));

    BoardDAO dao = new BoardDAO();
    BoardDTO dto = dao.selectOne(bd_no);
%>

<form action="Update_alert.jsp" method="post">
    <input type="hidden" name="bd_no" value="<%=dto.getBd_no()%>">
    <table border="1">
        <tr>
            <th>NAME</th>
            <td><%=dto.getBd_name()%></td>
        </tr>
        <tr>
            <th>TITLE</th>
            <td><input type="text" name="bd_title" value="<%=dto.getBd_title()%>"></td>
        </tr>
        <tr>
            <th>CONTENT</th>
            <td><textarea rows="10" cols="60" name="bd_content"><%=dto.getBd_content()%></textarea></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="수정">
            </td>
        </tr>
    </table>
</form>
<% dao.close(); %>
</body>
</html>
