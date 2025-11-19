<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

		<section class="destination-hero">
			<h1 class="main-title">서울 관광명소</h1>
			<p class="subtitle">꼭 봐야 할 명소, 숙박, 맛집을 확인하세요</p>
			<hr class="divider">
		</section>

		<section class="spot-section">
			<h2 class="section-title">가볼 만한 곳</h2>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20경복궁" target="_blank">
							<img src="img/seoul/place/gyeongbokgung.jpg" alt="경복궁">
						</a>
					</div>
					<div class="spot-info">
						<h3>경복궁</h3>
						<a
							href="addFavorite.jsp?id=seoul_place_1&place=경복궁&type=명소&img=img/seoul/place/gyeongbokgung.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20북촌 한옥마을" target="_blank">
							<img src="img/seoul/place/bukchon.jpg" alt="북촌 한옥마을">
						</a>
					</div>
					<div class="spot-info">
						<h3>북촌 한옥마을</h3>
						<a
							href="addFavorite.jsp?id=seoul_place_2&place=북촌 한옥마을&type=명소&img=img/seoul/place/bukchon.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20창덕궁" target="_blank">
							<img src="img/seoul/place/changdeokgung.jpg" alt="창덕궁">
						</a>
					</div>
					<div class="spot-info">
						<h3>창덕궁</h3>
						<a
							href="addFavorite.jsp?id=seoul_place_3&place=창덕궁&type=명소&img=img/seoul/place/changdeokgung.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20롯데월드" target="_blank">
								<img src="img/seoul/place/lotteworld.jpg" alt="롯데월드">
							</a>
						</div>
						<div class="spot-info">
							<h3>롯데월드</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_4&place=롯데월드&type=명소&img=img/seoul/place/lotteworld.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20N서울타워" target="_blank">
								<img src="img/seoul/place/nseoultower.jpg" alt="N서울타워">
							</a>
						</div>
						<div class="spot-info">
							<h3>N서울타워</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_5&place=N서울타워&type=명소&img=img/seoul/place/nseoultower.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20스타필드 코엑스몰" target="_blank">
								<img src="img/seoul/place/coex.jpg" alt="스타필드 코엑스몰">
							</a>
						</div>
						<div class="spot-info">
							<h3>스타필드 코엑스몰</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_6&place=스타필드 코엑스몰&type=명소&img=img/seoul/place/coex.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20서울숲공원" target="_blank">
								<img src="img/seoul/place/seoulforest.jpg" alt="서울숲공원">
							</a>
						</div>
						<div class="spot-info">
							<h3>서울숲공원</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_7&place=서울숲공원&type=명소&img=img/seoul/place/seoulforest.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20동대문디자인플라자" target="_blank">
								<img src="img/seoul/place/ddp.jpg" alt="동대문디자인플라자">
							</a>
						</div>
						<div class="spot-info">
							<h3>동대문디자인플라자</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_8&place=동대문디자인플라자&type=명소&img=img/seoul/place/ddp.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20광장시장" target="_blank">
								<img src="img/seoul/place/gwangjang.jpg" alt="광장시장">
							</a>
						</div>
						<div class="spot-info">
							<h3>광장시장</h3>
							<a
								href="addFavorite.jsp?id=seoul_place_9&place=광장시장&type=명소&img=img/seoul/place/gwangjang.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
				</div>
			</details>
		</section>

		<section class="spot-section">
			<h2 class="section-title">숙박할 곳</h2>
			<div class="spot-grid">
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20롯데 호텔 월드" target="_blank">
							<img src="img/seoul/stay/lotteworldhotel.jpg" alt="롯데 호텔 월드">
						</a>
					</div>
					<div class="spot-info">
						<h3>롯데 호텔 월드</h3>
						<a
							href="addFavorite.jsp?id=seoul_stay_1&place=롯데 호텔 월드&type=숙박&img=img/seoul/stay/lotteworldhotel.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20시그니엘 서울" target="_blank">
							<img src="img/seoul/stay/signoneseoul.jpg" alt="시그니엘 서울">
						</a>
					</div>
					<div class="spot-info">
						<h3>시그니엘 서울</h3>
						<a
							href="addFavorite.jsp?id=seoul_stay_2&place=시그니엘 서울&type=숙박&img=img/seoul/stay/signoneseoul.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20그랜드 하얏트 서울" target="_blank">
							<img src="img/seoul/stay/grandhyatt.jpg" alt="그랜드 하얏트 서울">
						</a>
					</div>
					<div class="spot-info">
						<h3>그랜드 하얏트 서울</h3>
						<a
							href="addFavorite.jsp?id=seoul_stay_3&place=그랜드 하얏트 서울&type=숙박&img=img/seoul/stay/grandhyatt.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20서울신라호텔" target="_blank">
								<img src="img/seoul/stay/shilla.jpg" alt="서울신라호텔">
							</a>
						</div>
						<div class="spot-info">
							<h3>서울신라호텔</h3>
							<a
								href="addFavorite.jsp?id=seoul_stay_4&place=서울신라호텔&type=숙박&img=img/seoul/stay/shilla.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20글래드 여의도" target="_blank">
								<img src="img/seoul/stay/glad.jpg" alt="글래드 여의도">
							</a>
						</div>
						<div class="spot-info">
							<h3>글래드 여의도</h3>
							<a
								href="addFavorite.jsp?id=seoul_stay_5&place=글래드 여의도&type=숙박&img=img/seoul/stay/glad.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20그랜드 워커힐 서울" target="_blank">
								<img src="img/seoul/stay/grandwalkerhill.jpg" alt="그랜드 워커힐 서울">
							</a>
						</div>
						<div class="spot-info">
							<h3>그랜드 워커힐 서울</h3>
							<a
								href="addFavorite.jsp?id=seoul_stay_6&place=그랜드 워커힐 서울&type=숙박&img=img/seoul/stay/grandwalkerhill.jpg"
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
						<a href="https://map.naver.com/p/search/${encodedLoc}%20래빗캐슬 잠실" target="_blank">
							<img src="img/seoul/food/rabbitcastle.jpg" alt="래빗캐슬 잠실">
						</a>
					</div>
					<div class="spot-info">
						<h3>래빗캐슬 잠실</h3>
						<a
							href="addFavorite.jsp?id=seoul_food_1&place=래빗캐슬 잠실&type=음식&img=img/seoul/food/rabbitcastle.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20해방촌 브런치 헤미안" target="_blank">
							<img src="img/seoul/food/haebangchon.jpg" alt="해방촌 브런치 헤미안">
						</a>
					</div>
					<div class="spot-info">
						<h3>해방촌 브런치 헤미안</h3>
						<a
							href="addFavorite.jsp?id=seoul_food_2&place=해방촌 브런치 헤미안&type=음식&img=img/seoul/food/haebangchon.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
				<div class="spot-card">
					<div class="spot-image">
						<a href="https://map.naver.com/p/search/${encodedLoc}%20모도우 광화문점" target="_blank">
							<img src="img/seoul/food/modow.jpg" alt="모도우 광화문점">
						</a>
					</div>
					<div class="spot-info">
						<h3>모도우 광화문점</h3>
						<a
							href="addFavorite.jsp?id=seoul_food_3&place=모도우 광화문점&type=음식&img=img/seoul/food/modow.jpg"
							class="like-link">❤️</a>
					</div>
				</div>
			</div>

			<details>
				<summary></summary>
				<div class="spot-grid">
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20밍글스" target="_blank">
								<img src="img/seoul/food/mingles.jpg" alt="밍글스">
							</a>
						</div>
						<div class="spot-info">
							<h3>밍글스</h3>
							<a
								href="addFavorite.jsp?id=seoul_food_4&place=밍글스&type=음식&img=img/seoul/food/mingles.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20권숙수" target="_blank">
								<img src="img/seoul/food/kwonsooksoo.jpg" alt="권숙수">
							</a>
						</div>
						<div class="spot-info">
							<h3>권숙수</h3>
							<a
								href="addFavorite.jsp?id=seoul_food_5&place=권숙수&type=음식&img=img/seoul/food/kwonsooksoo.jpg"
								class="like-link">❤️</a>
						</div>
					</div>
					<div class="spot-card">
						<div class="spot-image">
							<a href="https://map.naver.com/p/search/${encodedLoc}%20레스토랑 알렌" target="_blank">
								<img src="img/seoul/food/allen.jpg" alt="레스토랑 알렌">
							</a>
						</div>
						<div class="spot-info">
							<h3>레스토랑 알렌</h3>
							<a
								href="addFavorite.jsp?id=seoul_food_6&place=레스토랑 알렌&type=음식&img=img/seoul/food/allen.jpg"
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