-- Drop existing database and create a new one
DROP DATABASE IF EXISTS creativehub;
CREATE DATABASE creativehub;
USE creativehub;

-- Users table
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username_unique` (`username`),
  UNIQUE KEY `user_email_unique` (`email`)
 );

-- Images table
-- CREATE TABLE `images` (
--   `id` INT unsigned PRIMARY KEY AUTO_INCREMENT,
--   `location` VARCHAR(255)
-- );

-- create assset product
-- create table `product_asset` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,	
--   `location` varchar(255) -- need to be secured
--  );


-- User details table
CREATE TABLE `user_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` INT unsigned NOT NULL,
  `bio` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` text null,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_details_user_id_unique` (`user_id`),
  CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
 );

-- User roles table
-- CREATE TABLE `user_roles` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,
--   `role` VARCHAR(255),
--   `user_id` INT,
--   FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
--   constraint `user_roles_unique` UNIQUE(`role`, `user_id`)
-- );

-- Payment account table
-- CREATE TABLE `payment_account` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,
--   `user_id` INT,
--   `bank_name` VARCHAR(255),
--   `bank_number` INT UNIQUE,
--   FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
-- );


-- Categories table
CREATE TABLE `categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) unique
);

-- Products table
CREATE TABLE `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `image_product_url` text,
  `seller_id` INT unsigned,
  `description` text,
  `asset_product_url` text null,
  `price` INT,
  `category_id` INT,
  FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

-- Reviews table
CREATE TABLE `reviews` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `star` INT,
  `comment` TEXT,
  `user_id` INT unsigned,
  `product_id` INT,
  `created_at` TIMESTAMP default CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  constraint `unique_user_reviews` UNIQUE(`user_id`, `product_id`)
);

-- Charts table
CREATE TABLE `carts` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT unsigned,
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

-- Chart products junction table
CREATE TABLE `cart_products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `cart_id` INT,
  `product_id` INT,
  FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  constraint `unique_chart_products` UNIQUE(`cart_id`, `product_id`)
);

-- Wishlist table
-- CREATE TABLE `wishlist` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,
--   `user_id` INT,
--   FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
-- );

-- Wishlist products junction table
-- CREATE TABLE `wishlist_products` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,
--   `wishlist_id` INT,
--   `product_id` INT,
--   FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`),
--   FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
--   constraint `unique_wishlist_products` UNIQUE(`wishlist_id`, `product_id`)
-- );

-- Transaction table
CREATE TABLE `transactions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT,
  `user_id` INT unsigned,
--   `total` INT,
  `created_at` TIMESTAMP,
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
);

-- Table Payment Method
create table `payment_method` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` varchar(100)
);

-- Table Payment
create table `payment` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`payment_method_id` INT,
	`name` varchar(100),
	`number` varchar(50),
	`payment_proof_img` text,
	`transaction_id` INT,
	`status` varchar(50),
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    foreign key (`payment_method_id`) references `payment_method` (`id`),
	foreign key (`transaction_id`) references `transactions` (`id`)
);



-- list purchases item of buyer
-- create table `purchases` (
--   `id` INT PRIMARY KEY AUTO_INCREMENT,	
--   `transaction_id` INT,
--   `review_id` INT,
--   foreign key (`transaction_id`) references `transactions` (`id`),
--   foreign key (`review_id`) references `reviews` (`id`)
-- );
