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
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Payment account table
CREATE TABLE `payment_account` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT,
  `bank_name` VARCHAR(255),
  `bank_number` INT UNIQUE,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

-- Categories table
CREATE TABLE `categories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255)
);

-- Products table
CREATE TABLE `products` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(255),
  `image_id` INT,
  `seller_id` INT,
  `description` VARCHAR(255),
  `price` INT,
  `category_id` INT,
  FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

-- Reviews table
CREATE TABLE `reviews` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `star` INT,
  `comment` TEXT,
  `user_id` INT,
  `product_id` INT,
  `created_at` TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
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
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
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
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);

-- Transaction table
CREATE TABLE `transactions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT,
  `user_id` INT,
  `total` INT,
  `created_at` TIMESTAMP,
  FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);
