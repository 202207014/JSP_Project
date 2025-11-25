CREATE TABLE community (
    num INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 글 번호 (자동 증가)
    id VARCHAR(100) NOT NULL,                    -- 작성자 ID
    subject VARCHAR(255) NOT NULL,               -- 글 제목 (NOT NULL 유지)
    content TEXT NOT NULL,                       -- 글 내용
    area VARCHAR(50),                            -- 지역/카테고리 (JSP에서 전송된 'category' 값 저장)
    regist_day DATETIME NOT NULL,                -- 작성일 (NOW() 함수 사용)
    hit INT DEFAULT 0                            -- 조회수
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;