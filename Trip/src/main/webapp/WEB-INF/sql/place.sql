CREATE TABLE `places` (
  `place_id` VARCHAR(50) NOT NULL,
  `place_name` VARCHAR(100) NOT NULL,
  `place_address` VARCHAR(255),
  `place_type` VARCHAR(45),
  `place_img` VARCHAR(255),
  PRIMARY KEY (`place_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO places (place_id, place_name, place_address, place_type, place_img) VALUES  
/* 강릉 명소 */
('gangneung_place_1', '경포해변', '강원특별자치도 강릉시 창해로 514', '명소', 'img/gangneung/place/gyeongpo.jpg'),
('gangneung_place_2', '정동진', '강원특별자치도 강릉시 강동면 정동진리', '명소', 'img/gangneung/place/jeongdongjin.jpg'),
('gangneung_place_3', '안목해변 커피거리', '강원특별자치도 강릉시 창해로14번길 20-1', '명소', 'img/gangneung/place/anmok.jpg'),
('gangneung_place_4', '오죽헌', '강원특별자치도 강릉시 율곡로3139번길 24', '명소', 'img/gangneung/place/ojukheon.jpg'),
('gangneung_place_5', '하슬라 아트월드', '강원특별자치도 강릉시 강동면 율곡로 1441', '명소', 'img/gangneung/place/haslla.jpg'),
('gangneung_place_6', '강릉 중앙시장', '강원특별자치도 강릉시 금성로 21', '시장', 'img/gangneung/place/market.jpg'),
('gangneung_place_7', '주문진 수산시장', '강원특별자치도 강릉시 주문진읍 시장길 38', '시장', 'img/gangneung/place/jumunjin.jpg'),
('gangneung_place_8', '선교장', '강원특별자치도 강릉시 운정길 63', '명소', 'img/gangneung/place/seongyojang.jpg'),
('gangneung_place_9', '강문해변', '강원특별자치도 강릉시 강문동 182-1', '명소', 'img/gangneung/place/gangmun.jpg'),

/* 강릉 숙박 */
('gangneung_stay_1', '스카이베이 호텔 경포', '강원특별자치도 강릉시 해안로 476', '호텔', 'img/gangneung/stay/skybay.jpg'),
('gangneung_stay_2', '세인트존스 호텔', '강원특별자치도 강릉시 창해로 307', '호텔', 'img/gangneung/stay/stjohns.jpg'),
('gangneung_stay_3', '씨마크 호텔', '강원특별자치도 강릉시 해안로406번길 2', '호텔', 'img/gangneung/stay/seamarq.jpg'),
('gangneung_stay_4', '정동진 썬크루즈', '강원특별자치도 강릉시 강동면 헌화로 950-39', '호텔', 'img/gangneung/stay/suncruise.jpg'),
('gangneung_stay_5', '탑스텐 호텔', '강원특별자치도 강릉시 옥계면 헌화로 455-34', '호텔', 'img/gangneung/stay/topsten.jpg'),
('gangneung_stay_6', '라카이 샌드파인', '강원특별자치도 강릉시 해안로 536', '리조트', 'img/gangneung/stay/lakai.jpg'),

/* 강릉 음식 */
('gangneung_food_1', '동화가든', '강원특별자치도 강릉시 초당순두부길77번길 15', '음식', 'img/gangneung/food/donghwa.jpg'),
('gangneung_food_2', '엄지네 포장마차', '강원특별자치도 강릉시 경강로2255번길 21', '음식', 'img/gangneung/food/eomji.jpg'),
('gangneung_food_3', '강릉 커피콩빵', '강원특별자치도 강릉시 사천면 진리해변길 71', '음식', 'img/gangneung/food/coffeebean.jpg'),
('gangneung_food_4', '순두부 젤라또 1호점', '강원특별자치도 강릉시 초당순두부길 95-5', '음식', 'img/gangneung/food/gelato.jpg'),
('gangneung_food_5', '강릉 짬뽕순두부', '강원특별자치도 강릉시 초당순두부길 116', '음식', 'img/gangneung/food/jjamppong.jpg'),
('gangneung_food_6', '테라로사 커피공장', '강원특별자치도 강릉시 구정면 현천길 7', '음식', 'img/gangneung/food/terarosa.jpg');


INSERT INTO places (place_id, place_name, place_address, place_type, place_img) VALUES
/* 부산 명소 */
('busan_place_1', '해운대 해수욕장', '부산 해운대구 우동', '해수욕장', 'img/busan/place/haewundae.jpg'),
('busan_place_2', '광안리 해수욕장', '부산 수영구 광안해변로 255', '해수욕장', 'img/busan/place/gwangalli-beach.jpg'),
('busan_place_3', '송도 해수욕장', '부산 서구 암남동', '해수욕장', 'img/busan/place/songdo.jpg'),
('busan_place_4', '자갈치 시장', '부산 중구 자갈치해안로 52', '시장', 'img/busan/place/jagalchi.jpg'),
('busan_place_5', '국제 시장', '부산 중구 국제시장2길 25', '시장', 'img/busan/place/gukjae.jpg'),
('busan_place_6', '기장 시장', '부산 기장군 기장읍 읍내로104번길 16', '시장', 'img/busan/place/gijang.jpg'),
('busan_place_7', '송도 케이블카', '부산 서구 송도해변로 171', '체험관광지', 'img/busan/place/cablecar.jpg'),
('busan_place_8', '허심청 스파', '부산 동래구 온천장로107번길 32', '체험관광지', 'img/busan/place/spa.jpg'),
('busan_place_9', 'SEA LIFE 아쿠아리움', '부산 해운대구 해운대해변로 266', '체험관광지', 'img/busan/place/sealife.jpg'),

/* 부산 숙박 */
('busan_stay_1', '그랜드 조선 부산', '부산 해운대구 해운대해변로 30', '호텔', 'img/busan/stay/grandjosun.jpg'),
('busan_stay_2', '파크 하얏트 부산', '부산 해운대구 마린시티1로 51', '호텔', 'img/busan/stay/parkhbusan.jpg'),
('busan_stay_3', '신라스테이 부산 해운대', '부산 해운대구 해운대해변로 291', '호텔', 'img/busan/stay/shillastay.jpg'),
('busan_stay_4', '카이브 부산 송정 1호점', '부산 해운대구 송정광어골로 42', '펜션', 'img/busan/stay/kaiv.jpg'),
('busan_stay_5', '메르벨르펜션', '부산 기장군 일광읍 일광로 500-19', '펜션', 'img/busan/stay/mrbel.jpg'),
('busan_stay_6', '모네의 여름', '부산 기장군 일광읍 문오성길 10', '펜션', 'img/busan/stay/mone.jpg'),

/* 부산 음식 */
('busan_food_1', '해운대 횟집 미포점', '부산 해운대구 달맞이길62번길 34', '음식', 'img/busan/food/fish.jpg'),
('busan_food_2', '디에이블 광안점', '부산 수영구 민락수변로 7', '음식', 'img/busan/food/theable.jpg'),
('busan_food_3', '조개 공장 서면점', '부산 부산진구 중앙대로691번가길 15', '음식', 'img/busan/food/jogae.jpg'),
('busan_food_4', '모모스커피 마린시티점', '부산 해운대구 마린시티3로 1 마린시티1차상가 101호', '음식', 'img/busan/food/momos.jpg'),
('busan_food_5', '카페잇샌드', '부산 해운대구 좌동순환로 473', '음식', 'img/busan/food/cafeitsand.jpg'),
('busan_food_6', '도시농가코페도코', '부산 수영구 수영로572번길 38', '음식', 'img/busan/food/doko.jpg');



-- 서울 데이터
INSERT INTO places (place_id, place_name, place_address, place_type, place_img) VALUES
/* 서울 명소 */
('seoul_place_1', '경복궁', '서울 종로구 사직로 161', '명소', 'img/seoul/place/gyeongbokgung.jpg'),
('seoul_place_2', '북촌 한옥마을', '서울 종로구 계동길 37', '명소', 'img/seoul/place/bukchon.jpg'),
('seoul_place_3', '창덕궁', '서울 종로구 율곡로 99', '명소', 'img/seoul/place/changdeokgung.jpg'),
('seoul_place_4', '롯데월드', '서울 송파구 올림픽로 240', '명소', 'img/seoul/place/lotteworld.jpg'),
('seoul_place_5', 'N서울타워', '서울 용산구 남산공원길 105', '명소', 'img/seoul/place/nseoultower.jpg'),
('seoul_place_6', '스타필드 코엑스몰', '서울 강남구 영동대로 513', '명소', 'img/seoul/place/coex.jpg'),
('seoul_place_7', '서울숲', '서울 성동구 뚝섬로 273', '명소', 'img/seoul/place/seoulforest.jpg'),
('seoul_place_8', '동대문디자인플라자', '서울 중구 을지로 281', '명소', 'img/seoul/place/ddp.jpg'),
('seoul_place_9', '광장시장', '서울 종로구 창경궁로 88', '명소', 'img/seoul/place/gwangjang.jpg'),

/* 서울 숙박 */
('seoul_stay_1', '롯데 호텔 월드', '서울 송파구 올림픽로 240', '숙박', 'img/seoul/stay/lotteworldhotel.jpg'),
('seoul_stay_2', '시그니엘 서울', '서울 송파구 올림픽로 300', '숙박', 'img/seoul/stay/signoneseoul.jpg'),
('seoul_stay_3', '그랜드 하얏트 서울', '서울 용산구 소월로 322', '숙박', 'img/seoul/stay/grandhyatt.jpg'),
('seoul_stay_4', '서울신라호텔', '서울 중구 동호로 249', '숙박', 'img/seoul/stay/shilla.jpg'),
('seoul_stay_5', '글래드 여의도', '서울 영등포구 의사당대로 16', '숙박', 'img/seoul/stay/glad.jpg'),
('seoul_stay_6', '그랜드 워커힐 서울', '서울 광진구 워커힐로 177', '숙박', 'img/seoul/stay/grandwalkerhill.jpg'),

/* 서울 음식 */
('seoul_food_1', '래빗캐슬 잠실', '서울 송파구 백제고분로7길 42', '음식', 'img/seoul/food/rabbitcastle.jpg'),
('seoul_food_2', '해방촌 브런치 헤미안', '서울 용산구 신흥로20길 29', '음식', 'img/seoul/food/haebangchon.jpg'),
('seoul_food_3', '모도우 광화문점', '서울 종로구 종로3길 17', '음식', 'img/seoul/food/modow.jpg'),
('seoul_food_4', '밍글스', '서울 강남구 선릉로158길 15', '음식', 'img/seoul/food/mingles.jpg'),
('seoul_food_5', '권숙수', '서울 강남구 압구정로80길 25', '음식', 'img/seoul/food/kwonsooksoo.jpg'),
('seoul_food_6', '레스토랑 알렌', '서울 성동구 성수이로 94', '음식', 'img/seoul/food/allen.jpg');

-- 제주 데이터
INSERT INTO places (place_id, place_name, place_address, place_type, place_img) VALUES
/* 제주 명소 */
('jeju_place_1', '성산 일출봉', '제주 서귀포시 성산읍 일출로 284-12', '명소', 'img/jeju/place/ilchulbong.jpg'),
('jeju_place_2', '한라산 국립공원', '제주 제주시 1100로 2070-61', '명소', 'img/jeju/place/hallasan.jpg'),
('jeju_place_3', '대포해안 주상절리대', '제주 서귀포시 이어도로 36-30', '명소', 'img/jeju/place/jusangjeolli.jpg'),
('jeju_place_4', '한담해안 산책로', '제주 제주시 애월읍 곽지리 1383-1', '산책로', 'img/jeju/place/handam.jpg'),
('jeju_place_5', '신창 풍차해안도로', '제주 제주시 한경면 해안도로 541', '산책로', 'img/jeju/place/sinchang.jpg'),
('jeju_place_6', '별도봉 산책로', '제주 제주시 건입동 700-1', '산책로', 'img/jeju/place/buldobong.jpg'),
('jeju_place_7', '에코랜드 테마파크', '제주 제주시 번영로 1278-169', '테마파크', 'img/jeju/place/ecoland.jpg'),
('jeju_place_8', '제주김녕미로공원', '제주 제주시 구좌읍 김녕로 지하 130', '테마파크', 'img/jeju/place/gimnyeong.jpg'),
('jeju_place_9', '더마파크', '제주 제주시 한림읍 월림7길 155', '테마파크', 'img/jeju/place/dermapark.jpg'),

/* 제주 숙박 */
('jeju_stay_1', '제주 신라 호텔', '제주 서귀포시 중문관광로72번길 75', '숙박', 'img/jeju/stay/shillajeju.jpg'),
('jeju_stay_2', '그랜드 조선 제주', '제주 서귀포시 중문관광로72번길 60', '숙박', 'img/jeju/stay/grandjosun.jpg'),
('jeju_stay_3', '롯데 호텔 제주', '제주 서귀포시 중문관광로72번길 35', '숙박', 'img/jeju/stay/lottehotel.jpg'),
('jeju_stay_4', '제이앤클로이', '제주 제주시 구좌읍 해맞이해안로 1646-17', '숙박', 'img/jeju/stay/jcloye.jpg'),
('jeju_stay_5', '홍스랜드', '제주 제주시 조천읍 신북로 321', '숙박', 'img/jeju/stay/hongsland.jpg'),
('jeju_stay_6', '더비비스 제주', '제주 제주시 애월읍 애월해안로 300', '숙박', 'img/jeju/stay/thebbs.jpg'),

/* 제주 음식 */
('jeju_food_1', '돌담 흑돼지', '제주 제주시 애월읍 애월로 118-5', '음식', 'img/jeju/food/doldam.jpg'),
('jeju_food_2', '갈치 바다 애월', '제주 제주시 애월읍 애월해안로 861', '음식', 'img/jeju/food/galchibada.jpg'),
('jeju_food_3', '수선화 식당', '제주 제주시 구좌읍 해맞이해안로 2372', '음식', 'img/jeju/food/susunhwa.jpg'),
('jeju_food_4', '봄날', '제주 제주시 애월읍 애월로1길 25', '음식', 'img/jeju/food/bomnal.jpg'),
('jeju_food_5', '덤불', '제주 서귀포시 성산읍 일출로 258-2', '음식', 'img/jeju/food/dumbul.jpg'),
('jeju_food_6', '델문도', '제주 제주시 조천읍 조함해안로 519-10', '음식', 'img/jeju/food/delmundo.jpg');
