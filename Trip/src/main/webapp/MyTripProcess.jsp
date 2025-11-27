<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<%
// 폼에서 전송된 데이터의 한글 깨짐 방지
request.setCharacterEncoding("UTF-8");

// 1. 세션 및 액션 확인
String userId = (String) session.getAttribute("userid"); // 세션에서 사용자 ID 획득
String action = request.getParameter("action"); // 수행할 작업 (예: addTrip, deleteTrip)
String redirectUrl = "MyTripMain.jsp"; // 기본 복귀 경로는 목록 페이지

// 로그인 체크: 사용자 ID가 없으면 경고 후 로그인 페이지로 이동
if (userId == null) {
    out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
    return;
}

// 2. DB 연결 설정
Connection conn = null;
PreparedStatement pstmt = null;

String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "root";
String dbPass = "1234";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);
    conn.setAutoCommit(false); // 🌟 트랜잭션 시작: AutoCommit을 끄고 수동으로 관리

    boolean success = false;
    String message = "요청을 처리할 수 없습니다.";

    // ==========================================================
    // CASE 1: 새 여행 추가 (action=addTrip)
    // ==========================================================
    if ("addTrip".equals(action)) {
        String title = request.getParameter("title");
        String location = request.getParameter("location");
        String image = request.getParameter("image"); // 이미지 URL
        
        // 필수 값 검증
        if (title == null || title.trim().isEmpty() || location == null || location.trim().isEmpty()) {
            message = "여행 제목과 지역을 입력해주세요.";
        } else {
            // 이미지 값 처리: URL이 비어있으면 DB에 NULL 삽입
            if (image != null && image.trim().isEmpty()) image = null;

            // mytrip 테이블에 INSERT 쿼리 실행
            // (image, memo는 ?로 처리 후 파라미터 4, 5번으로 NULL 또는 값을 삽입)
            String sql = "INSERT INTO mytrip (user_id, title, location, image, memo) VALUES (?, ?, ?, ?, NULL)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, title.trim());
            pstmt.setString(3, location.trim());
            pstmt.setString(4, image); // 이미지 URL 삽입 (NULL 또는 문자열)
            
            if (pstmt.executeUpdate() > 0) {
                success = true;
                message = "'" + title + "' 여행 계획이 성공적으로 추가되었습니다.";
                redirectUrl = "MyTripMain.jsp"; // 목록 페이지로 이동
            } else {
                message = "DB 삽입 실패.";
            }
        }
    }
    
    // ==========================================================
    // CASE 2: 메모 수정 (action=updateMemo)
    // ==========================================================
    else if ("updateMemo".equals(action)) {
        String tripIdParam = request.getParameter("tripId");
        String memo = request.getParameter("memo");
        
        if (tripIdParam != null) {
            String sql = "UPDATE mytrip SET memo = ? WHERE id = ? AND user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memo);
            pstmt.setInt(2, Integer.parseInt(tripIdParam));
            pstmt.setString(3, userId); // 권한 체크 (본인의 메모만 수정 가능)
            
            if (pstmt.executeUpdate() > 0) {
                success = true;
                message = "메모가 저장되었습니다.";
                redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam; // 상세 페이지로 복귀
            } else {
                message = "메모 저장 실패 (권한 없음).";
                redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
            }
        }
    }
    
    // ==========================================================
    // CASE 3: 이미지 수정 (action=updateImage)
    // ==========================================================
    else if ("updateImage".equals(action)) {
        String tripIdParam = request.getParameter("tripId");
        String imageUrl = request.getParameter("imageUrl");
        
        if (tripIdParam != null && imageUrl != null && !imageUrl.trim().isEmpty()) {
            String sql = "UPDATE mytrip SET image = ? WHERE id = ? AND user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, imageUrl.trim());
            pstmt.setInt(2, Integer.parseInt(tripIdParam));
            pstmt.setString(3, userId); // 권한 체크
            
            if (pstmt.executeUpdate() > 0) {
                success = true;
                message = "대표 이미지가 변경되었습니다.";
                redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
            } else {
                message = "이미지 변경 실패.";
                redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
            }
        } else {
            message = "이미지 URL을 입력해주세요.";
            if(tripIdParam != null) redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
        }
    }
    
    // ==========================================================
    // CASE 4: 여행 삭제 (action=deleteTrip)
    // ==========================================================
    else if ("deleteTrip".equals(action)) {
        String tripIdParam = request.getParameter("tripId");
        
        if (tripIdParam != null) {
            // DELETE 쿼리 (mytrip 삭제 시 ON DELETE CASCADE로 trip_schedule 자동 삭제)
            String sql = "DELETE FROM mytrip WHERE id = ? AND user_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(tripIdParam));
            pstmt.setString(2, userId); // 권한 체크
            
            if (pstmt.executeUpdate() > 0) {
                success = true;
                message = "여행이 삭제되었습니다.";
                redirectUrl = "MyTripMain.jsp"; // 목록 페이지로 이동
            } else {
                message = "삭제 실패 (권한이 없거나 이미 삭제됨).";
            }
        }
    }

    // ----------------------------------------------------------
    // 3. 트랜잭션 종료 및 결과 페이지 이동
    // ----------------------------------------------------------
    if (success) {
        conn.commit(); // 성공 시 DB 변경 사항 반영
    } else {
        conn.rollback(); // 실패 시 DB 변경 사항 취소 (원상 복구)
    }
    
    // 최종 알림 및 리다이렉션 (JavaScript)
    out.println("<script>");
    out.println("alert('" + message + "');");
    out.println("location.href='" + redirectUrl + "';");
    out.println("</script>");

} catch (Exception e) {
    // 예외 발생 시 무조건 롤백하고 오류 메시지 출력
    if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
    e.printStackTrace();
    
    // 오류 메시지 정제 (JS 문법 깨짐 방지)
    String safeMsg = e.getMessage().replace("'", "").replace("\"", "").replace("\n", " ");
    out.println("<script>");
    out.println("alert('처리 중 치명적인 오류 발생: " + safeMsg + "');");
    out.println("location.href='" + redirectUrl + "';"); // 오류가 나더라도 페이지 이동 시도
    out.println("</script>");
} finally {
    // 4. 자원 해제 (DB 연결 닫기)
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>