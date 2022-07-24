-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2022 at 09:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chamber2`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `color_id`, `size_id`, `quantity`, `created_at`, `updated_at`) VALUES
(4, 1, 3, 1, 1, 6, '2022-05-29 12:18:41', '2022-05-29 14:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `category_image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `added_by`, `category_image`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'Electronics', 2, '2.jpg', NULL, '2022-04-12 17:53:01', '2022-04-12 17:58:14'),
(3, 'Fashion', 2, '3.png', NULL, '2022-04-12 18:05:59', '2022-04-12 18:05:59'),
(4, 'Accessories', 2, '4.jpg', NULL, '2022-04-12 18:10:30', '2022-04-12 18:10:30'),
(5, 'Furniture', 2, '5.jpg', NULL, '2022-04-12 18:12:13', '2022-04-12 18:12:13'),
(7, 'Mobile', 2, '7.jpg', NULL, '2022-04-12 18:18:35', '2022-04-12 18:32:58'),
(8, 'Motorbike', 2, '8.jpg', NULL, '2022-04-12 18:21:52', '2022-04-12 18:21:52'),
(9, 'Sports', 2, '9.jpg', NULL, '2022-04-12 18:23:53', '2022-04-12 18:23:53'),
(10, 'Home appliances', 2, '10.jpg', NULL, '2022-04-12 18:26:28', '2022-04-12 18:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(1, 'Red', '#FF0000', '2022-05-14 14:25:27', NULL),
(2, 'Blue', '#0000FF', '2022-05-14 14:28:13', NULL),
(3, 'Green', '#00FF00', '2022-05-14 14:29:24', NULL),
(4, 'NA', '#0000000', '2022-05-15 17:28:56', NULL),
(5, 'Black', '#000', '2022-05-23 08:18:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_logins`
--

CREATE TABLE `customer_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_logins`
--

INSERT INTO `customer_logins` (`id`, `name`, `password`, `email`, `created_at`, `updated_at`) VALUES
(1, 'zuxira', '$2y$10$98JXpKo6Abts4TSKV8KIVOXF8wyuYHfhZr4fgvRqeXX6hxaYxa3xe', 'jovanuweco@mailinator.com', '2022-05-27 20:46:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `color_id`, `size_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 4, 10, '2022-05-23 08:20:03', NULL),
(2, 2, 5, 4, 15, '2022-05-23 08:21:11', NULL),
(3, 2, 1, 4, 12, '2022-05-23 08:21:43', NULL),
(4, 3, 1, 1, 6, '2022-05-23 08:23:39', NULL),
(5, 3, 2, 1, 15, '2022-05-23 08:24:01', NULL),
(6, 3, 3, 2, 15, '2022-05-23 08:24:21', NULL),
(7, 3, 1, 2, 20, '2022-05-23 08:24:45', NULL),
(8, 3, 2, 3, 20, '2022-05-23 08:25:06', NULL),
(9, 4, 1, 4, 20, '2022-05-23 08:28:43', NULL),
(10, 4, 2, 4, 20, '2022-05-23 08:28:56', NULL),
(11, 4, 5, 4, 20, '2022-05-23 08:29:10', NULL),
(12, 5, 5, 4, 20, '2022-05-23 08:31:09', NULL),
(13, 6, 5, 4, 10, '2022-05-23 08:32:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_04_02_022023_create_categories_table', 2),
(20, '2022_04_10_235649_create_subcategories_table', 3),
(21, '2022_04_21_050313_create_products_table', 3),
(22, '2022_04_24_223644_create_thumbnails_table', 3),
(23, '2022_05_14_012702_create_colors_table', 4),
(24, '2022_05_14_012750_create_sizes_table', 4),
(25, '2022_05_15_200158_create_inventories_table', 5),
(26, '2022_05_28_023231_create_customer_logins_table', 6),
(27, '2022_05_29_144234_create_carts_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `after_discount` int(11) DEFAULT NULL,
  `short_desp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_desp` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_price`, `discount`, `after_discount`, `short_desp`, `long_desp`, `sku`, `slug`, `preview`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Sony DSLR Camera', 52500, 10, 47250, 'Sony Alpha A6000 Mirrorless Digital Camera With 16-50mm lens', '<h1 itemprop=\"name\" class=\"product-name\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; padding-bottom: 10px; line-height: 28px;\">Sony Alpha A6000 DSLR Camera With 16-50mm lens</h1><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding-top: 5px; padding-bottom: 10px; line-height: 28px;\">Unlike many competitors, the α6000’s Fast Hybrid AF combines the strengths of both phase- and contrast-detection autofocus. With a class-leading 179 phase detection points (covering almost the entire image) and a high-speed contrast-detection function, the result is not only an impressive 11 fps burst mode, but also highly accurate movement tracking for both stills and video.<span style=\"color: rgb(1, 19, 45); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px;\">&nbsp;</span>4D FOCUS enables superior autofocus performance in four dimensions: wide autofocus coverage.</p><h2 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; font-weight: bold; font-size: 20px; line-height: 26px; font-family: &quot;Trebuchet MS&quot;, sans-serif;\"><font color=\"#ff0000\" style=\"background-color: rgb(239, 239, 239);\">What is the price of Sony Alpha A6000 Camera With 16-50mm lens in Bangladesh?</font></h2><h4 style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; line-height: 26px;\">The latest price of Sony Alpha A6000 Camera With 16-50mm lens in Bangladesh is 68,000৳. You can buy the Sony Alpha A6000 Camera With 16-50mm lens at best price from our website or visit any of our showrooms.</h4><h2 style=\"margin: 16px 0px; line-height: 26px;\">Key Features:</h2><ul style=\"\"><li style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\">-Model: Sony Alpha A6000</li><li style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\">-24.3-megapixel APS-C image sensor</li><li style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\">-BIONZ X image processing engine</li><li style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\">-One-touch remote and sharing</li><li style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\">-High-resolution OLED Tru-Finder</li></ul><p style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\"><br></p><p style=\"margin: 0px; padding-bottom: 10px; display: block; line-height: 20px;\"><img src=\"data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gOTAK/9sAQwADAgIDAgIDAwMDBAMDBAUIBQUEBAUKBwcGCAwKDAwLCgsLDQ4SEA0OEQ4LCxAWEBETFBUVFQwPFxgWFBgSFBUU/9sAQwEDBAQFBAUJBQUJFA0LDRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU/8AAEQgB9AH0AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A/VOiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiqmq6rZ6Hp899f3UNlZW6GSa4uJBHHGo6szHgAepoAt1S1jWbHQNOnv9SvILCxgQvLc3MojjjUd2Y8AV8peOf+Cl/wAM/CWq3dtp9hq/iWztVJk1GxSOOBtud2zzGVmAx1xg9ietfAv7ZX7V/iT42fFHWbCK6mt/CGi381npumIxEb+U7IbiRf4pGKkgn7qkAYO4kVuoH6QeMf29/hvoM72+ivd+KJ1OPMs08qDPtJJjI91BHvXnGo/t+axfOf7K8P6ZZofu/appJz/47sr8rIfF2sBh5e/9a3tI8Y+KfNAht2k9jVLfQOp+kJ/bC8f37Ax3Wm2wP8MFkOP++2arMX7WPxBj+Zr+xlHpJZLg/livjHwD4u8Vyzx/btItxag/PIZyrAew2nJpnjb4neL0lkisNIs7WAEgOZjIxHr0Aoe2wH3BbftweJtNP/Ew0zRryMdfLWSFj+O9h+ldl4Y/4KCeA7udIPEVrd+H2YhTcL/pMCn1JUB8f8ANfkprPi/xjeuxuJSoPUJwK5u41TWmJ82RyT6k0aSWmlgP6HPC3i3R/G+jW+raDqdrq2mzjMd1aSiRG9Rkdx3HUVsV+CnwK/au8c/syateanoc8V3aXkTRXGlagWa1lcqQkpUEfOhwcggkArnB4+yPD/8AwVD8XpFDJqngvRL9HUMfstxNbMQRn+LzMdaFFtDsfpHRXxHoP/BT7QrnadY8B6nYA9XtL2KcY9cMEJ/AGu/8EftfzfGu/nsvAmlaTZSRMQT4m1Jop9oGd620KOWGM/8ALQHg1K1Vxbn0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9m/4VeJXL6p8N/Cl856vNotuWP47M16PRQB4Pe/sJ/AO/Zmk+F2goW6+RE0Q/JGFZ03/AAT4/Z8mXH/CttPTnOY7m5U/pKK+iaKPID5+sv2BfgBYTGSP4Z6VISMbbh5plHykcK7kDg/nz1Ga7zw/+zp8LvCkAi0f4eeF9PQd4dHgDdAM525JwB9cV6LRRvqBBbWcNnEIoIkhjHRI1CgfgKmwKWigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD//Z\" style=\"width: 499.992px;\" data-filename=\"a6000-500x500.jpg\"><br></p><table class=\"table table-bordered\"><tbody><tr><td><span style=\"color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; background-color: rgb(250, 251, 252);\">Pixels</span><br></td><td><span style=\"color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">AF Point</span><br></td><td><span style=\"color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">Batteries</span><br></td><td><span style=\"color: rgb(102, 102, 102); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">Warranty</span><br></td></tr><tr><td><span style=\"color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 15px; background-color: rgb(250, 251, 252);\">24.3MP</span><br></td><td><span style=\"color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">179 points</span><br></td><td><span style=\"color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">NP-FW50 W-series Rechargeable Battery Pack</span><br></td><td><span style=\"color: rgb(0, 0, 0); font-family: &quot;Trebuchet MS&quot;, sans-serif; font-size: 14px; background-color: rgb(250, 251, 252);\">03 Years Service Warranty (No parts warranty)</span><br></td></tr></tbody></table>', 'Sony-E0UXz878', 'sony-dslr-camera-663266', '1.jpg', '2022-05-20 19:48:36', '2022-05-20 16:09:27');
INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_price`, `discount`, `after_discount`, `short_desp`, `long_desp`, `sku`, `slug`, `preview`, `created_at`, `updated_at`) VALUES
(2, 2, 3, 'Iphone 13 Pro max', 145000, 5, 137750, 'Versions: A2638 (International); A2483 (USA); A2636 (Canada, Japan); A2639 (China, Hong Kong); A2640 (Russia)', '<p>Previous owner of the 13 Pro Max--So heavy and clunky -- definitely a two handed phone --the weight was stupid--sent it back got the 13 Pro (Heaven)!!!! Balance is beautiful and one handed use is superb!!! Highly recommend!!! Alpine Green!!!! Spectac...<br></p>', 'Ipho-pjsLL398', 'iphone-13-pro-max-511429', '2.jpg', '2022-05-20 19:48:45', '2022-05-20 17:11:42'),
(3, 3, 1, 'Mens Tshirt Round Neck', 550, 10, 495, 'Popular comfort apparel that look stylish too', '<h2 class=\"summary-desc\" style=\"margin: 10px 0px 8px; display: -webkit-box;\">T-shirts are one such apparel that men can wear all year round. Owning different types of them - v-neck, round neck, ribbed, polo - is always helpful in breaking the monotony.</h2>', 'Mens-ZWv4H638', 'mens-tshirt-round-neck-123679', '3.jpg', '2022-05-20 19:48:51', '2022-05-20 17:17:20'),
(4, 4, 4, 'MI Smart Watch', 2230, NULL, 2230, 'Xiaomi Haylou RT2 LS10 Smart Watch', '<p><span style=\"text-align: justify;\">Xiaomi Haylou RT2 LS10 featured with Retina HD display, Heart rate monitoring, Sleep monitoring options, 12 Workout Modes, SpO2 Tracking, Considerate Care, All-Day Heart Rate Monitoring, IP68 Waterproof, and Real-time Message Reminder. This Smart watch has Customized Watch Faces with More Practical Functions</span><br></p>', 'MI S-c6dTS171', 'mi-smart-watch-263542', '4.jpg', '2022-05-20 19:48:55', '2022-05-20 17:21:53'),
(5, 10, 5, 'Otobi Sofa', 65000, 10, 58500, 'SOFA LSHAPE UPHOLSTERY FF196,197,194,195', '<p><a href=\"https://otobi.com/\" style=\"margin: 0px; border: 0px; outline-style: initial; outline-width: 0px; text-size-adjust: 100%; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: all 0.4s ease-in-out 0s;\">Otobi</a>&nbsp;/&nbsp;<a href=\"https://otobi.com/product-category/home-furniture/\" style=\"margin: 0px; border: 0px; outline-style: initial; outline-width: 0px; text-size-adjust: 100%; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: all 0.4s ease-in-out 0s;\">Home Furniture</a>&nbsp;/&nbsp;<a href=\"https://otobi.com/product-category/home-furniture/living/\" style=\"margin: 0px; border: 0px; outline-style: initial; outline-width: 0px; text-size-adjust: 100%; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: all 0.4s ease-in-out 0s;\">Living</a>&nbsp;/&nbsp;SOFA LSHAPE UPHOLSTERY FF196,197,194,195<br></p>', 'Otob-PYfCn320', 'otobi-sofa-66070', '5.jpg', '2022-05-20 19:49:01', '2022-05-20 17:28:06'),
(6, 2, 6, 'Lenovo Yogo slim 3I', 85000, 5, 80750, 'Lenovo IdeaPad Slim 3i 10th Gen Core i5 15.6\" FHD Laptop with Windows 10', '<p><span style=\"text-align: justify;\">Lenovo IP Slim Laptop is comes with Intel Core i5-1035G1&nbsp;Processor (6M Cache, 1.10 GHz up to 3.70 GHz), 8GB DDR4 SODIMM 2667MHz RAM which is upgrade able up to 16 GB, 1TB 5400rpm HDD and optional discrete graphics, you can do more with your PC and enjoy a rich entertainment experience.</span><br></p>', 'Leno-sg6kR947', 'lenovo-yogo-slim-3i-529174', '6.jpg', '2022-05-20 19:49:22', '2022-05-20 17:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size_name`, `created_at`, `updated_at`) VALUES
(1, 's', '2022-05-14 16:25:46', NULL),
(2, 'm', '2022-05-14 16:25:54', NULL),
(3, 'L', '2022-05-14 16:26:06', NULL),
(4, 'NA', '2022-05-15 17:29:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 3, 'T-shirt', NULL, NULL, '2022-05-21 07:56:58'),
(2, 2, 'Camera', NULL, NULL, '2022-05-21 07:57:09'),
(3, 2, 'Mobile', NULL, NULL, '2022-05-21 07:57:15'),
(4, 4, 'Watch', NULL, NULL, '2022-05-21 07:57:20'),
(5, 10, 'Sofa', NULL, NULL, '2022-05-21 07:57:28'),
(6, 2, 'Computer', NULL, NULL, '2022-05-21 07:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnails`
--

CREATE TABLE `thumbnails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `thumbnails` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thumbnails`
--

INSERT INTO `thumbnails` (`id`, `product_id`, `thumbnails`, `created_at`, `updated_at`) VALUES
(1, 1, '1-1.jpg', '2022-05-20 16:09:30', NULL),
(2, 1, '1-2.jpg', '2022-05-20 16:09:32', NULL),
(3, 1, '1-3.jpg', '2022-05-20 16:09:35', NULL),
(4, 1, '1-4.jpg', '2022-05-20 16:09:37', NULL),
(5, 2, '2-1.jpg', '2022-05-20 17:11:45', NULL),
(6, 2, '2-2.jpg', '2022-05-20 17:11:49', NULL),
(7, 2, '2-3.jpg', '2022-05-20 17:11:52', NULL),
(8, 2, '2-4.jpg', '2022-05-20 17:11:53', NULL),
(9, 3, '3-1.jpg', '2022-05-20 17:17:26', NULL),
(10, 3, '3-2.jpg', '2022-05-20 17:17:29', NULL),
(11, 3, '3-3.jpg', '2022-05-20 17:17:33', NULL),
(12, 3, '3-4.jpg', '2022-05-20 17:17:35', NULL),
(13, 4, '4-1.jpg', '2022-05-20 17:21:55', NULL),
(14, 4, '4-2.jpg', '2022-05-20 17:21:57', NULL),
(15, 4, '4-3.jpg', '2022-05-20 17:21:58', NULL),
(16, 4, '4-4.jpg', '2022-05-20 17:21:59', NULL),
(17, 5, '5-1.jpg', '2022-05-20 17:28:09', NULL),
(18, 5, '5-2.jpg', '2022-05-20 17:28:11', NULL),
(19, 5, '5-3.jpg', '2022-05-20 17:28:13', NULL),
(20, 5, '5-4.jpg', '2022-05-20 17:28:16', NULL),
(21, 6, '6-1.jpg', '2022-05-20 17:33:04', NULL),
(22, 6, '6-2.jpg', '2022-05-20 17:33:08', NULL),
(23, 6, '6-3.jpg', '2022-05-20 17:33:16', NULL),
(24, 6, '6-4.jpg', '2022-05-20 17:33:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Ami', 'alamsiddiki22@gmail.com', NULL, '$2y$10$OegNavkinNZqU6EHGKWsTeJjwXkhlnz27tEDSLRXqlFiXBN2gp1ai', NULL, '2022-05-16 19:27:57', '2022-05-16 19:27:57'),
(3, 'David Cochran', 'goni@mailinator.com', NULL, '$2y$10$Tm22tdoFOnnpZYOUxfKLwOjnvDAb0qYdIROvrIUQF1yKu.RATP82a', NULL, '2022-04-26 16:06:54', '2022-04-26 16:06:54'),
(4, 'Gareth Conner', 'mabymaropu@mailinator.com', NULL, '$2y$10$p36tAvvz7rabWcAU.LJYlOF4slgkjF0vb0HkVpJVGFHXn9o5tEaii', NULL, '2022-04-26 17:40:25', '2022-04-26 17:40:25'),
(5, 'Len George', 'fuzugyjava@mailinator.com', NULL, '$2y$10$VSzHz1OFgXTLSE.M1O/q3uEXsqRhXjYrU5OIpC7ZlRkV9.xwjEgHC', NULL, '2022-05-16 10:57:38', '2022-05-16 10:57:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_logins`
--
ALTER TABLE `customer_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thumbnails`
--
ALTER TABLE `thumbnails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_logins`
--
ALTER TABLE `customer_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thumbnails`
--
ALTER TABLE `thumbnails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
