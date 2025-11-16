<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>강릉 여행 명소 | Trip Planner</title>
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/destination.css">
</head>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main class="destination-page-container">

    <section class="destination-hero">
        <h1 class="main-title">강릉 관광명소</h1>
        <p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
        <hr class="divider">
    </section>

    <!-- 관광명소 -->
    <section class="spot-section">
        <h2 class="section-title">가볼 만한 곳</h2>

        <!-- 해변/해수욕장 -->
        <h2 class="subtitle">해변 & 자연</h2>
        <div class="spot-grid">

            <!-- gangneung_place_7 안목해변 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/place/anmok.jpg" alt="안목해변">
                </div>
                <div class="spot-info">
                    <h3>안목해변</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_7&place=안목해변&type=해변&img=img/gangneung/place/anmok.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_place_8 강문 해변 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/place/gangmun.jpg" alt="강문 해변">
                </div>
                <div class="spot-info">
                    <h3>강문 해변</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_8&place=강문 해변&type=해변&img=img/gangneung/place/gangmun.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_place_9 주문진해수욕장 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/place/jumunjin.jpg" alt="주문진해수욕장">
                </div>
                <div class="spot-info">
                    <h3>주문진해수욕장</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_9&place=주문진해수욕장&type=해수욕장&img=img/gangneung/place/jumunjin.jpg" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>

            <h2 class="subtitle">전통 · 문화 · 관광지</h2>
            <div class="spot-grid">

                <!-- gangneung_place_1 강릉 선교장 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/seongyojang.jpg" alt="강릉 선교장">
                    </div>
                    <div class="spot-info">
                        <h3>강릉 선교장</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_1&place=강릉 선교장&type=문화&img=img/gangneung/place/seongyojang.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_place_2 구룡폭포 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/guryong.jpg" alt="구룡폭포">
                    </div>
                    <div class="spot-info">
                        <h3>구룡폭포</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_2&place=구룡폭포&type=자연&img=img/gangneung/place/guryong.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_place_3 아르떼뮤지엄 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/arte.jpg" alt="아르떼뮤지엄 강릉">
                    </div>
                    <div class="spot-info">
                        <h3>아르떼뮤지엄 강릉</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_3&place=아르떼뮤지엄 강릉&type=전시관&img=img/gangneung/place/arte.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_place_4 강릉 장덕리 은행나무 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/ginkgo.jpg" alt="강릉장덕리은행나무">
                    </div>
                    <div class="spot-info">
                        <h3>강릉 장덕리 은행나무</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_4&place=강릉 장덕리 은행나무&type=명소&img=img/gangneung/place/ginkgo.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_place_5 아들바위공원 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/adeulbawi.jpg" alt="아들바위공원">
                    </div>
                    <div class="spot-info">
                        <h3>아들바위공원</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_5&place=아들바위공원&type=공원&img=img/gangneung/place/adeulbawi.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_place_6 중앙시장 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/place/market.jpg" alt="중앙시장">
                    </div>
                    <div class="spot-info">
                        <h3>중앙시장</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_6&place=중앙시장&type=시장&img=img/gangneung/place/market.jpg" class="like-link">❤️</a>
                    </div>
                </div>
            </div>
        </details>
    </section>

    <!-- 숙박 -->
    <section class="spot-section">
        <h2 class="section-title">숙박할 곳</h2>
        <h2 class="subtitle">호텔</h2>

        <div class="spot-grid">

            <!-- gangneung_stay_1 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/stay/stjohns.jpg" alt="세인트존스 호텔">
                </div>
                <div class="spot-info">
                    <h3>세인트존스 호텔</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_1&place=세인트존스 호텔&type=호텔&img=img/gangneung/stay/stjohns.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_stay_2 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/stay/monogram.jpg" alt="신라모노그램 강릉">
                </div>
                <div class="spot-info">
                    <h3>신라모노그램 강릉</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_2&place=신라모노그램 강릉&type=호텔&img=img/gangneung/stay/monogram.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_stay_3 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/stay/skybay.jpg" alt="스카이베이 경포">
                </div>
                <div class="spot-info">
                    <h3>스카이베이 경포</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_3&place=스카이베이 경포&type=호텔&img=img/gangneung/stay/skybay.jpg" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>

            <h2 class="subtitle">펜션</h2>
            <div class="spot-grid">

                <!-- gangneung_stay_4 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/stay/hiyoungjin.jpg" alt="하이영진펜션">
                    </div>
                    <div class="spot-info">
                        <h3>하이영진펜션</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_4&place=하이영진펜션&type=펜션&img=img/gangneung/stay/hiyoungjin.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_stay_5 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/stay/beachhill.jpg" alt="강릉비치힐펜션">
                    </div>
                    <div class="spot-info">
                        <h3>강릉비치힐펜션</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_5&place=강릉비치힐펜션&type=펜션&img=img/gangneung/stay/beachhill.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_stay_6 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/stay/hyusim.jpg" alt="휴심">
                    </div>
                    <div class="spot-info">
                        <h3>휴심</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_6&place=휴심&type=펜션&img=img/gangneung/stay/hyusim.jpg" class="like-link">❤️</a>
                    </div>
                </div>
            </div>
        </details>
    </section>

    <!-- 음식 -->
    <section class="spot-section">
        <h2 class="section-title">음식</h2>

        <div class="spot-grid">

            <!-- gangneung_food_1 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/food/jumunhwalge.jpg" alt="주문활게">
                </div>
                <div class="spot-info">
                    <h3>주문활게</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_1&place=주문활게&type=음식&img=img/gangneung/food/jumunhwalge.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_food_2 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/food/fishman.jpg" alt="피쉬맨대게횟집">
                </div>
                <div class="spot-info">
                    <h3>피쉬맨대게횟집</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_2&place=피쉬맨대게횟집&type=음식&img=img/gangneung/food/fishman.jpg" class="like-link">❤️</a>
                </div>
            </div>

            <!-- gangneung_food_3 -->
            <div class="spot-card">
                <div class="spot-image">
                    <img src="img/gangneung/food/bravokalguksu.jpg" alt="브라보칼국수">
                </div>
                <div class="spot-info">
                    <h3>브라보칼국수</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_3&place=브라보칼국수&type=음식&img=img/gangneung/food/bravokalguksu.jpg" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>
            <div class="spot-grid">

                <!-- gangneung_food_4 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/food/bossanova.jpg" alt="보사노바 커피로스터스">
                    </div>
                    <div class="spot-info">
                        <h3>보사노바 커피로스터스</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_4&place=보사노바 커피로스터스&type=카페&img=img/gangneung/food/bossanova.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_food_5 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/food/insalt.jpg" alt="인솔트베이커리">
                    </div>
                    <div class="spot-info">
                        <h3>인솔트베이커리</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_5&place=인솔트베이커리&type=카페&img=img/gangneung/food/insalt.jpg" class="like-link">❤️</a>
                    </div>
                </div>

                <!-- gangneung_food_6 -->
                <div class="spot-card">
                    <div class="spot-image">
                        <img src="img/gangneung/food/cafejeniel.jpg" alt="카페제니엘">
                    </div>
                    <div class="spot-info">
                        <h3>카페제니엘</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_6&place=카페제니엘&type=카페&img=img/gangneung/food/cafejeniel.jpg" class="like-link">❤️</a>
                    </div>
                </div>

            </div>
        </details>
    </section>

</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
