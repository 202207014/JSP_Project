CREATE TABLE trip_schedule (
    id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT NOT NULL,                         -- 해당 일정이 속한 여행의 ID
    schedule_date DATE NOT NULL,
    schedule_time TIME NOT NULL,
    place VARCHAR(200) NOT NULL,
    memo TEXT,
    FOREIGN KEY (trip_id) REFERENCES mytrip(id) 
        ON DELETE CASCADE,

    UNIQUE KEY uk_trip_schedule (trip_id, schedule_date, schedule_time)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_general_ci;




