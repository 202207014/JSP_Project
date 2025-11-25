<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 삭제 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

// 1. 변수 및 세션 체크
String sessionId = (String) session.getAttribute("userid");
String numParam = request.getParameter("num");

if (sessionId == null) {
	out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
	return;
}
if (numParam == null || numParam.isEmpty()) {
	out.println("<script>alert('게시글 번호가 누락되었습니다.'); location.href='community_list.jsp';</script>");
	return;
}
int num = Integer.parseInt(numParam);


// 2. JDBC 설정
String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "root";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPass);
    
    // 3. 권한 확인 (SELECT)
    // 현재 세션ID와 DB에 저장된 작성자ID가 일치하는지 확인
    String checkOwnerSql = "SELECT id FROM community WHERE num = ?";
    pstmt = conn.prepareStatement(checkOwnerSql);
    pstmt.setInt(1, num);
    rs = pstmt.executeQuery();
    
    if (rs.next()) {
        String postOwnerId = rs.getString("id");
        
        if (!sessionId.equals(postOwnerId)) {
            // 권한 없음
            out.println("<script>alert('삭제 권한이 없습니다.'); location.href='community_view.jsp?num=" + num + "';</script>");
            return;
        }
    } else {
         // 게시글이 존재하지 않음
         out.println("<script>alert('해당 게시글을 찾을 수 없습니다.'); location.href='community_list.jsp';</script>");
         return;
    }
    
    // 4. 데이터 삭제 (DELETE)
    String deleteSql = "DELETE FROM community WHERE num = ? AND id = ?";
    pstmt.close(); // 기존 pstmt 닫기
    
    pstmt = conn.prepareStatement(deleteSql);
    pstmt.setInt(1, num);
    pstmt.setString(2, sessionId); // 작성자 ID로 한 번 더 검증
    
    int result = pstmt.executeUpdate();

    if (result > 0) {
        out.println("<script>alert('게시글이 성공적으로 삭제되었습니다.'); location.href='community_list.jsp';</script>");
    } else {
        // result == 0 이면 삭제 실패 (권한 문제가 아닌 DB 오류)
        out.println("<script>alert('삭제에 실패했습니다. 데이터베이스 오류를 확인하세요.'); history.back();</script>");
    }

} catch (Exception e) {
	e.printStackTrace();
    out.println("<script>");
    out.println("alert('삭제 처리 중 치명적 오류 발생: " + e.getMessage().replace("'", "").replace("\n", " ") + "');");
	out.println("history.back();");
	out.println("</script>");
} finally {
	// 자원 해제
	if (rs != null) try { rs.close(); } catch (Exception e) {}
	if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
</body>
</html>