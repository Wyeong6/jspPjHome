<%@ page import="Board.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="Board.BoardDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/Fix/Header.jsp" %>
<%
    BoardDAO dao = new BoardDAO();
    List<BoardDTO> list = dao.selectAll();
%>
    <h1>게시판 목록</h1>
    <form action="Multidel.jsp" method="post" id="multidelete">
    <table border="1">
        <col width="50px">
        <col width="100px">
        <col width="200px">
        <col width="100px">
        <tr>
            <th><input type="checkbox" name="all" onclick="allChk(this.checked);"></th>
            <th>No</th>
            <th>Name</th>
            <th>Title</th>
            <th>Date</th>
            <th>update</th>
            <th>delete</th>
        </tr>

        <%--for 반복문으로 테이블에 tr태그 추가--%>
<%
    for(int i=0; i<list.size(); i++){
%>
        <tr>
            <td><input type="checkbox" name="chk" value="<%=list.get(i).getBd_no()%>"></td>
            <td><%=list.get(i).getBd_no()%></td>
            <td><%=list.get(i).getBd_name()%></td>
            <td><a href="SelectOne.jsp?bd_no=<%=list.get(i).getBd_no()%>"><%=list.get(i).getBd_title()%></a></td>
            <td><%=list.get(i).getBd_date()%></td>
            <td><a href="Update.jsp?bd_no=<%=list.get(i).getBd_no()%>">수정</a></td>
            <td><a href="">삭제</a> </td>
        </tr>
        <%
            }
    dao.close();
        %>
        <tr>
            <td colspan="7" align="right">
                <input type="submit" value="삭제">
                <button onclick="location.href='Insert.jsp'">글쓰기</button>
            </td>
        </tr>
    </table>
<%@include file="/Fix/Footer.jsp" %>
</body>
</html>
