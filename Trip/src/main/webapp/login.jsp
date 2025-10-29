<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css" />
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
        <div class="logo2">
           <a href="${pageContext.request.contextPath}/index.jsp">Trip Planner</a>
        </div>
    <main>
        <div class="login-container">
            <h2>로그인</h2>
            <form action="loginProcess.jsp" method="post">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" required autofocus />

                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required />

                <button type="submit">로그인</button>
            </form>
            <div class="login-footer">
                <a href="register.jsp">회원가입</a> |
                <a href="forgotPassword.jsp">비밀번호 찾기</a>
            </div>
        </div>
    </main>
</body>
<footer>
<%@ include file="../footer.jsp" %>
</footer>

</html>