<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<section class="destination-hero">
			<h1 class="main-title">제주 관광명소</h1>
			<p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
			<hr class="divider">
		</section>

		<section class="spot-section">
			<h2 class="section-title">가볼 만한 곳</h2>
			<h2 class="subtitle">주요 명소</h2>
			<div class="spot-grid">

				<div class="spot-card">
					<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20성산일출봉"target="_blank">
						<img src="img/jeju/place/ilchulbong.jpg" alt="성산 일출봉">
						</a>
					</div>
					<div class="spot-info">
						<h3>성산 일출봉</h3>
						<a
							href="addFavorite.jsp?id=jeju_place_1&place=성산 일출봉&type=명소&img=img/jeju/place/ilchulbong.jpg"
							class="like-link">❤️</a>
					</div>
				</div>

				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20한라산 국립공원"target="_blank">
						<img src="img/jeju/place/hallasan.jpg" alt="한라산 국립공원">
						</a>
					</div>
					<div class="spot-info">
						<h3>한라산 국립공원</h3>
						<a
							href="addFavorite.jsp?id=jeju_place_2&place=한라산 국립공원&type=명소&img=img/jeju/place/hallasan.jpg"
							class="like-link">❤️</a>
					</div>
				</div>

				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20대포해안 주상절리대"target="_blank">
						<img src="img/jeju/place/jusangjeolli.jpg" alt="대포해안 주상절리대">
						</a>
					</div>
					<div class="spot-info">
						<h3>대포해안 주상절리대</h3>
						<a
							href="addFavorite.jsp?id=jeju_place_3&place=대포해안 주상절리대&type=명소&img=img/jeju/place/jusangjeolli.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<h2 class="subtitle">경관이 좋은 산책로</h2>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20한담해안산책로"target="_blank">
							<img src="img/jeju/place/handam.jpg" alt="한담해안 산책로"> </a>
						</div>
						<div class="spot-info">
							<h3>한담해안 산책로</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_4&place=한담해안 산책로&type=산책로&img=img/jeju/place/handam.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20신창 풍차해안도로"target="_blank">
							<img src="img/jeju/place/sinchang.jpg" alt="신창 풍차해안도로">
							</a>
						</div>
						<div class="spot-info">
							<h3>신창 풍차해안도로</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_5&place=신창 풍차해안도로&type=산책로&img=img/jeju/place/sinchang.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20별도봉 산책로"target="_blank">
							<img src="img/jeju/place/buldobong.jpg" alt="별도봉 산책로">
							</a>
						</div>
						<div class="spot-info">
							<h3>별도봉 산책로</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_6&place=별도봉 산책로&type=산책로&img=img/jeju/place/buldobong.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
				</div>

				<h2 class="subtitle">테마 파크</h2>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20에코랜드 테마파크"target="_blank">
							<img src="img/jeju/place/ecoland.jpg" alt="에코랜드 테마파크">
							</a>
						</div>
						<div class="spot-info">
							<h3>에코랜드 테마파크</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_7&place=에코랜드 테마파크&type=테마파크&img=img/jeju/place/ecoland.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20제주김녕미로공원"target="_blank">
							<img src="img/jeju/place/gimnyeong.jpg" alt="제주김녕미로공원">
							</a>
						</div>
						<div class="spot-info">
							<h3>제주김녕미로공원</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_8&place=제주김녕미로공원&type=테마파크&img=img/jeju/place/gimnyeong.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20더마파크"target="_blank">
							<img src="img/jeju/place/dermapark.jpg" alt="더마파크">
							</a>
						</div>
						<div class="spot-info">
							<h3>더마파크</h3>
							<a
								href="addFavorite.jsp?id=jeju_place_9&place=더마파크&type=테마파크&img=img/jeju/place/dermapark.jpg"
								class="like-link">❤️</a>
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
						<a href="https://map.naver.com/p/search/${encodedLoc}%20제주신라호텔"target="_blank">
						<img src="img/jeju/stay/shillajeju.jpg" alt="제주신라호텔">
						</a>
					</div>
					<div class="spot-info">
						<h3>제주 신라 호텔</h3>
						<a
							href="addFavorite.jsp?id=jeju_stay_1&place=제주 신라 호텔&type=숙박&img=img/jeju/stay/shillajeju.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20그랜드 조선 제주"target="_blank">
						<img src="img/jeju/stay/grandjosun.jpg" alt="그랜드 조선 제주">
						</a>
					</div>
					<div class="spot-info">
						<h3>그랜드 조선 제주</h3>
						<a
							href="addFavorite.jsp?id=jeju_stay_2&place=그랜드 조선 제주&type=숙박&img=img/jeju/stay/grandjosun.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20롯데 호텔 제주"target="_blank">
						<img src="img/jeju/stay/lottehotel.jpg" alt="롯데 호텔 제주">
						</a>
					</div>
					<div class="spot-info">
						<h3>롯데 호텔 제주</h3>
						<a
							href="addFavorite.jsp?id=jeju_stay_3&place=롯데 호텔 제주&type=숙박&img=img/jeju/stay/lottehotel.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<h2 class="subtitle">펜션</h2>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20제이앤클로이"target="_blank">
							<img src="img/jeju/stay/jcloye.jpg" alt="제이앤클로이">
							</a>
						</div>
						<div class="spot-info">
							<h3>제이앤클로이</h3>
							<a
								href="addFavorite.jsp?id=jeju_stay_4&place=제이앤클로이&type=숙박&img=img/jeju/stay/jcloye.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20홍스랜드"target="_blank">
							<img src="img/jeju/stay/hongsland.jpg" alt="홍스랜드">
							</a>
						</div>
						<div class="spot-info">
							<h3>홍스랜드</h3>
							<a
								href="addFavorite.jsp?id=jeju_stay_5&place=홍스랜드&type=숙박&img=img/jeju/stay/hongsland.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20더비비스 제주"target="_blank">
							<img src="img/jeju/stay/thebbs.jpg" alt="더비비스 제주">
							</a>
						</div>
						<div class="spot-info">
							<h3>더비비스 제주</h3>
							<a
								href="addFavorite.jsp?id=jeju_stay_6&place=더비비스 제주&type=숙박&img=img/jeju/stay/thebbs.jpg"
								class="like-link">❤️</a>
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
						<a href="https://map.naver.com/p/search/${encodedLoc}%20돌담 흑돼지"target="_blank">
						<img src="img/jeju/food/doldam.jpg" alt="돌담 흑돼지">
						</a>
					</div>
					<div class="spot-info">
						<h3>돌담 흑돼지</h3>
						<a
							href="addFavorite.jsp?id=jeju_food_1&place=돌담 흑돼지&type=음식&img=img/jeju/food/doldam.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20갈치 바다 애월"target="_blank">
						<img src="img/jeju/food/galchibada.jpg" alt="갈치 바다 애월">
						</a>
					</div>
					<div class="spot-info">
						<h3>갈치 바다 애월</h3>
						<a
							href="addFavorite.jsp?id=jeju_food_2&place=갈치 바다 애월&type=음식&img=img/jeju/food/galchibada.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20수선화 식당"target="_blank">
						<img src="img/jeju/food/susunhwa.jpg" alt="수선화 식당">
						</a>
					</div>
					<div class="spot-info">
						<h3>수선화 식당</h3>
						<a
							href="addFavorite.jsp?id=jeju_food_3&place=수선화 식당&type=음식&img=img/jeju/food/susunhwa.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20봄날카페"target="_blank">
							<img src="img/jeju/food/bomnal.jpg" alt="봄날">
							</a>
						</div>
						<div class="spot-info">
							<h3>봄날</h3>
							<a
								href="addFavorite.jsp?id=jeju_food_4&place=봄날&type=음식&img=img/jeju/food/bomnal.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20덤불카페"target="_blank">
							<img src="img/jeju/food/dumbul.jpg" alt="덤불">
							</a>
						</div>
						<div class="spot-info">
							<h3>덤불</h3>
							<a
								href="addFavorite.jsp?id=jeju_food_5&place=덤불&type=음식&img=img/jeju/food/dumbul.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20델문도"target="_blank">
							<img src="img/jeju/food/delmundo.jpg" alt="델문도">
							</a>
						</div>
						<div class="spot-info">
							<h3>델문도</h3>
							<a
								href="addFavorite.jsp?id=jeju_food_6&place=델문도&type=음식&img=img/jeju/food/delmundo.jpg"
								class="like-link">❤️</a>
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