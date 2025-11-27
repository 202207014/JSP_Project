<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 처리</title>
</head>
<body>
<%
	//인코딩 설정
    request.setCharacterEncoding("UTF-8");
	
	//회원가입 폼에서 전달된 데이터 저장
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
	//JDBC 연결 객체 선언
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
  	//Mysql DB 접속 정보
    String jdbcUrl = "jdbc:mysql://localhost:3306/trip";
    String dbUser = "root";   // DB 사용자 계정
    String dbPass = "1234";   // DB 비밀번호

    try {
    	//JDBC 드라이버 로드 및 DB 연결
    	Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		//입력한 아이디가 DB에 존재하는지 확인하는 쿼리문
        String checksql = "SELECT id from members WHERE id = ?";
        pstmt = conn.prepareStatement(checksql);
        //쿼리문 ?에 들어가는 값
        pstmt.setString(1, userid);
        //쿼리 실행
        rs = pstmt.executeQuery();
        
        if(rs.next())//아이디가 존재 한다면 되돌아감
        {	
        	out.println("<script>alert('이미 존재하는 아이디입니다.'); history.back();</script>");
        }
        else
        {
        	//새 쿼리문을 실행하기 위해 ResultSet, PreparedStatement 닫기
        	rs.close();
        	pstmt.close();
        	//회원정보 INSERT 쿼리문
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
    	//사용한 자원 해제
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>
</body>
</html>
