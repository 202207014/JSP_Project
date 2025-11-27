<%-- components/header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<link rel="stylesheet" href="css/header.css"> 
<header>
    <nav class="navbar">
      <!-- 로고 클릭 시 index.jsp 로 이동 -->
        <div class="logo"> 
           <a href="${pageContext.request.contextPath}/index.jsp">Trip Planner</a>
        </div>
        
        <ul class="nav-links">
            <li><a href="course_main.jsp" class="nav-item">추천</a></li>
            <li><a href="MyTripMain.jsp" class="nav-item">내 여행</a></li>
            <li><a href="community_list.jsp" class="nav-item">커뮤니티</a></li>
        </ul>
        
        <div class="nav-actions">
            <%
                // 세션에서 userid 와 username 값을 가져옵니다.
                String userid = (String) session.getAttribute("userid");
                String username =(String) session.getAttribute("username");
                if (userid != null && !userid.isEmpty()) {
                    // 로그인 상태일 때 (userid가 세션에 있을 때)
            %>
                    <!-- 사용자 이름 표시 (선택 사항) -->
                        <%=username %>님
                    <!-- 로그아웃 버튼 -->
                    <a href="logout.jsp" class="btn-login"> 
                        로그아웃
                    </a>
            <%
                } else {
                    // 비로그인 상태일 때 (userid가 세션에 없을 때)
            %>
                    <!-- 로그인 버튼 -->
                    <a href="login.jsp" class="btn-login"> 
                        로그인
                    </a>
            <%
                }
            %>
        </div>
    </nav>
</header>