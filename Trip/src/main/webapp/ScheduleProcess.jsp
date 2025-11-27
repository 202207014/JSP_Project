<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    
    // 로그인 체크 (보안)
    String userId = (String) session.getAttribute("userid");
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }

    String action = request.getParameter("action");
    String tripIdStr = request.getParameter("tripId"); // 돌아갈 페이지 정보
    
    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        if ("add".equals(action)) {
            // 일정 추가
            String date = request.getParameter("scheduleDate");
            String time = request.getParameter("scheduleTime");
            String place = request.getParameter("place");
            String memo = request.getParameter("memo");
            
            // 시간이 HH:MM 형태인지 확인 (초가 없으면 :00 붙임)
            if(time.length() == 5) time += ":00";

            String sql = "INSERT INTO trip_schedule (trip_id, schedule_date, schedule_time, place, memo) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(tripIdStr));
            pstmt.setString(2, date);
            pstmt.setString(3, time);
            pstmt.setString(4, place);
            pstmt.setString(5, memo);
            
            pstmt.executeUpdate();
            
        } else if ("delete".equals(action)) {
            // 일정 삭제
            String idParam = request.getParameter("id");
            int id = Integer.parseInt(idParam);
            
            String sql = "DELETE FROM trip_schedule WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            
            pstmt.executeUpdate();
        }

        // 처리 후 다시 상세 페이지로 복귀
        response.sendRedirect("TripDetail.jsp?tripId=" + tripIdStr);

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('오류 발생: " + e.getMessage() + "'); history.back();</script>");
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(conn != null) try { conn.close(); } catch(Exception e) {}
    }
%>