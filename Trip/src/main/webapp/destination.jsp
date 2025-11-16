<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String place = request.getParameter("place");

if ("jeju".equals(place)) {
%>
<jsp:include page="destination_jeju.jsp" />
<%
} else if ("busan".equals(place)) {
%>
<jsp:include page="destination_busan.jsp" />
<%
} else if ("seoul".equals(place)) {
%>
<jsp:include page="destination_seoul.jsp" />
<%
}
else if ("gangneung".equals(place)) {
%>
<jsp:include page="destination_gangneung.jsp" />
<%
}
else {
%>
<h2>잘못된 접근입니다.</h2>
<%
}
%>
