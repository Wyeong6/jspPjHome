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
    int bd_no = Integer.parseInt(request.getParameter("bd_no"));
    String bd_title = request.getParameter("bd_title");
    String bd_content = request.getParameter("bd_content");

    //DTO 에서 int,String,String 메개변수로만 이루어진 생성자를 만들어준다
    BoardDTO dto = new BoardDTO(bd_no,bd_title,bd_content);

    BoardDAO dao = new BoardDAO();
    int res = dao.Update(dto);

    if(res>0) {
%>
    <script type="text/javascript">
        alert("글 수정 성공")
        location.href="SelectOne.jsp?bd_no=<%=dto.getBd_no()%>";
    </script>
<%
    }else{
%>
    <script type="text/javascript">
        alert("글 수정 실패")
        location.href="Update.jsp?bd_no=<%=dto.getBd_no()%>"
    </script>
<%
    }
%>
</body>
</html>
