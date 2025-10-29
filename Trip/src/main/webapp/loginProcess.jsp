<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 1. 사용자가 입력한 정보 받기
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    
    // 2. 간단한 유효성 검사
    if(userid == null || password == null || 
       userid.trim().equals("") || password.trim().equals("")) {
%>
        <script>
            alert("아이디와 비밀번호를 모두 입력해주세요.");
            history.back();
        </script>
<%
        return;
    }
    
    // 3. 애플리케이션 스코프에서 사용자 정보 맵 가져오기
    Map<String, Map<String, String>> userMap = (Map<String, Map<String, String>>)application.getAttribute("userMap");
    boolean loginSuccess = false;
    String userName = "";
    
    // 4. 로그인 검증
    if(userMap != null && userMap.containsKey(userid)) {
        Map<String, String> userInfo = userMap.get(userid);
        if(userInfo.get("password").equals(password)) {
            loginSuccess = true;
            userName = userInfo.get("name");
        }
    }
    
    if(loginSuccess) {
        // 5. 로그인 성공시 세션에 사용자 정보 저장
        session.setAttribute("userid", userid);
        session.setAttribute("name", userName);
        session.setMaxInactiveInterval(1800); // 세션 유지 시간 30분
        response.sendRedirect("index.jsp");
    } else {
        // 6. 로그인 실패
%>
        <script>
            alert("아이디 또는 비밀번호가 일치하지 않습니다.");
            history.back();
        </script>
<%
    }
%>