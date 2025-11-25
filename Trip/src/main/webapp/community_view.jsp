<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 보기 | Trip Planner 커뮤니티</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/community.css"> 
    <style>
        /* community_view 전용 스타일 (임시) */
        .view-wrapper {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fff;
        }
        .view-header h1 {
            border-bottom: 2px solid #5cb85c;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .view-info {
            display: flex;
            justify-content: space-between;
            color: #666;
            font-size: 0.9em;
            margin-bottom: 20px;
            padding: 5px 0;
            border-bottom: 1px dashed #eee;
        }
        .view-content {
            min-height: 200px;
            padding: 20px;
            line-height: 1.6;
            border: 1px solid #f0f0f0;
            border-radius: 4px;
            white-space: pre-wrap; /* 줄바꿈 유지 */
        }
        .view-actions {
            margin-top: 30px;
            text-align: right;
        }
        .view-actions .btn {
            padding: 8px 15px;
            margin-left: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.9em;
        }
        .btn-list { background-color: #aaa; color: #fff; }
        .btn-edit { background-color: #5cb85c; color: #fff; }
        .btn-delete { background-color: #d9534f; color: #fff; }
    </style>
</head>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<%
// ----------------------------------------------------
// 1. 변수 초기화 및 파라미터/세션 체크
// ----------------------------------------------------
request.setCharacterEncoding("UTF-8");

// URL에서 게시글 번호(num) 가져오기
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
String post_regist_day = "";
int post_hit = 0;
boolean isPostFound = false;


// ----------------------------------------------------
// 2. JDBC 로직: 조회수 증가 및 게시글 정보 가져오기
// ----------------------------------------------------
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    // 2-1. 조회수 증가 (UPDATE)
    String updateSql = "UPDATE community SET hit = hit + 1 WHERE num = ?";
    pstmt = conn.prepareStatement(updateSql);
    pstmt.setInt(1, num);
    pstmt.executeUpdate();
    pstmt.close(); // pstmt 재사용을 위해 닫기

    // 2-2. 게시글 정보 조회 (SELECT)
    String selectSql = "SELECT id, subject, content, area, regist_day, hit FROM community WHERE num = ?";
    pstmt = conn.prepareStatement(selectSql);
    pstmt.setInt(1, num);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        isPostFound = true;
        post_id = rs.getString("id");
        post_subject = rs.getString("subject");
        post_content = rs.getString("content");
        post_area = rs.getString("area");
        post_hit = rs.getInt("hit");

        Timestamp timestamp = rs.getTimestamp("regist_day");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
        post_regist_day = sdf.format(timestamp);
    }

} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('데이터를 가져오는 중 오류가 발생했습니다.'); history.back();</script>");
    return;
} finally {
    // 자원 해제
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}

// ----------------------------------------------------
// 3. HTML 출력
// ----------------------------------------------------
if (!isPostFound) {
    out.println("<script>alert('해당 게시글을 찾을 수 없습니다.'); location.href='community_list.jsp';</script>");
} else {
%>
    <main class="community-container">
        <div class="view-wrapper">
            <div class="view-header">
                <h1 class="form-title">
                    <%= post_subject %>
                    <span style="font-size: 0.5em; color: #888;">[<%= post_area %>]</span>
                </h1>
            </div>
            <div class="view-info">
                <span>작성자: <%= post_id %></span>
                <span>작성일: <%= post_regist_day %></span>
                <span>조회: <%= post_hit %></span>
            </div>
            
            <div class="view-content">
                <%= post_content.replaceAll("\n", "<br>") %> 
            </div>
            
            <div class="view-actions">
                <% 
                // 로그인 ID와 작성자 ID가 일치할 경우에만 수정/삭제 버튼 표시
                if (sessionId != null && sessionId.equals(post_id)) { 
                %>
                    <button type="button" class="btn btn-edit" onclick="location.href='community_update.jsp?num=<%= num %>'">수정</button>
                    <button type="button" class="btn btn-delete" onclick="if(confirm('정말로 삭제하시겠습니까?')) location.href='community_delete.jsp?num=<%= num %>'">삭제</button>
                <%
                }
                %>
                <button type="button" class="btn btn-list" onclick="location.href='community_list.jsp'">목록</button>
            </div>
        </div>
    </main>
<%
} // end of if (!isPostFound)
%>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>