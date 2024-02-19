<%@ page import="Board.BoardDTO" %>
<%@ page import="Board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String bd_name = request.getParameter("bd_name");
  String bd_title = request.getParameter("bd_title");
  String bd_content = request.getParameter("bd_content");

  BoardDTO dto = new BoardDTO();
  dto.setBd_name(bd_name);
  dto.setBd_title(bd_title);
  dto.setBd_content(bd_content);

  BoardDAO dao = new BoardDAO();
  int res = dao.insert(dto);

  if (res>0){
%>
 <script type="text/javascript">
   alert("글 등록 성공");
   location.href="Main.jsp";
 </script>
<%
  }else{
%>
  <script type="text/javascript">
    alert("글 등록 실패");
    location.href="Insert.jsp"
  </script>
<%
  }
%>

</body>
</html>
