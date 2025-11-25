<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 저장</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

// 세션에서 로그인 ID 가져오기
String userId = (String) session.getAttribute("userid");
if (userId == null) {
	out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
	return;
}

String url = "jdbc:mysql://localhost:3306/trip" 
        + "?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; 
String dbUser = "root";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPass);

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String category = request.getParameter("category");

	String sql = "INSERT INTO community (id, subject, content, area, regist_day, hit) "
			+ "VALUES (?, ?, ?, ?, NOW(), 0)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	pstmt.setString(2, title);
	pstmt.setString(3, content);
	pstmt.setString(4, category);

	int result = pstmt.executeUpdate();

	if (result > 0) {
		out.println("<script>alert('게시글이 등록되었습니다.'); location.href='community_list.jsp';</script>");
	} else {
		out.println("<script>alert('등록 실패'); history.back();</script>");
	}

} catch (Exception e) {
	e.printStackTrace();
	out.println("<script>");
    out.println("alert('게시글 등록 중 치명적 오류 발생. 자세한 내용은 콘솔을 확인하세요.');");
    out.println("alert('오류 내용: " + e.getMessage().replace("'", "").replace("\n", " ") + "');"); // 오류 메시지 출력
	out.println("history.back();");
	out.println("</script>");
} finally {
	if (pstmt != null)
		try {
	pstmt.close();
		} catch (Exception e) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (Exception e) {
		}
}
%>
</body>
</html>