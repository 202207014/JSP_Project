<%-- community_write.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>여행 리뷰 작성 | Trip Planner 커뮤니티</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/community.css"> 
</head>
<%
String userId = (String) session.getAttribute("userid");
if (userId == null) {
    out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
    return;
}
%>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main class="community-container">
    <div class="write-form-wrapper">
        <h1 class="form-title">여행 리뷰 작성 📝</h1>
        <hr class="divider">
        
        <form action="community_save.jsp" method="post" class="review-form">
            
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" required placeholder="게시글 제목을 입력해주세요">
            </div>

            <div class="form-group half-width">
                <label for="category">여행지 (지역)</label>
                <select id="category" name="category" required>
                    <option value="" disabled selected>지역 선택</option>
                    <option value="제주">제주</option>
                    <option value="부산">부산</option>
                    <option value="서울">서울</option>
                    <option value="강릉">강릉</option>
                    <option value="기타">기타</option>
                </select>
            </div>

            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="content" rows="10" required placeholder="여행 경험과 팁을 공유해주세요."></textarea>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn-submit">작성 완료</button>
                <button type="button" class="btn-cancel" onclick="history.back()">취소</button>
                <button type="button" class="btn-cancel" onclick="location.href='community_list.jsp'">목록보기</button>
            </div>
        </form>
    </div>
</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>