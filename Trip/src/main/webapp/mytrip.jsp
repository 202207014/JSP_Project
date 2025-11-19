<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>나의 여행</title>
  <link rel="stylesheet" href="mytrip.css">
  <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>

  <div class="container">
    <h1>나의 여행</h1>

    <!-- 여행 추가 버튼 -->
    <button id="addTripBtn" onclick="addTrip()">+ 여행 추가</button>

    <!-- 여행 카드 목록 -->
    <div id="tripList" class="trip-list">

      <!-- 예시 카드 -->
      <div class="trip-card">
        <div class="trip-header">
          <div>
            <h3>부산 여행</h3>
            <p>부산</p>
          </div>

          <!-- 메뉴 버튼 (...) -->
          <div class="menu">
            <i class="fas fa-ellipsis-v" onclick="toggleMenu(this)"></i>
            <div class="dropdown-menu">
              <button onclick="deleteTrip(this)">삭제</button>
              <button onclick="completeTrip(this)">완료</button>
              <button onclick="shareTrip(this)">공유</button>
              <button onclick="inviteFriend(this)">초대</button>
            </div>
          </div>
        </div>

        <!-- 숙박/맛집/즐길거리 버튼 -->
        <div class="trip-actions">
          <button onclick="showInfo('부산', '숙박')">숙박</button>
          <button onclick="showInfo('부산', '맛집')">맛집</button>
          <button onclick="showInfo('부산', '즐길거리')">즐길거리</button>
        </div>

        <!-- 결과 출력 영역 -->
        <div class="trip-info"></div>
      </div>

    </div>
  </div>

  <script>
    // 메뉴 (… 버튼) 토글
    function toggleMenu(el) {
      const menu = el.parentElement;
      menu.classList.toggle("active");
    }

    // 여행 추가 버튼
    function addTrip() {
      const name = prompt("여행 이름을 입력하세요:");
      const location = prompt("여행 지역을 입력하세요:");
      if(!name || !location) return;

      const card = document.createElement("div");
      card.classList.add("trip-card");
      card.innerHTML = `
        <div class="trip-header">
          <div>
            <h3>${name}</h3>
            <p>${location}</p>
          </div>
          <div class="menu">
            <i class="fas fa-ellipsis-v" onclick="toggleMenu(this)"></i>
            <div class="dropdown-menu">
              <button onclick="deleteTrip(this)">삭제</button>
              <button onclick="completeTrip(this)">완료</button>
              <button onclick="shareTrip(this)">공유</button>
              <button onclick="inviteFriend(this)">초대</button>
            </div>
          </div>
        </div>
        <div class="trip-actions">
          <button onclick="showInfo('${location}', '숙박')">숙박</button>
          <button onclick="showInfo('${location}', '맛집')">맛집</button>
          <button onclick="showInfo('${location}', '즐길거리')">즐길거리</button>
        </div>
        <div class="trip-info"></div>
      `;
      document.getElementById("tripList").appendChild(card);
    }

    // 임시 기능들
    function deleteTrip(btn) {
      if(confirm("이 여행을 삭제하시겠습니까?")) {
        btn.closest(".trip-card").remove();
      }
    }

    function completeTrip(btn) {
      alert("여행이 완료로 표시되었습니다!");
    }

    function shareTrip(btn) {
      alert("공유 링크가 복사되었습니다!");
    }

    function inviteFriend(btn) {
      alert("초대 기능은 준비 중입니다!");
    }

    function showInfo(location, type) {
      const infoDiv = event.target.closest(".trip-card").querySelector(".trip-info");
      infoDiv.innerHTML = `<p><strong>${location}</strong>의 ${type} 정보를 불러오는 중...</p>`;
      // Kakao API 연결 시 여기에 fetch 코드 추가 예정
    }
  </script>
</body>
</html>
