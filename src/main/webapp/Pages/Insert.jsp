<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>글쓰기</h1>
    <form action="Insert_alert.jsp" method="get">
        <table border="1">
            <tr>
                <th>NAME</th>
                <td><input type="text" name="bd_name"></td>
            </tr>
            <tr>
                <th>TITLE</th>
                <td><input type="text" name="bd_title"></td>
            </tr>
            <tr>
                <th>CONTENT</th>
                <td><textarea rows="10" cols="60" name="bd_content"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <input type="submit" value="입력">
                    <input type="button" value="취소" onclick="location.href='Main.jsp'">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
