<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); //request 인코딩 설정

// 1. 파라미터 받기 및 변수 정의
String userId = (String)session.getAttribute("userid"); // 로그인된 사용자 ID

//destination.jsp에서 보낸 고유 정보들을 받음
String favId = request.getParameter("id"); //여행지 고유 ID
String placeName = request.getParameter("place");// 장소 이름
String placeType = request.getParameter("type"); // 장소 유형
String placeImg = request.getParameter("img"); // 이미지 경로

// 2. 로그인 및 필수 파라미터 체크
if (userId == null) {
    out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
    return;
}
if (favId == null || placeName == null || placeType == null) {
    out.println("<script>alert('필수 정보가 누락되었습니다.'); history.back();</script>");
    return;
}

// 3. JDBC 정보 및 자원 선언
String url = "jdbc:mysql://localhost:3306/trip" 
                 + "?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; 
String dbUser = "root";
String dbPass = "1234";
//JDBC 객체
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver"); //DB 연결
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    // A. 중복 확인 (fav_id와 user_id 기반)
    //해당 유저가 같은 장소를 선택했는지 확인
    String checkSql = "SELECT fav_id FROM favorites WHERE user_id = ? AND fav_id = ?"; 
    pstmt = conn.prepareStatement(checkSql);
    pstmt.setString(1, userId);
    pstmt.setString(2, favId);
    rs = pstmt.executeQuery();
	//이미 선택했다면 DELETE
    if (rs.next()) {
        //이미 찜한 장소 -> 삭제 (DELETE)로 토글 기능 구현
        String deleteSql = "DELETE FROM favorites WHERE user_id = ? AND fav_id = ?";
        pstmt.close(); // 기존 pstmt 닫기
        pstmt = conn.prepareStatement(deleteSql);
        pstmt.setString(1, userId);
        pstmt.setString(2, favId);
        pstmt.executeUpdate();
        
        out.println("<script>alert('" + placeName + "을(를) 찜 목록에서 제거했습니다.'); history.back();</script>");
        
    } else {
        //찜 추가 (INSERT)
        //DB 스키마: fav_id, user_id, place_name, place_img, place_type
        //SQL 수정: 파라미터 개수(5개) 및 순서 수정
        String insertSql = "INSERT INTO favorites (fav_id, user_id, place_name, place_img, place_type) VALUES (?, ?, ?, ?, ?)";
        
        pstmt.close(); // 기존 pstmt 닫기
        pstmt = conn.prepareStatement(insertSql);
        
        // 1. fav_id
        pstmt.setString(1, favId); 
        // 2. user_id
        pstmt.setString(2, userId); 
        // 3. place_name
        pstmt.setString(3, placeName); 
        // 4. place_img
        pstmt.setString(4, placeImg); 
        // 5. place_type
        pstmt.setString(5, placeType); 
        
        pstmt.executeUpdate();//insert 실행

        out.println("<script>alert('" + placeName + "이(가) 찜 목록에 추가되었습니다!'); history.back();</script>");
    }

} catch(SQLException e) {
    e.printStackTrace();
    out.println("<script>alert('DB 처리 중 오류가 발생했습니다. SQL Code: " + e.getErrorCode() + "'); history.back();</script>");
} catch(Exception e) {
    e.printStackTrace();
    out.println("<script>alert('일반 오류 발생: " + e.getMessage() + "'); history.back();</script>");
} finally {
    // 자원 해제
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
</body>
</html>