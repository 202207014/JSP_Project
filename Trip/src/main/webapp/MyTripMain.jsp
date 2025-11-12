<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<main class="container" style="max-width:1000px; margin:50px auto; font-family:sans-serif;">
  <h1 style="margin-bottom:30px; font-size:28px;">나의 여행</h1>

  <div style="margin-bottom:30px;">
    <button onclick="showAddTripModal()" 
            style="background-color:#444; color:white; border:none; padding:10px 20px; border-radius:6px; cursor:pointer;">
      + 새 여행 만들기
    </button>
  </div>

  <section id="tripList" style="display:flex; flex-wrap:wrap; gap:20px;"></section>
  <div id="emptyMessage" style="text-align:center; color:#999; margin-top:50px;">
    <p>아직 등록된 여행이 없습니다.<br>‘새 여행 만들기’ 버튼을 눌러 여행을 추가해보세요!</p>
  </div>
</main>

<!-- 여행 추가 모달 -->

<div id="addTripModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%;
     background:rgba(0,0,0,0.4); justify-content:center; align-items:center;">
  <div style="background:white; padding:30px; border-radius:10px; width:400px;">
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

```
  <button type="submit" style="background-color:#444; color:white; border:none; padding:10px; border-radius:6px; width:100%;">추가</button>
  <button type="button" onclick="closeModal()" style="margin-top:10px; background-color:#ccc; border:none; padding:8px; border-radius:6px; width:100%;">취소</button>
</form>
```

  </div>
</div>

<script>
let trips = JSON.parse(localStorage.getItem("myTrips") || "[]");

window.onload = function() { renderTrips(); };

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
  if (!file) return;
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
  const name = document.getElementById('tripName').value.trim();
  const location = document.getElementById('tripLocation').value.trim();
  const image = document.getElementById('preview').src || '../img/sample_trip.jpg';
  if (!name || !location) {
    alert("여행 이름과 여행지를 입력해주세요!");
    return;
  }

  const newTrip = { id: Date.now(), name, location, image, done: false };
  trips.push(newTrip);
  saveTrips();
  renderTrips();
  closeModal();
}

function saveTrips() {
  localStorage.setItem("myTrips", JSON.stringify(trips));
}

function deleteTrip(id) {
  if (confirm("정말 이 여행을 삭제하시겠어요?")) {
    trips = trips.filter(trip => trip.id !== id);
    saveTrips();
    renderTrips();
  }
}

function toggleComplete(id) {
  trips = trips.map(trip => trip.id === id ? { ...trip, done: !trip.done } : trip);
  saveTrips();
  renderTrips();
}

function toggleMenu(menuId) {
  const menu = document.getElementById(menuId);
  if (menu) {
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
  }
}

function openDetail(tripId) {
  localStorage.setItem("selectedTripId", tripId);
  window.location.href = "TripDetail.jsp";
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

  trips.forEach((trip) => {
    const card = document.createElement('div');
    card.className = 'trip-card';
    card.style.cssText = "width:300px; border:1px solid #ddd; border-radius:10px; overflow:hidden; box-shadow:0 2px 5px rgba(0,0,0,0.1); position:relative; background:#fff; cursor:pointer;";
    const encodedLoc = encodeURIComponent(trip.location);
    const menuId = "menu-" + trip.id;

    card.innerHTML = `
      <div style="position:absolute; top:10px; right:10px;">
        <button onclick="event.stopPropagation(); toggleMenu('${menuId}')" style="background:none; border:none; font-size:20px; cursor:pointer;">⋯</button>
        <div id="${menuId}" style="display:none; position:absolute; right:0; top:25px; background:white; border:1px solid #ccc; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.1); z-index:100;">
          <button onclick="deleteTrip(${trip.id})" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer;">삭제</button>
          <button onclick="toggleComplete(${trip.id})" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer;">
            ${trip.done ? '완료 해제' : '여행 완료'}
          </button>
          <button onclick="alert('공유 기능은 추후 추가 예정')" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer;">공유</button>
          <button onclick="alert('초대 기능은 추후 추가 예정')" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer;">초대</button>
        </div>
      </div>
      <img src="${trip.image}" alt="여행 이미지" style="width:100%; height:180px; object-fit:cover; opacity:${trip.done ? 0.6 : 1};">
      <div style="padding:15px;">
        <h3 style="margin:0; font-size:20px;">${trip.name}</h3>
        <p style="color:#666; font-size:14px;">${trip.location}</p>
        <div style="margin-top:10px; display:flex; gap:8px; flex-wrap:wrap;">
          <a href="https://map.naver.com/p/search/${encodedLoc}%20숙박" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">숙박</a>
          <a href="https://map.naver.com/p/search/${encodedLoc}%20즐길거리" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">즐길거리</a>
          <a href="https://map.naver.com/p/search/${encodedLoc}%20맛집" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">맛집</a>
        </div>
      </div>
    `;

    card.onclick = () => openDetail(trip.id);
    tripList.appendChild(card);
  });
}
</script>

<%@ include file="../footer.jsp" %>
