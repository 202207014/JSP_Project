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

    <section class="spot-section">
        <h2 class="section-title">가볼 만한 곳</h2>

        <h2 class="subtitle">해변 & 자연</h2>
        <div class="spot-grid">

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20안목해변" target="_blank">
                        <img src="img/gangneung/place/anmok.jpg" alt="안목해변">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>안목해변</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_7&place=안목해변" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20강문 해변" target="_blank">
                        <img src="img/gangneung/place/gangmun.jpg" alt="강문 해변">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>강문 해변</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_8&place=강문 해변" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20주문진해수욕장" target="_blank">
                        <img src="img/gangneung/place/jumunjin.jpg" alt="주문진해수욕장">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>주문진해수욕장</h3>
                    <a href="addFavorite.jsp?id=gangneung_place_9&place=주문진해수욕장" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>

            <h2 class="subtitle">전통 · 문화 · 관광지</h2>
            <div class="spot-grid">

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20강릉 선교장" target="_blank">
                            <img src="img/gangneung/place/seongyojang.jpg" alt="강릉 선교장">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>강릉 선교장</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_1&place=강릉 선교장" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20구룡폭포" target="_blank">
                            <img src="img/gangneung/place/guryong.jpg" alt="구룡폭포">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>구룡폭포</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_2&place=구룡폭포" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20아르떼뮤지엄 강릉" target="_blank">
                            <img src="img/gangneung/place/arte.jpg" alt="아르떼뮤지엄 강릉">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>아르떼뮤지엄 강릉</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_3&place=아르떼뮤지엄 강릉" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20강릉 장덕리 은행나무" target="_blank">
                            <img src="img/gangneung/place/ginkgo.jpg" alt="강릉장덕리은행나무">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>강릉 장덕리 은행나무</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_4&place=강릉 장덕리 은행나무" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20아들바위공원" target="_blank">
                            <img src="img/gangneung/place/adeulbawi.jpg" alt="아들바위공원">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>아들바위공원</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_5&place=아들바위공원" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20중앙시장" target="_blank">
                            <img src="img/gangneung/place/market.jpg" alt="중앙시장">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>중앙시장</h3>
                        <a href="addFavorite.jsp?id=gangneung_place_6&place=중앙시장" class="like-link">❤️</a>
                    </div>
                </div>
            </div>
        </details>
    </section>

    <section class="spot-section">
        <h2 class="section-title">숙박할 곳</h2>
        <h2 class="subtitle">호텔</h2>

        <div class="spot-grid">

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20세인트존스 호텔" target="_blank">
                        <img src="img/gangneung/stay/stjohns.jpg" alt="세인트존스 호텔">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>세인트존스 호텔</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_1&place=세인트존스 호텔" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20신라모노그램 강릉" target="_blank">
                        <img src="img/gangneung/stay/monogram.jpg" alt="신라모노그램 강릉">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>신라모노그램 강릉</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_2&place=신라모노그램 강릉" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20스카이베이 경포" target="_blank">
                        <img src="img/gangneung/stay/skybay.jpg" alt="스카이베이 경포">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>스카이베이 경포</h3>
                    <a href="addFavorite.jsp?id=gangneung_stay_3&place=스카이베이 경포" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>

            <h2 class="subtitle">펜션</h2>
            <div class="spot-grid">

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20하이영진펜션" target="_blank">
                            <img src="img/gangneung/stay/hiyoungjin.jpg" alt="하이영진펜션">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>하이영진펜션</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_4&place=하이영진펜션" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20강릉비치힐펜션" target="_blank">
                            <img src="img/gangneung/stay/beachhill.jpg" alt="강릉비치힐펜션">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>강릉비치힐펜션</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_5&place=강릉비치힐펜션" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20휴심" target="_blank">
                            <img src="img/gangneung/stay/hyusim.jpg" alt="휴심">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>휴심</h3>
                        <a href="addFavorite.jsp?id=gangneung_stay_6&place=휴심" class="like-link">❤️</a>
                    </div>
                </div>
            </div>
        </details>
    </section>

    <section class="spot-section">
        <h2 class="section-title">음식</h2>

        <div class="spot-grid">

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20주문활게" target="_blank">
                        <img src="img/gangneung/food/jumunhwalge.jpg" alt="주문활게">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>주문활게</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_1&place=주문활게" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20피쉬맨대게횟집" target="_blank">
                        <img src="img/gangneung/food/fishman.jpg" alt="피쉬맨대게횟집">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>피쉬맨대게횟집</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_2&place=피쉬맨대게횟집" class="like-link">❤️</a>
                </div>
            </div>

            <div class="spot-card">
                <div class="spot-image">
                    <a href="https://map.naver.com/p/search/${encodedLoc}%20브라보칼국수" target="_blank">
                        <img src="img/gangneung/food/bravokalguksu.jpg" alt="브라보칼국수">
                    </a>
                </div>
                <div class="spot-info">
                    <h3>브라보칼국수</h3>
                    <a href="addFavorite.jsp?id=gangneung_food_3&place=브라보칼국수" class="like-link">❤️</a>
                </div>
            </div>
        </div>

        <details>
            <summary></summary>
            <div class="spot-grid">

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20보사노바 커피로스터스" target="_blank">
                            <img src="img/gangneung/food/bossanova.jpg" alt="보사노바 커피로스터스">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>보사노바 커피로스터스</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_4&place=보사노바 커피로스터스" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20인솔트베이커리" target="_blank">
                            <img src="img/gangneung/food/insalt.jpg" alt="인솔트베이커리">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>인솔트베이커리</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_5&place=인솔트베이커리" class="like-link">❤️</a>
                    </div>
                </div>

                <div class="spot-card">
                    <div class="spot-image">
                        <a href="https://map.naver.com/p/search/${encodedLoc}%20카페제니엘" target="_blank">
                            <img src="img/gangneung/food/cafejeniel.jpg" alt="카페제니엘">
                        </a>
                    </div>
                    <div class="spot-info">
                        <h3>카페제니엘</h3>
                        <a href="addFavorite.jsp?id=gangneung_food_6&place=카페제니엘" class="like-link">❤️</a>
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