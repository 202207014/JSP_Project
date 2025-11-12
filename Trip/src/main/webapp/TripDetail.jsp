<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="css/mytrip.css">

<%
    // --- 1. 로그인 체크 ---
    String userId = (String) session.getAttribute("userid");
    if (userId == null) {
        out.print("<script>alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.'); location.href='login.jsp';</script>");
        return;
    }

    // --- 2. 쿼리 파라미터 가져오기 ---
    request.setCharacterEncoding("UTF-8");
    String tripName = request.getParameter("tripName");
    String tripLocation = request.getParameter("tripLocation");
    
    if (tripName == null || tripLocation == null) {
        out.print("<script>alert('잘못된 접근입니다. 나의여행 목록으로 이동합니다.'); location.href='MyTripMain.jsp';</script>");
        return;
    }
    
    // --- 3. 이미지 URL 결정 (더미) ---
    // 실제 데이터가 없으므로 tripLocation에 따라 임시 이미지 결정
    String locationLower = tripLocation.toLowerCase();
    String defaultImage = "img/default_korea_bg.jpg"; // 기본 한국 배경 이미지
    String imageUrl = "img/bg_" + locationLower.replace(" ", "_") + ".jpg";

    // 이미지 파일이 없다고 가정하고 기본 이미지로 대체하는 로직 (실제 프로젝트에서는 DB에서 가져와야 함)
    // 현재는 JSP에서 동적으로 CSS를 생성하기 위해 변수를 준비합니다.
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title><%= tripName %> 여행 상세 | Trip Planner</title>
    
    <!-- 동적인 배경 이미지 URL을 위해 <style> 태그 사용 -->
    <style>
        .detail-header {
            /* JSP 스크립틀릿 변수를 사용하여 배경 이미지 URL을 동적으로 설정 */
            background-image: url('<%= imageUrl %>'); 
            background-size: cover;
            background-position: center;
            height: 300px;
            color: white;
            padding: 30px;
            display: flex;
            align-items: flex-end;
        }
        .detail-header h1 {
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            font-size: 2.5em;
        }
    </style>
</head>
<body>
    <main class="trip-container">

        <!-- 헤더 이미지 및 정보 -->
        <div class="detail-header">
            <div class="location-info" style="background: rgba(0,0,0,0.4); padding: 10px; border-radius: 5px;">
                <h1><%= tripName %></h1>
                <p style="margin: 5px 0 0 0;">📍 <%= tripLocation %></p>
            </div>
        </div>

        <!-- 탭 메뉴 -->
        <div class="detail-tabs">
            <button class="tab-btn active" onclick="openTab(event, 'list')">관심 리스트</button>
            <button class="tab-btn" onclick="openTab(event, 'schedule')">여행 일정</button>
            <button class="tab-btn" onclick="openTab(event, 'stay')">숙박 시설</button>
            <button class="tab-btn" onclick="openTab(event, 'food')">맛집</button>
            <button class="tab-btn" onclick="openTab(event, 'activity')">즐길 거리</button>
        </div>

        <!-- 탭 콘텐츠 영역 -->
        <div id="list" class="tab-content" style="display:block;">
            <h2>관심 리스트</h2>
            <p style="color:#777; margin-bottom: 20px;">여행 중 가보고 싶은 모든 장소를 저장해보세요.</p>
            
            <div class="item-card">
                <div class="item-card-text">
                    <h4>부산 해운대 해변 (명소)</h4>
                    <p>⭐ 4.5점 / 해변 산책 및 사진 촬영</p>
                </div>
                <div class="item-card-actions">
                    <button>지도에서 보기</button>
                </div>
            </div>

            <div class="item-card">
                <div class="item-card-text">
                    <h4>감천 문화마을 (관광)</h4>
                    <p>⭐ 4.7점 / 알록달록한 벽화 마을</p>
                </div>
                <div class="item-card-actions">
                    <button>지도에서 보기</button>
                </div>
            </div>
        </div>
        
        <div id="schedule" class="tab-content" style="display:none;">
            <h2>여행 일정</h2>
            <p>날짜별로 구체적인 일정을 계획합니다.</p>
            <ul style="list-style: none; padding: 0;">
                <li style="border-left: 3px solid #008000; padding-left: 10px; margin-bottom: 15px;">
                    <strong>DAY 1:</strong> 오전 - KTX 부산역 도착 / 오후 - 해운대 숙소 체크인 및 해변 산책.
                </li>
                <li style="border-left: 3px solid #ccc; padding-left: 10px; margin-bottom: 15px;">
                    <strong>DAY 2:</strong> 오전 - 감천 문화마을 관광 / 오후 - 자갈치 시장에서 해산물 만찬.
                </li>
            </ul>
        </div>
        
        <div id="stay" class="tab-content" style="display:none;">
            <h2>숙박 시설</h2>
            <div class="item-card">
                <div class="item-card-text">
                    <h4>파크 하얏트 부산</h4>
                    <p>⭐ 4.8점 / 해운대 오션뷰 럭셔리 호텔</p>
                </div>
                <div class="item-card-actions">
                    <button>예약</button>
                </div>
            </div>
        </div>
        
        <div id="food" class="tab-content" style="display:none;">
            <h2>맛집</h2>
            <div class="item-card">
                <div class="item-card-text">
                    <h4>원조 부산 돼지국밥</h4>
                    <p>⭐ 4.5점 / 뜨끈한 국물이 일품</p>
                </div>
                <div class="item-card-actions">
                    <button>리뷰 보기</button>
                </div>
            </div>
        </div>
        
        <div id="activity" class="tab-content" style="display:none;">
            <h2>즐길 거리</h2>
            <div class="item-card">
                <div class="item-card-text">
                    <h4>태종대 다누비 열차</h4>
                    <p>⭐ 4.6점 / 태종대 순환 관광</p>
                </div>
                <div class="item-card-actions">
                    <button>정보 확인</button>
                </div>
            </div>
        </div>
    </main>

    <script>
        // 탭 전환 JavaScript
        function openTab(evt, tabName) {
            let i, tabcontent, tablinks;
            
            // 모든 탭 콘텐츠 숨기기
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            
            // 모든 탭 버튼에서 active 클래스 제거
            tablinks = document.getElementsByClassName("tab-btn");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            
            // 현재 탭 콘텐츠 표시 및 버튼에 active 클래스 추가
            document.getElementById(tabName).style.display = "block";
            // evt.currentTarget이 null인 경우를 방지 (JS 오류 방지)
            if (evt.currentTarget) {
                evt.currentTarget.className += " active";
            }
        }
        
        // 페이지 로드 시 '관심 리스트' 탭을 활성화 (첫 번째 탭)
        document.addEventListener('DOMContentLoaded', () => {
             // 페이지 로드 시 첫 번째 탭 버튼에 active 클래스 추가
             const firstTabButton = document.querySelector('.detail-tabs .tab-btn');
             if (firstTabButton) {
                 firstTabButton.className += " active";
             }
        });
    </script>
    
    <%@ include file="footer.jsp" %>
</body>
</html>