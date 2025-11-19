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
                <div class="input-group"> 
                    <input type="text" id="userid" name="userid" required autofocus maxlength="20" placeholder="아이디를 입력해주세요" />
                    <button type="button" id="checkIdBtn">중복 확인</button>
                </div>
				 <input type="hidden" id="checkId" name="checkId" value="NO">
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
        // 아이디 중복 확인 
        document.getElementById("checkIdBtn").addEventListener("click", function () {
            const userid = document.getElementById("userid").value;
            const checkIdInput = document.getElementById("checkId");
            if (userid.trim() === "") {
                alert("아이디를 입력해주세요.");
                return;
            }

            // AJAX 호출
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "checkId.jsp?userid=" + encodeURIComponent(userid), true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const result = xhr.responseText.trim();

                    if (result === "OK") {
                        alert("사용 가능한 아이디입니다.");
                        checkIdInput.value = "YES";
                    } else if (result === "USED") {
                        alert("이미 존재하는 아이디입니다.");
                        checkIdInput.value = "NO";
                    } else {
                        alert("오류가 발생했습니다.");
                        checkIdInput.value = "NO";
                    }
                }
            };

            xhr.send();
        });
        
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('.register-container form');
            form.addEventListener('submit', function(event) {

                const password = document.getElementById('password').value;
                const passwordConfirm = document.getElementById('passwordConfirm').value;
                const checkId = document.getElementById('checkId').value;

                if (password !== passwordConfirm) {
                    alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                    event.preventDefault();
                    return;
                }

                // ★ 아이디 중복확인 여부 체크
                if (checkId !== "YES") {
                    alert("아이디 중복확인을 먼저 해주세요.");
                    event.preventDefault(); // 전송 막기
                    return;
                }
            });
        });

    </script>
</body>
<footer>
<%@ include file="../footer.jsp" %>
</footer>
</html>