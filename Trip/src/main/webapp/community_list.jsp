<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");

    // 1. 로그인 확인
    String userId = (String) session.getAttribute("userid");
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }

    // 2. 페이징 변수 설정
    int pageSize = 5; // 한 페이지에 보여줄 게시글 수
    
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize; // 쿼리용 OFFSET 계산 (0부터 시작)

    // 3. DB 연결 설정
    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    int totalCount = 0; // 전체 게시글 수
    List<Map<String, Object>> list = new ArrayList<>(); // 게시글 담을 리스트

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 4. 전체 게시글 수 구하기 (페이징 계산용)
        String countSql = "SELECT COUNT(*) FROM community";
        pstmt = conn.prepareStatement(countSql);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            totalCount = rs.getInt(1);
        }
        // 자원 해제 후 재사용
        rs.close();
        pstmt.close();

        // 5. 현재 페이지에 해당하는 게시글 목록 조회 (LIMIT, OFFSET 사용)
        // LIMIT 가져올개수 OFFSET 건너뛸개수
        String sql = "SELECT * FROM community ORDER BY num DESC LIMIT ? OFFSET ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, pageSize);
        pstmt.setInt(2, startRow);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            Map<String, Object> map = new HashMap<>();
            map.put("num", rs.getInt("num"));
            map.put("id", rs.getString("id"));
            map.put("subject", rs.getString("subject"));
            map.put("content", rs.getString("content"));
            map.put("area", rs.getString("area")); // 지역 컬럼
            map.put("regist_day", rs.getString("regist_day")); // 날짜 포맷팅은 필요시 자바에서 처리하거나 DB에서 DATE_FORMAT 사용
            map.put("hit", rs.getInt("hit"));
            list.add(map);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
    
    // 화면에 보여줄 글 번호 (DB의 고유번호 num이 아니라, 100, 99, 98... 순서)
    int number = totalCount - (currentPage - 1) * pageSize;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>여행 리뷰 커뮤니티 | Trip Planner</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/community.css">
</head>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main class="community-container">
    <h1 class="list-title">여행자들의 생생 리뷰 🌍</h1>

    <div class="list-controls">
        <a href="community_insert.jsp" class="btn-write">글쓰기</a>
    </div>

    <table class="community-table">
        <thead>
            <tr>
                <th class="col-num">번호</th>
                <th class="col-region">지역</th>
                <th class="col-title">제목</th>
                <th class="col-user">작성자</th>
                <th class="col-date">작성일</th>
                <th class="col-views">조회</th>
            </tr>
        </thead>

        <tbody>
        <%
        if (totalCount == 0) {
        %>
            <tr>
                <td colspan="6" style="text-align:center; padding: 30px;">등록된 게시글이 없습니다.</td>
            </tr>
        <%
        } else {
            for (Map<String, Object> post : list) {
                String area = (String)post.get("area");
                if(area == null) area = "기타";
                
                // 날짜 문자열에서 시간 부분 자르기 (yyyy-MM-dd HH:mm:ss.0 -> yyyy-MM-dd)
                String date = post.get("regist_day").toString();
                if(date.length() > 10) date = date.substring(0, 10);
        %>
            <tr>
                <td data-label="번호" class="col-num"><%= number-- %></td>
                
                <td data-label="지역" class="col-region">
                    <span class="region-tag"><%= area %></span>
                </td>
                
                <td data-label="제목" class="col-title">
                    <a href="community_view.jsp?num=<%= post.get("num") %>&pageNum=<%= currentPage %>" class="post-link">
                        <%= post.get("subject") %>
                    </a>
                </td>
                
                <td data-label="작성자" class="col-user"><%= post.get("id") %></td>
                <td data-label="작성일" class="col-date"><%= date %></td>
                <td data-label="조회" class="col-views"><%= post.get("hit") %></td>
            </tr>
        <%
            }
        }
        %>
        </tbody>
    </table>

    <!-- 페이징 영역 -->
    <div class="pagination">
    <%
        if (totalCount > 0) {
            // 페이지 카운트 로직
            int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1); // 전체 페이지 수
            int pageBlock = 5; // 하단에 보여줄 페이지 번호 개수 (1~5, 6~10)
            
            // 현재 페이지 블록의 시작 페이지와 끝 페이지 계산
            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            
            if (endPage > pageCount) {
                endPage = pageCount;
            }
            
            // [이전] 버튼
            if (startPage > pageBlock) {
    %>
                <a href="community_list.jsp?pageNum=<%= startPage - pageBlock %>" class="page-nav">&laquo;</a>
    <%
            }
            
            // 페이지 번호 출력 (1, 2, 3, 4, 5)
            for (int i = startPage; i <= endPage; i++) {
                if (i == currentPage) {
    %>
                    <a href="#" class="page-num active"><%= i %></a> <!-- 현재 페이지 -->
    <%
                } else {
    %>
                    <a href="community_list.jsp?pageNum=<%= i %>" class="page-num"><%= i %></a>
    <%
                }
            }
            
            // [다음] 버튼
            if (endPage < pageCount) {
    %>
                <a href="community_list.jsp?pageNum=<%= startPage + pageBlock %>" class="page-nav">&raquo;</a>
    <%
            }
        }
    %>
    </div>

</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>