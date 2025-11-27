<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String jdbcUrl = "jdbc:mysql://localhost:3306/trip";
    String dbUser = "root";
    String dbPass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		//아이디 중복 확인을 위한 sql문
        String sql = "SELECT id FROM members WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            out.print("USED");  // 이미 존재함 
        } else {
            out.print("OK");    // 사용 가능
        }

    } catch (Exception e) {
        out.print("ERROR");
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
