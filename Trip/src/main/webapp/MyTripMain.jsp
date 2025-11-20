<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="../header.jsp"%>

<main class="container"
	style="max-width: 1000px; margin: 50px auto; font-family: sans-serif;">
	<!--로그인 확인 (추가 내용)-->
	<%
	request.setCharacterEncoding("UTF-8");
	String userId = (String) session.getAttribute("userid"); // 세션 ID 받아오기
	if (userId == null) { //세션 ID X
		out.println("<script>alert('로그인이 필요합니다.'); location.href='login.jsp';</script>");
		return;
	}
	%>
	<!--로그인 확인 (추가 내용) 끝-->
	<h1 style="margin-bottom: 30px; font-size: 28px;">나의 여행</h1>

	<div style="margin-bottom: 30px;">
		<button onclick="showAddTripModal()"
			style="background-color: #444; color: white; border: none; padding: 10px 20px; border-radius: 6px; cursor: pointer;">
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
	style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4); justify-content: center; align-items: center;">
	<div
		style="background: white; padding: 30px; border-radius: 10px; width: 400px;">
		<h2>새 여행 추가</h2>
		<form id="addTripForm" onsubmit="addTrip(event)">
			<label>여행 이름:<br> <input type="text" id="tripName"
				required style="width: 100%; padding: 8px; margin-top: 5px;">
			</label><br>
			<br> <label>여행지:<br> <input type="text"
				id="tripLocation" required
				style="width: 100%; padding: 8px; margin-top: 5px;">
			</label><br>
			<br> <label>이미지 업로드:<br> <input type="file"
				id="tripImage" accept="image/*" onchange="previewImage(event)">
			</label><br>
			<br> <img id="preview" src="" alt="미리보기"
				style="width: 100%; display: none; border-radius: 6px; margin-bottom: 10px;">

			<button type="submit"
				style="background-color: #444; color: white; border: none; padding: 10px; border-radius: 6px; width: 100%;">추가</button>
			<button type="button" onclick="closeModal()"
				style="margin-top: 10px; background-color: #ccc; border: none; padding: 8px; border-radius: 6px; width: 100%;">취소</button>
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

				// favorites + places 테이블을 join 하여 최근 3개항목 검색
				String sql = "SELECT f.place_id, p.place_name, p.place_img " + "FROM favorites f "
				+ "JOIN places p ON f.place_id = p.place_id " + "WHERE f.user_id = ? " + "ORDER BY f.created_at DESC "
				+ "LIMIT 3";
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
/* 데이터 (localStorage 사용) */
let trips = JSON.parse(localStorage.getItem("myTrips") || "[]");

/* 초기 렌더 */
window.onload = function() { renderTrips(); };

/* 모달 열기/닫기 */
function showAddTripModal() {
  document.getElementById('addTripModal').style.display = 'flex';
}
function closeModal() {
  document.getElementById('addTripModal').style.display = 'none';
  document.getElementById('addTripForm').reset();
  document.getElementById('preview').style.display = 'none';
}

/* 이미지 미리보기 */
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

/* 여행 추가 */
function addTrip(event) {
  event.preventDefault();
  const name = document.getElementById('tripName').value.trim();
  const location = document.getElementById('tripLocation').value.trim();
  const previewImg = document.getElementById('preview').src;
  const image = (previewImg && previewImg.indexOf('data:')===0) ? previewImg : '../img/sample_trip.jpg';
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

/* localStorage 저장 */
function saveTrips() {
  localStorage.setItem("myTrips", JSON.stringify(trips));
}

/* 삭제 (아이디로 바로 삭제) */
function deleteTripById(id) {
  if (confirm("정말 이 여행을 삭제하시겠어요?")) {
    trips = trips.filter(trip => trip.id !== id);
    saveTrips();
    renderTrips();
  }
}

/* 완료 토글 */
function toggleCompleteById(id) {
  trips = trips.map(trip => trip.id === id ? Object.assign({}, trip, { done: !trip.done }) : trip);
  saveTrips();
  renderTrips();
}

/* 카드 상세 이동 */
function openDetail(tripId) {
  localStorage.setItem("selectedTripId", tripId);
  window.location.href = "TripDetail.jsp";
}

/* 문서 클릭 시 모든 메뉴 닫기 (안전) */
document.addEventListener('click', function() {
  closeAllMenusExcept(null);
});
function closeAllMenusExcept(exceptId) {
  const menus = document.querySelectorAll('[data-menu-id]');
  menus.forEach(m => {
    if (!exceptId || m.id !== exceptId) m.style.display = 'none';
  });
}

/* 렌더링 */
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

    card.innerHTML = `
        <div style="position:absolute; top:10px; right:10px; display:flex; gap:8px; z-index:200;">
          <button class="btn-immediate-delete" title="삭제" style="background:#ff5252; color:white; border:none; width:34px; height:34px; border-radius:6px; cursor:pointer; display:flex; align-items:center; justify-content:center;">
            🗑
          </button>
          <button class="btn-menu" title="메뉴" style="background:none; border:none; font-size:20px; cursor:pointer;">⋯</button>
        </div>

        <img src="\${trip.image}" alt="여행 이미지" style="width:100%; height:180px; object-fit:cover; opacity:\${trip.done ? 0.6 : 1};">
        <div style="padding:15px;">
          <h3 style="margin:0; font-size:20px;">\${escapeHtml(trip.name)}</h3>
          <p style="color:#666; font-size:14px;">\${escapeHtml(trip.location)}</p>
          <div style="margin-top:10px; display:flex; gap:8px; flex-wrap:wrap;">
            <a href="https://map.naver.com/p/search/${encodedLoc}%20숙박" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">숙박</a>
            <a href="https://map.naver.com/p/search/${encodedLoc}%20즐길거리" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">즐길거리</a>
            <a href="https://map.naver.com/p/search/${encodedLoc}%20맛집" target="_blank" style="padding:6px 10px; border-radius:5px; border:1px solid #aaa; text-decoration:none; color:#333;">맛집</a>
          </div>
        </div>
      `;

    /* 카드 클릭 -> 상세페이지 (card 전체 클릭) */
    card.addEventListener('click', function() {
      openDetail(trip.id);
    });

    /* 즉시 삭제 버튼: 클릭 시 카드 이동(상세) 전파 차단하고 바로 삭제 */
    const delBtn = card.querySelector('.btn-immediate-delete');
    delBtn.addEventListener('click', function(e) {
      e.stopPropagation(); // 카드 클릭 막음
      deleteTripById(trip.id);
    });

    /* (선택) 메뉴 버튼 동작: 열고 닫기 (메뉴 구현을 원치 않으면 제거 가능) */
    const menuBtn = card.querySelector('.btn-menu');
    menuBtn.addEventListener('click', function(e) {
      e.stopPropagation();
      // 간단한 예: 메뉴 대신 토스트로 옵션 제공
      const choice = prompt("동작 선택: 1=완료 토글, 2=공유, 3=초대 (숫자 입력)");
      if (choice === '1') { toggleCompleteById(trip.id); }
      else if (choice === '2') { alert('공유 기능 준비중'); }
      else if (choice === '3') { alert('초대 기능 준비중'); }
    });

    tripList.appendChild(card);
  });
}

/* 간단한 XSS 방지(사용자가 입력한 텍스트를 안전하게 보여주기 위해) */
function escapeHtml(text) {
  if (!text) return '';
  return text.replace(/[&<>"']/g, function(m) {
    return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[m];
  });
}
function toggleCardMenu(id) {
	  const menu = document.getElementById("expand-" + id);
	  if (!menu) return;
	  menu.style.display = (menu.style.display === "none" || menu.style.display === "") 
	    ? "block" 
	    : "none";
	}

</script>

<%@ include file="../footer.jsp"%>
