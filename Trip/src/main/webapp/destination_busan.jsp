<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>부산 여행 명소 | Trip Planner</title>
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
        <h1 class="main-title">부산 관광명소</h1>
        <p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
        <hr class="divider">
    </section>

    <!-- 가볼 만한 곳 -->
    <section class="spot-section">
        <h2 class="section-title">가볼 만한 곳</h2>
         <h2 class="subtitle">해수욕장</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/busan/place/haewundae.jpg" alt="해운대"></div>
            <div class="spot-info"><h3>해운대 해수욕장</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/place/gwangalli-beach.jpg" alt="광안리"></div>
            <div class="spot-info"><h3>광안리 해수욕장</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/place/songdo.jpg" alt="송도"></div>
            <div class="spot-info"><h3>송도 해수욕장</h3><span class="like-btn">♡</span></div></div>
        </div>

        <!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
             <h2 class="subtitle">시장</h2>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/jagalchi.jpg" alt="자갈치시장"></div>
                <div class="spot-info"><h3>자갈치 시장</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/gukjae.jpg" alt="국제시장"></div>
                <div class="spot-info"><h3>국제 시장</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/gijang.jpg" alt="기장시장"></div>
                <div class="spot-info"><h3>기장 시장</h3><span class="like-btn">♡</span></div></div>
            </div>
            <h2 class="subtitle">체험 & 관광지</h2>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/cablecar.jpg" alt="송도 케이블카"></div>
                <div class="spot-info"><h3>송도 케이블카</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/spa.jpg" alt="허심청 스파"></div>
                <div class="spot-info"><h3>허심청 스파</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/place/sealife.jpg" alt="부산 아쿠아리움"></div>
                <div class="spot-info"><h3>SEA LIFE 아쿠아리움</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

    <!-- 숙박할 곳 -->
    <section class="spot-section">
        <h2 class="section-title">숙박할 곳</h2>
        <h2 class="subtitle">호텔</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/grandjosun.jpg" alt="그랜드 조선 부산"></div>
            <div class="spot-info"><h3>그랜드 조선 부산</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/parkhbusan.jpg" alt="파크 하얏트 부산"></div>
            <div class="spot-info"><h3>파크 하얏트 부산</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/shillastay.jpg" alt="신라스테이 부산 해운대"></div>
            <div class="spot-info"><h3>신라스테이 부산 해운대</h3><span class="like-btn">♡</span></div></div>
        </div>
        <!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
            <h2 class="subtitle">펜션</h2>
             <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/kaiv.jpg" alt="카이브 부산 송정 1호점"></div>
                <div class="spot-info"><h3>카이브 부산 송정 1호점</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/mrbel.jpg" alt="메르벨르펜션"></div>
                <div class="spot-info"><h3>메르벨르펜션</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/stay/mone.jpg" alt="모네의 여름"></div>
                <div class="spot-info"><h3>모네의 여름</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

    <!-- 음식 -->
    <section class="spot-section">
        <h2 class="section-title">음식</h2>
        <div class="spot-grid">
            <div class="spot-card"><div class="spot-image"><img src="img/busan/food/fish.jpg" alt="해운대 횟집 미포점"></div>
            <div class="spot-info"><h3>해운대 횟집 미포점</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/food/theable.jpg" alt="디에이블 광안점"></div>
            <div class="spot-info"><h3>디에이블 광안점</h3><span class="like-btn">♡</span></div></div>
            <div class="spot-card"><div class="spot-image"><img src="img/busan/food/jogae.jpg" alt="조개 공장 서면점"></div>
            <div class="spot-info"><h3>조개 공장 서면점</h3><span class="like-btn">♡</span></div></div>
        </div>
		<!-- 더보기(접기/펼치기) -->
        <details>
            <summary></summary>
            <div class="spot-grid">
                <div class="spot-card"><div class="spot-image"><img src="img/busan/food/momos.jpg" alt="모모스커피"></div>
                <div class="spot-info"><h3>모모스커피 마린시티점</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/food/cafeitsand.jpg" alt="카페잇샌드"></div>
                <div class="spot-info"><h3>카페잇샌드</h3><span class="like-btn">♡</span></div></div>
                <div class="spot-card"><div class="spot-image"><img src="img/busan/food/doko.jpg" alt="도시농가코페도코"></div>
                <div class="spot-info"><h3>도시농가코페도코</h3><span class="like-btn">♡</span></div></div>
            </div>
        </details>
    </section>

</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
