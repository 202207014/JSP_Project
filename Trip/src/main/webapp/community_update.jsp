<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 수정 | Trip Planner 커뮤니티</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/community.css"> 
</head>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<%
// ----------------------------------------------------
// 1. 변수 초기화 및 접근 권한 체크
// ----------------------------------------------------
request.setCharacterEncoding("UTF-8");

String numParam = request.getParameter("num");
if (numParam == null || numParam.isEmpty()) {
    out.println("<script>alert('잘못된 접근입니다.'); location.href='community_list.jsp';</script>");
    return;
}
int num = Integer.parseInt(numParam);

// 세션에서 로그인 ID 가져오기 (trim() 적용)
String sessionId = (String) session.getAttribute("userid");
if (sessionId != null) {
    sessionId = sessionId.trim();
}

// DB 연결 정보
String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "root";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

// 게시글 데이터 저장을 위한 변수
String post_id = "";
String post_subject = "";
String post_content = "";
String post_area = "";
boolean isPostFound = false;


// ----------------------------------------------------
// 2. JDBC 로직: 기존 게시글 정보 가져오기
// ----------------------------------------------------
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    // 게시글 정보 조회 (SELECT)
    String selectSql = "SELECT id, subject, content, area FROM community WHERE num = ?";
    pstmt = conn.prepareStatement(selectSql);
    pstmt.setInt(1, num);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        isPostFound = true;
        post_id = rs.getString("id");
        post_subject = rs.getString("subject");
        post_content = rs.getString("content");
        post_area = rs.getString("area");
    }

} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('데이터를 가져오는 중 오류가 발생했습니다.'); history.back();</script>");
    return;
} finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}

// ----------------------------------------------------
// 3. 권한 및 HTML 출력
// ----------------------------------------------------
// 1) 게시글이 없거나 2) 로그인 ID와 작성자 ID가 일치하지 않으면 접근 차단
if (!isPostFound) {
    out.println("<script>alert('해당 게시글을 찾을 수 없습니다.'); location.href='community_list.jsp';</script>");
} else if (sessionId == null || !sessionId.equals(post_id)) { 
    out.println("<script>alert('수정 권한이 없습니다.'); location.href='community_list.jsp';</script>");
} else {
    // 폼에 데이터를 채워서 출력
%>
    <main class="community-container">
        <div class="write-form-wrapper">
            <h1 class="form-title">여행 리뷰 수정 ✏️</h1>
            <hr class="divider">
            
            <form action="community_update_pro.jsp" method="post" class="review-form">
                
                <input type="hidden" name="num" value="<%= num %>"> 

                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" id="title" name="title" required value="<%= post_subject %>">
                </div>

                <div class="form-group half-width">
                    <label for="category">여행지 (지역)</label>
                    <select id="category" name="category" required>
                        <option value="jeju" <%= "jeju".equals(post_area) ? "selected" : "" %>>제주</option>
                        <option value="busan" <%= "busan".equals(post_area) ? "selected" : "" %>>부산</option>
                        <option value="seoul" <%= "seoul".equals(post_area) ? "selected" : "" %>>서울</option>
                        <option value="gangneung" <%= "gangneung".equals(post_area) ? "selected" : "" %>>강릉</option>
                        <option value="etc" <%= "etc".equals(post_area) ? "selected" : "" %>>기타</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content" rows="10" required><%= post_content %></textarea>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">수정 완료</button>
                    <button type="button" class="btn-cancel" onclick="location.href='community_view.jsp?num=<%= num %>'">취소</button>
                    <button type="button" class="btn-cancel" onclick="location.href='community_list.jsp'">목록</button>
                </div>
            </form>
        </div>
    </main>
<%
} // end of 권한 체크 else
%>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>