<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 세션 무효화 (로그아웃)
    session.invalidate();
%>
<script>
    alert("로그아웃되었습니다.");
    location.href = "index.jsp";
</script>