CREATE TABLE mytrip (
    id INT AUTO_INCREMENT PRIMARY KEY,            -- 여행 고유 번호
    user_id VARCHAR(50) NOT NULL,                 -- 작성자(회원) 아이디 (members.id 참조)
    title VARCHAR(100) NOT NULL,                  -- 여행 제목
    location VARCHAR(200) NOT NULL,               -- 여행지 위치(도시 이름 등)
    image VARCHAR(255) DEFAULT NULL,              -- 이미지 경로
    memo TEXT DEFAULT NULL,                       -- 메모 (TripDetail.jsp에서 저장)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,  -- 생성 시각
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정 시각 자동 업데이트

    -- 외래키 설정
    CONSTRAINT fk_mytrip_user
        FOREIGN KEY (user_id) REFERENCES members(id)
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;