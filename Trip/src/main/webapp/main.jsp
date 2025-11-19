<%-- components/header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/main.css">
<main>
	<div class="bg">
		<!-- 메인 페이지 이미지 -->
		<div class="hero-content">
			<h1>추천 여행 확인하기</h1>
			<p>여행 코스를 추천해 드립니다.</p>
		</div>
		<div class="hero-actions">
			<a href="MyTripMain.jsp" class="btn-secondary"> <!--mytripmain.jsp 이동-->
				나의 여행 바로가기
			</a> <a href="recommand.jsp" class="btn-primary"> <!--(X)recommand.jsp 이동-->
				추천 여행지 보기
			</a>
		</div>
	</div>
	<!-- 메인 페이지 이미지 -->
	<section class="popular-destinations">
		<h2>인기 여행지</h2>
		<div class="card-container">
			<!-- 여행지 카드 1 -->
			<div class="card">
				<img src="img/jeju.jpg" alt="제주도">
				<h3>제주도</h3>
				<p>자연과 함께하는 힐링 여행지</p>
				<a href="destination.jsp?place=jeju" class="btn-secondary">자세히
					보기</a>
			</div>
			<!-- 여행지 카드 2 -->
			<div class="card">
				<img src="img/busan.jpg" alt="부산">
				<h3>부산</h3>
				<p>바다와 맛집의 도시</p>
				<a href="destination.jsp?place=busan" class="btn-secondary">자세히
					보기</a>
			</div>

			<!-- 여행지 카드 3 -->
			<div class="card">
				<img src="img/seoul.jpg" alt="서울">
				<h3>서울</h3>
				<p>역사와 현대가 공존하는 수도</p>
				<a href="destination.jsp?place=seoul" class="btn-secondary">자세히
					보기</a>
			</div>
			<!-- 여행지 카드 4 -->
			<div class="card">
				<img src="img/gangneung.jpg" alt="강릉">
				<h3>강릉</h3>
				<p>바다와 커피의 도시</p>
				<a href="destination.jsp?place=gangneung" class="btn-secondary">자세히
					보기</a>
			</div>
		</div>
	</section>
</main>