-- Drop existing database and create a new one
DROP DATABASE IF EXISTS creativehub;
CREATE DATABASE creativehub;
USE creativehub;

-- Users table
CREATE TABLE `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(255) UNIQUE,
  `created_at` TIMESTAMP
);

-- Images table
CREATE TABLE `images` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `location` VARCHAR(255)
);

-- create assset product
create table `product_asset` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,	
  `location` varchar(255) -- need to be secured
 );


-- User details table
CREATE TABLE `user_details` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `email` VARCHAR(255) UNIQUE,
  `password` VARCHAR(255),
  `name` VARCHAR(255),
  `bio` TEXT,
  `title` VARCHAR(255),
  `image_id` INT,
  `updated_at` TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
);

-- User roles table
CREATE TABLE `user_roles` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `role` VARCHAR(255),
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  constraint `user_roles_unique` UNIQUE(`role`, `user_id`)
);

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
  `title` VARCHAR(255),
  `image_id` INT,
  `seller_id` INT,
  `description` VARCHAR(255),
  `asset_id` INT,
  `price` INT,
  `category_id` INT,
  FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`asset_id`) REFERENCES `product_asset` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

-- Reviews table
CREATE TABLE `reviews` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `star` INT,
  `comment` TEXT,
  `user_id` INT,
  `product_id` INT,
  `created_at` TIMESTAMP default CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  constraint `unique_user_reviews` UNIQUE(`user_id`, `product_id`)
);

-- Charts table
CREATE TABLE `charts` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Chart products junction table
CREATE TABLE `chart_products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `chart_id` INT,
  `product_id` INT,
  FOREIGN KEY (`chart_id`) REFERENCES `charts` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  constraint `unique_chart_products` UNIQUE(`chart_id`, `product_id`)
);

-- Wishlist table
CREATE TABLE `wishlist` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Wishlist products junction table
CREATE TABLE `wishlist_products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `wishlist_id` INT,
  `product_id` INT,
  FOREIGN KEY (`wishlist_id`) REFERENCES `wishlist` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  constraint `unique_wishlist_products` UNIQUE(`wishlist_id`, `product_id`)
);

-- Transaction table
CREATE TABLE `transactions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT,
  `user_id` INT,
--   `total` INT,
  `created_at` TIMESTAMP,
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Table Payment
create table `payment` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`bank_name` varchar(100),
	`account_name` varchar(100),
	`account_number` varchar(50),
	`image_id` INT,
	`transaction_id` INT,
	`status` varchar(50),
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	foreign key (`image_id`) references `images` (`id`),
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
