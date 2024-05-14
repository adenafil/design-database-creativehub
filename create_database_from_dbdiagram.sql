drop database creativehub;

create database creativehub;

use creativehub;

CREATE TABLE `users` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) UNIQUE,
  `created_at` timestamp
);

CREATE TABLE `user_details` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer,
  `email` varchar(255) UNIQUE,
  `password` varchar(255),
  `name` varchar(255),
  `bio` text,
  `title_id` integer,
  `image_id` integer,
  `updated_at` timestamp
);

CREATE TABLE `titles` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255)
);

CREATE TABLE `user_roles` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `role` varchar(255),
  `user_id` integer
);

CREATE TABLE `payment_account` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `user_id` integer,
  `bank_name` varchar(255),
  `bank_number` int UNIQUE
);

CREATE TABLE `Categories` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `Product` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `image_id` integer,
  `seller_id` integer,
  `description` varchar(255),
  `price` integer,
  `category_id` integer
);

CREATE TABLE `reviews` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `star` integer,
  `comment` text,
  `user_id` integer,
  `product_id` integer,
  `created_at` timestamp
);

CREATE TABLE `charts` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `products_id` integer UNIQUE COMMENT 'Unique',
  `user_id` integer
);

CREATE TABLE `whistlist` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `products_id` integer UNIQUE COMMENT 'Unique',
  `user_id` integer
);

CREATE TABLE `transaction` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `product_id` integer,
  `user_id` integer,
  `total` integer,
  `created_at` timestamp
);

CREATE TABLE `images` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `location` varchar(255)
);

ALTER TABLE `user_details` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_details` ADD FOREIGN KEY (`title_id`) REFERENCES `titles` (`id`);

ALTER TABLE `user_details` ADD FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

ALTER TABLE `user_roles` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `payment_account` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`category_id`) REFERENCES `Categories` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`id`) REFERENCES `charts` (`products_id`);

ALTER TABLE `charts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `Product` ADD FOREIGN KEY (`id`) REFERENCES `whistlist` (`products_id`);

ALTER TABLE `whistlist` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`);

ALTER TABLE `transaction` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
