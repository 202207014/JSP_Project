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
	<section class="destination-hero">
		<h1 class="main-title">부산 관광명소</h1>
		<p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
		<hr class="divider">
	</section>

	<section class="spot-section">
		<h2 class="section-title">가볼 만한 곳</h2>
		<h2 class="subtitle">해수욕장</h2>
		<div class="spot-grid">
			<div class="spot-card">
				<div class="spot-image">
				<a href="https://map.naver.com/p/search/${encodedLoc}%20해운대 해수욕장" target="_blank"><img src="img/busan/place/haewundae.jpg" alt="해운대">
					</a>
				</div>
				<div class="spot-info">
					<h3>해운대 해수욕장</h3>
					<a href="addFavorite.jsp?id=busan_place_1&place=해운대 해수욕장" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
				<a href="https://map.naver.com/p/search/${encodedLoc}%20광안리 해수욕장" target="_blank">
					<img src="img/busan/place/gwangalli-beach.jpg" alt="광안리">
					</a>
				</div>
				<div class="spot-info">
					<h3>광안리 해수욕장</h3>
					<a href="addFavorite.jsp?id=busan_place_2&place=광안리 해수욕장" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
				<a href="https://map.naver.com/p/search/${encodedLoc}%20송도 해수욕장" target="_blank">
					<img src="img/busan/place/songdo.jpg" alt="송도">
				</a>
				</div>
				<div class="spot-info">
					<h3>송도 해수욕장</h3>
					<a href="addFavorite.jsp?id=busan_place_3&place=송도 해수욕장" class="like-link">❤️</a>
				</div>
			</div>
		</div>

		<details>
			<summary></summary>
			<h2 class="subtitle">시장</h2>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20자갈치 시장" target="_blank">
						<img src="img/busan/place/jagalchi.jpg" alt="자갈치시장">
					</a>
					</div>
					<div class="spot-info">
						<h3>자갈치 시장</h3>
						<a href="addFavorite.jsp?id=busan_place_4&place=자갈치 시장" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20국제 시장" target="_blank">
							<img src="img/busan/place/gukjae.jpg" alt="국제시장">
						</a>
					</div>
					<div class="spot-info">
						<h3>국제 시장</h3>
						<a href="addFavorite.jsp?id=busan_place_5&place=국제 시장" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20기장 시장" target="_blank">
							<img src="img/busan/place/gijang.jpg" alt="기장시장">
						</a>
					</div>
					<div class="spot-info">
						<h3>기장 시장</h3>
						<a href="addFavorite.jsp?id=busan_place_6&place=기장 시장" class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<h2 class="subtitle">체험 & 관광지</h2>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20송도 케이블카" target="_blank">
							<img src="img/busan/place/cablecar.jpg" alt="송도 케이블카">
						</a>
					</div>
					<div class="spot-info">
						<h3>송도 케이블카</h3>
						<a href="addFavorite.jsp?id=busan_place_7&place=송도 케이블카" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20허심청 스파" target="_blank">
							<img src="img/busan/place/spa.jpg" alt="허심청 스파">
						</a>
					</div>
					<div class="spot-info">
						<h3>허심청 스파</h3>
						<a href="addFavorite.jsp?id=busan_place_8&place=허심청 스파" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20SEA LIFE 아쿠아리움" target="_blank">
							<img src="img/busan/place/sealife.jpg" alt="부산 아쿠아리움">
						</a>
					</div>
					<div class="spot-info">
						<h3>SEA LIFE 아쿠아리움</h3>
						<a href="addFavorite.jsp?id=busan_place_9&place=SEA LIFE 아쿠아리움" class="like-link">❤️</a>
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
					<a href="https://map.naver.com/p/search/${encodedLoc}%20그랜드 조선 부산" target="_blank">
						<img src="img/busan/stay/grandjosun.jpg" alt="그랜드 조선 부산">
					</a>
				</div>
				<div class="spot-info">
					<h3>그랜드 조선 부산</h3>
					<a href="addFavorite.jsp?id=busan_stay_1&place=그랜드 조선 부산" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20파크 하얏트 부산" target="_blank">
						<img src="img/busan/stay/parkhbusan.jpg" alt="파크 하얏트 부산">
					</a>
				</div>
				<div class="spot-info">
					<h3>파크 하얏트 부산</h3>
					<a href="addFavorite.jsp?id=busan_stay_2&place=파크 하얏트 부산" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20신라스테이 부산 해운대" target="_blank">
						<img src="img/busan/stay/shillastay.jpg" alt="신라스테이 부산 해운대">
					</a>
				</div>
				<div class="spot-info">
					<h3>신라스테이 부산 해운대</h3>
					<a href="addFavorite.jsp?id=busan_stay_3&place=신라스테이 부산 해운대" class="like-link">❤️</a>
				</div>
			</div>
		</div>

		<details>
			<summary></summary>
			<h2 class="subtitle">펜션</h2>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20카이브 부산 송정 1호점" target="_blank">
							<img src="img/busan/stay/kaiv.jpg" alt="카이브 부산 송정 1호점">
						</a>
					</div>
					<div class="spot-info">
						<h3>카이브 부산 송정 1호점</h3>
						<a href="addFavorite.jsp?id=busan_stay_4&place=카이브 부산 송정 1호점" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20메르벨르펜션" target="_blank">
							<img src="img/busan/stay/mrbel.jpg" alt="메르벨르펜션">
						</a>
					</div>
					<div class="spot-info">
						<h3>메르벨르펜션</h3>
						<a href="addFavorite.jsp?id=busan_stay_5&place=메르벨르펜션" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20모네의 여름" target="_blank">
							<img src="img/busan/stay/mone.jpg" alt="모네의 여름">
						</a>
					</div>
					<div class="spot-info">
						<h3>모네의 여름</h3>
						<a href="addFavorite.jsp?id=busan_stay_6&place=모네의 여름" class="like-link">❤️</a>
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
					<a href="https://map.naver.com/p/search/${encodedLoc}%20해운대 횟집 미포점" target="_blank">
						<img src="img/busan/food/fish.jpg" alt="해운대 횟집 미포점">
					</a>
				</div>
				<div class="spot-info">
					<h3>해운대 횟집 미포점</h3>
					<a href="addFavorite.jsp?id=busan_food_1&place=해운대 횟집 미포점" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20디에이블 광안점" target="_blank">
						<img src="img/busan/food/theable.jpg" alt="디에이블 광안점">
					</a>
				</div>
				<div class="spot-info">
					<h3>디에이블 광안점</h3>
					<a href="addFavorite.jsp?id=busan_food_2&place=디에이블 광안점" class="like-link">❤️</a>
				</div>
			</div>
			<div class="spot-card">
				<div class="spot-image">
					<a href="https://map.naver.com/p/search/${encodedLoc}%20조개 공장 서면점" target="_blank">
						<img src="img/busan/food/jogae.jpg" alt="조개 공장 서면점">
					</a>
				</div>
				<div class="spot-info">
					<h3>조개 공장 서면점</h3>
					<a href="addFavorite.jsp?id=busan_food_3&place=조개 공장 서면점" class="like-link">❤️</a>
				</div>
			</div>
		</div>

		<details>
			<summary></summary>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20모모스커피 마린시티점" target="_blank">
							<img src="img/busan/food/momos.jpg" alt="모모스커피">
						</a>
					</div>
					<div class="spot-info">
						<h3>모모스커피 마린시티점</h3>
						<a href="addFavorite.jsp?id=busan_food_4&place=모모스커피 마린시티점" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20카페잇샌드" target="_blank">
							<img src="img/busan/food/cafeitsand.jpg" alt="카페잇샌드">
						</a>
					</div>
					<div class="spot-info">
						<h3>카페잇샌드</h3>
						<a href="addFavorite.jsp?id=busan_food_5&place=카페잇샌드" class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20도시농가코페도코" target="_blank">
							<img src="img/busan/food/doko.jpg" alt="도시농가코페도코">
						</a>
					</div>
					<div class="spot-info">
						<h3>도시농가코페도코</h3>
						<a href="addFavorite.jsp?id=busan_food_6&place=도시농가코페도코" class="like-link">❤️</a>
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