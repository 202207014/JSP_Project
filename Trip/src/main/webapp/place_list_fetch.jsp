<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // 1. 파라미터 수신 및 인코딩 설정
    request.setCharacterEncoding("UTF-8");
    
    // AJAX 요청으로부터 지역명 (예: 제주)과 카테고리 (예: 숙박)를 받음
    String locationName = request.getParameter("location"); 
    String category = request.getParameter("type"); 
    
    // DB 연결 설정
    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    // ==========================================================
    // 2. 지역 및 카테고리 매핑 로직
    // ==========================================================
    
    // 2-1. 지역 이름 매핑 (한글 이름 -> DB place_id 접두사)
    String locPrefix = "";
    if ("제주".equals(locationName)) locPrefix = "jeju";
    else if ("부산".equals(locationName)) locPrefix = "busan";
    else if ("서울".equals(locationName)) locPrefix = "seoul";
    else if ("강릉".equals(locationName)) locPrefix = "gangneung";
    else locPrefix = "jeju"; // 기본값 설정
    
    // 2-2. 카테고리 매핑 (버튼 이름 -> DB place_type 목록)
    // SQL IN 절에 들어갈 문자열을 동적으로 구성
    String typeCondition = "";
    if ("숙박".equals(category)) {
        typeCondition = "'숙박', '호텔', '펜션', '리조트'";
    } else if ("맛집".equals(category)) {
        typeCondition = "'음식', '카페'"; 
    } else { // 즐길거리 (명소, 체험 등)
        typeCondition = "'명소', '관광지', '테마파크', '산책로', '체험관광지', '시장', '해변', '해수욕장'";
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        
        // 3. SQL 쿼리 준비
        // 쿼리: 해당 지역으로 시작하는 ID를 가지며, 타입이 IN 절에 포함되는 장소 3개를 랜덤으로 조회
        String sql = "SELECT place_name, place_img FROM places " +
                     "WHERE place_id LIKE ? AND place_type IN (" + typeCondition + ") " +
                     "ORDER BY RAND() LIMIT 3"; 
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, locPrefix + "%"); // 예: 'jeju%' 바인딩
        
        rs = pstmt.executeQuery();
        
        boolean hasData = false;
        
        // 4. 결과 HTML 생성 (AJAX 응답 본문)
        while (rs.next()) {
            hasData = true;
            String pName = rs.getString("place_name");
            String pImg = rs.getString("place_img");
%>
            
            <div class="popup-card">
                <div class="popup-img-wrapper">
                    <img src="<%= pImg %>" alt="<%= pName %>">
                </div>
                <div class="popup-info">
                    <h4><%= pName %></h4>
                    <span class="heart-icon">♥</span>
                </div>
            </div>
<%
        }
        
        // 5. 데이터가 없을 경우 처리
        if (!hasData) {
            out.println("<p style='width:100%; text-align:center; color:#666;'>해당하는 추천 장소가 없습니다.</p>");
        }

    } catch (Exception e) {
        // 6. 오류 발생 시 처리
        e.printStackTrace();
        out.println("데이터 로드 중 오류 발생: " + e.getMessage()); // 디버그를 위한 간단한 오류 메시지 출력
    } finally {
        // 7. DB 자원 해제 (필수)
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>