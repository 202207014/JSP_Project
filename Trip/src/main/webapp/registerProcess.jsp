<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // 1. 애플리케이션 스코프에 사용자 정보를 저장할 Map이 없으면 생성/ Map은 딕셔너리랑 같은 기능 키:값 식으로 저장 여기서는 키:[키:값]식으로 저장
    Map<String, Map<String, String>> userMap = (Map<String, Map<String, String>>)application.getAttribute("userMap");
    if(userMap == null) {
        userMap = new HashMap<String, Map<String, String>>();
        application.setAttribute("userMap", userMap);
    }
    
    // 2. 사용자가 입력한 정보 받기
    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String passwordConfirm = request.getParameter("passwordConfirm");
    String name = request.getParameter("name");
    
    // 3. 간단한 유효성 검사
    if(userid == null || password == null || name == null || userid.trim().equals("") || 
    password.trim().equals("") || name.trim().equals("")) {
%>
        <script>
            alert("모든 항목을 입력해주세요.");
            history.back();
        </script>
<%
        return;
    }
    
    // 비밀번호 확인 일치 여부 검사
    if(!password.equals(passwordConfirm)) {
%>
        <script>
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            history.back();
        </script>
<%
        return;
    }
    
    // 4. 아이디 중복 체크
    if(userMap.containsKey(userid)) {
%>
        <script>
            alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
            history.back();
        </script>
<%
        return;
    }
    //                       키       :  값(키): 값   
    // 5. 사용자 정보를 맵에 저장 입력한아이디  : 비밀번호:입력한 비번
    //							         이름 : 입력한 이름
    //                                   날짜 : 만들어진 날짜
    Map<String, String> userInfo = new HashMap<String, String>();
    userInfo.put("password", password);
    userInfo.put("name", name);
    userInfo.put("regdate", new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
    
    userMap.put(userid, userInfo);
    
    // 6. 회원가입 성공
%>
    <script>
        alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
        location.href = "login.jsp";
    </script>