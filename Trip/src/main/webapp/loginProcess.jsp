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
	//인코딩 설정
    request.setCharacterEncoding("UTF-8");
	
	//로그인 폼에서 전달한 아이디와 패스워드
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
	
 	// JDBC 연결 객체 선언
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	//Mysql DB 접속 정보
    String jdbcUrl = "jdbc:mysql://localhost:3306/trip";
    String dbUser = "root";
    String dbPass = "1234";

    try {
    	//JDBC 드라이버 로드 및 DB 연결
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		//Mysql에서 실행할 sql문 문자열 변수
        String sql = "SELECT * FROM members WHERE id = ? AND passwd = ?";
		
        pstmt = conn.prepareStatement(sql);
        //sql ?에 값을 userid와 password 값을 넣어줌
        pstmt.setString(1, userid);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // ✅ 로그인 성공 시
            HttpSession s = request.getSession(); //로그인 성공 시 세션 생성
            s.setAttribute("userid", userid);
            s.setAttribute("username", rs.getString("name"));
            
            out.println("<script>");
            out.println("alert('로그인 성공! 환영합니다, " + rs.getString("name") + "님.');");
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
    	//사용한 자원 해제
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
