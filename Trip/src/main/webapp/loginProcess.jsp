<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String userid = request.getParameter("userid");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String jdbcUrl = "jdbc:mysql://localhost:3306/trip?useSSL=false&serverTimezone=Asia/Seoul";
    String dbUser = "root";
    String dbPass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

        String sql = "SELECT * FROM members WHERE id = ? AND passwd = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // ✅ 로그인 성공 시
            out.println("<script>");
            out.println("alert('로그인 성공! 환영합니다.');");
            out.println("location.href='index.jsp';"); // 로그인 성공 후 이동할 페이지
            out.println("</script>");
        } else {
            // ❌ 로그인 실패 시
            out.println("<script>");
            out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.');");
            out.println("history.back();");
            out.println("</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
