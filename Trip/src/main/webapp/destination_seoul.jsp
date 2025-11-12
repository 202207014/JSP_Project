<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>서울 여행 명소 | Trip Planner</title>
    <link rel="stylesheet" href="css/header.css"> 
    <link rel="stylesheet" href="css/main.css"> 
    <link rel="stylesheet" href="css/destination.css">
</head>
<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main class="destination-page-container">

    <!-- 서울 메인 타이틀 -->
    <section class="destination-hero">
        <h1 class="main-title">서울 관광명소</h1>
        <p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
        <hr class="divider">
    </section>

    <!-- 관광명소 -->
    <section class="spot-section">
        <h2 class="section-title">가볼 만한 곳</h2>
        <div class="spot-grid">
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/place/gyeongbokgung.jpg" alt="경복궁"></div>
                <div class="spot-info"><h3>경복궁</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/place/bukchon.jpg" alt="북촌 한옥마을"></div>
                <div class="spot-info"><h3>북촌 한옥마을</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/place/changdeokgung.jpg" alt="창덕궁"></div>
                <div class="spot-info"><h3>창덕궁</h3><span class="like-btn">♡</span></div>
            </div>
        </div>

        <details>
            <summary></summary>
            <div class="spot-grid">
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/lotteworld.jpg" alt="롯데월드"></div>
                    <div class="spot-info"><h3>롯데월드</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/nseoultower.jpg" alt="N서울타워"></div>
                    <div class="spot-info"><h3>N서울타워</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/coex.jpg" alt="스타필드 코엑스몰"></div>
                    <div class="spot-info"><h3>스타필드 코엑스몰</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/seoulforest.jpg" alt="서울숲공원"></div>
                    <div class="spot-info"><h3>서울숲공원</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/ddp.jpg" alt="동대문디자인플라자"></div>
                    <div class="spot-info"><h3>동대문디자인플라자</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/place/gwangjang.jpg" alt="광장시장"></div>
                    <div class="spot-info"><h3>광장시장</h3><span class="like-btn">♡</span></div>
                </div>
            </div>
        </details>
    </section>

    <!-- 숙박 -->
    <section class="spot-section">
        <h2 class="section-title">숙박할 곳</h2>
        <div class="spot-grid">
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/stay/lotteworldhotel.jpg" alt="롯데 호텔 월드"></div>
                <div class="spot-info"><h3>롯데 호텔 월드</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/stay/signoneseoul.jpg" alt="시그니엘 서울"></div>
                <div class="spot-info"><h3>시그니엘 서울</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/stay/grandhyatt.jpg" alt="그랜드 하얏트 서울"></div>
                <div class="spot-info"><h3>그랜드 하얏트 서울</h3><span class="like-btn">♡</span></div>
            </div>
        </div>
        <details>
            <summary></summary>
            <div class="spot-grid">
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/stay/shilla.jpg" alt="서울신라호텔"></div>
                    <div class="spot-info"><h3>서울신라호텔</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/stay/glad.jpg" alt="글래드 여의도"></div>
                    <div class="spot-info"><h3>글래드 여의도</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/stay/grandwalkerhill.jpg" alt="그랜드 워커힐 서울"></div>
                    <div class="spot-info"><h3>그랜드 워커힐 서울</h3><span class="like-btn">♡</span></div>
                </div>
            </div>
        </details>
    </section>

    <!-- 음식 -->
    <section class="spot-section">
        <h2 class="section-title">음식</h2>
        <div class="spot-grid">
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/food/rabbitcastle.jpg" alt="래빗캐슬 잠실"></div>
                <div class="spot-info"><h3>래빗캐슬 잠실</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/food/haebangchon.jpg" alt="해방촌 브런치 헤미안"></div>
                <div class="spot-info"><h3>해방촌 브런치 헤미안</h3><span class="like-btn">♡</span></div>
            </div>
            <div class="spot-card">
                <div class="spot-image"><img src="img/seoul/food/modow.jpg" alt="모도우 광화문점"></div>
                <div class="spot-info"><h3>모도우 광화문점</h3><span class="like-btn">♡</span></div>
            </div>
        </div>

        <details>
            <summary></summary>
            <div class="spot-grid">
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/food/mingles.jpg" alt="밍글스"></div>
                    <div class="spot-info"><h3>밍글스</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/food/kwonsooksoo.jpg" alt="권숙수"></div>
                    <div class="spot-info"><h3>권숙수</h3><span class="like-btn">♡</span></div>
                </div>
                <div class="spot-card">
                    <div class="spot-image"><img src="img/seoul/food/allen.jpg" alt="레스토랑 알렌"></div>
                    <div class="spot-info"><h3>레스토랑 알렌</h3><span class="like-btn">♡</span></div>
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
