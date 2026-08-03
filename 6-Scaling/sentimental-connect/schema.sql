
 CREATE TABLE `users` (
     `id` INT AUTO_INCREMENT,
     `f_name` VARCHAR(32) NOT NULL,
     `l_name` VARCHAR(32) NOT NULL,
     `username` VARCHAR(32) NOT NULL,
     `password` VARCHAR(64) NOT NULL,
     PRIMARY KEY (`id`)
   );


 CREATE TABLE `users` (
     `id` INT AUTO_INCREMENT,
     `f_name` VARCHAR(32) NOT NULL,
     `l_name` VARCHAR(32) NOT NULL,
     `username` VARCHAR(32) NOT NULL,
     `password` VARCHAR(64) NOT NULL,
     PRIMARY KEY (`id`)
   );


 CREATE TABLE `schools` (
     `id` INT AUTO_INCREMENT,
     `name`  VARCHAR(88) NOT NULL,
     `type`  ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
     `stablishment_date` YEAR NOT NULL,
     PRIMARY KEY (`id`)
   );

    CREATE TABLE `companies` (
     `id` INT AUTO_INCREMENT,
     `name` VARCHAR(64) NOT NULL,
     `industry` ENUM('Technology', 'Education', 'Business'),
     `locatoin` VARCHAR(100) NOT NULL,
     PRIMARY KEY (`id`)
   );

   CREATE TABLE `connection_with_people` (
    `f_user_id` INT NOT NULL,
    `s_user_id` INT NOT NULL,
    PRIMARY KEY (`f_user_id`, `s_user_id`),
    FOREIGN KEY (`f_user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`s_user_id`) REFERENCES `users`(`id`)
  );


 CREATE TABLE `connection_with_schools` (
     `user_id` INT NOT NULL,
     `school_id` INT NOT NULL,
     `start_date` YEAR,
     `end_date`   YEAR,
     `degree_type` VARCHAR (64) NOT NULL,
     FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
     FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`)
   );


CREATE TABLE `connection_with_companies` (
    `user_id` INT NOT NULL,
    `company_id` INT NOT NULL,
    `start_date` DATE,
    `end_date` DATE,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`)
  );
