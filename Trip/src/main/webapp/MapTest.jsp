<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>제주 명소/숙소/식당 커스텀 마커 표시</title>
    <style>
#mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 

/* ------------------------------------------------ */
/* 카테고리 버튼 아이콘 스타일 (새로운 이미지 경로 사용) */
/* ------------------------------------------------ */
.category .ico_comm {
    display:block;
    margin:0 auto 2px;
    width:24px; /* 아이콘 크기 조정 */
    height:24px; /* 아이콘 크기 조정 */
    background-size: contain; /* 이미지가 영역 안에 맞게 축소/확대 */
    background-repeat: no-repeat;
    background-position: center;
    /* 이전 스프라이트 이미지 제거 */
} 

/* 명소 아이콘 (산 모양) */
.category .ico_attraction {
    background-image: url('img/logo/location.png'); 
}

/* 숙소 아이콘 (침대 모양) */
.category .ico_accommodation {
    background-image: url('img/logo/stay.png'); 
}

/* 식당 아이콘 (포크/나이프 모양) */
.category .ico_restaurant {
    background-image: url('img/logo/food.png'); 
}
</style>
</head>
<body>
<div id="mapwrap"> 
    <div id="map" style="width:100%;height:350px;"></div>
    <div class="category">
        <ul>
            <li id="attractionMenu" onclick="changeMarker('attraction')">
                <span class="ico_comm ico_attraction"></span>
                명소
            </li>
            <li id="accommodationMenu" onclick="changeMarker('accommodation')">
                <span class="ico_comm ico_accommodation"></span>
                숙소
            </li>
            <li id="restaurantMenu" onclick="changeMarker('restaurant')">
                <span class="ico_comm ico_restaurant"></span>
                식당
            </li>
        </ul>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68de1d94b9b6c750e878cee4f2a98e34"></script>
<script>
// 카카오맵 설정
var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 제주도 중심 좌표 (대략)
        level: 10 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption);

// ----------------------------------------------------
// 1. 제주도 좌표 데이터
// ----------------------------------------------------
var attractionPositions = [ 
    { title: '성산 일출봉', latlng: new kakao.maps.LatLng(33.462615, 126.936611) },
    { title: '한라산 국립공원', latlng: new kakao.maps.LatLng(33.360700, 126.529000) },
    { title: '대포해안주상절리대', latlng: new kakao.maps.LatLng(33.247470, 126.435251) },
    { title: '한담해안 산책로', latlng: new kakao.maps.LatLng(33.468200, 126.335900) },
    { title: '신창 풍차해안도로', latlng: new kakao.maps.LatLng(33.364400, 126.166400) },
    { title: '별도봉 산책로', latlng: new kakao.maps.LatLng(33.513500, 126.549200) },
    { title: '에코랜드 테마파크', latlng: new kakao.maps.LatLng(33.447300, 126.757000) },
    { title: '제주김녕미로공원', latlng: new kakao.maps.LatLng(33.551200, 126.744100) },
    { title: '더마파크', latlng: new kakao.maps.LatLng(33.435200, 126.279800) }
];
var accommodationPositions = [
    { title: '제주 신라 호텔', latlng: new kakao.maps.LatLng(33.245800, 126.410300) },
    { title: '그랜드 조선 제주', latlng: new kakao.maps.LatLng(33.245200, 126.408700) },
    { title: '롯데 호텔 제주', latlng: new kakao.maps.LatLng(33.245100, 126.411600) },
    { title: '제이앤클로이', latlng: new kakao.maps.LatLng(33.462900, 126.282800) },
    { title: '홍스랜드', latlng: new kakao.maps.LatLng(33.541400, 126.852400) },
    { title: '더비비스 제주', latlng: new kakao.maps.LatLng(33.473500, 126.302000) }
];
var restaurantPositions = [
    { title: '돌담 흑돼지', latlng: new kakao.maps.LatLng(33.490700, 126.334000) },
    { title: '갈치 바다 애월', latlng: new kakao.maps.LatLng(33.456000, 126.313000) },
    { title: '수선화 식당', latlng: new kakao.maps.LatLng(33.549300, 126.879000) },
    { title: '봄날', latlng: new kakao.maps.LatLng(33.467800, 126.332300) },
    { title: '덤불', latlng: new kakao.maps.LatLng(33.486200, 126.347800) },
    { title: '델문도', latlng: new kakao.maps.LatLng(33.542200, 126.666100) }
];

// ----------------------------------------------------
// 2. 마커 이미지 URL 정의 (카테고리 버튼과 동일한 파일 경로 사용)
// ----------------------------------------------------
// TODO: 이 경로를 실제 웹 서버의 이미지 URL로 변경해야 합니다!
var attractionImageSrc = 'img/logo/location.png',
    accommodationImageSrc = 'img/logo/stay.png',
    restaurantImageSrc = 'img/logo/food.png';

var markerImageSize = new kakao.maps.Size(36, 36), 
    markerImageOption = { offset: new kakao.maps.Point(18, 36) }; 

var attractionMarkers = [],
    accommodationMarkers = [],
    restaurantMarkers = [];

// ----------------------------------------------------
// 3. 마커 생성 및 관리 함수 (기존 로직 유지)
// ----------------------------------------------------

function createMarkerImage(src) {
    var markerImage = new kakao.maps.MarkerImage(src, markerImageSize, markerImageOption);
    return markerImage;            
}

function createMarker(position, image, title) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image,
        title: title
    });
    return marker;  
}   
   
function createAttractionMarkers() {
    var attractionMarkerImage = createMarkerImage(attractionImageSrc);
    for (var i = 0; i < attractionPositions.length; i++) {  
        var marker = createMarker(attractionPositions[i].latlng, attractionMarkerImage, attractionPositions[i].title);  
        attractionMarkers.push(marker);
    }     
}

function setAttractionMarkers(map) {        
    for (var i = 0; i < attractionMarkers.length; i++) {  
        attractionMarkers[i].setMap(map);
    }        
}

function createAccommodationMarkers() {
    var accommodationMarkerImage = createMarkerImage(accommodationImageSrc);
    for (var i = 0; i < accommodationPositions.length; i++) {
        var marker = createMarker(accommodationPositions[i].latlng, accommodationMarkerImage, accommodationPositions[i].title);  
        accommodationMarkers.push(marker);    
    }        
}

function setAccommodationMarkers(map) {        
    for (var i = 0; i < accommodationMarkers.length; i++) {  
        accommodationMarkers[i].setMap(map);
    }        
}

function createRestaurantMarkers() {
    var restaurantMarkerImage = createMarkerImage(restaurantImageSrc);
    for (var i = 0; i < restaurantPositions.length; i++) {
        var marker = createMarker(restaurantPositions[i].latlng, restaurantMarkerImage, restaurantPositions[i].title);  
        restaurantMarkers.push(marker);        
    }                
}

function setRestaurantMarkers(map) {        
    for (var i = 0; i < restaurantMarkers.length; i++) {  
        restaurantMarkers[i].setMap(map);
    }        
}

// 초기 마커 생성 및 표시
createAttractionMarkers();
createAccommodationMarkers();
createRestaurantMarkers();
changeMarker('attraction'); 

// ----------------------------------------------------
// 4. 카테고리 클릭 이벤트 핸들러 (기존 로직 유지)
// ----------------------------------------------------

function changeMarker(type){
    var attractionMenu = document.getElementById('attractionMenu');
    var accommodationMenu = document.getElementById('accommodationMenu');
    var restaurantMenu = document.getElementById('restaurantMenu');
    
    if (type === 'attraction') {
        attractionMenu.className = 'menu_selected';
        accommodationMenu.className = '';
        restaurantMenu.className = '';
        
        setAttractionMarkers(map);
        setAccommodationMarkers(null);
        setRestaurantMarkers(null);
        
    } else if (type === 'accommodation') {
        attractionMenu.className = '';
        accommodationMenu.className = 'menu_selected';
        restaurantMenu.className = '';
        
        setAttractionMarkers(null);
        setAccommodationMarkers(map);
        setRestaurantMarkers(null);
        
    } else if (type === 'restaurant') {
        attractionMenu.className = '';
        accommodationMenu.className = '';
        restaurantMenu.className = 'menu_selected';
        
        setAttractionMarkers(null);
        setAccommodationMarkers(null);
        setRestaurantMarkers(map);  
    }    
} 
</script>
</body>
</html>