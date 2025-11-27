<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<%
// 폼에서 전송된 데이터의 한글 깨짐 방지 처리 (필수)
request.setCharacterEncoding("UTF-8");

// 1. 변수 선언 및 로그인 세션 확인
String userId = (String) session.getAttribute("userid"); // 세션에서 사용자 ID를 가져옴

// 로그인 체크: 사용자 ID가 없으면 경고 후 로그인 페이지로 이동
if (userId == null) {
	out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
	return;
}

// JDBC 연결 정보 설정
String url = "jdbc:mysql://localhost:3306/trip" 
        + "?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // 한글 인코딩 설정 포함
String dbUser = "root";
String dbPass = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	// 2. DB 연결 및 데이터 수신
	Class.forName("com.mysql.cj.jdbc.Driver"); // JDBC 드라이버 로드
	conn = DriverManager.getConnection(url, dbUser, dbPass); // DB 연결 수립

	// HTML 폼에서 전송된 파라미터 값 수신
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String category = request.getParameter("category"); // (DB의 'area' 컬럼에 저장될 값)

	// 3. SQL 쿼리 준비 (INSERT)
	// regist_day는 NOW() 함수로 현재 시간을 DB에서 직접 기록하도록 함.
	// hit는 0으로 초기값 설정.
	String sql = "INSERT INTO community (id, subject, content, area, regist_day, hit) "
			+ "VALUES (?, ?, ?, ?, NOW(), 0)";
	
	pstmt = conn.prepareStatement(sql);
	
	// 4. 값 바인딩 (SQL Injection 방지)
	pstmt.setString(1, userId);   // 1번: id (작성자 ID)
	pstmt.setString(2, title);    // 2번: subject (제목)
	pstmt.setString(3, content);  // 3번: content (내용)
	pstmt.setString(4, category); // 4번: area (지역/카테고리)

	// 5. 쿼리 실행
	int result = pstmt.executeUpdate(); // 쿼리 실행 결과 (영향 받은 행의 수)

	// 6. 결과 처리 및 페이지 이동
	if (result > 0) {
		// 등록 성공 시
		out.println("<script>alert('게시글이 등록되었습니다.'); location.href='community_list.jsp';</script>");
	} else {
		// 등록 실패 시
		out.println("<script>alert('등록 실패'); history.back();</script>");
	}

} catch (Exception e) {
	// 7. 예외 처리 (오류 발생 시)
	e.printStackTrace(); // 개발 콘솔에 오류 상세 내용 출력
	
	// 사용자에게 경고 메시지 출력 (JS 문법 깨짐 방지 처리 포함)
	out.println("<script>");
    out.println("alert('게시글 등록 중 치명적 오류 발생. 자세한 내용은 콘솔을 확인하세요.');");
    // 오류 메시지의 따옴표/줄바꿈 등을 제거하여 JS alert이 깨지지 않도록 함
    out.println("alert('오류 내용: " + e.getMessage().replace("'", "").replace("\"", "").replace("\n", " ") + "');"); 
	out.println("history.back();"); // 이전 페이지로 복귀
	out.println("</script>");
} finally {
	// 8. 자원 해제 (DB 연결 객체 닫기)
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