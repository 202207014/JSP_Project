<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="../header.jsp"%>

<main class="container"
	style="max-width: 1000px; margin: 50px auto; font-family: 'Malgun Gothic', 'Dotum', sans-serif; padding: 0 20px;">
	
	<!--로그인 확인 (추가 내용)-->
	<%
		request.setCharacterEncoding("UTF-8");
		String userId = (String)session.getAttribute("userid"); // 세션 ID 받아오기
		if (userId == null) { //세션 ID X
		    out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
		    return;
		}
	%>
	<!--로그인 확인 (추가 내용) 끝-->
	<h1 style="margin-bottom: 30px; font-size: 28px;">나의 여행</h1>

	<div style="margin-bottom: 30px;">
		<button onclick="showAddTripModal()"
			style="background-color: #444; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer; font-weight: 600;">
			+ 새 여행 만들기</button>
	</div>

	<section id="tripList"
		style="display: flex; flex-wrap: wrap; gap: 20px;"></section>
	<div id="emptyMessage"
		style="text-align: center; color: #999; margin-top: 50px;">
		<p>
			아직 등록된 여행이 없습니다.<br>‘새 여행 만들기’ 버튼을 눌러 여행을 추가해보세요!
		</p>
	</div>
</main>
<!-- 여행 추가 모달 -->
<div id="addTripModal"
	style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.6); justify-content: center; align-items: center; z-index: 1000;">

	<div class="modal-content"
		style="background: white; padding: 30px; border-radius: 10px; width: 400px; max-width: 90%; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);">

		<h2>새 여행 추가</h2>
		<form id="addTripForm" onsubmit="addTrip(event)">
			<label style="display: block; margin-top: 10px;">여행 이름:<br>
				<input type="text" id="tripName" required
				style="width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px;">
			</label><br> <br> <label style="display: block; margin-top: 10px;">여행지:<br>
				<input type="text" id="tripLocation" required
				style="width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px;">
			</label><br> <br> <label style="display: block; margin-top: 10px;">이미지
				업로드:<br> <input type="file" id="tripImage" accept="image/*"
				onchange="previewImage(event)">
			</label><br> <br> <img id="preview" src="" alt="미리보기"
				style="width: 100%; display: none; border-radius: 6px; margin-bottom: 10px;">

			<button type="submit"
				style="background-color: #444; color: white; border: none; padding: 10px; border-radius: 6px; width: 100%; cursor: pointer; font-weight: 600;">추가</button>
			<button type="button" onclick="closeModal()"
				style="margin-top: 10px; background-color: #ccc; border: none; padding: 8px; border-radius: 6px; width: 100%; cursor: pointer;">취소</button>
		</form>
	</div>
</div>
<!-- DB 찜 목록 보기(추가 내용)-->
<div class="footer-favorites-area"
	style="max-width: 600px; margin: 30px auto; padding: 0 20px;">
	<h2 class="favorites-title"
		style="font-size: 1.4em; font-weight: 600; color: #3498db; margin-top: 0; margin-bottom: 15px; border-bottom: 2px solid #3498db; padding-bottom: 5px; text-align: center;">나의
		최근 찜 목록</h2>
	<div class="favorite-cards-wrapper"
		style="display: flex; justify-content: center; gap: 15px; flex-wrap: wrap;">

		<%
		// DB 및 세션 변수 선언(mysql 연결을 위한 기본 객체)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 로그인한 경우에만 DB 조회 실행
		if (userId != null) {
			try {
				//DB 연결
				String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
				String dbUser = "root"; //DB ID
				String dbPass = "1234"; //DB PASSWD

				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, dbUser, dbPass);

				// LIMIT 3을 사용하여 최근 항목 3개만 조회
				String sql = "SELECT place_name, place_img FROM favorites WHERE user_id = ? LIMIT 3";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();

				boolean found = false;
				while (rs.next()) {
			found = true;
			String name = rs.getString("place_name");
			String img = rs.getString("place_img");

			// 🌟 인라인 스타일로 카드 마크업 출력 🌟
			out.println(
					"<div style='width: 100px; background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; overflow: hidden; text-align: center; box-shadow: 0 1px 3px rgba(0,0,0,0.5);'>");
			out.println(
					"<img src='" + img + "' alt='" + name + "' style='width: 100%; height: 80px; object-fit: cover;'>");
			out.println(
					"<p style='font-size: 0.75em; margin: 5px 2px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; color: #555; padding-bottom: 5px;'>"
							+ name + "</p>");
			out.println("</div>");
				}

				if (!found) { // 찜 목록이 비어있을 때 
			out.println("<p style='text-align: center; color: #999; padding: 20px 0;'>찜 목록이 비어있습니다.</p>");
				}

			} catch (Exception e) { //에러 처리
				out.println("<p style='color:red;'>DB 로드 오류: " + e.getMessage() + "</p>");
				// e.printStackTrace();
			} finally { //DB 자원 해제
				if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
			}
				if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
			}
				if (conn != null)
			try {
				conn.close();
			} catch (Exception e) {
			}
			}
		} else { //로그인 안한 경우
			out.println("<p style='text-align: center; color: #999; padding: 20px 0;'>로그인하시면 찜 목록을 확인할 수 있습니다.</p>");
		}
		%>
	</div>
</div>
<!-- DB 찜 목록 보기(추가 내용) 끝-->
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
    
    // 🌟 카드 자체의 인라인 스타일 🌟
    card.style.cssText = "width:300px; border:1px solid #ddd; border-radius:10px; overflow:hidden; box-shadow:0 2px 5px rgba(0,0,0,0.1); position:relative; background:#fff; cursor:pointer;";
    card.className = 'trip-card ' + (trip.done ? 'trip-done' : ''); 
    
    const encodedLoc = encodeURIComponent(trip.location);
    const menuId = "menu-" + trip.id;
    
    // 🌟 템플릿 리터럴 내부 인라인 스타일 🌟
    const imgOpacity = trip.done ? 0.6 : 1;

    card.innerHTML = `
      <div style="position:absolute; top:10px; right:10px;">
        <button onclick="event.stopPropagation(); toggleMenu('${menuId}')" style="background:none; border:none; font-size:20px; cursor:pointer; color: #333;">⋯</button>
        <div id="${menuId}" style="display:none; position:absolute; right:0; top:25px; background:white; border:1px solid #ccc; border-radius:6px; box-shadow:0 2px 8px rgba(0,0,0,0.1); z-index:100; min-width: 120px;">
          <button onclick="deleteTrip(${trip.id})" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer; font-size: 14px;">삭제</button>
          <button onclick="toggleComplete(${trip.id})" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer; font-size: 14px;">
            ${trip.done ? '완료 해제' : '여행 완료'}
          </button>
          <button onclick="alert('공유 기능은 추후 추가 예정')" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer; font-size: 14px;">공유</button>
          <button onclick="alert('초대 기능은 추후 추가 예정')" style="display:block; width:100%; background:none; border:none; padding:8px 12px; text-align:left; cursor:pointer; font-size: 14px;">초대</button>
        </div>
      </div>
      <img src="${trip.image}" alt="여행 이미지" style="width:100%; height:180px; object-fit:cover; opacity:${imgOpacity};">
      <div style="padding:15px;">
        <h3 style="margin:0; font-size:20px;">${trip.name}</h3>
        <p style="color:#666; font-size:14px; margin-top: 5px;">${trip.location}</p>
        <div style="margin-top:10px; display:flex; gap:8px; flex-wrap:wrap;">
          <a href="https://map.naver.com/p/search/${encodedLoc}%20숙박" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333; font-size: 14px;">숙박</a>
          <a href="https://map.naver.com/p/search/${encodedLoc}%20즐길거리" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333; font-size: 14px;">즐길거리</a>
          <a href="https://map.naver.com/p/search/${encodedLoc}%20맛집" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333; font-size: 14px;">맛집</a>
        </div>
      </div>
    `;

    card.onclick = () => openDetail(trip.id);
    tripList.appendChild(card);
  });
}
</script>

<%@ include file="../footer.jsp"%>