<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<style>

/* 일정 기능 CSS */
.add-btn {
  background: #4A90E2;
  color: white;
  padding: 10px 16px;
  border-radius: 8px;
  border: none;
  font-size: 15px;
  cursor: pointer;
  margin-top: 20px;
}

.schedule-list { margin-top: 20px; display:flex; flex-direction:column; gap:12px; }

.schedule-card {
  background: #ffffff;
  border-radius: 10px;
  padding: 12px 14px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.08);
  position: relative;
}

.schedule-card .delete-btn {
  position: absolute;
  right: 12px;
  top: 12px;
  border: none;
  background: #ff5b5b;
  color: white;
  padding: 5px 10px;
  border-radius: 6px;
  cursor: pointer;
}

/* 모달 */
.modal {
  display: none;
  position: fixed;
  z-index: 999;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: rgba(0,0,0,0.4);
  justify-content: center;
  align-items: center;
}

.modal-content {
  background: #fff;
  padding: 18px;
  width: 320px;
  border-radius: 10px;
  box-shadow: 0 6px 18px rgba(0,0,0,0.15);
}

.modal-content input,
.modal-content textarea {
  width: 100%;
  padding: 8px;
  margin-top: 8px;
  border-radius: 6px;
  border: 1px solid #ddd;
}

.modal-btns { display:flex; gap:8px; margin-top:12px; }
.modal-btns button { flex:1; padding:8px 10px; border-radius:6px; border:none; cursor:pointer; }
.modal-btns .save { background:#2d8cff; color:#fff; }
.modal-btns .cancel { background:#eee; }

/* 상세 정보 CSS */
.detail-container {
    max-width: 900px;
    margin: 40px auto;
    font-family: sans-serif;
}

.detail-card {
    border: 1px solid #ddd;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    background: white;
}

.detail-img {
    width: 100%;
    height: 280px;
    object-fit: cover;
}

.detail-info {
    padding: 20px;
}

.detail-title {
    font-size: 26px;
    font-weight: bold;
    margin: 0 0 10px 0;
}

.detail-location {
    font-size: 16px;
    color: #555;
}

.detail-buttons {
    margin-top: 25px;
    display: flex;
    gap: 12px;
}

.detail-buttons a {
    padding: 10px 16px;
    border-radius: 6px;
    border: 1px solid #aaa;
    text-decoration: none;
    color: #333;
    font-size: 15px;
}

.memo-box {
    margin-top: 30px;
}

.memo-box textarea {
    width: 100%;
    height: 140px;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #ccc;
    resize: none;
    font-size: 15px;
}

</style>

<main class="detail-container">

  <h1 style="margin-bottom:20px;">여행 상세 정보</h1>

  <div id="detailContent"></div>

</main>

<!-- 일정 영역 -->
<div id="scheduleArea" style="max-width:900px; margin:20px auto; padding:0 16px;">
  
  <h2 style="margin:20px 0 10px 0;">🗓 일정</h2>

  <button id="openScheduleModal" class="add-btn">＋ 일정 추가</button>

  <div id="scheduleList" class="schedule-list"></div>
</div>

<!-- 일정 추가 모달 -->
<div id="scheduleModal" class="modal" aria-hidden="true">
  <div class="modal-content" role="dialog" aria-modal="true">
    <h3 style="margin:0 0 10px 0;">일정 추가</h3>

    <label>날짜</label>
    <input type="date" id="scheduleDate">

    <label>시간</label>
    <input type="time" id="scheduleTime">

    <label>장소</label>
    <input type="text" id="schedulePlace" placeholder="장소 입력">

    <label>메모</label>
    <textarea id="scheduleMemo" placeholder="메모 입력" rows="4"></textarea>

    <div class="modal-btns">
      <button id="saveScheduleBtn" class="save">저장</button>
      <button id="closeScheduleModal" class="cancel">취소</button>
    </div>
  </div>
</div>

<script>
/* ================================
   여행 상세 정보 표시
================================ */

const trips = JSON.parse(localStorage.getItem("myTrips") || "[]");
const selectedId = localStorage.getItem("selectedTripId");
const trip = trips.find(t => t.id == selectedId);

if (!trip) {
    document.getElementById("detailContent").innerHTML =
        "<p>선택된 여행 정보를 찾을 수 없습니다.</p>";
} else {
    const encodedLoc = encodeURIComponent(trip.location);

    document.getElementById("detailContent").innerHTML = `
      <div class="detail-card">
          <img src="\${trip.image}" class="detail-img">

          <div class="detail-info">
              <h2 class="detail-title">\${trip.name}</h2>
              <p class="detail-location">\${trip.location}</p>

              <div class="detail-buttons">
                  <a href="https://map.naver.com/p/search/\${encodedLoc}%20숙박" target="_blank">숙박</a>
                  <a href="https://map.naver.com/p/search/\${encodedLoc}%20즐길거리" target="_blank">즐길거리</a>
                  <a href="https://map.naver.com/p/search/\${encodedLoc}%20맛집" target="_blank">맛집</a>
              </div>

              <div class="memo-box">
                <h3>메모</h3>
                <textarea id="memo">\${trip.memo || ""}</textarea>
                <button style="margin-top:10px; padding:10px 16px; background:#444; color:white; border:none; border-radius:6px; cursor:pointer;"
                        onclick="saveMemo(\${trip.id})">메모 저장</button>
              </div>

          </div>
      </div>
    `;
}

function saveMemo(id) {
    const memoText = document.getElementById("memo").value;
    const updated = trips.map(t => t.id == id ? { ...t, memo: memoText } : t);
    localStorage.setItem("myTrips", JSON.stringify(updated));
    alert("메모가 저장되었습니다!");
}

/* ================================
   일정 기능
================================ */

const scheduleKey = "trip_schedule_" + selectedId;
let schedules = JSON.parse(localStorage.getItem(scheduleKey) || "[]");

const modal = document.getElementById("scheduleModal");
const openModalBtn = document.getElementById("openScheduleModal");
const closeModalBtn = document.getElementById("closeScheduleModal");
const saveBtn = document.getElementById("saveScheduleBtn");
const scheduleListEl = document.getElementById("scheduleList");

function renderSchedules() {
  scheduleListEl.innerHTML = "";

  if (schedules.length === 0) {
    scheduleListEl.innerHTML =
      '<p style="color:#777; text-align:center; padding:18px;">등록된 일정이 없습니다.</p>';
    return;
  }

  schedules.sort((a, b) => (a.date + a.time > b.date + b.time ? 1 : -1));

  schedules.forEach(s => {
    const div = document.createElement("div");
    div.className = "schedule-card";

    div.innerHTML = `
      <strong>\${s.date} \${s.time}</strong>
      <div style="margin-top:6px;">📍 \${s.place}</div>
      <p style="margin:8px 0 0 0; color:#444;">\${s.memo}</p>
      <button class="delete-btn" data-id="\${s.id}">삭제</button>
    `;

    scheduleListEl.appendChild(div);
  });

  // 삭제 기능
  scheduleListEl.querySelectorAll(".delete-btn").forEach(btn => {
    btn.addEventListener("click", function() {
      const id = Number(this.dataset.id);
      schedules = schedules.filter(s => s.id !== id);
      localStorage.setItem(scheduleKey, JSON.stringify(schedules));
      renderSchedules();
    });
  });
}

openModalBtn.addEventListener("click", () => {
  modal.style.display = "flex";
});

closeModalBtn.addEventListener("click", () => {
  modal.style.display = "none";
});

saveBtn.addEventListener("click", () => {
  const date = document.getElementById("scheduleDate").value;
  const time = document.getElementById("scheduleTime").value;
  const place = document.getElementById("schedulePlace").value;
  const memo = document.getElementById("scheduleMemo").value;

  if (!date || !time || !place) {
    alert("날짜, 시간, 장소는 필수 입력입니다.");
    return;
  }

  schedules.push({
    id: Date.now(),
    date, time, place, memo
  });

  localStorage.setItem(scheduleKey, JSON.stringify(schedules));
  modal.style.display = "none";
  renderSchedules();
});

// 첫 로딩 시 일정 출력
renderSchedules();


</script>

<%@ include file="../footer.jsp" %>
