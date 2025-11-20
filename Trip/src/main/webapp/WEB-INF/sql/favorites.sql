CREATE TABLE `favorites` (
  `fav_id` INT AUTO_INCREMENT PRIMARY KEY,
  `user_id` VARCHAR(50) NOT NULL,
  `place_id` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT `fk_fav_user`
      FOREIGN KEY (`user_id`) 
      REFERENCES `members` (`id`) 
      ON DELETE CASCADE,

  CONSTRAINT `fk_fav_place`
      FOREIGN KEY (`place_id`) 
      REFERENCES `places` (`place_id`) 
      ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;