<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<main class="container" style="max-width:1000px; margin:50px auto; font-family:sans-serif;">
    <h1 style="margin-bottom:30px; font-size:28px;">나의 여행</h1>

    <!-- 새 여행 만들기 버튼 -->
    <div style="margin-bottom:30px;">
        <button onclick="showAddTripModal()" 
                style="background-color:#00695c; color:white; border:none; padding:10px 20px; border-radius:6px; cursor:pointer;">
            + 새 여행 만들기
        </button>
    </div>

    <!-- 여행 카드 목록 -->
    <section id="tripList" style="display:flex; flex-wrap:wrap; gap:20px;">
        <!-- 카드들은 JS로 동적 생성 -->
    </section>

    <!-- 여행이 없을 때 메시지 -->
    <div id="emptyMessage" style="text-align:center; color:#999; margin-top:50px;">
        <p>아직 등록된 여행이 없습니다.<br>‘새 여행 만들기’ 버튼을 눌러 여행을 추가해보세요!</p>
    </div>
</main>

<!-- 여행 추가 모달 -->
<div id="addTripModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; 
     background:rgba(0,0,0,0.4); justify-content:center; align-items:center;">
    <div style="background:white; padding:30px; border-radius:10px; width:400px; position:relative;">
        <h2>새 여행 추가</h2>
        <form id="addTripForm" onsubmit="addTrip(event)">
            <label>여행 이름:<br>
                <input type="text" id="tripName" required style="width:100%; padding:8px; margin-top:5px;">
            </label><br><br>

            <label>여행지:<br>
                <input type="text" id="tripLocation" required style="width:100%; padding:8px; margin-top:5px;">
            </label><br><br>

            <label>이미지 업로드:<br>
                <input type="file" id="tripImage" accept="image/*" onchange="previewImage(event)">
            </label><br><br>

            <img id="preview" src="" alt="미리보기" style="width:100%; display:none; border-radius:6px; margin-bottom:10px;">

            <button type="submit" style="background-color:#0288d1; color:white; border:none; padding:10px; border-radius:6px; width:100%;">추가</button>
            <button type="button" onclick="closeModal()" style="margin-top:10px; background-color:#ccc; border:none; padding:8px; border-radius:6px; width:100%;">취소</button>
        </form>
    </div>
</div>

<script>
let trips = [];

function showAddTripModal() {
    document.getElementById('addTripModal').style.display = 'flex';
}

function closeModal() {
    document.getElementById('addTripModal').style.display = 'none';
    document.getElementById('addTripForm').reset();
    document.getElementById('preview').style.display = 'none';
}

function previewImage(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    reader.onload = function(e) {
        const preview = document.getElementById('preview');
        preview.src = e.target.result;
        preview.style.display = 'block';
    };
    reader.readAsDataURL(file);
}

function addTrip(event) {
    event.preventDefault();

    const name = document.getElementById('tripName').value;
    const location = document.getElementById('tripLocation').value;
    const image = document.getElementById('preview').src || '../img/sample_trip.jpg';

    const newTrip = { name, location, image };
    trips.push(newTrip);
    renderTrips();

    closeModal();
}

function renderTrips() {
    const tripList = document.getElementById('tripList');
    const emptyMessage = document.getElementById('emptyMessage');
    tripList.innerHTML = '';

    if (trips.length === 0) {
        emptyMessage.style.display = 'block';
        return;
    } else {
        emptyMessage.style.display = 'none';
    }

    trips.forEach((trip, index) => {
        const card = document.createElement('div');
        card.className = 'trip-card';
        card.style.cssText = "width:300px; border:1px solid #ddd; border-radius:10px; overflow:hidden; box-shadow:0 2px 5px rgba(0,0,0,0.1);";

        card.innerHTML = `
            <img src="${trip.image}" alt="여행 이미지" style="width:100%; height:180px; object-fit:cover;">
            <div style="padding:15px;">
                <h3 style="margin:0; font-size:20px;">${trip.name}</h3>
                <p style="color:#666; font-size:14px;">${trip.location}</p>

                <div class="tabs" style="margin-top:10px;">
                    <button onclick="showTab(${index}, 'stay')" style="margin-right:5px;">숙박</button>
                    <button onclick="showTab(${index}, 'activity')" style="margin-right:5px;">즐길거리</button>
                    <button onclick="showTab(${index}, 'food')">맛집</button>
                </div>

                <div id="tab-${index}" style="margin-top:10px; font-size:14px; color:#333;">
                    숙박 시설 정보를 확인하려면 ‘숙박’ 탭을 눌러주세요.
                </div>
            </div>
        `;
        tripList.appendChild(card);
    });
}

function showTab(index, tab) {
    const tabContent = document.getElementById(`tab-${index}`);
    if (tab === 'stay') {
        tabContent.innerHTML = '🏨 추천 숙박: 힐튼 호텔, 롯데시티호텔, 에어비앤비';
    } else if (tab === 'activity') {
        tabContent.innerHTML = '🎡 즐길거리: 현지 투어, 해변 산책, 야경 명소';
    } else if (tab === 'food') {
        tabContent.innerHTML = '🍽 맛집: 현지 식당, 유명 디저트 카페, 시장 음식';
    }
}
</script>

<%@ include file="../footer.jsp" %>
