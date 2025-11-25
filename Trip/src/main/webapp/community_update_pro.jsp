<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<%
request.setCharacterEncoding("UTF-8");

// 1. 세션 및 파라미터 받기
String sessionId = (String) session.getAttribute("userid");
String numParam = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");
String category = request.getParameter("category"); // DB 컬럼명은 'area'임

// ----------------------------------------------------
// 2. 필수 값 및 로그인 체크
// ----------------------------------------------------
if (sessionId == null) {
	out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
	return;
}
if (numParam == null || numParam.isEmpty()) {
	out.println("<script>alert('게시글 번호가 누락되었습니다.'); history.back();</script>");
	return;
}
int num = Integer.parseInt(numParam);

// 공백 제거 및 유효성 검사 (필요 시 강화)
String finalTitle = title != null ? title.trim() : "";
String finalContent = content != null ? content.trim() : "";
String finalCategory = category != null ? category.trim() : "";

if (finalTitle.isEmpty() || finalContent.isEmpty()) {
    out.println("<script>alert('제목과 내용을 모두 입력해주세요.'); history.back();</script>");
    return;
}


// ----------------------------------------------------
// 3. JDBC 설정 및 UPDATE 로직
// ----------------------------------------------------
String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "root";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPass);
    
    // 3-1. 작성자 권한 확인 (보안 강화)
    // 현재 세션ID와 DB에 저장된 작성자ID가 일치하는지 확인
    String checkOwnerSql = "SELECT id FROM community WHERE num = ?";
    pstmt = conn.prepareStatement(checkOwnerSql);
    pstmt.setInt(1, num);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()) {
        String postOwnerId = rs.getString("id");
        if (!postOwnerId.equals(sessionId)) {
            out.println("<script>alert('수정 권한이 없습니다.'); location.href='community_view.jsp?num=" + num + "';</script>");
            return;
        }
    } else {
         out.println("<script>alert('해당 게시글을 찾을 수 없습니다.'); location.href='community_list.jsp';</script>");
         return;
    }
    pstmt.close(); // pstmt는 재사용 위해 닫음
    

    // 3-2. 데이터 갱신 (UPDATE)
    // DB 컬럼명: subject, content, area
	String sql = "UPDATE community SET subject = ?, content = ?, area = ? WHERE num = ? AND id = ?";

	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, finalTitle);
	pstmt.setString(2, finalContent);
	pstmt.setString(3, finalCategory); // area 컬럼에 category 변수 값 삽입
    pstmt.setInt(4, num);
    pstmt.setString(5, sessionId); // 작성자 ID로 한번 더 검증

	int result = pstmt.executeUpdate();

	if (result > 0) {
		out.println("<script>alert('게시글이 성공적으로 수정되었습니다.'); location.href='community_view.jsp?num=" + num + "';</script>");
	} else {
        // result == 0 이면 쿼리 실행은 되었으나 영향받은 행이 0개 (수정 실패)
		out.println("<script>alert('수정 실패: 변경된 내용이 없거나 오류가 발생했습니다.'); history.back();</script>");
	}

} catch (Exception e) {
	e.printStackTrace();
    out.println("<script>");
    out.println("alert('수정 처리 중 오류 발생: " + e.getMessage().replace("'", "").replace("\n", " ") + "');");
	out.println("history.back();");
	out.println("</script>");
} finally {
	// 자원 해제
	if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
	if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
</body>
</html>