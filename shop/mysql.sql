-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `accounting_transactions`;
CREATE TABLE `accounting_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `invoice_id` bigint(20) unsigned DEFAULT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `increase` int(10) unsigned DEFAULT NULL,
  `decrease` int(10) unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `accounting_transactions_user_id_foreign` (`user_id`),
  KEY `accounting_transactions_invoice_id_foreign` (`invoice_id`),
  KEY `accounting_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `accounting_transactions_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `accounting_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `accounting_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `reply_to_id` bigint(20) unsigned DEFAULT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `author_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_product_id_foreign` (`product_id`),
  KEY `comments_reply_to_id_foreign` (`reply_to_id`),
  KEY `comments_author_id_foreign` (`author_id`),
  CONSTRAINT `comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `comments_reply_to_id_foreign` FOREIGN KEY (`reply_to_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issuer_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `used_count` int(10) unsigned NOT NULL DEFAULT 0,
  `amount` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `discounts_code_unique` (`code`),
  KEY `discounts_issuer_id_foreign` (`issuer_id`),
  KEY `discounts_user_id_foreign` (`user_id`),
  CONSTRAINT `discounts_issuer_id_foreign` FOREIGN KEY (`issuer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_path_unique` (`path`),
  KEY `files_user_id_foreign` (`user_id`),
  KEY `files_product_id_foreign` (`product_id`),
  CONSTRAINT `files_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issuer_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `tracking_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoices_tracking_code_unique` (`tracking_code`),
  UNIQUE KEY `invoices_slug_unique` (`slug`),
  KEY `invoices_issuer_id_foreign` (`issuer_id`),
  KEY `invoices_user_id_foreign` (`user_id`),
  CONSTRAINT `invoices_issuer_id_foreign` FOREIGN KEY (`issuer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `invoices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `tracking_code` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_count` int(10) unsigned NOT NULL DEFAULT 0,
  `item_price` int(10) unsigned NOT NULL DEFAULT 0,
  `delivery_cost` int(10) unsigned NOT NULL DEFAULT 0,
  `value_added_tax` int(10) unsigned NOT NULL DEFAULT 0,
  `discount` int(10) unsigned NOT NULL DEFAULT 0,
  `total_price` int(10) unsigned NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 1,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_tracking_code_unique` (`tracking_code`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `total_price` int(10) unsigned NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `state` enum('waiting','paying','paid','sent','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_status_order_id_foreign` (`order_id`),
  KEY `order_status_user_id_foreign` (`user_id`),
  CONSTRAINT `order_status_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_mobile_index` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `payment_transactiobs`;
CREATE TABLE `payment_transactiobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `invoice_id` bigint(20) unsigned NOT NULL,
  `payment_method` enum('card','account','ach','ipg','ussd','credit','cash') COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int(10) unsigned NOT NULL,
  `status` enum('pending','success','failed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_number` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `payment_transactiobs_user_id_foreign` (`user_id`),
  KEY `payment_transactiobs_invoice_id_foreign` (`invoice_id`),
  CONSTRAINT `payment_transactiobs_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `payment_transactiobs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `thumbnail_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL DEFAULT 0,
  `priority` int(10) unsigned NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_thumbnail_id_foreign` (`thumbnail_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_thumbnail_id_foreign` FOREIGN KEY (`thumbnail_id`) REFERENCES `files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `issuer_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `tracking_code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `refunds_tracking_code_unique` (`tracking_code`),
  UNIQUE KEY `refunds_slug_unique` (`slug`),
  KEY `refunds_issuer_id_foreign` (`issuer_id`),
  KEY `refunds_user_id_foreign` (`user_id`),
  CONSTRAINT `refunds_issuer_id_foreign` FOREIGN KEY (`issuer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `refunds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `avatar_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `balance` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`),
  KEY `users_avatar_id_foreign` (`avatar_id`),
  CONSTRAINT `users_avatar_id_foreign` FOREIGN KEY (`avatar_id`) REFERENCES `files` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2020-09-05 04:59:03
