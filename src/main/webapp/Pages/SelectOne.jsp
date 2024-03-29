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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
  $(function (){
    $("#updateform").hide();
  })
  function updateformView(){
    $("#updateform").show();
    $("#borderform").hide();
  }
</script>
<div id="borderform">
<table border="1">
  <tr>
    <th>NAME:</th>
    <td><%=dto.getBd_name()%></td>
  </tr>
  <tr>
    <th>TITLE</th>
    <td><%=dto.getBd_title()%></td>
  </tr>
  <tr>
    <th>CONTENT</th>
    <td><textarea rows="10" cols="60" readonly="readonly"><%=dto.getBd_content()%></textarea> </td>
  </tr>
  <tr>
    <td colspan="2">
      <button onclick="updateformView();">수정</button>&nbsp;&nbsp;
      <button onclick="location.href='Delete.jsp?bd_no=<%=dto.getBd_no()%>'">삭제</button>&nbsp;&nbsp;
      <button onclick="location.href='Main.jsp'">목록</button>&nbsp;&nbsp;
    </td>
  </tr>
</table>
</div>

<div id="updateform">
  <h1>글 수정</h1>

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
</div>
</body>
</html>
