<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MySQL 연동 테스트</title>
</head>
<body>
    <h2>MySQL 연동 테스트</h2>
    <%
        // DB 접속 정보 설정
        String url = "jdbc:mysql://localhost:3306/trip";
        String user = "root";
        String password = "1234";

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 드라이버 로드
            conn = DriverManager.getConnection(url, user, password); // 연결 시도

            if (conn != null) {
                out.println("<p style='color:green;'>✅ MySQL 연결 성공!</p>");
            } else {
                out.println("<p style='color:red;'>❌ MySQL 연결 실패</p>");
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>오류 발생: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    %>
</body>
</html>
