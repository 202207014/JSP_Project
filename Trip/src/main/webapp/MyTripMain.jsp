<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.net.URLEncoder, java.util.*" %>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="css/MyTripMain.css">

<%
    // =========================================================
    // 1. 서버 측 로직: 로그인 체크 및 DB 데이터 조회
    // =========================================================
    
    // 세션에서 사용자 ID를 가져옴
    String userId = (String) session.getAttribute("userid");
    
    // 로그인 체크: ID가 null이면 로그인 페이지로 강제 이동
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }

    // JDBC 연결 객체 및 DB 설정
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";
    
    // DB에서 조회한 여행 목록을 담을 리스트
    List<Map<String, String>> myTripList = new ArrayList<>();
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 쿼리: 현재 사용자(user_id)의 여행 목록을 최신순(updated_at DESC)으로 조회
        String sql = "SELECT id, title, location, image, updated_at FROM mytrip WHERE user_id = ? ORDER BY updated_at DESC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        // 조회 결과를 리스트에 저장
        while (rs.next()) {
            Map<String, String> trip = new HashMap<>();
            trip.put("id", String.valueOf(rs.getInt("id")));
            trip.put("title", rs.getString("title"));
            trip.put("location", rs.getString("location"));
            
            // 이미지 경로 처리: DB 값이 NULL이거나 비어있으면 기본 이미지 경로 사용
            String imgUrl = rs.getString("image");
            if(imgUrl == null || imgUrl.trim().isEmpty()) {
                imgUrl = "img/sample_trip.jpg"; 
            }
            trip.put("image", imgUrl);
            
            myTripList.add(trip);
        }
    } catch (Exception e) {
        // DB 오류 발생 시 화면에 출력
        out.println("<p class='error-msg'>여행 목록을 불러오는 중 DB 오류 발생: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // DB 자원 해제 (null 체크 포함)
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>

<main class="container">
    
    <h1 class="main-title">나의 여행</h1>

    <div class="top-actions">
        <button onclick="showAddTripModal()" class="btn-primary">
            + 새 여행 만들기
        </button>
    </div>

    <section id="tripList" class="trip-list-section">
        <%
            // 2. HTML 출력 로직: 여행 목록이 비어있는 경우
            if (myTripList.isEmpty()) {
        %>
            <div class="empty-msg-box">
                <p>아직 등록된 여행이 없습니다.<br>‘새 여행 만들기’ 버튼을 눌러 여행을 추가해보세요!</p>
            </div>
        <%
            // 3. HTML 출력 로직: 여행 목록이 있는 경우
            } else {
                for (Map<String, String> trip : myTripList) {
                    String tripId = trip.get("id"); // 여행 고유 ID
        %>
            <div class="trip-card" onclick="location.href='TripDetail.jsp?tripId=<%=tripId%>'">

                <div class="trip-card-delete-wrapper">
                    <button onclick="event.stopPropagation(); if(confirm('정말 삭제하시겠어요?')) location.href='MyTripProcess.jsp?action=deleteTrip&tripId=<%=tripId%>';"
                            class="btn-delete" title="삭제">
                        🗑
                    </button>
                </div>
                <img src="<%= trip.get("image") %>" alt="여행 이미지" class="trip-card-img" onerror="this.src='img/sample_trip.jpg'">
                
                <div class="trip-card-content">
                    <h3 class="trip-title"><%= trip.get("title") %></h3>
                    <p class="trip-location"><%= trip.get("location") %></p>
                </div>
            </div>
        <%
            // 4. HTML 출력 종료
            }
        }
        %>
    </section>

    <hr class="section-divider">

    <div class="favorites-area">
        </div>
</main>


<div id="addTripModal" class="modal-overlay">
    <div class="modal-content">
        <h2>새 여행 추가</h2>
        
        <form action="MyTripProcess.jsp?action=addTrip" method="post"> 
            <label class="form-label">여행 이름:</label>
            <input type="text" name="title" required class="form-input">

            <label class="form-label">여행지 선택:</label>
            <select name="location" required class="form-select">
                <option value="" disabled selected>--- 지역 선택 ---</option>
                <option value="제주">제주</option>
                <option value="서울">서울</option>
                <option value="부산">부산</option>
                <option value="강릉">강릉</option>
            </select>
            
            <label class="form-label">대표 이미지 (URL):</label>
            <input type="text" name="image" placeholder="https://example.com/image.jpg (선택사항)" class="form-input">
            
            <button type="submit" class="modal-btn-submit">추가</button>
            <button type="button" onclick="closeModal()" class="modal-btn-cancel">취소</button>
        </form>
    </div>
</div>

<script>
// 5. 클라이언트 측 JavaScript (UI 제어)
function showAddTripModal() {
    document.getElementById('addTripModal').style.display = 'flex';
}

function closeModal() {
    document.getElementById('addTripModal').style.display = 'none';
}
</script>

<%@ include file="../footer.jsp" %>