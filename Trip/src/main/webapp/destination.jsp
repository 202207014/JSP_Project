<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제주도 여행 명소 | Trip Planner</title>
    <link rel="stylesheet" href="css/header.css"> 
    <link rel="stylesheet" href="css/main.css"> 
    <link rel="stylesheet" href="css/destination.css"> <%-- 상세 페이지 전용 CSS --%>
</head>
<body>

    <header>
        <jsp:include page="header.jsp" />
    </header>

    <main class="destination-page-container">

        <section class="destination-hero">
            <h1 class="main-title">제주도의 관광명소</h1>
            <p class="subtitle">꼭 봐야 할 명소, 액티비티를 확인하세요</p>
            <hr class="divider">
        </section>

        <section class="spot-section">
            <h2 class="section-title">주요 명소</h2>
            <div class="spot-grid">
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/ilchulbong.jpg" alt="일출봉">
                    </div>
                    <div class="spot-info">
                        <h3>일출봉</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/hallasan.jpg" alt="한라산 국립공원">
                    </div>
                    <div class="spot-info">
                        <h3>한라산 국립공원</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/jusangjeolli.jpg" alt="대포해안주상절리대">
                    </div>
                    <div class="spot-info">
                       <h3>대포해안주상절리대</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="spot-section">
            <h2 class="section-title">경관이 좋은 산책로</h2>
            <div class="spot-grid">
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/handam.jpg" alt="한담해안산책로">
                    </div>
                    <div class="spot-info">
                        <h3>한담해안산책로</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/sinchang.jpg" alt="신창 풍차해안도로">
                    </div>
                    <div class="spot-info">
                        <h3>대포해안주상절리대</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/buldobong.jpg" alt="별도봉 산책로">
                    </div>
                    <div class="spot-info">
                        <h3>별도봉 산책로</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
            </div>
         
        </section>

        <section class="spot-section">
            <h2 class="section-title">테마 파크</h2>
            <div class="spot-grid">
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/ecoland.jpg" alt="에코랜드 테마파크">
                    </div>
                    <div class="spot-info">
                        <h3>에코랜드 테마파크 </h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/gimnyeong.jpg" alt="제주김녕미로공원">
                    </div>
                    <div class="spot-info">
                        <h3>제주김녕미로공원 </h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
                
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/jeju/dermapark.jpg" alt="더 마 파크">
                    </div>
                    <div class="spot-info">
                        <h3>더마파크</h3>
                        <span class="like-btn">♡</span>
                    </div>
                </div>
            </div>
           
        </section>
    
    </main>
    
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
    
</body>
</html>