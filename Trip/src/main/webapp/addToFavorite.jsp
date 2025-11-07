<%@ page contentType="text/html; charset=UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String image = request.getParameter("image");

java.util.List<java.util.Map<String, String>> favorites =
    (java.util.List<java.util.Map<String, String>>) session.getAttribute("favorites");

if (favorites == null) {
    favorites = new java.util.ArrayList<>();
}

java.util.Map<String, String> spot = new java.util.HashMap<>();
spot.put("name", name);
spot.put("image", image);

favorites.add(spot);
session.setAttribute("favorites", favorites);

out.print("즐겨찾기에 추가되었습니다!");
%>
