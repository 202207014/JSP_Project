<%@ page import="java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>부산 코스 보기 | Trip Planner</title>

<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/destination.css">

<style>
.course-buttons { text-align:center; margin:20px 0; }
.course-buttons button { margin:0 8px; padding:8px 14px; cursor:pointer; }
#map { width:100%; height:600px; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.1); }
.info-window { width:220px; }
.info-window img { width:100%; height:110px; object-fit:cover; border-radius:4px; }
</style>
</head>
<body>
<jsp:include page="header.jsp" />

<%
request.setCharacterEncoding("UTF-8");

String jdbcUrl = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
String dbUser = "root";
String dbPass = "1234";
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

class Place { String name,type; Place(String n,String t){name=n; type=t;} }
List<Place> places = new ArrayList<>();

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);

	String sql="SELECT place_name, place_type FROM places WHERE place_id LIKE 'busan_%'";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		places.add(new Place(rs.getString("place_name"), rs.getString("place_type")));
	}
} catch(Exception e){ e.printStackTrace(); } 
finally { try{ if(rs!=null) rs.close(); } catch(Exception e){} try{ if(pstmt!=null) pstmt.close(); } catch(Exception e){} try{ if(conn!=null) conn.close(); } catch(Exception e){} }

StringBuilder jsPlaces = new StringBuilder("[");
for(int i=0;i<places.size();i++){
	Place p = places.get(i);
	jsPlaces.append("{name:'").append(p.name).append("', type:'").append(p.type).append("'}");
	if(i<places.size()-1) jsPlaces.append(",");
}
jsPlaces.append("]");
%>

<main style="max-width:1100px; margin:30px auto; padding:0 16px;">
<h1 style="text-align:center; margin-bottom:8px;">부산 여행 코스</h1>
<p style="text-align:center; color:#666; margin-top:0;">당일치기 · 1박2일 · 2박3일 버튼을 눌러 코스를 확인하세요.</p>

<div class="course-buttons">
	<button onclick="loadCourse('1day')">당일치기</button>
	<button onclick="loadCourse('2day')">1박 2일</button>
	<button onclick="loadCourse('3day')">2박 3일</button>
</div>

<div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68de1d94b9b6c750e878cee4f2a98e34&libraries=services"></script>
<script>
var allPlaces = <%=jsPlaces.toString()%>;

// 코스별 배열 (봄날 제거)
var courses = {
	    "1day": [
	        "해운대 해수욕장",
	        "광안리 해수욕장",
	        "자갈치 시장",
	        "해운대 횟집 미포점"
	    ],
	    "2day": [
	        "해운대 해수욕장",
	        "광안리 해수욕장",
	        "자갈치 시장",
	        "그랜드 조선 부산", // 1박차 숙소
	        "송도 해수욕장",
	        "국제 시장",
	        "디에이블 광안점",
	        "파크 하얏트 부산"  // 2박차 숙소 (2일차 마지막 숙소)
	    ],
	    "3day": [
	        "해운대 해수욕장",
	        "광안리 해수욕장",
	        "자갈치 시장",
	        "그랜드 조선 부산",  // 1박차 숙소
	        "송도 해수욕장",
	        "국제 시장",
	        "기장 시장",
	        "모네의 여름",        // 2박차 숙소
	        "카이브 부산 송정 1호점", // 3박차 숙소 (필요시 추가)
	        "조개 공장 서면점",
	        "모모스커피 마린시티점",
	        "도시농가코페도코"
	    ]
	};


var map = new kakao.maps.Map(document.getElementById('map'), {
	center:new kakao.maps.LatLng(35.1807,129.0753),
	level:9
});

var ps = new kakao.maps.services.Places();
var markers=[];

// 기존 마커 제거
function removeMarkers(){
	for(var i=0;i<markers.length;i++){ markers[i].setMap(null); }
	markers=[];
}

// 코스 로딩
function loadCourse(courseName){
	removeMarkers();
	var course=courses[courseName];
	if(!course) return;
	
	course.forEach(function(name,index){
		var place = allPlaces.find(p=>p.name===name);
		if(!place) return;
		
		ps.keywordSearch(name,function(data,status){
			if(status===kakao.maps.services.Status.OK){
				var lat=data[0].y;
				var lng=data[0].x;
				
				// 기본 마커
				var marker=new kakao.maps.Marker({
					map:map,
					position:new kakao.maps.LatLng(lat,lng),
					title:name
				});
				markers.push(marker);

				// 인포윈도우: 순서, 장소 타입
				
				var infoContent = '<div class="info-window"><strong>'+name+'</strong><br>'
                + (index+1) + '번째 코스<br>'
                 + place.type + '</div>';

				var infowindow = new kakao.maps.InfoWindow({ content: infoContent });

				kakao.maps.event.addListener(marker,'mouseover',function(){
					infowindow.open(map,marker);
				});
				kakao.maps.event.addListener(marker,'mouseout',function(){
					infowindow.close();
				});
			} else {
				console.log("검색 실패:"+name+", 상태:"+status);
			}
		});
	});
}
</script>

<div style="margin-top:18px; text-align:center;">
<small style="color:#777;">※ 마커 클릭 없이 마우스 오버 시, 코스 정보와 장소 타입을 확인할 수 있습니다.</small>
</div>
</main>

<jsp:include page="footer.jsp" />
</body>
</html>
