<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>회원가입</title>
    <link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/register.css">    
</head>
<body>
    <div class="logo">
       <a href="${pageContext.request.contextPath}/index.jsp">Trip Planner</a>
    </div>
    <main>
        <div class="register-container">
            <h2>회원가입</h2>
            <form action="registerProcess.jsp" method="post">
                <label for="userid">아이디</label>
                <input type="text" id="userid" name="userid" required autofocus maxlength="20" />

                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required minlength="4" />

                <label for="passwordConfirm">비밀번호 확인</label>
                <input type="password" id="passwordConfirm" name="passwordConfirm" required minlength="4" />

                <label for="name">이름</label>
                <input type="text" id="name" name="name" required maxlength="30" />

                <button type="submit">회원가입</button>
            </form>
            <div class="register-footer">
                이미 회원이신가요? <a href="login.jsp">로그인</a>
            </div>
        </div>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.register-container form');
            form.addEventListener('submit', function(event) {
                const password = document.getElementById('password').value;
                const passwordConfirm = document.getElementById('passwordConfirm').value;

                if (password !== passwordConfirm) {
                    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                    event.preventDefault(); // 폼 제출 방지
                }
            });
        });
    </script>
</body>
<footer>
<%@ include file="../footer.jsp" %>
</footer>
</html>