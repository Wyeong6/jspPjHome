<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<html>
<link rel="stylesheet" href="/TfCSS/Button.CSS">
<head>
    <title>메인 페이지</title>
</head>

<body>

<h1 class="title">메인 페이지</h1>

<div class="loginForm">
    <form action="/특정서블릿URL" method="post">
        <input type="text" name="username" placeholder="사용자명">
        <input type="password" name="password" placeholder="비밀번호">
        <button type="submit" name="action" value="login">로그인</button>
    </form>
</div>

<div class="button-container">
    <form action="/" method="post">
        <button type="submit" name="action" value="login">회원가입</button>
    </form>
    <form action="/" method="post">
        <button type="submit" name="action" value="login">편지띄우기</button>
    </form>
    <form action="/ViewController.do" method="post">
        <button type="submit" name="action" value="login">편지받기</button>
    </form>
</div>

</body>
</html>