<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="css/TripDetail.css">

<%
    String tripIdParam = request.getParameter("tripId");
    String userId = (String) session.getAttribute("userid");

    if (tripIdParam == null || userId == null) {
        out.println("<script>alert('잘못된 접근입니다.'); location.href='MyTripMain.jsp';</script>");
        return;
    }
    int tripId = Integer.parseInt(tripIdParam);

    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String title = "", location = "", image = "", memo = "";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 1. 여행 기본 정보 조회
        String sql = "SELECT title, location, image, memo FROM mytrip WHERE id = ? AND user_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, tripId);
        pstmt.setString(2, userId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            location = rs.getString("location");
            image = rs.getString("image");
            memo = rs.getString("memo");
            if(memo == null) memo = "";
        } else {
            out.println("<script>alert('여행 정보를 찾을 수 없습니다.'); location.href='MyTripMain.jsp';</script>");
            return;
        }
%>

<main class="detail-container">
    <div class="detail-card">
        
        <div class="detail-img-wrapper">
            <img src="<%= image != null && !image.isEmpty() ? image : "img/sample_trip.jpg" %>" class="detail-img" onerror="this.src='img/sample_trip.jpg'">
            <button type="button" class="btn-edit-img" onclick="document.getElementById('imageModal').style.display='flex'">
                📷 이미지 변경
            </button>
        </div>

        <div class="detail-info">
            <h1 class="detail-title"><%= title %> <small style="font-size:0.6em; color:#777;">(<%= location %>)</small></h1>
            
            <form action="MyTripProcess.jsp?action=updateMemo" method="post" class="memo-box">
                <input type="hidden" name="tripId" value="<%= tripId %>">
                <div class="memo-label">📝 메모</div>
                <textarea name="memo" class="memo-textarea" placeholder="여행 아이디어, 준비물 등을 기록하세요."><%= memo %></textarea>
                <div style="overflow:hidden;">
                    <button type="submit" class="btn-memo-save">저장</button>
                </div>
            </form>

            <div class="detail-buttons">
                <button onclick="toggleRecommendation(this, '숙박', '<%= location %>')">🏨 숙박 추천</button>
                <button onclick="toggleRecommendation(this, '즐길거리', '<%= location %>')">🎡 즐길거리 추천</button>
                <button onclick="toggleRecommendation(this, '맛집', '<%= location %>')">🍽 맛집 추천</button>
            </div>
            
            <div id="recommendationArea">
                <h3 id="recommendTitle"></h3>
                <div id="placeContent">
                    </div>
            </div>
        </div>
    </div>

    <div class="schedule-area">
        <div class="schedule-header">
            <h2>🗓 상세 일정</h2>
            <button onclick="document.getElementById('scheduleModal').style.display='flex'" class="add-btn">+ 일정 추가</button>
        </div>

        <div id="scheduleList">
            <%
                // 2. 일정 목록 조회
                if (pstmt != null) pstmt.close();
                String schSql = "SELECT id, schedule_date, schedule_time, place, memo FROM trip_schedule WHERE trip_id = ? ORDER BY schedule_date ASC, schedule_time ASC";
                pstmt = conn.prepareStatement(schSql);
                pstmt.setInt(1, tripId);
                rs = pstmt.executeQuery();

                if (!rs.isBeforeFirst()) {
                    out.println("<div style='background:#f9f9f9; padding:20px; text-align:center; border-radius:8px; color:#888;'>등록된 일정이 없습니다.</div>");
                } else {
                    while (rs.next()) {
                        int schId = rs.getInt("id");
                        String date = rs.getString("schedule_date");
                        String time = rs.getString("schedule_time").substring(0, 5);
                        String place = rs.getString("place");
                        String schMemo = rs.getString("memo");
            %>
            <div class="schedule-card">
                <div>
                    <div style="font-size:1.1em; font-weight:bold; color:#333;">
                        <%= date %> <span style="color:#888; font-weight:normal; margin-left:5px;"><%= time %></span>
                    </div>
                    <div style="margin-top:5px; color:#3498db; font-weight:600;">📍 <%= place %></div>
                    <% if(schMemo != null && !schMemo.isEmpty()) { %>
                        <p style="margin:5px 0 0 0; color:#666; font-size:0.9em;">- <%= schMemo %></p>
                    <% } %>
                </div>
                <button onclick="if(confirm('삭제하시겠습니까?')) location.href='ScheduleProcess.jsp?action=delete&id=<%= schId %>&tripId=<%= tripId %>'"
                        style="background:#ff5b5b; color:white; border:none; padding:6px 12px; border-radius:4px; cursor:pointer;">삭제</button>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</main>

<div id="scheduleModal" class="modal-overlay">
    <div class="modal-content">
        <h3>일정 추가</h3>
        <form action="ScheduleProcess.jsp?action=add" method="post">
            <input type="hidden" name="tripId" value="<%= tripId %>"> 
            
            <label class="modal-label">날짜</label>
            <input type="date" name="scheduleDate" required class="modal-input">
            
            <label class="modal-label">시간</label>
            <input type="time" name="scheduleTime" required class="modal-input">
            
            <label class="modal-label">장소</label>
            <input type="text" name="place" placeholder="예: 맛집 탐방" required class="modal-input">
            
            <label class="modal-label">메모</label>
            <textarea name="memo" rows="3" class="modal-textarea"></textarea>

            <div class="modal-actions">
                <button type="button" onclick="document.getElementById('scheduleModal').style.display='none'" class="btn-cancel">취소</button>
                <button type="submit" class="btn-save">저장</button>
            </div>
        </form>
    </div>
</div>

<div id="imageModal" class="modal-overlay">
    <div class="modal-content">
        <h3>대표 이미지 변경</h3>
        <p style="color:#666; font-size:14px; margin-bottom:15px;">변경할 이미지의 주소(URL)를 입력하세요.</p>
        
        <form action="MyTripProcess.jsp?action=updateImage" method="post">
            <input type="hidden" name="tripId" value="<%= tripId %>">
            <input type="text" name="imageUrl" required placeholder="https://example.com/image.jpg" class="modal-input">
            
            <div class="modal-actions">
                <button type="button" onclick="document.getElementById('imageModal').style.display='none'" class="btn-cancel">취소</button>
                <button type="submit" class="btn-save">변경 저장</button>
            </div>
        </form>
    </div>
</div>

<script>
// --- 아코디언(토글) 기능 스크립트 ---
function toggleRecommendation(btn, type, location) {
    const area = document.getElementById('recommendationArea');
    const content = document.getElementById('placeContent');
    const title = document.getElementById('recommendTitle');
    const buttons = document.querySelectorAll('.detail-buttons button');

    // 1. 닫기 로직
    if (area.style.display === 'block' && btn.classList.contains('active')) {
        area.style.display = 'none';
        btn.classList.remove('active');
        return;
    }

    // 2. 열기/전환 로직
    buttons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    area.style.display = 'block';
    title.innerHTML = `추천 목록`;
    content.innerHTML = '<p style="text-align:center; width:100%; padding:20px;">데이터를 불러오는 중입니다...</p>';

    // AJAX 요청
    fetch(`place_list_fetch.jsp?location=\${encodeURIComponent(location)}&type=\${encodeURIComponent(type)}`)
        .then(response => response.text())
        .then(html => {
            content.innerHTML = html;
        })
        .catch(error => {
            console.error('Error:', error);
            content.innerHTML = '<p style="text-align:center; color:red;">데이터 로드 실패</p>';
        });
}
</script>

<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rs != null) try { rs.close(); } catch(Exception e) {}
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>
<%@ include file="../footer.jsp" %>