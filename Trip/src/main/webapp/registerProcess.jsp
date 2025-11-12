<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String name = request.getParameter("name");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	
    String jdbcUrl = "jdbc:mysql://localhost:3306/trip";
    String dbUser = "root";   // DB 사용자 계정
    String dbPass = "1234";   // DB 비밀번호

    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		
        String checksql = "SELECT id from members WHERE id = ?";
        pstmt = conn.prepareStatement(checksql);
        pstmt.setString(1, userid);
        rs = pstmt.executeQuery();
        
        if(rs.next())
        {
        	out.println("<script>alert('이미 존재하는 아이디입니다.'); history.back();</script>");
        }
        else
        {
        	rs.close();
        	pstmt.close();
        	String sql = "insert into members values(?, ?, ?)";
        	pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userid);
            pstmt.setString(2,password);
            pstmt.setString(3,name);
            
            int result = pstmt.executeUpdate();
            
            if(result == 1){ // 성공
    			response.sendRedirect("login.jsp");
    		} else{ // 실패
    			 out.println("<script>alert('회원가입 실패. 다시 시도해주세요.'); history.back();</script>");
    		}
            
        }	
    } catch (Exception e) {
    	e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
