<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    // 1. 세션 확인
    String userId = (String) session.getAttribute("userid");
    if (userId == null) {
        out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
        return;
    }

    // 2. 파라미터 및 변수 설정
    String action = request.getParameter("action"); 
    String redirectUrl = "MyTripMain.jsp"; // 기본 이동 경로는 메인
    
    Connection conn = null;
    PreparedStatement pstmt = null;

    String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    String dbUser = "root";
    String dbPass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        conn.setAutoCommit(false); // 트랜잭션 시작

        boolean success = false;
        String message = "요청을 처리할 수 없습니다.";

        // ==========================================================
        // CASE 1: 새 여행 추가 (action=addTrip)
        // ==========================================================
        if ("addTrip".equals(action)) {
            String title = request.getParameter("title");
            String location = request.getParameter("location");
            String image = request.getParameter("image"); // 이미지 URL (선택)

            if (title == null || title.trim().isEmpty() || location == null || location.trim().isEmpty()) {
                message = "여행 제목과 지역을 입력해주세요.";
            } else {
                if (image != null && image.trim().isEmpty()) image = "https://i.namu.wiki/i/kBobJDcw7LXN0tECxpFdEy17p7UEPQglVw7517nfpfA-MA8g06OPoZR4KXRWHpkMxuDA_Yw2KczKWAWfWdnuwg.webp";

                String sql = "INSERT INTO mytrip (user_id, title, location, image, memo) VALUES (?, ?, ?, ?, NULL)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);
                pstmt.setString(2, title.trim());
                pstmt.setString(3, location.trim());
                pstmt.setString(4, image);
                
                if (pstmt.executeUpdate() > 0) {
                    success = true;
                    message = "새 여행이 추가되었습니다.";
                    redirectUrl = "MyTripMain.jsp"; // 목록 페이지로 이동
                } else {
                    message = "저장에 실패했습니다.";
                }
            }
        }
        
        // ==========================================================
        // CASE 2: 메모 수정 (action=updateMemo)
        // ==========================================================
        else if ("updateMemo".equals(action)) {
            String tripIdParam = request.getParameter("tripId");
            String memo = request.getParameter("memo");
            
            if (tripIdParam != null) {
                String sql = "UPDATE mytrip SET memo = ? WHERE id = ? AND user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, memo);
                pstmt.setInt(2, Integer.parseInt(tripIdParam));
                pstmt.setString(3, userId);
                
                if (pstmt.executeUpdate() > 0) {
                    success = true;
                    message = "메모가 저장되었습니다.";
                    redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam; // 상세 페이지로 복귀
                } else {
                    message = "메모 저장 실패 (권한이 없거나 여행을 찾을 수 없음).";
                    redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
                }
            }
        }
        
        // ==========================================================
        // CASE 3: 이미지 수정 (action=updateImage)
        // ==========================================================
        else if ("updateImage".equals(action)) {
            String tripIdParam = request.getParameter("tripId");
            String imageUrl = request.getParameter("imageUrl");
            
            if (tripIdParam != null && imageUrl != null && !imageUrl.trim().isEmpty()) {
                String sql = "UPDATE mytrip SET image = ? WHERE id = ? AND user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, imageUrl.trim());
                pstmt.setInt(2, Integer.parseInt(tripIdParam));
                pstmt.setString(3, userId);
                
                if (pstmt.executeUpdate() > 0) {
                    success = true;
                    message = "이미지가 변경되었습니다.";
                    redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam; // 상세 페이지로 복귀
                } else {
                    message = "이미지 변경 실패.";
                    redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
                }
            } else {
                message = "이미지 URL을 입력해주세요.";
                if(tripIdParam != null) redirectUrl = "TripDetail.jsp?tripId=" + tripIdParam;
            }
        }
        
        // ==========================================================
        // CASE 4: 여행 삭제 (action=deleteTrip)
        // ==========================================================
        else if ("deleteTrip".equals(action)) {
            String tripIdParam = request.getParameter("tripId");
            
            if (tripIdParam != null) {
                String sql = "DELETE FROM mytrip WHERE id = ? AND user_id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, Integer.parseInt(tripIdParam));
                pstmt.setString(2, userId);
                
                if (pstmt.executeUpdate() > 0) {
                    success = true;
                    message = "여행이 삭제되었습니다.";
                    redirectUrl = "MyTripMain.jsp"; // 목록 페이지로 이동
                } else {
                    message = "삭제 실패 (권한이 없거나 이미 삭제됨).";
                }
            }
        }

        // ----------------------------------------------------------
        // 3. 트랜잭션 종료 및 결과 페이지 이동
        // ----------------------------------------------------------
        if (success) {
            conn.commit();
        } else {
            conn.rollback();
        }
        
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("location.href='" + redirectUrl + "';");
        out.println("</script>");

    } catch (Exception e) {
        if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
        e.printStackTrace();
        
        // 에러 메시지 출력 (따옴표 깨짐 방지 처리)
        String safeMsg = e.getMessage().replace("'", "").replace("\"", "").replace("\n", " ");
        out.println("<script>");
        out.println("alert('오류 발생: " + safeMsg + "');");
        out.println("history.back();");
        out.println("</script>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
    }
%>