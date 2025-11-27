<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행 코스 메인</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/destination.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("userid"); // 세션에서 사용자 ID 획득

	// 📌 필수 보안 체크: 세션에 ID가 없으면 로그인 페이지로 이동
	if (userId == null) {
		out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
		return;
	}
	%>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<main>
		<section class="popular-destinations">
			<h2>코스 확인하기</h2>
			<div class="card-container">
				<div class="card">
					<img src="img/jeju.jpg" alt="제주도">
					<h3>제주도</h3>
					<p>자연과 함께하는 힐링 여행지</p>
					<a href="course_jeju.jsp" class="btn-secondary">코스 보기</a>
				</div>
				<div class="card">
					<img src="img/busan.jpg" alt="부산">
					<h3>부산</h3>
					<p>바다와 맛집의 도시</p>
					<a href="course_busan.jsp" class="btn-secondary">코스 보기</a>
				</div>

				<div class="card">
					<img src="img/seoul.jpg" alt="서울">
					<h3>서울</h3>
					<p>역사와 현대가 공존하는 수도</p>
					<a href="course_seoul.jsp" class="btn-secondary">코스 보기</a>
				</div>
				<div class="card">
					<img src="img/gangneung.jpg" alt="강릉">
					<h3>강릉</h3>
					<p>바다와 커피의 도시</p>
					<a href="course_gangneung.jsp" class="btn-secondary">코스 보기</a>
				</div>
			</div>
		</section>

		<div class="footer-favorites-area"
			style="max-width: 600px; margin: 30px auto; padding: 0 20px;">
			<h2 class="favorites-title"
				style="font-size: 1.4em; font-weight: 600; color: #3498db; margin-top: 0; margin-bottom: 15px; border-bottom: 2px solid #3498db; padding-bottom: 5px; text-align: center;">나의
				찜 목록</h2>
			<div class="favorite-cards-wrapper"
				style="display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">

				<%
				// 📌 DB 조회 객체 선언 (지역 변수)
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				// 로그인한 경우에만 DB 조회 실행 (userId는 위에서 이미 체크됨)
				if (userId != null) {
					try {
						// DB 연결 정보
						String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
						String dbUser = "root"; 
						String dbPass = "1234"; 

						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(url, dbUser, dbPass);

						// 쿼리: favorites 테이블을 places와 JOIN하여 최근 5개 항목의 이름과 이미지 경로 조회
						String sql = "SELECT f.place_id, p.place_name, p.place_img " 
						+ "FROM favorites f "
						+ "JOIN places p ON f.place_id = p.place_id " 
						+ "WHERE f.user_id = ? " 
						+ "ORDER BY f.created_at DESC " // 찜한 시각(created_at) 기준 최신순 정렬
						+ "LIMIT 5"; // 최근 5개만 조회

						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, userId);
						rs = pstmt.executeQuery();

						boolean found = false;
						while (rs.next()) {
					found = true;
					// 조회된 데이터
					String name = rs.getString("place_name");
					String img = rs.getString("place_img");
					
					// 찜 카드 HTML 출력 (인라인 스타일)
					out.println(
							"<div style='width: 100px; background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; overflow: hidden; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.5);'>");
					out.println(
							"<img src='" + img + "' alt='" + name + "' style='width: 100%; height: 80px; object-fit: cover;'>");
					out.println(
							"<p style='font-size: 0.75em; margin: 5px 2px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: #555; padding-bottom: 5px;'>"
									+ name + "</p>");
					out.println("</div>");
						}

						if (!found) { // 찜 목록이 비어있을 때 메시지 출력
					out.println("<p style='text-align: center; color: #999; padding: 20px 0;'>찜 목록이 비어있습니다.</p>");
						}

					} catch (Exception e) { // DB 오류 발생 시
						out.println("<p style='color:red;'>DB 로드 오류: " + e.getMessage() + "</p>");
						// e.printStackTrace(); // 개발 콘솔에 상세 오류 출력
					} finally { // 📌 자원 해제 (필수)
						if (rs != null)
					try {
						rs.close();
					} catch (Exception e) {
					}
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
				} else { // 로그인 안 한 경우 메시지 출력
					out.println("<p style='text-align: center; color: #999; padding: 20px 0;'>로그인하시면 찜 목록을 확인할 수 있습니다.</p>");
				}
				%>
			</div>
		</div>
		</main>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>