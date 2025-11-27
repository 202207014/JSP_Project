<%@ page import="java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>강릉 코스 보기 | Trip Planner</title>

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/course.css">

</head>
<body>
	<jsp:include page="header.jsp" />

	<%
	// ==========================================================
	// 1. 서버 측 로직: DB 연결 및 장소 정보 추출 (JDBC)
	// ==========================================================
	request.setCharacterEncoding("UTF-8");

	// DB 연결 정보 설정 (MySQL)
	String jdbcUrl = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	String dbUser = "root";
	String dbPass = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 장소 이름과 타입을 저장하기 위한 내부 클래스 정의
	class Place {
		String name, type;
		Place(String n, String t) {
			name = n;
			type = t;
		}
	}
	// DB에서 가져온 장소 정보를 저장하는 자바 리스트
	List<Place> places = new ArrayList<>();

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		
		// 쿼리: places 테이블에서 'gangneung_'으로 시작하는 장소(이름, 타입)만 조회
		String sql = "SELECT place_name, place_type FROM places WHERE place_id LIKE 'gangneung_%'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		// DB 결과(ResultSet)를 자바 리스트(places)에 저장
		while (rs.next()) {
			places.add(new Place(rs.getString("place_name"), rs.getString("place_type")));
		}
	} catch (Exception e) {
		// 오류 발생 시 콘솔에 출력 (디버깅 목적)
		e.printStackTrace();
	} finally {
		// DB 자원 해제 (안전한 닫기 처리)
		if (rs != null) try { rs.close(); } catch (Exception e) {}
		if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
		if (conn != null) try { conn.close(); } catch (Exception e) {}
	}
	
	// places 리스트를 JS에서 사용 가능한 JSON 배열 문자열 형태로 변환
	StringBuilder jsPlaces = new StringBuilder("[");
	for (int i = 0; i < places.size(); i++) {
		Place p = places.get(i);
		// JS 객체 형식: {name:'...', type:'...'} 생성
		jsPlaces.append("{name:'").append(p.name).append("', type:'").append(p.type).append("'}");
		if (i < places.size() - 1)
			jsPlaces.append(",");
	}
	jsPlaces.append("]");
	// 최종 결과 예: [{name:'경포해변', type:'명소'}, ...]
	%>

	<main style="max-width: 1100px; margin: 30px auto; padding: 0 16px;">
		<h1 style="text-align: center; margin-bottom: 8px;">강릉 여행 코스</h1>
		<p style="text-align: center; color: #666; margin-top: 0;">당일치기 ·
			1박2일 · 2박3일 버튼을 눌러 코스를 확인하세요.</p>
		
		<div class="course-buttons">
			<button onclick="loadCourse('1day')">당일치기</button>
			<button onclick="loadCourse('2day')">1박 2일</button>
			<button onclick="loadCourse('3day')">2박 3일</button>
		</div>
		<div id="map"></div>
		
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68de1d94b9b6c750e878cee4f2a98e34&libraries=services"></script>
			
		<script>
// ==========================================================
// 2. 클라이언트 측 로직: 지도 및 코스 관리 (JavaScript)
// ==========================================================
// JSP에서 서버 데이터를 받아 JS 변수로 초기화
var allPlaces = <%=jsPlaces.toString()%>;

// 미리 정의된 코스 경로 배열 (장소 이름을 순서대로 나열)
var courses = {
    "1day": [
        "경포해변",
        "안목해변 커피거리",
        "오죽헌",
        "강릉 중앙시장",
        "동화가든"
    ],
    "2day": [
        "정동진",
        "하슬라 아트월드",
        "주문진 수산시장",
        "세인트존스 호텔",      // 숙박 포함
        "엄지네 포장마차",
        "강릉 커피콩빵"
    ],
    "3day": [
        "선교장",
        "강문해변",
        "순두부 젤라또 1호점",  
        "강릉 짬뽕순두부",       
        "테라로사 커피공장",     
        "씨마크 호텔",           // 숙박 포함
        "라카이 샌드파인"        // 숙박 포함
    ]
};

// 카카오 지도 객체 생성 및 초기화 (강릉 중심 좌표 및 레벨 설정)
var map = new kakao.maps.Map(document.getElementById('map'), {
	center:new kakao.maps.LatLng(37.7459,128.8733), // 지도 초기 중심 (강릉 시내 근처)
	level:10 // 지도 확대 레벨
});

var ps = new kakao.maps.services.Places(); // 카카오 장소 검색 서비스 객체
var markers=[]; // 지도에 표시된 마커를 저장할 배열

// 기존 마커 제거
function removeMarkers(){
	for(var i=0;i<markers.length;i++){ markers[i].setMap(null); }
	markers=[];
}

// 코스 로딩 및 지도에 표시
function loadCourse(courseName){
	removeMarkers(); // 새 코스 로드 전 기존 마커 제거
	var course=courses[courseName]; // 선택된 코스 배열 (장소 이름 목록)
	if(!course) return;
	
	course.forEach(function(name,index){
		// 1. DB에서 가져온 리스트(allPlaces)에서 현재 장소 이름에 해당하는 타입 정보를 찾음
		var place = allPlaces.find(p=>p.name===name);
		if(!place) return; 
		
		// 2. 카카오 장소 검색 API 호출 (장소 이름으로 좌표를 비동기적으로 얻어옴)
		ps.keywordSearch(name,function(data,status){
			if(status===kakao.maps.services.Status.OK){
				var lat=data[0].y; // 위도
				var lng=data[0].x; // 경도
				
				// 마커 생성 및 지도에 표시
				var marker=new kakao.maps.Marker({
					map:map,
					position:new kakao.maps.LatLng(lat,lng),
					title:name
				});
				markers.push(marker);

				// 3. 인포윈도우 내용 구성: 순서와 장소 타입 표시
				var infoContent = '<div class="info-window"><strong>'+name+'</strong><br>'
                + (index+1) + '번째 코스<br>'
                 + place.type + '</div>'; // DB에서 가져온 place.type 사용

				var infowindow = new kakao.maps.InfoWindow({ content: infoContent });

				// 4. 마우스 오버/아웃 이벤트 리스너 추가 (인포윈도우 표시/숨김)
				kakao.maps.event.addListener(marker,'mouseover',function(){
					infowindow.open(map,marker);
				});
				kakao.maps.event.addListener(marker,'mouseout',function(){
					infowindow.close();
				});
			} else {
				// 검색 실패 시 콘솔에 로그 출력 (좌표를 찾지 못함)
				console.log("검색 실패:"+name+", 상태:"+status);
			}
		});
	});
}
</script>

		<div style="margin-top: 18px; text-align: center;">
			<small style="color: #777;">※ 마커 클릭 없이 마우스 오버 시, 코스 정보와 장소
				타입을 확인할 수 있습니다.</small>
		</div>
	</main>

	<jsp:include page="footer.jsp" />
</body>
</html>