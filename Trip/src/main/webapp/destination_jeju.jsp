<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>제주도 여행 명소 | Trip Planner</title>
    <link rel="stylesheet" href="css/header.css"> 
    <link rel="stylesheet" href="css/main.css"> 
    <link rel="stylesheet" href="css/destination.css">

</head>

<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main class="destination-page-container">

    <!-- 제주도 메인 타이틀 -->
    <section class="destination-hero">
        <h1 class="main-title">제주 관광명소</h1>
        <p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
        <hr class="divider">
    </section>

    <!-- 가볼 만한 곳 -->
    <section class="spot-section">
        <h2 class="section-title">가볼 만한 곳</h2>
         <h2 class="subtitle">주요 명소</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/ilchulbong.jpg" alt="일출봉"></div>
            <div class="spot-info"><h3>성산 일출봉</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/hallasan.jpg" alt="한라산"></div>
            <div class="spot-info"><h3>한라산 국립공원</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/jusangjeolli.jpg" alt="주상절리대"></div>
            <div class="spot-info"><h3>대포해안 주상절리대</h3><span class="like-btn">♡</span></div></div>
        </div>

        <!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
             <h2 class="subtitle">경관이 좋은 산책로</h2>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/handam.jpg" alt="한담해안 산책로"></div>
                <div class="spot-info"><h3>한담해안 산책로</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/sinchang.jpg" alt="신창 풍차해안도로"></div>
                <div class="spot-info"><h3>신창 풍차해안도로</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/buldobong.jpg" alt="별도봉 산책로"></div>
                <div class="spot-info"><h3>별도봉 산책로</h3><span class="like-btn">♡</span></div></div>
            </div>
            <h2 class="subtitle">테마 파크</h2>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/ecoland.jpg" alt="에코랜드 테마파크"></div>
                <div class="spot-info"><h3>에코랜드 테마파크</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/gimnyeong.jpg" alt="제주김녕미로공원"></div>
                <div class="spot-info"><h3>제주김녕미로공원</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/place/dermapark.jpg" alt="더마파크"></div>
                <div class="spot-info"><h3>더마파크</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

    <!-- 숙박할 곳 -->
    <section class="spot-section">
        <h2 class="section-title">숙박할 곳</h2>
        <h2 class="subtitle">호텔</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/shillajeju.jpg" alt="제주신라호텔"></div>
            <div class="spot-info"><h3>제주 신라 호텔</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/grandjosun.jpg" alt="그랜드 조선 제주"></div>
            <div class="spot-info"><h3>그랜드 조선 제주</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/lottehotel.jpg" alt="롯데 호텔 제주"></div>
            <div class="spot-info"><h3>롯데 호텔 제주</h3><span class="like-btn">♡</span></div></div>
        </div>
        <!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
            <h2 class="subtitle">펜션</h2>
             <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/jcloye.jpg" alt="제이앤클로이"></div>
                <div class="spot-info"><h3>제이앤클로이</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/hongsland.jpg" alt="홍스랜드"></div>
                <div class="spot-info"><h3>홍스랜드</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/stay/thebbs.jpg" alt="더비비스 제주"></div>
                <div class="spot-info"><h3>더비비스 제주</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

    <!-- 음식 -->
    <section class="spot-section">
        <h2 class="section-title">음식</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/doldam.jpg" alt="돌담흑돼지"></div>
            <div class="spot-info"><h3>돌담 흑돼지</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/galchibada.jpg" alt="갈치바다 애월"></div>
            <div class="spot-info"><h3>갈치 바다 애월</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/susunhwa.jpg" alt="수선화 식당"></div>
            <div class="spot-info"><h3>수선화 식당</h3><span class="like-btn">♡</span></div></div>
        </div>
		<!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/bomnal.jpg" alt="봄날"></div>
                <div class="spot-info"><h3>봄날</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/dumbul.jpg" alt="덤불"></div>
                <div class="spot-info"><h3>덤불</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/jeju/food/delmundo.jpg" alt="델문도"></div>
                <div class="spot-info"><h3>델문도</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
