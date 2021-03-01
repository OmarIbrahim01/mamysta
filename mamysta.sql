-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2021 at 08:24 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mamysta`
--

-- --------------------------------------------------------

--
-- Table structure for table `ages`
--

DROP TABLE IF EXISTS `ages`;
CREATE TABLE IF NOT EXISTS `ages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Zara', 'Zara Brand', NULL, NULL),
(2, 'Nania', 'Nania Brand', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-11-14 12:06:01', '2020-11-14 12:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `region_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nasr City', NULL, NULL),
(2, 1, '5th Settlement', NULL, NULL),
(3, 2, 'Haram', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE IF NOT EXISTS `data_rows` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 2),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 5),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 6),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 7),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 10),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 13),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 14),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 11),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(58, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 9),
(61, 1, 'last_name', 'text', 'Last Name', 0, 1, 1, 1, 1, 1, '{}', 4),
(62, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE IF NOT EXISTS `data_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-11-14 12:06:00', '2020-12-05 15:42:53'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-11-14 12:06:02', '2020-11-14 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `discount_codes`
--

DROP TABLE IF EXISTS `discount_codes`;
CREATE TABLE IF NOT EXISTS `discount_codes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `discount_percentage` int(11) NOT NULL,
  `max_use_times` int(11) NOT NULL,
  `expire_in_days` int(11) NOT NULL DEFAULT '360',
  `discount_code_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount_codes`
--

INSERT INTO `discount_codes` (`id`, `code`, `discount_percentage`, `max_use_times`, `expire_in_days`, `discount_code_type_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'mamy111', 10, 100, 30, 1, NULL, 1, NULL, NULL),
(2, 'mamy222', 10, 100, 30, 1, NULL, 1, NULL, NULL),
(3, 'mamy333', 8, 1, 30, 2, NULL, 1, NULL, NULL),
(4, 'mamy444', 7, 1, 30, 2, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount_code_types`
--

DROP TABLE IF EXISTS `discount_code_types`;
CREATE TABLE IF NOT EXISTS `discount_code_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discount_code_types`
--

INSERT INTO `discount_code_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Multiple Times Use', NULL, NULL),
(2, 'One Time Use', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
CREATE TABLE IF NOT EXISTS `genders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Boy', NULL, NULL),
(2, 'Girl', NULL, NULL),
(3, 'Mom', NULL, NULL),
(4, 'Unisex', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groth_calculator_values`
--

DROP TABLE IF EXISTS `groth_calculator_values`;
CREATE TABLE IF NOT EXISTS `groth_calculator_values` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gender_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `length_from` float NOT NULL,
  `length_to` float NOT NULL,
  `weight_from` float NOT NULL,
  `weight_to` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groth_calculator_values`
--

INSERT INTO `groth_calculator_values` (`id`, `gender_id`, `age`, `length_from`, `length_to`, `weight_from`, `weight_to`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(2, 1, 2, 60, 65, 5.5, 8, NULL, NULL),
(3, 1, 3, 65, 70, 5, 8, NULL, NULL),
(4, 1, 4, 55, 64, 4.5, 7.5, NULL, NULL),
(5, 1, 5, 55, 64, 4.5, 7.5, NULL, NULL),
(6, 1, 6, 55, 64, 4.5, 7.5, NULL, NULL),
(7, 1, 7, 55, 64, 4.5, 7.5, NULL, NULL),
(8, 1, 8, 55, 64, 4.5, 7.5, NULL, NULL),
(9, 1, 9, 55, 64, 4.5, 7.5, NULL, NULL),
(10, 1, 10, 55, 64, 4.5, 7.5, NULL, NULL),
(11, 1, 11, 55, 64, 4.5, 7.5, NULL, NULL),
(12, 1, 12, 55, 64, 4.5, 7.5, NULL, NULL),
(13, 1, 13, 55, 64, 4.5, 7.5, NULL, NULL),
(14, 1, 14, 55, 64, 4.5, 7.5, NULL, NULL),
(15, 1, 15, 55, 64, 4.5, 7.5, NULL, NULL),
(16, 1, 16, 55, 64, 4.5, 7.5, NULL, NULL),
(17, 1, 17, 55, 64, 4.5, 7.5, NULL, NULL),
(18, 1, 18, 55, 64, 4.5, 7.5, NULL, NULL),
(19, 1, 19, 55, 64, 4.5, 7.5, NULL, NULL),
(20, 1, 20, 55, 64, 4.5, 7.5, NULL, NULL),
(21, 1, 21, 55, 64, 4.5, 7.5, NULL, NULL),
(22, 1, 22, 55, 64, 4.5, 7.5, NULL, NULL),
(23, 1, 23, 55, 64, 4.5, 7.5, NULL, NULL),
(24, 1, 24, 55, 64, 4.5, 7.5, NULL, NULL),
(25, 1, 25, 55, 64, 4.5, 7.5, NULL, NULL),
(26, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(27, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(28, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(29, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(30, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(31, 1, 1, 55, 64, 4.5, 7.5, NULL, NULL),
(32, 1, 36, 55, 64, 4.5, 7.5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groth_trackers`
--

DROP TABLE IF EXISTS `groth_trackers`;
CREATE TABLE IF NOT EXISTS `groth_trackers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_child_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `weight` double(8,2) NOT NULL,
  `height` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `groth_trackers`
--

INSERT INTO `groth_trackers` (`id`, `user_child_id`, `date`, `weight`, `height`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-08-26', 5.50, 10.00, NULL, NULL),
(2, 2, '2021-03-01', 3.50, 70.00, NULL, NULL),
(3, 2, '2021-03-01', 2.00, 30.00, '2021-03-01 16:15:59', '2021-03-01 16:15:59'),
(4, 1, '2021-03-01', 6.00, 20.00, '2021-03-01 16:16:29', '2021-03-01 16:16:29'),
(5, 1, '2021-02-28', 8.00, 30.00, '2021-03-01 16:19:18', '2021-03-01 16:19:18'),
(6, 2, '2021-02-28', 1.00, 50.00, '2021-03-01 16:20:21', '2021-03-01 16:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-11-14 12:06:00', '2020-11-14 12:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-11-14 12:06:00', '2020-11-14 12:06:00', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-11-14 12:06:00', '2020-11-14 12:06:00', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-11-14 12:06:01', '2020-11-14 12:06:01', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-11-14 12:06:01', '2020-11-14 12:06:01', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-11-14 12:06:02', '2020-11-14 12:06:02', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-11-14 12:06:02', '2020-11-14 12:06:02', 'voyager.hooks', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(28, '2020_11_14_142717_create_products_table', 3),
(29, '2020_11_14_142807_create_product_variants_table', 3),
(30, '2020_11_14_142825_create_product_sections_table', 3),
(31, '2020_11_14_142839_create_product_brands_table', 3),
(32, '2020_11_14_142904_create_product_sub_categories_table', 4),
(33, '2020_11_14_143116_create_vendors_table', 4),
(34, '2020_11_14_143210_create_product_sizes_table', 4),
(35, '2020_11_14_143309_create_product_colors_table', 4),
(36, '2020_11_14_143625_create_ages_table', 4),
(37, '2020_11_14_143900_create_genders_table', 4),
(38, '2020_11_14_143917_create_product_reviews_table', 4),
(39, '2020_11_15_124030_create_product_variant_stocks_table', 4),
(40, '2020_11_15_124325_create_orders_table', 4),
(41, '2020_11_15_124339_create_order_items_table', 4),
(42, '2020_11_15_124527_create_product_variant_images_table', 4),
(43, '2020_11_15_132212_create_vendor_types_table', 4),
(44, '2020_11_15_134233_create_product_statuses_table', 4),
(45, '2020_11_15_142020_create_vendor_contacts_table', 4),
(46, '2020_11_15_144041_create_vendor_field_types_table', 4),
(47, '2020_11_15_144436_create_user_addresses_table', 4),
(48, '2020_11_15_144506_create_user_phones_table', 4),
(49, '2020_11_16_002552_create_product_categories_table', 4),
(50, '2020_11_16_005912_create_product_tags_table', 4),
(51, '2020_11_16_015315_create_payment_methods_table', 4),
(52, '2020_11_16_015353_create_shipping_types_table', 4),
(53, '2020_11_23_165722_create_product_revenue_percentages_table', 5),
(54, '2020_11_23_165854_create_product_running_cost_percentages_table', 5),
(55, '2020_12_05_185442_create_user_cart_items_table', 6),
(56, '2020_12_10_104306_create_regions_table', 7),
(57, '2020_12_10_104411_create_cities_table', 7),
(58, '2020_12_13_175936_create_shipping_methods_table', 8),
(59, '2020_12_16_160842_create_discount_codes_table', 9),
(60, '2020_12_16_163124_create_discount_code_types_table', 10),
(61, '2020_12_16_163644_create_user_discount_codes_table', 11),
(62, '2020_12_21_171629_create_order_statuses_table', 12),
(63, '2020_12_21_203424_create_user_discounts_table', 13),
(64, '2021_02_06_154037_create_parenting_questions_table', 14),
(65, '2021_02_06_154235_create_parenting_answers_table', 14),
(66, '2021_02_06_154256_create_parenting_question_categories_table', 14),
(67, '2021_02_06_154311_create_parenting_question_subcategories_table', 14),
(68, '2021_02_06_154333_create_parenting_question_statuses_table', 14),
(69, '2021_02_06_155815_create_parenting_answer_types_table', 14),
(70, '2021_02_08_171023_create_parenting_answer_statuses_table', 15),
(71, '2021_02_09_170150_create_parenting_topics_table', 16),
(72, '2021_02_09_170217_create_parenting_topic_categories_table', 16),
(73, '2021_02_09_173359_create_parenting_topic_statuses_table', 17),
(74, '2021_02_24_154132_create_user_children_table', 18),
(75, '2021_02_28_160038_create_groth_calculator_values_table', 19),
(76, '2021_03_01_171903_create_groth_trackers_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `user_adress_id` int(11) NOT NULL,
  `user_phone_id` int(11) NOT NULL,
  `shipping_method_id` int(11) NOT NULL,
  `shipping_cost` float NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `payment_cost` float NOT NULL DEFAULT '0',
  `tracking_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_status_id`, `user_adress_id`, `user_phone_id`, `shipping_method_id`, `shipping_cost`, `payment_method_id`, `payment_cost`, `tracking_number`, `note`, `created_at`, `updated_at`) VALUES
(7, 1, 6, 1, 5, 2, 25, 1, 0, NULL, NULL, '2020-12-23 13:23:23', '2020-12-23 13:23:23'),
(8, 1, 5, 1, 5, 2, 25, 1, 0, NULL, NULL, '2020-12-28 14:01:53', '2020-12-28 14:01:53'),
(9, 1, 4, 1, 5, 2, 25, 1, 0, NULL, NULL, '2020-12-28 14:49:20', '2020-12-28 14:49:20'),
(10, 1, 3, 1, 5, 2, 25, 1, 0, NULL, NULL, '2020-12-28 16:08:44', '2020-12-28 16:08:44'),
(11, 1, 2, 1, 5, 2, 25, 1, 0, NULL, NULL, '2020-12-28 16:15:25', '2020-12-28 16:15:25'),
(12, 1, 1, 1, 5, 2, 25, 1, 0, NULL, NULL, '2021-01-20 21:43:59', '2021-01-20 21:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `product_variant_stock_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `running_cost_percentage` int(11) NOT NULL,
  `product_revenue_percentage` int(11) NOT NULL,
  `our_discount_percentage` int(11) NOT NULL DEFAULT '0',
  `vendor_discount_percentage` int(11) NOT NULL DEFAULT '0',
  `taxes_percentage` int(11) NOT NULL DEFAULT '14',
  `discount_code_percentage` int(11) NOT NULL DEFAULT '0',
  `user_discount_percentage` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_variant_id`, `product_variant_stock_id`, `vendor_id`, `price`, `running_cost_percentage`, `product_revenue_percentage`, `our_discount_percentage`, `vendor_discount_percentage`, `taxes_percentage`, `discount_code_percentage`, `user_discount_percentage`, `created_at`, `updated_at`) VALUES
(34, 7, 1, 1, 8, 1, 90, 3, 6, 7, 7, 14, 0, 3, '2020-12-23 13:23:23', '2020-12-23 13:23:23'),
(35, 8, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 0, '2020-12-28 14:01:53', '2020-12-28 14:01:53'),
(36, 8, 2, 9, 9, 1, 1200, 3, 3, 0, 0, 14, 0, 0, '2020-12-28 14:01:53', '2020-12-28 14:01:53'),
(37, 8, 3, 10, 10, 1, 100, 3, 12, 0, 0, 14, 0, 0, '2020-12-28 14:01:53', '2020-12-28 14:01:53'),
(38, 9, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 5, '2020-12-28 14:49:20', '2020-12-28 14:49:20'),
(39, 9, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 5, '2020-12-28 14:49:20', '2020-12-28 14:49:20'),
(40, 10, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 0, '2020-12-28 16:08:45', '2020-12-28 16:08:45'),
(41, 11, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 0, '2020-12-28 16:15:25', '2020-12-28 16:15:25'),
(42, 12, 1, 1, 1, 1, 100, 3, 15, 5, 10, 14, 0, 0, '2021-01-20 21:43:59', '2021-01-20 21:43:59'),
(43, 12, 5, 12, 15, 1, 100, 5, 13, 0, 0, 14, 0, 0, '2021-01-20 21:43:59', '2021-01-20 21:43:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `color`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Placed', '#284ec9', '', NULL, NULL),
(2, 'Under Review', '#c928c9', '', NULL, NULL),
(3, 'Fullfiling', '#e68107', '', NULL, NULL),
(4, 'Ready To Shipp', '#9fe607', '', NULL, NULL),
(5, 'Shipped', '#07e67a', '', NULL, NULL),
(6, 'Delevered', '#4ec928', '', NULL, NULL),
(100, 'Canceled', '#c92828', '', NULL, NULL),
(101, 'Returned', '#e6073b', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-11-14 12:06:02', '2020-11-14 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `parenting_answers`
--

DROP TABLE IF EXISTS `parenting_answers`;
CREATE TABLE IF NOT EXISTS `parenting_answers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parenting_question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parenting_answer_type_id` int(11) NOT NULL,
  `parenting_answer_status_id` int(11) NOT NULL,
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_answers`
--

INSERT INTO `parenting_answers` (`id`, `parenting_question_id`, `user_id`, `parenting_answer_type_id`, `parenting_answer_status_id`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(2, 6, 1, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(3, 5, 1, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(4, 5, 10, 2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(5, 6, 10, 2, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(6, 6, 1, 3, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(7, 5, 1, 3, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(8, 7, 1, 3, 2, 'bezek 7lmtk', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(9, 8, 1, 1, 2, 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\r\n', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(10, 8, 9, 2, 1, 'khvuyuyvyuv', '2021-02-12 14:03:33', '2021-02-12 14:03:33'),
(11, 8, 9, 2, 2, 'mmmmmmmmmmmmmmmmmmmmmmm', '2021-02-12 14:05:47', '2021-02-12 14:05:47'),
(12, 8, 9, 2, 2, 'aksdbhaksvdivasivdas', '2021-02-12 14:07:00', '2021-02-12 14:07:00'),
(13, 8, 9, 2, 2, 'kkkkkkkkkkkkkkkkkkkk', '2021-02-12 14:07:34', '2021-02-12 14:07:34'),
(14, 2, 1, 3, 2, '<p>gggggggggggg</p>', '2021-02-23 15:16:09', '2021-02-23 15:16:09'),
(15, 2, 1, 3, 2, '<p>gggggggggggg</p>', '2021-02-23 15:16:41', '2021-02-23 15:16:41'),
(16, 9, 1, 3, 2, '<p>ggggggggggggggggggggggg</p>', '2021-02-23 15:21:06', '2021-02-23 15:21:06'),
(17, 10, 1, 1, 2, '<p>lllllllllllllllll</p>', '2021-02-23 15:32:06', '2021-02-23 15:32:06'),
(18, 10, 1, 2, 2, 'uuuuuuuuuuuuuuuuuuuuuuuu', '2021-02-23 15:33:59', '2021-02-23 15:33:59'),
(19, 10, 1, 3, 2, '<p>ooooooooooooooooooooooooo</p>', '2021-02-23 15:34:17', '2021-02-23 15:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `parenting_answer_statuses`
--

DROP TABLE IF EXISTS `parenting_answer_statuses`;
CREATE TABLE IF NOT EXISTS `parenting_answer_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_answer_statuses`
--

INSERT INTO `parenting_answer_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Under Review', '#284ec9', NULL, NULL),
(2, 'Confirmed', '#4ec928', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_answer_types`
--

DROP TABLE IF EXISTS `parenting_answer_types`;
CREATE TABLE IF NOT EXISTS `parenting_answer_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_answer_types`
--

INSERT INTO `parenting_answer_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Requesting More Info', NULL, NULL),
(2, 'Submitting Required Info', NULL, NULL),
(3, 'Answer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_questions`
--

DROP TABLE IF EXISTS `parenting_questions`;
CREATE TABLE IF NOT EXISTS `parenting_questions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `parenting_questions_category_id` int(11) NOT NULL,
  `parenting_questions_subcategory_id` int(11) NOT NULL,
  `parenting_questions_status_id` int(11) NOT NULL,
  `user_child_id` int(11) DEFAULT NULL,
  `age` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `privet` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_questions`
--

INSERT INTO `parenting_questions` (`id`, `user_id`, `parenting_questions_category_id`, `parenting_questions_subcategory_id`, `parenting_questions_status_id`, `user_child_id`, `age`, `gender`, `question`, `privet`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 4, NULL, '1 Year', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 0, '2020-12-23 13:23:23', '2020-12-23 13:23:23'),
(2, 1, 2, 1, 4, NULL, '3', '2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 1, '2021-02-09 11:54:13', '2021-02-23 15:16:41'),
(3, 1, 2, 1, 1, NULL, '3', '2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 1, '2021-02-09 11:54:13', '2021-02-09 11:54:13'),
(4, 1, 1, 1, 1, NULL, '1 Year', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 0, '2020-12-23 13:23:23', '2020-12-23 13:23:23'),
(5, 10, 3, 1, 4, NULL, '12', '1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 1, '2021-02-09 12:45:09', '2021-02-09 12:45:09'),
(6, 10, 6, 1, 4, NULL, '2', '2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.', 0, '2021-02-09 12:45:37', '2021-02-09 12:45:37'),
(7, 10, 2, 1, 2, NULL, '123', '1', 'letjnjetbguobetwubpetwiugbetwiupgetwiputgwipeugpewi5ugpieug5piqegtpieg4pit3', 0, '2021-02-09 14:38:23', '2021-02-09 14:38:23'),
(8, 9, 4, 1, 3, NULL, '3454', '1', 'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', 0, '2021-02-09 14:48:49', '2021-02-12 14:07:34'),
(9, 1, 3, 1, 4, NULL, '2', '2', 'hhhhhhhhhhhhh', 0, '2021-02-23 15:20:38', '2021-02-23 15:21:06'),
(10, 1, 4, 1, 4, NULL, '6', '1', 'kkkkkkkkkkkkkkkkkkk', 1, '2021-02-23 15:31:46', '2021-02-23 15:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `parenting_question_categories`
--

DROP TABLE IF EXISTS `parenting_question_categories`;
CREATE TABLE IF NOT EXISTS `parenting_question_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_question_categories`
--

INSERT INTO `parenting_question_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', NULL, NULL),
(2, 'Category 2', NULL, NULL),
(3, 'Category 3', NULL, NULL),
(4, 'Category 4', NULL, NULL),
(5, 'Category 5', NULL, NULL),
(6, 'Category 6', NULL, NULL),
(7, 'Category 7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_question_statuses`
--

DROP TABLE IF EXISTS `parenting_question_statuses`;
CREATE TABLE IF NOT EXISTS `parenting_question_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_question_statuses`
--

INSERT INTO `parenting_question_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Un-Answered', '#284ec9', NULL, NULL),
(2, 'Under Review', '#c928c9', NULL, NULL),
(3, 'Awaiting More Info From User', '#9fe607', NULL, NULL),
(4, 'Answered (Closed)', '#4ec928', NULL, NULL),
(5, 'Reported', '#e6073b', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_question_subcategories`
--

DROP TABLE IF EXISTS `parenting_question_subcategories`;
CREATE TABLE IF NOT EXISTS `parenting_question_subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parenting_category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_question_subcategories`
--

INSERT INTO `parenting_question_subcategories` (`id`, `parenting_category_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', NULL, NULL),
(2, 2, 'General', NULL, NULL),
(3, 3, 'General', NULL, NULL),
(4, 4, 'General', NULL, NULL),
(5, 5, 'General', NULL, NULL),
(6, 6, 'General', NULL, NULL),
(7, 7, 'General', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_topics`
--

DROP TABLE IF EXISTS `parenting_topics`;
CREATE TABLE IF NOT EXISTS `parenting_topics` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parenting_topic_status_id` int(11) NOT NULL,
  `parenting_topic_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `topic` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_topics`
--

INSERT INTO `parenting_topics` (`id`, `parenting_topic_status_id`, `parenting_topic_category_id`, `user_id`, `title`, `topic`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Topic Main Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae ipsum sit amet libero luctus tincidunt in a libero. Nam vitae enim mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec lacus ut eros condimentum sollicitudin id ut felis. Vivamus feugiat ipsum eget dolor scelerisque, id facilisis urna facilisis. Maecenas eleifend augue quis condimentum consequat. Cras porta lacus neque.\r\n\r\nIn fermentum pretium metus, quis congue mauris bibendum vel. Sed felis tortor, posuere vitae consectetur at, commodo sit amet lacus. Morbi dignissim risus eu nibh ullamcorper, vel luctus enim porttitor. Aenean efficitur varius ultricies. Mauris mollis nisl sit amet laoreet volutpat. Proin dapibus lorem quis lacus consectetur, eu hendrerit nulla mattis. Phasellus ornare interdum hendrerit. In vel augue euismod, fringilla est ac, fermentum felis. Sed a est dolor.\r\n\r\nMauris dui urna, tincidunt semper commodo in, ultricies pharetra lacus. Vivamus non congue magna. Integer dictum semper interdum. Ut fermentum mattis tellus, et pretium arcu tempus nec. Fusce gravida venenatis metus, in varius diam pharetra eu. Etiam non luctus quam. Aenean fringilla ultricies mauris nec gravida. Nulla velit urna, imperdiet non nulla ac, porta vulputate velit. Nulla scelerisque metus quis erat dictum, in consequat diam ullamcorper. Nulla porttitor volutpat nunc, non luctus diam tincidunt id. Nunc at eleifend urna.\r\n\r\nEtiam non magna blandit nunc ornare laoreet et quis nunc. Aenean laoreet nibh nisl, quis molestie velit placerat ac. Donec in ex aliquet, luctus urna at, euismod nisi. In hac habitasse platea dictumst. In nec augue lectus. Ut fermentum venenatis pretium. Nulla maximus sem id nisi ultricies, vitae ornare nisl maximus.\r\n\r\nSed volutpat tellus eget faucibus porttitor. Fusce fermentum neque diam, porta fringilla sapien iaculis non. Etiam id arcu tincidunt, sollicitudin purus id, porttitor nisl. In aliquet mollis elit, sed sodales libero placerat auctor. Praesent id velit vitae enim aliquam condimentum eget at tortor. Integer non malesuada nulla, vitae aliquet odio. Cras a leo sit amet sem rhoncus rutrum. Vestibulum hendrerit tellus a dui pellentesque, in lacinia enim elementum. Phasellus rhoncus vestibulum risus eu semper. In id euismod eros. Fusce sit amet volutpat libero. Nullam mauris turpis, suscipit quis magna sed, mollis cursus magna.\r\n\r\nMauris placerat euismod pellentesque. Donec pellentesque ex sed metus hendrerit, vel porttitor orci malesuada. Donec vel neque rutrum, sodales lorem nec, interdum dolor. Proin sem eros, ullamcorper eu sodales id, sagittis id sapien. Nam vel sodales nunc. Mauris in leo mi. Vestibulum semper elit ut velit sollicitudin, non fermentum ipsum porttitor. Donec sapien leo, pharetra ut diam in, laoreet pretium sem. Nulla eget enim volutpat, tincidunt enim sed, dapibus lorem. Cras venenatis nunc in facilisis sodales.\r\n\r\nDuis libero nisl, vulputate porttitor laoreet eget, aliquet a arcu. Suspendisse potenti. Vestibulum ante nulla, sollicitudin sed diam in, pellentesque pulvinar ante. Curabitur ut enim libero. Ut tempus nulla est, id blandit lacus scelerisque in. Ut blandit nulla id sodales porttitor. Sed nec nulla et tortor efficitur volutpat quis at mauris. Curabitur cursus erat convallis dictum auctor. Suspendisse ut enim ut justo tristique tempus eget vel nunc. Integer tristique libero ac nisl cursus, sit amet ornare augue suscipit. Phasellus massa orci, consequat ut vestibulum at, varius eu nunc. Nam placerat placerat elit et ultricies. Phasellus ultrices orci tincidunt augue ornare finibus.\r\n\r\nFusce at laoreet eros. Pellentesque sagittis purus pellentesque, mattis felis quis, porta eros. Morbi et orci quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse gravida leo nec turpis efficitur rutrum. In hendrerit rhoncus arcu, eget efficitur mauris. Pellentesque et volutpat enim. Vivamus non arcu id tellus tempus consectetur. Sed fermentum auctor sapien, et varius mi eleifend vel. Aliquam at rutrum nisi, at consequat libero. Vestibulum fringilla ligula commodo mi condimentum, id dapibus mauris volutpat. Morbi quis eros purus. Mauris vel est laoreet, tincidunt risus sit amet, commodo risus.\r\n\r\nSed ut nisl vel nunc dapibus molestie a nec diam. Quisque aliquet tempor sapien vel imperdiet. Curabitur in maximus tortor. Phasellus consequat, purus sit amet dictum pretium, metus ex efficitur urna, non feugiat quam nunc at mi. Mauris ultrices lorem eget mauris interdum, a eleifend leo venenatis. Donec maximus pulvinar elementum. Mauris rhoncus augue magna, et rhoncus dolor efficitur ut. Vivamus vitae eleifend lorem, ut congue erat. Praesent non quam elit.\r\n\r\nUt at nulla at quam laoreet viverra ut in nunc. Curabitur ut ligula non nisl volutpat auctor. Sed scelerisque euismod lacus, eu pulvinar sapien laoreet id. Donec eu erat tempus, interdum est sed, rutrum libero. Aenean tempus dictum ultrices. Mauris consectetur eu risus et bibendum. Duis vestibulum nulla nisi, in sodales elit sollicitudin sit amet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus a mi id nibh tristique iaculis. Quisque ultricies velit gravida magna pulvinar, non ultricies arcu vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\r\n\r\nCurabitur a ultrices felis, in faucibus nisl. Vivamus quis odio posuere, dapibus dui non, pulvinar ipsum. Nullam a nisl eget tortor scelerisque mattis non sed felis. Nullam pulvinar luctus efficitur. Quisque et quam ac odio ullamcorper tempor eu ut magna. Cras a sollicitudin erat, ut volutpat est. Ut id dapibus lacus. Praesent massa odio, condimentum sed aliquam eu, lobortis id nisl. Pellentesque pulvinar sit amet diam eu varius. Proin eros felis, egestas vel dapibus et, egestas a ligula.\r\n\r\nNullam euismod, enim eget dictum scelerisque, erat est tempus magna, nec mattis ligula risus pulvinar est. Donec eget sem fermentum, posuere sapien sit amet, aliquam enim. Fusce lacinia eu diam vel cursus. Curabitur non mi eu augue vestibulum molestie et eget metus. Maecenas fringilla quam sit amet lorem scelerisque bibendum a ut sem. Donec quis augue turpis. Nulla non placerat lorem. Duis ornare lorem arcu, eu euismod lacus tempor nec. Vestibulum nec tortor vestibulum elit aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nCurabitur varius in leo vitae tristique. Ut nisl lacus, suscipit vitae urna a, porttitor elementum nulla. Phasellus cursus justo in volutpat rutrum. Quisque vulputate facilisis metus et gravida. Quisque malesuada purus ex, vitae convallis ex eleifend venenatis. Aenean tristique metus sed mauris lacinia aliquet. Aliquam eu tellus vel urna fermentum cursus quis sed est. Nulla volutpat vulputate lorem eu fermentum. Proin vehicula imperdiet felis non pharetra. Ut at dui eu orci ullamcorper commodo a ut metus. Morbi id augue tincidunt, varius velit eu, aliquam purus. Morbi tempus nunc sit amet varius imperdiet. Vivamus vel purus justo.\r\n\r\nCras eget efficitur ipsum, quis imperdiet orci. Nunc vitae dolor nec nulla volutpat lobortis. Vestibulum eu ipsum vitae est egestas accumsan. Nulla convallis pellentesque metus in tristique. Maecenas nec maximus nulla, sit amet tempor massa. Fusce tortor leo, sodales et pretium vitae, gravida in ipsum. Integer gravida purus a dapibus fringilla.\r\n\r\nFusce sit amet urna eget leo hendrerit tincidunt. Cras ac nisl massa. Aliquam eget eros tempus, hendrerit neque eget, ullamcorper elit. In ac aliquet elit, a aliquet odio. Etiam quam lacus, euismod aliquet hendrerit et, porttitor at est. Vestibulum faucibus nunc a iaculis vulputate. Nunc pulvinar ipsum a mi ultricies, at porttitor risus dignissim. Ut luctus sapien in auctor condimentum.\r\n\r\nNunc convallis cursus congue. Cras cursus ipsum nec ante consequat, et tincidunt enim tristique. Praesent nec faucibus est. Morbi tincidunt ligula vitae sapien consectetur, in scelerisque quam tempor. Etiam quis sapien nunc. Quisque ut est vulputate, finibus nibh at, mattis enim. Donec vitae vestibulum tortor. Ut dictum molestie risus aliquam imperdiet.\r\n\r\nAliquam laoreet nec nisi nec lacinia. Etiam laoreet pretium arcu, ut finibus augue volutpat in. Fusce ac orci eu libero pharetra gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris vel ipsum ac nisl tempus faucibus. Quisque eget malesuada est. Integer posuere magna vitae quam fringilla fringilla. Nullam ut posuere libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est mauris, placerat eu consectetur et, pulvinar sed metus. Suspendisse posuere auctor ipsum, sit amet placerat urna sagittis quis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed aliquam ex sed varius blandit. Duis vulputate dui quis iaculis finibus. Nunc porta urna mauris, congue interdum magna posuere id.\r\n\r\nQuisque varius dui sed blandit viverra. Quisque accumsan, sem vel feugiat ultricies, nisi nulla aliquet ante, eget euismod lectus augue ac nibh. Nam vel efficitur dolor. Nam lectus eros, eleifend eget nisi eu, rutrum mattis mi. Fusce nisi mauris, tincidunt id ligula et, blandit euismod ligula. Suspendisse et mi eget diam consectetur fringilla vitae nec libero. Sed eget iaculis nisl, at efficitur quam. Nunc et rhoncus leo. Fusce quis augue sit amet sapien suscipit finibus. Aenean pretium condimentum pulvinar. Sed nec tellus in nibh fringilla lobortis sed luctus diam. Nam id purus a magna faucibus porta. Donec vel maximus nisi. Phasellus fringilla mi id dui ultricies, non ultrices ante faucibus. Nulla a ullamcorper magna, quis consectetur risus. Cras vel leo vestibulum, posuere dui id, accumsan ipsum.\r\n\r\nMorbi sed imperdiet est. Vestibulum tempor in dolor eget auctor. Pellentesque auctor ullamcorper urna, non vestibulum urna ullamcorper nec. Mauris a lorem a magna bibendum ornare vitae vel purus. Mauris luctus, dui eget gravida convallis, quam augue fermentum metus, id eleifend eros elit vel turpis. Suspendisse mollis, tellus sed dapibus cursus, ligula ipsum sagittis lacus, et ultricies leo lacus in libero. Donec est dolor, gravida non ligula sed, malesuada feugiat urna. Duis vel nunc dui. Sed consectetur ex eget eros suscipit, vitae ultricies risus sagittis. Integer vulputate dictum sapien, consectetur dapibus enim euismod nec. Praesent quis faucibus nunc, sit amet malesuada nisi. Fusce at arcu ligula. Proin euismod, diam eget tempor vehicula, lorem arcu fermentum tortor, non accumsan nisi dolor vitae tortor. Morbi bibendum imperdiet ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vehicula mauris, id sagittis eros cursus vitae.\r\n\r\nCras malesuada, risus rhoncus ultrices consequat, nulla ante scelerisque justo, eget aliquet nisi nulla vitae elit. Nunc pulvinar lectus eu elit hendrerit tincidunt. Ut a ante quis orci blandit tincidunt. Nulla facilisi. Cras nec interdum ex. Aenean hendrerit leo libero, nec scelerisque augue tincidunt ac. Pellentesque tristique arcu ornare, mollis purus non, tristique arcu. Curabitur dignissim tortor augue, ac dapibus eros ultricies vitae. Etiam at sapien tincidunt, lacinia nunc at, varius arcu. Integer mattis gravida neque, eget sollicitudin velit tristique eget. Nunc risus massa, viverra at sem ac, rhoncus faucibus dolor. Praesent in odio ut arcu convallis dictum in id risus. Nulla ac semper magna, a hendrerit libero.\r\n\r\nUt sagittis mattis quam, vitae rutrum diam venenatis at. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut et finibus felis, et fermentum diam. Integer varius arcu urna, at elementum lectus porta a. Quisque aliquet ut nunc sed imperdiet. Etiam ipsum dui, volutpat vitae leo a, ultricies facilisis ipsum. Quisque suscipit faucibus quam ut iaculis. In vestibulum ex non felis tincidunt, sit amet blandit lacus tempor. Phasellus finibus purus eu risus efficitur condimentum. Etiam ac sapien ligula. Donec quis ex et leo accumsan varius in ut est. Ut facilisis sit amet sem in ultricies.\r\n\r\nSuspendisse potenti. Maecenas eu blandit eros. Nullam eleifend dolor id est suscipit aliquet. Vestibulum ac ligula in tellus porta egestas a gravida odio. Phasellus dui nisi, pulvinar accumsan sodales a, interdum eu mi. Pellentesque consectetur quis dolor sed semper. Sed aliquet convallis nunc ac faucibus. Nunc erat justo, pulvinar quis scelerisque at, aliquam nec libero. Nullam turpis ligula, faucibus et neque vel, ullamcorper molestie tortor. Cras quis neque eleifend, sagittis felis sit amet, mattis nibh. Nullam placerat lacinia ante sed rhoncus. Cras dui justo, sodales quis vulputate at, viverra quis dolor.\r\n\r\nNulla non turpis rutrum, luctus urna sit amet, lacinia purus. In faucibus, tellus sed pulvinar suscipit, erat nisi gravida felis, vitae maximus sem elit eu velit. In nec vehicula eros. Nulla eleifend tincidunt sapien efficitur vulputate. Aliquam maximus magna vitae pulvinar viverra. Cras iaculis tristique purus et commodo. Vivamus ut vulputate est, ut efficitur dui. Aliquam sed diam ornare, tempor erat non, interdum eros.\r\n\r\nNulla ullamcorper odio ut felis porttitor tincidunt. Sed porta neque dui, sed volutpat enim interdum ac. Etiam pellentesque, lacus sit amet vulputate tincidunt, ex justo vulputate orci, a mattis risus felis vel enim. Pellentesque quis lorem iaculis, laoreet eros id, facilisis lorem. Vivamus orci justo, facilisis vel consequat id, vestibulum eget massa. Aliquam dolor mauris, fringilla a tellus elementum, lacinia interdum tortor. Nam lobortis tellus magna, ut rutrum tortor pellentesque vel. Cras id magna elementum, condimentum turpis in, dictum odio. Nam mattis, arcu eu interdum semper, velit neque bibendum magna, nec porttitor ligula elit eget nunc. Proin a lorem orci. Nam vitae sem purus. Maecenas elementum non felis lobortis molestie. Aliquam in interdum neque, non placerat metus. Ut quis scelerisque felis. Curabitur efficitur nunc in vulputate gravida.\r\n\r\nUt sodales, sapien vitae elementum dapibus, dolor odio placerat justo, ultricies bibendum diam arcu a tortor. Phasellus dapibus nec turpis at interdum. Suspendisse quis sem id magna pellentesque luctus. Duis eget hendrerit ante. Donec ac purus eu dolor ornare blandit vitae vitae nibh. Suspendisse eleifend urna sed tincidunt eleifend. Fusce pulvinar tortor ante, sed commodo eros blandit eget. Praesent ex metus, sagittis sit amet quam vehicula, venenatis sagittis magna. Nunc tempus tellus justo, sed placerat massa convallis at. Maecenas velit mauris, vulputate sit amet sapien sit amet, fermentum consectetur elit. Maecenas libero quam, rhoncus a tortor non, luctus accumsan neque. Nulla facilisi. Nunc interdum dolor dolor, vel facilisis urna congue eget.\r\n\r\nIn augue mauris, accumsan sit amet felis venenatis, condimentum pulvinar est. Maecenas scelerisque, libero in commodo dictum, nunc magna vehicula magna, a porttitor magna mi id ipsum. Cras scelerisque lacus magna, facilisis rhoncus ante pretium et. Integer tempor, velit eget condimentum iaculis, sapien libero maximus sem, in pretium odio dolor sit amet nisl. Morbi interdum mi sapien, a finibus sapien mollis finibus. Nulla imperdiet porta nulla, et luctus ligula tincidunt ac. Suspendisse varius at massa vitae fermentum. Nullam libero erat, ullamcorper sed pulvinar eu, varius fermentum tellus. In finibus lectus libero, sed condimentum massa lacinia quis. Vestibulum eu nisl mi. Aenean ut odio ut augue lobortis pellentesque.\r\n\r\nDonec consequat orci eget sem rutrum, viverra vestibulum est dignissim. Aliquam tempus est et ante scelerisque condimentum. Nunc varius blandit quam, ut pulvinar lorem finibus ut. Nulla facilisi. Fusce eget nunc ut ipsum tristique venenatis. Quisque dignissim venenatis massa, posuere ullamcorper purus pharetra id. Integer a nibh non nisl condimentum lobortis. Integer imperdiet ex non risus porta, eget venenatis est auctor. Cras nec laoreet felis. Vestibulum mi magna, tempor quis arcu semper, aliquet gravida sem. In nec libero id nunc hendrerit tempus. Vivamus ut sodales justo, eu ultrices tellus. Donec tristique posuere elementum.\r\n\r\nVivamus quis justo mattis, convallis elit eu, aliquam augue. Integer sit amet neque libero. Sed et nibh rutrum orci posuere euismod ac in ipsum. Suspendisse potenti. Quisque orci nunc, ultrices sed facilisis tristique, consectetur ut nisi. Donec ac enim mi. Morbi lacinia ut leo ut dictum. Ut erat sapien, sodales in erat nec, placerat ornare nunc. Praesent accumsan ac lectus rutrum consequat. Proin ullamcorper lorem non tincidunt porttitor. Morbi ullamcorper, nibh ac elementum pellentesque, neque neque fermentum erat, at malesuada augue urna ut purus. Maecenas ornare varius tortor. Quisque mattis ultrices maximus. Ut porta velit non pretium aliquet. Maecenas laoreet quis orci nec consequat.\r\n\r\nMauris commodo auctor maximus. Integer non dictum magna, vel luctus velit. Donec in faucibus eros. Aenean non condimentum nisi. Curabitur quis mi non nulla pulvinar dignissim eu sed velit. Etiam blandit non quam a aliquam. Sed ac blandit erat. Morbi cursus sollicitudin tortor id laoreet. Vivamus lobortis egestas pulvinar. Nam commodo aliquet porta. Nullam non rutrum quam. Praesent et consectetur augue. Vivamus venenatis lacus sit amet ornare ultricies. Aliquam ultrices dapibus semper. Nam faucibus molestie ultrices. Ut sed eros eu nunc malesuada suscipit.\r\n\r\nMaecenas lobortis lectus vel sollicitudin efficitur. Etiam malesuada tincidunt vestibulum. Suspendisse vehicula sit amet arcu non gravida. Quisque molestie odio nec ipsum consectetur, in hendrerit nibh mattis. Aenean auctor velit ut felis sagittis volutpat. Mauris porttitor nibh urna, at bibendum elit rutrum quis. Nunc tincidunt eros lacus, at congue nisi porttitor in. Ut iaculis tortor eget facilisis dapibus. Praesent convallis et enim quis egestas. Cras hendrerit cursus accumsan. Sed nibh quam, condimentum eget justo quis, dapibus cursus ligula.\r\n\r\nVestibulum luctus imperdiet quam, ut scelerisque ligula sodales a. Nulla nec eros a neque fermentum porta. Pellentesque pretium purus sed tortor pellentesque pulvinar. Nullam lobortis diam suscipit turpis fringilla, vitae luctus mi imperdiet. In eget tellus eget nulla euismod eleifend in id sapien. Vivamus posuere elit bibendum lectus interdum varius. In dapibus egestas nisi, id pulvinar nunc rhoncus sed. Pellentesque interdum rutrum dui vel suscipit. Phasellus pulvinar, mi sit amet scelerisque viverra, mi metus blandit velit, vitae hendrerit enim mi ut odio. Vivamus fringilla cursus nibh vel lacinia. Vivamus ut sem ultricies, pharetra dolor eget, facilisis felis.\r\n\r\nSuspendisse eu egestas sapien, ut venenatis enim. Vestibulum ut sapien porttitor, mattis odio non, feugiat eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce eros metus, tincidunt sed rutrum nec, accumsan eget elit. Maecenas gravida justo at enim elementum venenatis. Integer quis maximus lectus. Fusce quis pharetra quam. Mauris lobortis, enim at tincidunt luctus, augue odio facilisis nisl, sit amet aliquet justo elit vel nisl.\r\n\r\nSuspendisse hendrerit, odio id lobortis interdum, nibh diam tempor nunc, a finibus magna dui a elit. Vestibulum odio lectus, dignissim eget felis ut, malesuada eleifend diam. Sed et sodales nisi. Ut dignissim eros sem, eu condimentum nibh dictum quis. Praesent nibh nunc, pharetra eget vehicula ut, pretium quis ante. Cras vitae tellus in purus euismod rutrum. Aenean elementum arcu at facilisis egestas. Aliquam sit amet eleifend velit. Ut gravida vehicula augue quis facilisis. Proin rutrum, nisl sed volutpat congue, mi lorem gravida est, ac vestibulum elit nisl nec ipsum. Proin tristique massa eleifend ex vehicula, nec ultricies ipsum tincidunt. Sed tortor eros, semper a lacinia eget, sollicitudin non purus. Suspendisse interdum tincidunt justo nec molestie.\r\n\r\nNulla enim dui, blandit sit amet odio eget, pulvinar semper felis. Praesent varius suscipit metus sit amet aliquet. Donec semper odio quis erat pellentesque scelerisque. Nunc sodales, lectus vitae iaculis lobortis, elit augue tincidunt augue, ac pulvinar libero quam sed enim. Duis euismod velit nec ante porta condimentum nec ac nisi. Vestibulum scelerisque congue enim ac ultricies. Sed sed sollicitudin enim. Nunc non augue at purus fringilla finibus. Nam vulputate ultrices odio nec pellentesque. Suspendisse semper, ipsum ut hendrerit rutrum, dolor risus aliquam augue, eget tempus urna felis vel diam. Phasellus sagittis mi tempor vestibulum porta. Sed vehicula, arcu vel semper ultricies, dolor velit sollicitudin nisl, in congue arcu neque vel ipsum. Donec bibendum consectetur lorem, a sodales sem iaculis vel. Sed consectetur purus vel nisl consequat scelerisque. Vestibulum eu metus auctor, efficitur risus sit amet, volutpat eros. Pellentesque et sapien vitae ex tempor molestie et sed ligula.\r\n\r\nSuspendisse potenti. Aenean posuere libero leo. Nulla maximus eget quam vitae pretium. Vivamus quis vestibulum lacus. Nunc aliquam eros pretium, accumsan augue non, interdum ex. Etiam vitae eros enim. Duis vel odio a diam porta fermentum. In eleifend neque pulvinar elit rhoncus fringilla.\r\n\r\nPellentesque erat erat, pulvinar eu elementum in, ultrices quis est. Aliquam erat volutpat. Vivamus iaculis sem in lacus porta, at congue arcu efficitur. Duis porta ornare malesuada. Maecenas nisl neque, porta finibus arcu sed, ultrices ullamcorper erat. In nec euismod dui, sit amet feugiat libero. Donec id dictum nibh. Praesent fringilla tincidunt nisi, cursus condimentum arcu.\r\n\r\nInteger id lorem eu metus malesuada blandit. Ut non metus nisi. Maecenas id ipsum felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante diam, facilisis at pretium sed, fermentum sit amet nisi. Suspendisse sagittis turpis nisi, viverra tincidunt urna imperdiet et. Praesent vulputate mauris velit, consectetur tempor turpis rhoncus eu. Aenean et ipsum ante. In hac habitasse platea dictumst.\r\n\r\nInteger at placerat neque. Duis auctor ipsum vel urna posuere ultricies. Donec feugiat ligula ac justo porta ornare ut id libero. Aliquam ullamcorper semper orci ac dictum. Sed ultrices arcu nisi, eleifend tempus massa sollicitudin a. Vestibulum iaculis rutrum volutpat. In laoreet dictum justo, at ultricies ligula. Fusce ut eros quam. Vestibulum interdum quam ut justo tempor, et viverra lacus porttitor. Nunc quis condimentum dui. Nam ornare mollis lorem, non mattis ipsum consequat eget. Donec ut dolor ornare, congue elit vel, tincidunt magna. Sed sagittis libero sed eros iaculis, eu imperdiet risus tincidunt.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Nulla sollicitudin ullamcorper nisl, quis tincidunt purus suscipit quis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse vitae elementum sem, sed ornare mauris. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed varius tincidunt rutrum. Phasellus congue tincidunt velit, vel gravida dolor venenatis a.\r\n\r\nMauris nec purus eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam id orci felis. Donec quis ligula augue. Suspendisse justo lectus, gravida id laoreet efficitur, fringilla vel lacus. Curabitur leo metus, efficitur vel vestibulum quis, lobortis sit amet elit. Sed lorem nulla, consequat vel purus et, gravida dictum sapien. Duis mattis aliquet gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi et elementum lacus, eu accumsan libero. Donec viverra ut libero at suscipit. Pellentesque ultrices urna nisi, in pharetra tortor tincidunt sit amet. Duis id condimentum libero. Integer ultrices accumsan quam eu tristique. Donec non dictum tellus. Donec a mi lectus.\r\n\r\nInteger eget suscipit massa. Suspendisse a turpis magna. Nam cursus mauris non metus porttitor, nec aliquet libero auctor. In dignissim imperdiet sapien a efficitur. Mauris in nibh odio. Proin sagittis placerat urna et tempor. Sed condimentum nisi non magna tristique, id finibus eros consequat. Nulla vehicula, massa eget aliquet tristique, felis ligula tincidunt nisl, vel facilisis diam risus et dui. Proin ac mauris elit. Aliquam eleifend orci accumsan, convallis orci vitae, ornare justo. Vivamus id ligula nec nulla euismod finibus vel non nisl. Morbi ac augue purus. Suspendisse vitae nulla neque. In blandit interdum est quis egestas. Cras vestibulum ex in ligula volutpat, nec fringilla quam aliquet. Nullam quis elit semper, molestie velit a, maximus sapien.\r\n\r\nCurabitur tempus egestas magna eget hendrerit. Morbi volutpat odio tellus, sed cursus mauris volutpat vitae. Nunc convallis pharetra erat vel commodo. Quisque faucibus consectetur est, nec luctus nisl tempor ac. Praesent suscipit quis risus malesuada lobortis. Sed sodales velit quis urna convallis, ac interdum libero condimentum. Mauris at dignissim risus, quis viverra enim. In hac habitasse platea dictumst. Integer pharetra, erat non cursus condimentum, erat est rutrum lorem, vitae convallis tortor nisl sit amet felis.\r\n\r\nNullam sit amet mauris ac nunc vulputate facilisis sed in augue. Nam vestibulum quam vitae scelerisque laoreet. Nullam et enim a dui dictum interdum. Nulla ipsum magna, lobortis in ipsum sit amet, condimentum aliquet metus. Sed nec rutrum nunc. In nulla est, interdum vitae ornare non, sagittis eget enim. Donec mattis diam nec leo posuere cursus. Vivamus justo tortor, dictum sed odio sed, bibendum facilisis sem. Mauris in nunc erat. Duis egestas est orci, non pharetra libero placerat id.\r\n\r\nMauris consectetur dui lobortis, euismod enim sit amet, maximus risus. Donec hendrerit, nulla at sagittis maximus, ipsum erat tincidunt eros, nec dictum nibh augue at nisl. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec mollis erat. Aenean ut lorem feugiat lacus tristique mollis sit amet quis neque. Suspendisse blandit viverra finibus. Nullam in ligula leo. Donec nisl metus, mollis a purus vehicula, bibendum accumsan turpis. In ultricies felis nec sem laoreet, eu ultricies mauris sollicitudin. Ut nulla turpis, pulvinar non gravida maximus, faucibus eleifend orci. Aenean blandit, tortor sodales mattis tristique, velit purus finibus ligula, sit amet commodo erat sapien et arcu. Aenean consequat urna in tristique tristique. Donec ac nisl lacinia, facilisis justo vitae, vehicula diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur ac turpis bibendum, fringilla enim eget, congue augue.\r\n\r\nVestibulum vel tellus a nibh tincidunt iaculis. Donec ullamcorper aliquam consequat. Aliquam rutrum posuere fringilla. Ut vel sapien tincidunt, feugiat augue nec, posuere massa. Maecenas viverra mauris est, commodo dictum ante vestibulum sed. Aliquam lobortis luctus risus, vitae eleifend quam pulvinar sed. Integer bibendum suscipit magna, quis egestas lorem elementum a. Maecenas tincidunt arcu odio, in mollis erat blandit eget.\r\n\r\nNunc vestibulum condimentum enim vitae laoreet. Vestibulum sapien sem, tristique ac lectus non, iaculis faucibus urna. Fusce rhoncus mattis suscipit. Vivamus tincidunt purus sed risus placerat, sodales finibus orci imperdiet. Phasellus varius eget tellus nec vestibulum. Mauris feugiat purus eu ante sodales, sed varius urna sagittis. Cras et nisi nibh.\r\n\r\nAenean sagittis lacus libero, ullamcorper bibendum quam condimentum et. Ut blandit sit amet nunc ut pellentesque. Integer sollicitudin eu odio id bibendum. Duis a nisi metus. Sed ut dapibus urna. Vivamus fringilla euismod justo, ac luctus est. Sed vestibulum, mi eget efficitur vestibulum, dui lectus hendrerit neque, et tincidunt diam odio elementum nunc. Nulla porta sapien elementum, porttitor justo non, aliquam mi. Sed ornare semper velit in semper. Nam dolor massa, accumsan et magna a, rhoncus consequat nibh. Aliquam faucibus turpis sed imperdiet tincidunt.\r\n\r\nProin rutrum dui vitae dignissim pretium. Quisque id vestibulum purus. Donec pharetra ac libero in scelerisque. Aenean ligula velit, tempor nec urna in, porttitor fringilla nibh. Nulla ultrices nibh interdum quam laoreet imperdiet. In imperdiet sapien ut lectus aliquet, non ultrices elit faucibus. Phasellus molestie, libero id tempus suscipit, ligula nunc vehicula ipsum, eget dignissim lectus est ut odio. Aenean ipsum elit, blandit eget felis eu, aliquet fermentum odio. Proin nulla metus, porta non massa molestie, posuere varius enim. Proin vel dictum orci. Nullam nec nisl at sem pellentesque venenatis eget sed justo. Aenean erat dolor, tincidunt sit amet auctor egestas, rhoncus vitae nunc. Cras interdum, est id finibus tempus, ligula turpis viverra tortor, at blandit metus elit ac ex. Nulla a ipsum accumsan, tempus leo ac, vehicula quam. Quisque scelerisque mi vitae urna ultricies, non imperdiet ligula sagittis.\r\n\r\nDuis ullamcorper neque eget quam vehicula commodo. Donec sed dictum velit. Donec lectus libero, tristique eget tellus eget, egestas sodales libero. Curabitur ex quam, condimentum sed lacus vitae, tincidunt posuere nibh. Donec porta metus quis turpis iaculis, vel dignissim risus aliquam. Aliquam mollis tempus ultricies. In fringilla metus in orci molestie sodales. Quisque suscipit mi sed neque tristique, sit amet varius orci vestibulum. Mauris vel est eu sem tincidunt ullamcorper quis quis justo. In vel aliquet purus, sed tempus turpis. Phasellus vulputate ac orci sed bibendum. Ut neque lacus, iaculis eu augue vitae, varius condimentum tortor. Curabitur congue est id molestie fermentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ac lacus lectus. Donec ut malesuada sapien.\r\n\r\nPraesent porttitor elit non nisi porttitor luctus. Mauris quis orci id orci ornare viverra. Quisque pulvinar lorem sed mollis placerat. Praesent in eleifend arcu, ut tristique lorem. Proin gravida volutpat nunc, eu sodales eros pulvinar vitae. Ut vitae feugiat mi. Vivamus gravida justo sed dignissim aliquam. In porta enim sapien, ac tempor metus laoreet in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed maximus cursus augue at faucibus.\r\n\r\nPhasellus vitae orci est. Mauris sed est non elit facilisis iaculis. Morbi in massa convallis, rhoncus enim sit amet, suscipit nisi. Integer consequat neque non quam feugiat varius. Mauris vel vehicula sem, nec consequat ex. Nullam interdum sapien a feugiat fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed nec arcu tincidunt, gravida massa a, semper odio. Donec efficitur consequat volutpat. Vestibulum dapibus ut metus nec convallis. Cras hendrerit dignissim nulla, eget vehicula justo volutpat quis. Proin gravida ipsum nisi, in accumsan augue condimentum non. Pellentesque elementum in dolor vitae rhoncus. Nulla luctus, massa ut posuere scelerisque, velit risus ornare arcu, eget cursus velit magna eu ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Praesent condimentum justo leo, eget gravida metus suscipit et. Vestibulum ornare iaculis elit, nec pulvinar purus ornare quis. Morbi efficitur pellentesque dignissim. Donec ac felis eros. Integer sagittis, diam ac convallis convallis, orci turpis lacinia nisl, eu fringilla quam arcu ac turpis. Mauris eros leo, condimentum in nibh eget, volutpat placerat risus. Curabitur in dui ut dolor tincidunt vehicula. Aenean ultrices pellentesque consequat. Phasellus dapibus eget purus eu finibus. Nulla semper ante odio, vitae hendrerit sem maximus non. Aenean nisi nibh, venenatis non imperdiet porta, sodales id ex. Pellentesque pellentesque imperdiet mi id gravida.\r\n\r\nNulla pulvinar arcu nisi, vulputate venenatis enim elementum vitae. Vivamus aliquam ut odio ut sollicitudin. Pellentesque magna turpis, aliquam et rhoncus vel, iaculis id ipsum. Praesent est sem, iaculis quis nisi sed, suscipit blandit elit. Etiam feugiat sem massa, ut gravida mi consectetur sed. Phasellus blandit placerat lacus in posuere. Donec a posuere ex. Mauris purus sapien, pellentesque sed varius sed, venenatis ut nulla. Etiam sagittis justo est, vel semper augue ornare eu.\r\n\r\nVivamus ultricies dolor at est tincidunt pellentesque. Aliquam metus dui, cursus quis pharetra sit amet, pretium sit amet diam. Phasellus vitae accumsan libero, et sollicitudin enim. Morbi est odio, ultrices quis bibendum eget, accumsan et urna. Quisque vulputate dapibus malesuada. Praesent lectus tortor, maximus quis suscipit ultricies, mollis a orci. Nullam lacus lacus, interdum nec magna nec, faucibus pharetra enim. Curabitur tincidunt velit non turpis vestibulum, vitae lobortis tortor blandit. In sit amet metus nec ex laoreet scelerisque. Cras faucibus mi consequat dui varius sagittis. Duis egestas venenatis nisl, nec gravida erat maximus in. Vestibulum at libero gravida, tincidunt urna eget, feugiat metus.\r\n\r\nUt consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.\r\n\r\nNulla ornare ornare blandit. Pellentesque ut nisi placerat, pharetra dolor ac, vehicula neque. Duis vitae lectus quis ex volutpat varius. Phasellus ultrices vel mauris ut rhoncus. Vestibulum viverra tortor elit, quis consequat metus eleifend sit amet. Maecenas non ligula volutpat, cursus arcu vel, tempor magna. Praesent vestibulum ante quis accumsan dignissim. Donec eu augue facilisis, commodo metus eget, vulputate leo. Nulla non commodo magna. Suspendisse eget tellus nec dui rhoncus auctor non id lorem.\r\n\r\nSed massa lectus, ultricies sit amet vulputate egestas, convallis ut ante. Etiam lacinia vitae felis sed condimentum. Vestibulum tempus in tortor sed malesuada. Mauris hendrerit ornare suscipit. Integer rutrum placerat dui, ut pretium tortor laoreet sed. Sed ac lacinia elit. Morbi congue, ante congue fringilla tincidunt, orci purus aliquam libero, eget mattis diam odio ac odio. Nulla eros leo, malesuada et eleifend maximus, convallis dapibus lacus. Morbi tempor vehicula cursus. Fusce tincidunt, dui nec auctor sagittis, arcu libero accumsan est, nec porttitor nisi quam ac ante. Nam pellentesque feugiat purus vitae rhoncus. Vestibulum tincidunt ac nisi ac sollicitudin. Aliquam id fermentum dolor. Vivamus malesuada dui eget dui aliquam placerat vitae id orci.\r\n\r\nProin imperdiet elit nibh, at commodo ipsum facilisis sit amet. Cras tincidunt aliquet purus ac luctus. Praesent viverra quis ipsum vel rhoncus. Duis eget quam vitae ipsum pulvinar viverra vitae nec libero. Quisque sodales orci orci, nec faucibus elit imperdiet malesuada. Integer egestas sapien ut turpis posuere luctus. Integer ut dolor at arcu fringilla convallis in vel purus. In hac habitasse platea dictumst. Etiam ut elit leo. Nullam semper consequat lorem. Quisque eleifend arcu id urna aliquet, id sodales purus feugiat. In aliquet lorem suscipit, hendrerit ex vel, aliquam ex.\r\n\r\nCurabitur consequat non purus vel porttitor. Cras ullamcorper sollicitudin magna sed gravida. Sed elementum sed ante ut tincidunt. In nec mi sodales, viverra risus eu, pellentesque tellus. Duis ornare eleifend metus vel mollis. Vivamus varius consectetur neque vitae pharetra. Mauris nec velit ut nunc efficitur lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nQuisque vel condimentum dui. Pellentesque id lorem massa', '/app/topics/1/1.jpg', '2021-02-09 14:38:23', '2021-02-19 13:55:11');
INSERT INTO `parenting_topics` (`id`, `parenting_topic_status_id`, `parenting_topic_category_id`, `user_id`, `title`, `topic`, `image`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 4, 'Topic Main Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae ipsum sit amet libero luctus tincidunt in a libero. Nam vitae enim mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec lacus ut eros condimentum sollicitudin id ut felis. Vivamus feugiat ipsum eget dolor scelerisque, id facilisis urna facilisis. Maecenas eleifend augue quis condimentum consequat. Cras porta lacus neque.\r\n\r\nIn fermentum pretium metus, quis congue mauris bibendum vel. Sed felis tortor, posuere vitae consectetur at, commodo sit amet lacus. Morbi dignissim risus eu nibh ullamcorper, vel luctus enim porttitor. Aenean efficitur varius ultricies. Mauris mollis nisl sit amet laoreet volutpat. Proin dapibus lorem quis lacus consectetur, eu hendrerit nulla mattis. Phasellus ornare interdum hendrerit. In vel augue euismod, fringilla est ac, fermentum felis. Sed a est dolor.\r\n\r\nMauris dui urna, tincidunt semper commodo in, ultricies pharetra lacus. Vivamus non congue magna. Integer dictum semper interdum. Ut fermentum mattis tellus, et pretium arcu tempus nec. Fusce gravida venenatis metus, in varius diam pharetra eu. Etiam non luctus quam. Aenean fringilla ultricies mauris nec gravida. Nulla velit urna, imperdiet non nulla ac, porta vulputate velit. Nulla scelerisque metus quis erat dictum, in consequat diam ullamcorper. Nulla porttitor volutpat nunc, non luctus diam tincidunt id. Nunc at eleifend urna.\r\n\r\nEtiam non magna blandit nunc ornare laoreet et quis nunc. Aenean laoreet nibh nisl, quis molestie velit placerat ac. Donec in ex aliquet, luctus urna at, euismod nisi. In hac habitasse platea dictumst. In nec augue lectus. Ut fermentum venenatis pretium. Nulla maximus sem id nisi ultricies, vitae ornare nisl maximus.\r\n\r\nSed volutpat tellus eget faucibus porttitor. Fusce fermentum neque diam, porta fringilla sapien iaculis non. Etiam id arcu tincidunt, sollicitudin purus id, porttitor nisl. In aliquet mollis elit, sed sodales libero placerat auctor. Praesent id velit vitae enim aliquam condimentum eget at tortor. Integer non malesuada nulla, vitae aliquet odio. Cras a leo sit amet sem rhoncus rutrum. Vestibulum hendrerit tellus a dui pellentesque, in lacinia enim elementum. Phasellus rhoncus vestibulum risus eu semper. In id euismod eros. Fusce sit amet volutpat libero. Nullam mauris turpis, suscipit quis magna sed, mollis cursus magna.\r\n\r\nMauris placerat euismod pellentesque. Donec pellentesque ex sed metus hendrerit, vel porttitor orci malesuada. Donec vel neque rutrum, sodales lorem nec, interdum dolor. Proin sem eros, ullamcorper eu sodales id, sagittis id sapien. Nam vel sodales nunc. Mauris in leo mi. Vestibulum semper elit ut velit sollicitudin, non fermentum ipsum porttitor. Donec sapien leo, pharetra ut diam in, laoreet pretium sem. Nulla eget enim volutpat, tincidunt enim sed, dapibus lorem. Cras venenatis nunc in facilisis sodales.\r\n\r\nDuis libero nisl, vulputate porttitor laoreet eget, aliquet a arcu. Suspendisse potenti. Vestibulum ante nulla, sollicitudin sed diam in, pellentesque pulvinar ante. Curabitur ut enim libero. Ut tempus nulla est, id blandit lacus scelerisque in. Ut blandit nulla id sodales porttitor. Sed nec nulla et tortor efficitur volutpat quis at mauris. Curabitur cursus erat convallis dictum auctor. Suspendisse ut enim ut justo tristique tempus eget vel nunc. Integer tristique libero ac nisl cursus, sit amet ornare augue suscipit. Phasellus massa orci, consequat ut vestibulum at, varius eu nunc. Nam placerat placerat elit et ultricies. Phasellus ultrices orci tincidunt augue ornare finibus.\r\n\r\nFusce at laoreet eros. Pellentesque sagittis purus pellentesque, mattis felis quis, porta eros. Morbi et orci quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse gravida leo nec turpis efficitur rutrum. In hendrerit rhoncus arcu, eget efficitur mauris. Pellentesque et volutpat enim. Vivamus non arcu id tellus tempus consectetur. Sed fermentum auctor sapien, et varius mi eleifend vel. Aliquam at rutrum nisi, at consequat libero. Vestibulum fringilla ligula commodo mi condimentum, id dapibus mauris volutpat. Morbi quis eros purus. Mauris vel est laoreet, tincidunt risus sit amet, commodo risus.\r\n\r\nSed ut nisl vel nunc dapibus molestie a nec diam. Quisque aliquet tempor sapien vel imperdiet. Curabitur in maximus tortor. Phasellus consequat, purus sit amet dictum pretium, metus ex efficitur urna, non feugiat quam nunc at mi. Mauris ultrices lorem eget mauris interdum, a eleifend leo venenatis. Donec maximus pulvinar elementum. Mauris rhoncus augue magna, et rhoncus dolor efficitur ut. Vivamus vitae eleifend lorem, ut congue erat. Praesent non quam elit.\r\n\r\nUt at nulla at quam laoreet viverra ut in nunc. Curabitur ut ligula non nisl volutpat auctor. Sed scelerisque euismod lacus, eu pulvinar sapien laoreet id. Donec eu erat tempus, interdum est sed, rutrum libero. Aenean tempus dictum ultrices. Mauris consectetur eu risus et bibendum. Duis vestibulum nulla nisi, in sodales elit sollicitudin sit amet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus a mi id nibh tristique iaculis. Quisque ultricies velit gravida magna pulvinar, non ultricies arcu vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\r\n\r\nCurabitur a ultrices felis, in faucibus nisl. Vivamus quis odio posuere, dapibus dui non, pulvinar ipsum. Nullam a nisl eget tortor scelerisque mattis non sed felis. Nullam pulvinar luctus efficitur. Quisque et quam ac odio ullamcorper tempor eu ut magna. Cras a sollicitudin erat, ut volutpat est. Ut id dapibus lacus. Praesent massa odio, condimentum sed aliquam eu, lobortis id nisl. Pellentesque pulvinar sit amet diam eu varius. Proin eros felis, egestas vel dapibus et, egestas a ligula.\r\n\r\nNullam euismod, enim eget dictum scelerisque, erat est tempus magna, nec mattis ligula risus pulvinar est. Donec eget sem fermentum, posuere sapien sit amet, aliquam enim. Fusce lacinia eu diam vel cursus. Curabitur non mi eu augue vestibulum molestie et eget metus. Maecenas fringilla quam sit amet lorem scelerisque bibendum a ut sem. Donec quis augue turpis. Nulla non placerat lorem. Duis ornare lorem arcu, eu euismod lacus tempor nec. Vestibulum nec tortor vestibulum elit aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nCurabitur varius in leo vitae tristique. Ut nisl lacus, suscipit vitae urna a, porttitor elementum nulla. Phasellus cursus justo in volutpat rutrum. Quisque vulputate facilisis metus et gravida. Quisque malesuada purus ex, vitae convallis ex eleifend venenatis. Aenean tristique metus sed mauris lacinia aliquet. Aliquam eu tellus vel urna fermentum cursus quis sed est. Nulla volutpat vulputate lorem eu fermentum. Proin vehicula imperdiet felis non pharetra. Ut at dui eu orci ullamcorper commodo a ut metus. Morbi id augue tincidunt, varius velit eu, aliquam purus. Morbi tempus nunc sit amet varius imperdiet. Vivamus vel purus justo.\r\n\r\nCras eget efficitur ipsum, quis imperdiet orci. Nunc vitae dolor nec nulla volutpat lobortis. Vestibulum eu ipsum vitae est egestas accumsan. Nulla convallis pellentesque metus in tristique. Maecenas nec maximus nulla, sit amet tempor massa. Fusce tortor leo, sodales et pretium vitae, gravida in ipsum. Integer gravida purus a dapibus fringilla.\r\n\r\nFusce sit amet urna eget leo hendrerit tincidunt. Cras ac nisl massa. Aliquam eget eros tempus, hendrerit neque eget, ullamcorper elit. In ac aliquet elit, a aliquet odio. Etiam quam lacus, euismod aliquet hendrerit et, porttitor at est. Vestibulum faucibus nunc a iaculis vulputate. Nunc pulvinar ipsum a mi ultricies, at porttitor risus dignissim. Ut luctus sapien in auctor condimentum.\r\n\r\nNunc convallis cursus congue. Cras cursus ipsum nec ante consequat, et tincidunt enim tristique. Praesent nec faucibus est. Morbi tincidunt ligula vitae sapien consectetur, in scelerisque quam tempor. Etiam quis sapien nunc. Quisque ut est vulputate, finibus nibh at, mattis enim. Donec vitae vestibulum tortor. Ut dictum molestie risus aliquam imperdiet.\r\n\r\nAliquam laoreet nec nisi nec lacinia. Etiam laoreet pretium arcu, ut finibus augue volutpat in. Fusce ac orci eu libero pharetra gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris vel ipsum ac nisl tempus faucibus. Quisque eget malesuada est. Integer posuere magna vitae quam fringilla fringilla. Nullam ut posuere libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est mauris, placerat eu consectetur et, pulvinar sed metus. Suspendisse posuere auctor ipsum, sit amet placerat urna sagittis quis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed aliquam ex sed varius blandit. Duis vulputate dui quis iaculis finibus. Nunc porta urna mauris, congue interdum magna posuere id.\r\n\r\nQuisque varius dui sed blandit viverra. Quisque accumsan, sem vel feugiat ultricies, nisi nulla aliquet ante, eget euismod lectus augue ac nibh. Nam vel efficitur dolor. Nam lectus eros, eleifend eget nisi eu, rutrum mattis mi. Fusce nisi mauris, tincidunt id ligula et, blandit euismod ligula. Suspendisse et mi eget diam consectetur fringilla vitae nec libero. Sed eget iaculis nisl, at efficitur quam. Nunc et rhoncus leo. Fusce quis augue sit amet sapien suscipit finibus. Aenean pretium condimentum pulvinar. Sed nec tellus in nibh fringilla lobortis sed luctus diam. Nam id purus a magna faucibus porta. Donec vel maximus nisi. Phasellus fringilla mi id dui ultricies, non ultrices ante faucibus. Nulla a ullamcorper magna, quis consectetur risus. Cras vel leo vestibulum, posuere dui id, accumsan ipsum.\r\n\r\nMorbi sed imperdiet est. Vestibulum tempor in dolor eget auctor. Pellentesque auctor ullamcorper urna, non vestibulum urna ullamcorper nec. Mauris a lorem a magna bibendum ornare vitae vel purus. Mauris luctus, dui eget gravida convallis, quam augue fermentum metus, id eleifend eros elit vel turpis. Suspendisse mollis, tellus sed dapibus cursus, ligula ipsum sagittis lacus, et ultricies leo lacus in libero. Donec est dolor, gravida non ligula sed, malesuada feugiat urna. Duis vel nunc dui. Sed consectetur ex eget eros suscipit, vitae ultricies risus sagittis. Integer vulputate dictum sapien, consectetur dapibus enim euismod nec. Praesent quis faucibus nunc, sit amet malesuada nisi. Fusce at arcu ligula. Proin euismod, diam eget tempor vehicula, lorem arcu fermentum tortor, non accumsan nisi dolor vitae tortor. Morbi bibendum imperdiet ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vehicula mauris, id sagittis eros cursus vitae.\r\n\r\nCras malesuada, risus rhoncus ultrices consequat, nulla ante scelerisque justo, eget aliquet nisi nulla vitae elit. Nunc pulvinar lectus eu elit hendrerit tincidunt. Ut a ante quis orci blandit tincidunt. Nulla facilisi. Cras nec interdum ex. Aenean hendrerit leo libero, nec scelerisque augue tincidunt ac. Pellentesque tristique arcu ornare, mollis purus non, tristique arcu. Curabitur dignissim tortor augue, ac dapibus eros ultricies vitae. Etiam at sapien tincidunt, lacinia nunc at, varius arcu. Integer mattis gravida neque, eget sollicitudin velit tristique eget. Nunc risus massa, viverra at sem ac, rhoncus faucibus dolor. Praesent in odio ut arcu convallis dictum in id risus. Nulla ac semper magna, a hendrerit libero.\r\n\r\nUt sagittis mattis quam, vitae rutrum diam venenatis at. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut et finibus felis, et fermentum diam. Integer varius arcu urna, at elementum lectus porta a. Quisque aliquet ut nunc sed imperdiet. Etiam ipsum dui, volutpat vitae leo a, ultricies facilisis ipsum. Quisque suscipit faucibus quam ut iaculis. In vestibulum ex non felis tincidunt, sit amet blandit lacus tempor. Phasellus finibus purus eu risus efficitur condimentum. Etiam ac sapien ligula. Donec quis ex et leo accumsan varius in ut est. Ut facilisis sit amet sem in ultricies.\r\n\r\nSuspendisse potenti. Maecenas eu blandit eros. Nullam eleifend dolor id est suscipit aliquet. Vestibulum ac ligula in tellus porta egestas a gravida odio. Phasellus dui nisi, pulvinar accumsan sodales a, interdum eu mi. Pellentesque consectetur quis dolor sed semper. Sed aliquet convallis nunc ac faucibus. Nunc erat justo, pulvinar quis scelerisque at, aliquam nec libero. Nullam turpis ligula, faucibus et neque vel, ullamcorper molestie tortor. Cras quis neque eleifend, sagittis felis sit amet, mattis nibh. Nullam placerat lacinia ante sed rhoncus. Cras dui justo, sodales quis vulputate at, viverra quis dolor.\r\n\r\nNulla non turpis rutrum, luctus urna sit amet, lacinia purus. In faucibus, tellus sed pulvinar suscipit, erat nisi gravida felis, vitae maximus sem elit eu velit. In nec vehicula eros. Nulla eleifend tincidunt sapien efficitur vulputate. Aliquam maximus magna vitae pulvinar viverra. Cras iaculis tristique purus et commodo. Vivamus ut vulputate est, ut efficitur dui. Aliquam sed diam ornare, tempor erat non, interdum eros.\r\n\r\nNulla ullamcorper odio ut felis porttitor tincidunt. Sed porta neque dui, sed volutpat enim interdum ac. Etiam pellentesque, lacus sit amet vulputate tincidunt, ex justo vulputate orci, a mattis risus felis vel enim. Pellentesque quis lorem iaculis, laoreet eros id, facilisis lorem. Vivamus orci justo, facilisis vel consequat id, vestibulum eget massa. Aliquam dolor mauris, fringilla a tellus elementum, lacinia interdum tortor. Nam lobortis tellus magna, ut rutrum tortor pellentesque vel. Cras id magna elementum, condimentum turpis in, dictum odio. Nam mattis, arcu eu interdum semper, velit neque bibendum magna, nec porttitor ligula elit eget nunc. Proin a lorem orci. Nam vitae sem purus. Maecenas elementum non felis lobortis molestie. Aliquam in interdum neque, non placerat metus. Ut quis scelerisque felis. Curabitur efficitur nunc in vulputate gravida.\r\n\r\nUt sodales, sapien vitae elementum dapibus, dolor odio placerat justo, ultricies bibendum diam arcu a tortor. Phasellus dapibus nec turpis at interdum. Suspendisse quis sem id magna pellentesque luctus. Duis eget hendrerit ante. Donec ac purus eu dolor ornare blandit vitae vitae nibh. Suspendisse eleifend urna sed tincidunt eleifend. Fusce pulvinar tortor ante, sed commodo eros blandit eget. Praesent ex metus, sagittis sit amet quam vehicula, venenatis sagittis magna. Nunc tempus tellus justo, sed placerat massa convallis at. Maecenas velit mauris, vulputate sit amet sapien sit amet, fermentum consectetur elit. Maecenas libero quam, rhoncus a tortor non, luctus accumsan neque. Nulla facilisi. Nunc interdum dolor dolor, vel facilisis urna congue eget.\r\n\r\nIn augue mauris, accumsan sit amet felis venenatis, condimentum pulvinar est. Maecenas scelerisque, libero in commodo dictum, nunc magna vehicula magna, a porttitor magna mi id ipsum. Cras scelerisque lacus magna, facilisis rhoncus ante pretium et. Integer tempor, velit eget condimentum iaculis, sapien libero maximus sem, in pretium odio dolor sit amet nisl. Morbi interdum mi sapien, a finibus sapien mollis finibus. Nulla imperdiet porta nulla, et luctus ligula tincidunt ac. Suspendisse varius at massa vitae fermentum. Nullam libero erat, ullamcorper sed pulvinar eu, varius fermentum tellus. In finibus lectus libero, sed condimentum massa lacinia quis. Vestibulum eu nisl mi. Aenean ut odio ut augue lobortis pellentesque.\r\n\r\nDonec consequat orci eget sem rutrum, viverra vestibulum est dignissim. Aliquam tempus est et ante scelerisque condimentum. Nunc varius blandit quam, ut pulvinar lorem finibus ut. Nulla facilisi. Fusce eget nunc ut ipsum tristique venenatis. Quisque dignissim venenatis massa, posuere ullamcorper purus pharetra id. Integer a nibh non nisl condimentum lobortis. Integer imperdiet ex non risus porta, eget venenatis est auctor. Cras nec laoreet felis. Vestibulum mi magna, tempor quis arcu semper, aliquet gravida sem. In nec libero id nunc hendrerit tempus. Vivamus ut sodales justo, eu ultrices tellus. Donec tristique posuere elementum.\r\n\r\nVivamus quis justo mattis, convallis elit eu, aliquam augue. Integer sit amet neque libero. Sed et nibh rutrum orci posuere euismod ac in ipsum. Suspendisse potenti. Quisque orci nunc, ultrices sed facilisis tristique, consectetur ut nisi. Donec ac enim mi. Morbi lacinia ut leo ut dictum. Ut erat sapien, sodales in erat nec, placerat ornare nunc. Praesent accumsan ac lectus rutrum consequat. Proin ullamcorper lorem non tincidunt porttitor. Morbi ullamcorper, nibh ac elementum pellentesque, neque neque fermentum erat, at malesuada augue urna ut purus. Maecenas ornare varius tortor. Quisque mattis ultrices maximus. Ut porta velit non pretium aliquet. Maecenas laoreet quis orci nec consequat.\r\n\r\nMauris commodo auctor maximus. Integer non dictum magna, vel luctus velit. Donec in faucibus eros. Aenean non condimentum nisi. Curabitur quis mi non nulla pulvinar dignissim eu sed velit. Etiam blandit non quam a aliquam. Sed ac blandit erat. Morbi cursus sollicitudin tortor id laoreet. Vivamus lobortis egestas pulvinar. Nam commodo aliquet porta. Nullam non rutrum quam. Praesent et consectetur augue. Vivamus venenatis lacus sit amet ornare ultricies. Aliquam ultrices dapibus semper. Nam faucibus molestie ultrices. Ut sed eros eu nunc malesuada suscipit.\r\n\r\nMaecenas lobortis lectus vel sollicitudin efficitur. Etiam malesuada tincidunt vestibulum. Suspendisse vehicula sit amet arcu non gravida. Quisque molestie odio nec ipsum consectetur, in hendrerit nibh mattis. Aenean auctor velit ut felis sagittis volutpat. Mauris porttitor nibh urna, at bibendum elit rutrum quis. Nunc tincidunt eros lacus, at congue nisi porttitor in. Ut iaculis tortor eget facilisis dapibus. Praesent convallis et enim quis egestas. Cras hendrerit cursus accumsan. Sed nibh quam, condimentum eget justo quis, dapibus cursus ligula.\r\n\r\nVestibulum luctus imperdiet quam, ut scelerisque ligula sodales a. Nulla nec eros a neque fermentum porta. Pellentesque pretium purus sed tortor pellentesque pulvinar. Nullam lobortis diam suscipit turpis fringilla, vitae luctus mi imperdiet. In eget tellus eget nulla euismod eleifend in id sapien. Vivamus posuere elit bibendum lectus interdum varius. In dapibus egestas nisi, id pulvinar nunc rhoncus sed. Pellentesque interdum rutrum dui vel suscipit. Phasellus pulvinar, mi sit amet scelerisque viverra, mi metus blandit velit, vitae hendrerit enim mi ut odio. Vivamus fringilla cursus nibh vel lacinia. Vivamus ut sem ultricies, pharetra dolor eget, facilisis felis.\r\n\r\nSuspendisse eu egestas sapien, ut venenatis enim. Vestibulum ut sapien porttitor, mattis odio non, feugiat eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce eros metus, tincidunt sed rutrum nec, accumsan eget elit. Maecenas gravida justo at enim elementum venenatis. Integer quis maximus lectus. Fusce quis pharetra quam. Mauris lobortis, enim at tincidunt luctus, augue odio facilisis nisl, sit amet aliquet justo elit vel nisl.\r\n\r\nSuspendisse hendrerit, odio id lobortis interdum, nibh diam tempor nunc, a finibus magna dui a elit. Vestibulum odio lectus, dignissim eget felis ut, malesuada eleifend diam. Sed et sodales nisi. Ut dignissim eros sem, eu condimentum nibh dictum quis. Praesent nibh nunc, pharetra eget vehicula ut, pretium quis ante. Cras vitae tellus in purus euismod rutrum. Aenean elementum arcu at facilisis egestas. Aliquam sit amet eleifend velit. Ut gravida vehicula augue quis facilisis. Proin rutrum, nisl sed volutpat congue, mi lorem gravida est, ac vestibulum elit nisl nec ipsum. Proin tristique massa eleifend ex vehicula, nec ultricies ipsum tincidunt. Sed tortor eros, semper a lacinia eget, sollicitudin non purus. Suspendisse interdum tincidunt justo nec molestie.\r\n\r\nNulla enim dui, blandit sit amet odio eget, pulvinar semper felis. Praesent varius suscipit metus sit amet aliquet. Donec semper odio quis erat pellentesque scelerisque. Nunc sodales, lectus vitae iaculis lobortis, elit augue tincidunt augue, ac pulvinar libero quam sed enim. Duis euismod velit nec ante porta condimentum nec ac nisi. Vestibulum scelerisque congue enim ac ultricies. Sed sed sollicitudin enim. Nunc non augue at purus fringilla finibus. Nam vulputate ultrices odio nec pellentesque. Suspendisse semper, ipsum ut hendrerit rutrum, dolor risus aliquam augue, eget tempus urna felis vel diam. Phasellus sagittis mi tempor vestibulum porta. Sed vehicula, arcu vel semper ultricies, dolor velit sollicitudin nisl, in congue arcu neque vel ipsum. Donec bibendum consectetur lorem, a sodales sem iaculis vel. Sed consectetur purus vel nisl consequat scelerisque. Vestibulum eu metus auctor, efficitur risus sit amet, volutpat eros. Pellentesque et sapien vitae ex tempor molestie et sed ligula.\r\n\r\nSuspendisse potenti. Aenean posuere libero leo. Nulla maximus eget quam vitae pretium. Vivamus quis vestibulum lacus. Nunc aliquam eros pretium, accumsan augue non, interdum ex. Etiam vitae eros enim. Duis vel odio a diam porta fermentum. In eleifend neque pulvinar elit rhoncus fringilla.\r\n\r\nPellentesque erat erat, pulvinar eu elementum in, ultrices quis est. Aliquam erat volutpat. Vivamus iaculis sem in lacus porta, at congue arcu efficitur. Duis porta ornare malesuada. Maecenas nisl neque, porta finibus arcu sed, ultrices ullamcorper erat. In nec euismod dui, sit amet feugiat libero. Donec id dictum nibh. Praesent fringilla tincidunt nisi, cursus condimentum arcu.\r\n\r\nInteger id lorem eu metus malesuada blandit. Ut non metus nisi. Maecenas id ipsum felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante diam, facilisis at pretium sed, fermentum sit amet nisi. Suspendisse sagittis turpis nisi, viverra tincidunt urna imperdiet et. Praesent vulputate mauris velit, consectetur tempor turpis rhoncus eu. Aenean et ipsum ante. In hac habitasse platea dictumst.\r\n\r\nInteger at placerat neque. Duis auctor ipsum vel urna posuere ultricies. Donec feugiat ligula ac justo porta ornare ut id libero. Aliquam ullamcorper semper orci ac dictum. Sed ultrices arcu nisi, eleifend tempus massa sollicitudin a. Vestibulum iaculis rutrum volutpat. In laoreet dictum justo, at ultricies ligula. Fusce ut eros quam. Vestibulum interdum quam ut justo tempor, et viverra lacus porttitor. Nunc quis condimentum dui. Nam ornare mollis lorem, non mattis ipsum consequat eget. Donec ut dolor ornare, congue elit vel, tincidunt magna. Sed sagittis libero sed eros iaculis, eu imperdiet risus tincidunt.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Nulla sollicitudin ullamcorper nisl, quis tincidunt purus suscipit quis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse vitae elementum sem, sed ornare mauris. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed varius tincidunt rutrum. Phasellus congue tincidunt velit, vel gravida dolor venenatis a.\r\n\r\nMauris nec purus eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam id orci felis. Donec quis ligula augue. Suspendisse justo lectus, gravida id laoreet efficitur, fringilla vel lacus. Curabitur leo metus, efficitur vel vestibulum quis, lobortis sit amet elit. Sed lorem nulla, consequat vel purus et, gravida dictum sapien. Duis mattis aliquet gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi et elementum lacus, eu accumsan libero. Donec viverra ut libero at suscipit. Pellentesque ultrices urna nisi, in pharetra tortor tincidunt sit amet. Duis id condimentum libero. Integer ultrices accumsan quam eu tristique. Donec non dictum tellus. Donec a mi lectus.\r\n\r\nInteger eget suscipit massa. Suspendisse a turpis magna. Nam cursus mauris non metus porttitor, nec aliquet libero auctor. In dignissim imperdiet sapien a efficitur. Mauris in nibh odio. Proin sagittis placerat urna et tempor. Sed condimentum nisi non magna tristique, id finibus eros consequat. Nulla vehicula, massa eget aliquet tristique, felis ligula tincidunt nisl, vel facilisis diam risus et dui. Proin ac mauris elit. Aliquam eleifend orci accumsan, convallis orci vitae, ornare justo. Vivamus id ligula nec nulla euismod finibus vel non nisl. Morbi ac augue purus. Suspendisse vitae nulla neque. In blandit interdum est quis egestas. Cras vestibulum ex in ligula volutpat, nec fringilla quam aliquet. Nullam quis elit semper, molestie velit a, maximus sapien.\r\n\r\nCurabitur tempus egestas magna eget hendrerit. Morbi volutpat odio tellus, sed cursus mauris volutpat vitae. Nunc convallis pharetra erat vel commodo. Quisque faucibus consectetur est, nec luctus nisl tempor ac. Praesent suscipit quis risus malesuada lobortis. Sed sodales velit quis urna convallis, ac interdum libero condimentum. Mauris at dignissim risus, quis viverra enim. In hac habitasse platea dictumst. Integer pharetra, erat non cursus condimentum, erat est rutrum lorem, vitae convallis tortor nisl sit amet felis.\r\n\r\nNullam sit amet mauris ac nunc vulputate facilisis sed in augue. Nam vestibulum quam vitae scelerisque laoreet. Nullam et enim a dui dictum interdum. Nulla ipsum magna, lobortis in ipsum sit amet, condimentum aliquet metus. Sed nec rutrum nunc. In nulla est, interdum vitae ornare non, sagittis eget enim. Donec mattis diam nec leo posuere cursus. Vivamus justo tortor, dictum sed odio sed, bibendum facilisis sem. Mauris in nunc erat. Duis egestas est orci, non pharetra libero placerat id.\r\n\r\nMauris consectetur dui lobortis, euismod enim sit amet, maximus risus. Donec hendrerit, nulla at sagittis maximus, ipsum erat tincidunt eros, nec dictum nibh augue at nisl. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec mollis erat. Aenean ut lorem feugiat lacus tristique mollis sit amet quis neque. Suspendisse blandit viverra finibus. Nullam in ligula leo. Donec nisl metus, mollis a purus vehicula, bibendum accumsan turpis. In ultricies felis nec sem laoreet, eu ultricies mauris sollicitudin. Ut nulla turpis, pulvinar non gravida maximus, faucibus eleifend orci. Aenean blandit, tortor sodales mattis tristique, velit purus finibus ligula, sit amet commodo erat sapien et arcu. Aenean consequat urna in tristique tristique. Donec ac nisl lacinia, facilisis justo vitae, vehicula diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur ac turpis bibendum, fringilla enim eget, congue augue.\r\n\r\nVestibulum vel tellus a nibh tincidunt iaculis. Donec ullamcorper aliquam consequat. Aliquam rutrum posuere fringilla. Ut vel sapien tincidunt, feugiat augue nec, posuere massa. Maecenas viverra mauris est, commodo dictum ante vestibulum sed. Aliquam lobortis luctus risus, vitae eleifend quam pulvinar sed. Integer bibendum suscipit magna, quis egestas lorem elementum a. Maecenas tincidunt arcu odio, in mollis erat blandit eget.\r\n\r\nNunc vestibulum condimentum enim vitae laoreet. Vestibulum sapien sem, tristique ac lectus non, iaculis faucibus urna. Fusce rhoncus mattis suscipit. Vivamus tincidunt purus sed risus placerat, sodales finibus orci imperdiet. Phasellus varius eget tellus nec vestibulum. Mauris feugiat purus eu ante sodales, sed varius urna sagittis. Cras et nisi nibh.\r\n\r\nAenean sagittis lacus libero, ullamcorper bibendum quam condimentum et. Ut blandit sit amet nunc ut pellentesque. Integer sollicitudin eu odio id bibendum. Duis a nisi metus. Sed ut dapibus urna. Vivamus fringilla euismod justo, ac luctus est. Sed vestibulum, mi eget efficitur vestibulum, dui lectus hendrerit neque, et tincidunt diam odio elementum nunc. Nulla porta sapien elementum, porttitor justo non, aliquam mi. Sed ornare semper velit in semper. Nam dolor massa, accumsan et magna a, rhoncus consequat nibh. Aliquam faucibus turpis sed imperdiet tincidunt.\r\n\r\nProin rutrum dui vitae dignissim pretium. Quisque id vestibulum purus. Donec pharetra ac libero in scelerisque. Aenean ligula velit, tempor nec urna in, porttitor fringilla nibh. Nulla ultrices nibh interdum quam laoreet imperdiet. In imperdiet sapien ut lectus aliquet, non ultrices elit faucibus. Phasellus molestie, libero id tempus suscipit, ligula nunc vehicula ipsum, eget dignissim lectus est ut odio. Aenean ipsum elit, blandit eget felis eu, aliquet fermentum odio. Proin nulla metus, porta non massa molestie, posuere varius enim. Proin vel dictum orci. Nullam nec nisl at sem pellentesque venenatis eget sed justo. Aenean erat dolor, tincidunt sit amet auctor egestas, rhoncus vitae nunc. Cras interdum, est id finibus tempus, ligula turpis viverra tortor, at blandit metus elit ac ex. Nulla a ipsum accumsan, tempus leo ac, vehicula quam. Quisque scelerisque mi vitae urna ultricies, non imperdiet ligula sagittis.\r\n\r\nDuis ullamcorper neque eget quam vehicula commodo. Donec sed dictum velit. Donec lectus libero, tristique eget tellus eget, egestas sodales libero. Curabitur ex quam, condimentum sed lacus vitae, tincidunt posuere nibh. Donec porta metus quis turpis iaculis, vel dignissim risus aliquam. Aliquam mollis tempus ultricies. In fringilla metus in orci molestie sodales. Quisque suscipit mi sed neque tristique, sit amet varius orci vestibulum. Mauris vel est eu sem tincidunt ullamcorper quis quis justo. In vel aliquet purus, sed tempus turpis. Phasellus vulputate ac orci sed bibendum. Ut neque lacus, iaculis eu augue vitae, varius condimentum tortor. Curabitur congue est id molestie fermentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ac lacus lectus. Donec ut malesuada sapien.\r\n\r\nPraesent porttitor elit non nisi porttitor luctus. Mauris quis orci id orci ornare viverra. Quisque pulvinar lorem sed mollis placerat. Praesent in eleifend arcu, ut tristique lorem. Proin gravida volutpat nunc, eu sodales eros pulvinar vitae. Ut vitae feugiat mi. Vivamus gravida justo sed dignissim aliquam. In porta enim sapien, ac tempor metus laoreet in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed maximus cursus augue at faucibus.\r\n\r\nPhasellus vitae orci est. Mauris sed est non elit facilisis iaculis. Morbi in massa convallis, rhoncus enim sit amet, suscipit nisi. Integer consequat neque non quam feugiat varius. Mauris vel vehicula sem, nec consequat ex. Nullam interdum sapien a feugiat fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed nec arcu tincidunt, gravida massa a, semper odio. Donec efficitur consequat volutpat. Vestibulum dapibus ut metus nec convallis. Cras hendrerit dignissim nulla, eget vehicula justo volutpat quis. Proin gravida ipsum nisi, in accumsan augue condimentum non. Pellentesque elementum in dolor vitae rhoncus. Nulla luctus, massa ut posuere scelerisque, velit risus ornare arcu, eget cursus velit magna eu ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Praesent condimentum justo leo, eget gravida metus suscipit et. Vestibulum ornare iaculis elit, nec pulvinar purus ornare quis. Morbi efficitur pellentesque dignissim. Donec ac felis eros. Integer sagittis, diam ac convallis convallis, orci turpis lacinia nisl, eu fringilla quam arcu ac turpis. Mauris eros leo, condimentum in nibh eget, volutpat placerat risus. Curabitur in dui ut dolor tincidunt vehicula. Aenean ultrices pellentesque consequat. Phasellus dapibus eget purus eu finibus. Nulla semper ante odio, vitae hendrerit sem maximus non. Aenean nisi nibh, venenatis non imperdiet porta, sodales id ex. Pellentesque pellentesque imperdiet mi id gravida.\r\n\r\nNulla pulvinar arcu nisi, vulputate venenatis enim elementum vitae. Vivamus aliquam ut odio ut sollicitudin. Pellentesque magna turpis, aliquam et rhoncus vel, iaculis id ipsum. Praesent est sem, iaculis quis nisi sed, suscipit blandit elit. Etiam feugiat sem massa, ut gravida mi consectetur sed. Phasellus blandit placerat lacus in posuere. Donec a posuere ex. Mauris purus sapien, pellentesque sed varius sed, venenatis ut nulla. Etiam sagittis justo est, vel semper augue ornare eu.\r\n\r\nVivamus ultricies dolor at est tincidunt pellentesque. Aliquam metus dui, cursus quis pharetra sit amet, pretium sit amet diam. Phasellus vitae accumsan libero, et sollicitudin enim. Morbi est odio, ultrices quis bibendum eget, accumsan et urna. Quisque vulputate dapibus malesuada. Praesent lectus tortor, maximus quis suscipit ultricies, mollis a orci. Nullam lacus lacus, interdum nec magna nec, faucibus pharetra enim. Curabitur tincidunt velit non turpis vestibulum, vitae lobortis tortor blandit. In sit amet metus nec ex laoreet scelerisque. Cras faucibus mi consequat dui varius sagittis. Duis egestas venenatis nisl, nec gravida erat maximus in. Vestibulum at libero gravida, tincidunt urna eget, feugiat metus.\r\n\r\nUt consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.\r\n\r\nNulla ornare ornare blandit. Pellentesque ut nisi placerat, pharetra dolor ac, vehicula neque. Duis vitae lectus quis ex volutpat varius. Phasellus ultrices vel mauris ut rhoncus. Vestibulum viverra tortor elit, quis consequat metus eleifend sit amet. Maecenas non ligula volutpat, cursus arcu vel, tempor magna. Praesent vestibulum ante quis accumsan dignissim. Donec eu augue facilisis, commodo metus eget, vulputate leo. Nulla non commodo magna. Suspendisse eget tellus nec dui rhoncus auctor non id lorem.\r\n\r\nSed massa lectus, ultricies sit amet vulputate egestas, convallis ut ante. Etiam lacinia vitae felis sed condimentum. Vestibulum tempus in tortor sed malesuada. Mauris hendrerit ornare suscipit. Integer rutrum placerat dui, ut pretium tortor laoreet sed. Sed ac lacinia elit. Morbi congue, ante congue fringilla tincidunt, orci purus aliquam libero, eget mattis diam odio ac odio. Nulla eros leo, malesuada et eleifend maximus, convallis dapibus lacus. Morbi tempor vehicula cursus. Fusce tincidunt, dui nec auctor sagittis, arcu libero accumsan est, nec porttitor nisi quam ac ante. Nam pellentesque feugiat purus vitae rhoncus. Vestibulum tincidunt ac nisi ac sollicitudin. Aliquam id fermentum dolor. Vivamus malesuada dui eget dui aliquam placerat vitae id orci.\r\n\r\nProin imperdiet elit nibh, at commodo ipsum facilisis sit amet. Cras tincidunt aliquet purus ac luctus. Praesent viverra quis ipsum vel rhoncus. Duis eget quam vitae ipsum pulvinar viverra vitae nec libero. Quisque sodales orci orci, nec faucibus elit imperdiet malesuada. Integer egestas sapien ut turpis posuere luctus. Integer ut dolor at arcu fringilla convallis in vel purus. In hac habitasse platea dictumst. Etiam ut elit leo. Nullam semper consequat lorem. Quisque eleifend arcu id urna aliquet, id sodales purus feugiat. In aliquet lorem suscipit, hendrerit ex vel, aliquam ex.\r\n\r\nCurabitur consequat non purus vel porttitor. Cras ullamcorper sollicitudin magna sed gravida. Sed elementum sed ante ut tincidunt. In nec mi sodales, viverra risus eu, pellentesque tellus. Duis ornare eleifend metus vel mollis. Vivamus varius consectetur neque vitae pharetra. Mauris nec velit ut nunc efficitur lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nQuisque vel condimentum dui. Pellentesque id lorem massa\r\n', '/app/topics/1/1.jpg', '2021-02-09 14:38:23', '2021-02-09 14:38:23');
INSERT INTO `parenting_topics` (`id`, `parenting_topic_status_id`, `parenting_topic_category_id`, `user_id`, `title`, `topic`, `image`, `created_at`, `updated_at`) VALUES
(3, 3, 1, 4, 'Topic Main Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vitae ipsum sit amet libero luctus tincidunt in a libero. Nam vitae enim mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec lacus ut eros condimentum sollicitudin id ut felis. Vivamus feugiat ipsum eget dolor scelerisque, id facilisis urna facilisis. Maecenas eleifend augue quis condimentum consequat. Cras porta lacus neque.\r\n\r\nIn fermentum pretium metus, quis congue mauris bibendum vel. Sed felis tortor, posuere vitae consectetur at, commodo sit amet lacus. Morbi dignissim risus eu nibh ullamcorper, vel luctus enim porttitor. Aenean efficitur varius ultricies. Mauris mollis nisl sit amet laoreet volutpat. Proin dapibus lorem quis lacus consectetur, eu hendrerit nulla mattis. Phasellus ornare interdum hendrerit. In vel augue euismod, fringilla est ac, fermentum felis. Sed a est dolor.\r\n\r\nMauris dui urna, tincidunt semper commodo in, ultricies pharetra lacus. Vivamus non congue magna. Integer dictum semper interdum. Ut fermentum mattis tellus, et pretium arcu tempus nec. Fusce gravida venenatis metus, in varius diam pharetra eu. Etiam non luctus quam. Aenean fringilla ultricies mauris nec gravida. Nulla velit urna, imperdiet non nulla ac, porta vulputate velit. Nulla scelerisque metus quis erat dictum, in consequat diam ullamcorper. Nulla porttitor volutpat nunc, non luctus diam tincidunt id. Nunc at eleifend urna.\r\n\r\nEtiam non magna blandit nunc ornare laoreet et quis nunc. Aenean laoreet nibh nisl, quis molestie velit placerat ac. Donec in ex aliquet, luctus urna at, euismod nisi. In hac habitasse platea dictumst. In nec augue lectus. Ut fermentum venenatis pretium. Nulla maximus sem id nisi ultricies, vitae ornare nisl maximus.\r\n\r\nSed volutpat tellus eget faucibus porttitor. Fusce fermentum neque diam, porta fringilla sapien iaculis non. Etiam id arcu tincidunt, sollicitudin purus id, porttitor nisl. In aliquet mollis elit, sed sodales libero placerat auctor. Praesent id velit vitae enim aliquam condimentum eget at tortor. Integer non malesuada nulla, vitae aliquet odio. Cras a leo sit amet sem rhoncus rutrum. Vestibulum hendrerit tellus a dui pellentesque, in lacinia enim elementum. Phasellus rhoncus vestibulum risus eu semper. In id euismod eros. Fusce sit amet volutpat libero. Nullam mauris turpis, suscipit quis magna sed, mollis cursus magna.\r\n\r\nMauris placerat euismod pellentesque. Donec pellentesque ex sed metus hendrerit, vel porttitor orci malesuada. Donec vel neque rutrum, sodales lorem nec, interdum dolor. Proin sem eros, ullamcorper eu sodales id, sagittis id sapien. Nam vel sodales nunc. Mauris in leo mi. Vestibulum semper elit ut velit sollicitudin, non fermentum ipsum porttitor. Donec sapien leo, pharetra ut diam in, laoreet pretium sem. Nulla eget enim volutpat, tincidunt enim sed, dapibus lorem. Cras venenatis nunc in facilisis sodales.\r\n\r\nDuis libero nisl, vulputate porttitor laoreet eget, aliquet a arcu. Suspendisse potenti. Vestibulum ante nulla, sollicitudin sed diam in, pellentesque pulvinar ante. Curabitur ut enim libero. Ut tempus nulla est, id blandit lacus scelerisque in. Ut blandit nulla id sodales porttitor. Sed nec nulla et tortor efficitur volutpat quis at mauris. Curabitur cursus erat convallis dictum auctor. Suspendisse ut enim ut justo tristique tempus eget vel nunc. Integer tristique libero ac nisl cursus, sit amet ornare augue suscipit. Phasellus massa orci, consequat ut vestibulum at, varius eu nunc. Nam placerat placerat elit et ultricies. Phasellus ultrices orci tincidunt augue ornare finibus.\r\n\r\nFusce at laoreet eros. Pellentesque sagittis purus pellentesque, mattis felis quis, porta eros. Morbi et orci quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse gravida leo nec turpis efficitur rutrum. In hendrerit rhoncus arcu, eget efficitur mauris. Pellentesque et volutpat enim. Vivamus non arcu id tellus tempus consectetur. Sed fermentum auctor sapien, et varius mi eleifend vel. Aliquam at rutrum nisi, at consequat libero. Vestibulum fringilla ligula commodo mi condimentum, id dapibus mauris volutpat. Morbi quis eros purus. Mauris vel est laoreet, tincidunt risus sit amet, commodo risus.\r\n\r\nSed ut nisl vel nunc dapibus molestie a nec diam. Quisque aliquet tempor sapien vel imperdiet. Curabitur in maximus tortor. Phasellus consequat, purus sit amet dictum pretium, metus ex efficitur urna, non feugiat quam nunc at mi. Mauris ultrices lorem eget mauris interdum, a eleifend leo venenatis. Donec maximus pulvinar elementum. Mauris rhoncus augue magna, et rhoncus dolor efficitur ut. Vivamus vitae eleifend lorem, ut congue erat. Praesent non quam elit.\r\n\r\nUt at nulla at quam laoreet viverra ut in nunc. Curabitur ut ligula non nisl volutpat auctor. Sed scelerisque euismod lacus, eu pulvinar sapien laoreet id. Donec eu erat tempus, interdum est sed, rutrum libero. Aenean tempus dictum ultrices. Mauris consectetur eu risus et bibendum. Duis vestibulum nulla nisi, in sodales elit sollicitudin sit amet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus a mi id nibh tristique iaculis. Quisque ultricies velit gravida magna pulvinar, non ultricies arcu vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;\r\n\r\nCurabitur a ultrices felis, in faucibus nisl. Vivamus quis odio posuere, dapibus dui non, pulvinar ipsum. Nullam a nisl eget tortor scelerisque mattis non sed felis. Nullam pulvinar luctus efficitur. Quisque et quam ac odio ullamcorper tempor eu ut magna. Cras a sollicitudin erat, ut volutpat est. Ut id dapibus lacus. Praesent massa odio, condimentum sed aliquam eu, lobortis id nisl. Pellentesque pulvinar sit amet diam eu varius. Proin eros felis, egestas vel dapibus et, egestas a ligula.\r\n\r\nNullam euismod, enim eget dictum scelerisque, erat est tempus magna, nec mattis ligula risus pulvinar est. Donec eget sem fermentum, posuere sapien sit amet, aliquam enim. Fusce lacinia eu diam vel cursus. Curabitur non mi eu augue vestibulum molestie et eget metus. Maecenas fringilla quam sit amet lorem scelerisque bibendum a ut sem. Donec quis augue turpis. Nulla non placerat lorem. Duis ornare lorem arcu, eu euismod lacus tempor nec. Vestibulum nec tortor vestibulum elit aliquet pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit.\r\n\r\nCurabitur varius in leo vitae tristique. Ut nisl lacus, suscipit vitae urna a, porttitor elementum nulla. Phasellus cursus justo in volutpat rutrum. Quisque vulputate facilisis metus et gravida. Quisque malesuada purus ex, vitae convallis ex eleifend venenatis. Aenean tristique metus sed mauris lacinia aliquet. Aliquam eu tellus vel urna fermentum cursus quis sed est. Nulla volutpat vulputate lorem eu fermentum. Proin vehicula imperdiet felis non pharetra. Ut at dui eu orci ullamcorper commodo a ut metus. Morbi id augue tincidunt, varius velit eu, aliquam purus. Morbi tempus nunc sit amet varius imperdiet. Vivamus vel purus justo.\r\n\r\nCras eget efficitur ipsum, quis imperdiet orci. Nunc vitae dolor nec nulla volutpat lobortis. Vestibulum eu ipsum vitae est egestas accumsan. Nulla convallis pellentesque metus in tristique. Maecenas nec maximus nulla, sit amet tempor massa. Fusce tortor leo, sodales et pretium vitae, gravida in ipsum. Integer gravida purus a dapibus fringilla.\r\n\r\nFusce sit amet urna eget leo hendrerit tincidunt. Cras ac nisl massa. Aliquam eget eros tempus, hendrerit neque eget, ullamcorper elit. In ac aliquet elit, a aliquet odio. Etiam quam lacus, euismod aliquet hendrerit et, porttitor at est. Vestibulum faucibus nunc a iaculis vulputate. Nunc pulvinar ipsum a mi ultricies, at porttitor risus dignissim. Ut luctus sapien in auctor condimentum.\r\n\r\nNunc convallis cursus congue. Cras cursus ipsum nec ante consequat, et tincidunt enim tristique. Praesent nec faucibus est. Morbi tincidunt ligula vitae sapien consectetur, in scelerisque quam tempor. Etiam quis sapien nunc. Quisque ut est vulputate, finibus nibh at, mattis enim. Donec vitae vestibulum tortor. Ut dictum molestie risus aliquam imperdiet.\r\n\r\nAliquam laoreet nec nisi nec lacinia. Etiam laoreet pretium arcu, ut finibus augue volutpat in. Fusce ac orci eu libero pharetra gravida. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris vel ipsum ac nisl tempus faucibus. Quisque eget malesuada est. Integer posuere magna vitae quam fringilla fringilla. Nullam ut posuere libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam est mauris, placerat eu consectetur et, pulvinar sed metus. Suspendisse posuere auctor ipsum, sit amet placerat urna sagittis quis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed aliquam ex sed varius blandit. Duis vulputate dui quis iaculis finibus. Nunc porta urna mauris, congue interdum magna posuere id.\r\n\r\nQuisque varius dui sed blandit viverra. Quisque accumsan, sem vel feugiat ultricies, nisi nulla aliquet ante, eget euismod lectus augue ac nibh. Nam vel efficitur dolor. Nam lectus eros, eleifend eget nisi eu, rutrum mattis mi. Fusce nisi mauris, tincidunt id ligula et, blandit euismod ligula. Suspendisse et mi eget diam consectetur fringilla vitae nec libero. Sed eget iaculis nisl, at efficitur quam. Nunc et rhoncus leo. Fusce quis augue sit amet sapien suscipit finibus. Aenean pretium condimentum pulvinar. Sed nec tellus in nibh fringilla lobortis sed luctus diam. Nam id purus a magna faucibus porta. Donec vel maximus nisi. Phasellus fringilla mi id dui ultricies, non ultrices ante faucibus. Nulla a ullamcorper magna, quis consectetur risus. Cras vel leo vestibulum, posuere dui id, accumsan ipsum.\r\n\r\nMorbi sed imperdiet est. Vestibulum tempor in dolor eget auctor. Pellentesque auctor ullamcorper urna, non vestibulum urna ullamcorper nec. Mauris a lorem a magna bibendum ornare vitae vel purus. Mauris luctus, dui eget gravida convallis, quam augue fermentum metus, id eleifend eros elit vel turpis. Suspendisse mollis, tellus sed dapibus cursus, ligula ipsum sagittis lacus, et ultricies leo lacus in libero. Donec est dolor, gravida non ligula sed, malesuada feugiat urna. Duis vel nunc dui. Sed consectetur ex eget eros suscipit, vitae ultricies risus sagittis. Integer vulputate dictum sapien, consectetur dapibus enim euismod nec. Praesent quis faucibus nunc, sit amet malesuada nisi. Fusce at arcu ligula. Proin euismod, diam eget tempor vehicula, lorem arcu fermentum tortor, non accumsan nisi dolor vitae tortor. Morbi bibendum imperdiet ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum cursus vehicula mauris, id sagittis eros cursus vitae.\r\n\r\nCras malesuada, risus rhoncus ultrices consequat, nulla ante scelerisque justo, eget aliquet nisi nulla vitae elit. Nunc pulvinar lectus eu elit hendrerit tincidunt. Ut a ante quis orci blandit tincidunt. Nulla facilisi. Cras nec interdum ex. Aenean hendrerit leo libero, nec scelerisque augue tincidunt ac. Pellentesque tristique arcu ornare, mollis purus non, tristique arcu. Curabitur dignissim tortor augue, ac dapibus eros ultricies vitae. Etiam at sapien tincidunt, lacinia nunc at, varius arcu. Integer mattis gravida neque, eget sollicitudin velit tristique eget. Nunc risus massa, viverra at sem ac, rhoncus faucibus dolor. Praesent in odio ut arcu convallis dictum in id risus. Nulla ac semper magna, a hendrerit libero.\r\n\r\nUt sagittis mattis quam, vitae rutrum diam venenatis at. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut et finibus felis, et fermentum diam. Integer varius arcu urna, at elementum lectus porta a. Quisque aliquet ut nunc sed imperdiet. Etiam ipsum dui, volutpat vitae leo a, ultricies facilisis ipsum. Quisque suscipit faucibus quam ut iaculis. In vestibulum ex non felis tincidunt, sit amet blandit lacus tempor. Phasellus finibus purus eu risus efficitur condimentum. Etiam ac sapien ligula. Donec quis ex et leo accumsan varius in ut est. Ut facilisis sit amet sem in ultricies.\r\n\r\nSuspendisse potenti. Maecenas eu blandit eros. Nullam eleifend dolor id est suscipit aliquet. Vestibulum ac ligula in tellus porta egestas a gravida odio. Phasellus dui nisi, pulvinar accumsan sodales a, interdum eu mi. Pellentesque consectetur quis dolor sed semper. Sed aliquet convallis nunc ac faucibus. Nunc erat justo, pulvinar quis scelerisque at, aliquam nec libero. Nullam turpis ligula, faucibus et neque vel, ullamcorper molestie tortor. Cras quis neque eleifend, sagittis felis sit amet, mattis nibh. Nullam placerat lacinia ante sed rhoncus. Cras dui justo, sodales quis vulputate at, viverra quis dolor.\r\n\r\nNulla non turpis rutrum, luctus urna sit amet, lacinia purus. In faucibus, tellus sed pulvinar suscipit, erat nisi gravida felis, vitae maximus sem elit eu velit. In nec vehicula eros. Nulla eleifend tincidunt sapien efficitur vulputate. Aliquam maximus magna vitae pulvinar viverra. Cras iaculis tristique purus et commodo. Vivamus ut vulputate est, ut efficitur dui. Aliquam sed diam ornare, tempor erat non, interdum eros.\r\n\r\nNulla ullamcorper odio ut felis porttitor tincidunt. Sed porta neque dui, sed volutpat enim interdum ac. Etiam pellentesque, lacus sit amet vulputate tincidunt, ex justo vulputate orci, a mattis risus felis vel enim. Pellentesque quis lorem iaculis, laoreet eros id, facilisis lorem. Vivamus orci justo, facilisis vel consequat id, vestibulum eget massa. Aliquam dolor mauris, fringilla a tellus elementum, lacinia interdum tortor. Nam lobortis tellus magna, ut rutrum tortor pellentesque vel. Cras id magna elementum, condimentum turpis in, dictum odio. Nam mattis, arcu eu interdum semper, velit neque bibendum magna, nec porttitor ligula elit eget nunc. Proin a lorem orci. Nam vitae sem purus. Maecenas elementum non felis lobortis molestie. Aliquam in interdum neque, non placerat metus. Ut quis scelerisque felis. Curabitur efficitur nunc in vulputate gravida.\r\n\r\nUt sodales, sapien vitae elementum dapibus, dolor odio placerat justo, ultricies bibendum diam arcu a tortor. Phasellus dapibus nec turpis at interdum. Suspendisse quis sem id magna pellentesque luctus. Duis eget hendrerit ante. Donec ac purus eu dolor ornare blandit vitae vitae nibh. Suspendisse eleifend urna sed tincidunt eleifend. Fusce pulvinar tortor ante, sed commodo eros blandit eget. Praesent ex metus, sagittis sit amet quam vehicula, venenatis sagittis magna. Nunc tempus tellus justo, sed placerat massa convallis at. Maecenas velit mauris, vulputate sit amet sapien sit amet, fermentum consectetur elit. Maecenas libero quam, rhoncus a tortor non, luctus accumsan neque. Nulla facilisi. Nunc interdum dolor dolor, vel facilisis urna congue eget.\r\n\r\nIn augue mauris, accumsan sit amet felis venenatis, condimentum pulvinar est. Maecenas scelerisque, libero in commodo dictum, nunc magna vehicula magna, a porttitor magna mi id ipsum. Cras scelerisque lacus magna, facilisis rhoncus ante pretium et. Integer tempor, velit eget condimentum iaculis, sapien libero maximus sem, in pretium odio dolor sit amet nisl. Morbi interdum mi sapien, a finibus sapien mollis finibus. Nulla imperdiet porta nulla, et luctus ligula tincidunt ac. Suspendisse varius at massa vitae fermentum. Nullam libero erat, ullamcorper sed pulvinar eu, varius fermentum tellus. In finibus lectus libero, sed condimentum massa lacinia quis. Vestibulum eu nisl mi. Aenean ut odio ut augue lobortis pellentesque.\r\n\r\nDonec consequat orci eget sem rutrum, viverra vestibulum est dignissim. Aliquam tempus est et ante scelerisque condimentum. Nunc varius blandit quam, ut pulvinar lorem finibus ut. Nulla facilisi. Fusce eget nunc ut ipsum tristique venenatis. Quisque dignissim venenatis massa, posuere ullamcorper purus pharetra id. Integer a nibh non nisl condimentum lobortis. Integer imperdiet ex non risus porta, eget venenatis est auctor. Cras nec laoreet felis. Vestibulum mi magna, tempor quis arcu semper, aliquet gravida sem. In nec libero id nunc hendrerit tempus. Vivamus ut sodales justo, eu ultrices tellus. Donec tristique posuere elementum.\r\n\r\nVivamus quis justo mattis, convallis elit eu, aliquam augue. Integer sit amet neque libero. Sed et nibh rutrum orci posuere euismod ac in ipsum. Suspendisse potenti. Quisque orci nunc, ultrices sed facilisis tristique, consectetur ut nisi. Donec ac enim mi. Morbi lacinia ut leo ut dictum. Ut erat sapien, sodales in erat nec, placerat ornare nunc. Praesent accumsan ac lectus rutrum consequat. Proin ullamcorper lorem non tincidunt porttitor. Morbi ullamcorper, nibh ac elementum pellentesque, neque neque fermentum erat, at malesuada augue urna ut purus. Maecenas ornare varius tortor. Quisque mattis ultrices maximus. Ut porta velit non pretium aliquet. Maecenas laoreet quis orci nec consequat.\r\n\r\nMauris commodo auctor maximus. Integer non dictum magna, vel luctus velit. Donec in faucibus eros. Aenean non condimentum nisi. Curabitur quis mi non nulla pulvinar dignissim eu sed velit. Etiam blandit non quam a aliquam. Sed ac blandit erat. Morbi cursus sollicitudin tortor id laoreet. Vivamus lobortis egestas pulvinar. Nam commodo aliquet porta. Nullam non rutrum quam. Praesent et consectetur augue. Vivamus venenatis lacus sit amet ornare ultricies. Aliquam ultrices dapibus semper. Nam faucibus molestie ultrices. Ut sed eros eu nunc malesuada suscipit.\r\n\r\nMaecenas lobortis lectus vel sollicitudin efficitur. Etiam malesuada tincidunt vestibulum. Suspendisse vehicula sit amet arcu non gravida. Quisque molestie odio nec ipsum consectetur, in hendrerit nibh mattis. Aenean auctor velit ut felis sagittis volutpat. Mauris porttitor nibh urna, at bibendum elit rutrum quis. Nunc tincidunt eros lacus, at congue nisi porttitor in. Ut iaculis tortor eget facilisis dapibus. Praesent convallis et enim quis egestas. Cras hendrerit cursus accumsan. Sed nibh quam, condimentum eget justo quis, dapibus cursus ligula.\r\n\r\nVestibulum luctus imperdiet quam, ut scelerisque ligula sodales a. Nulla nec eros a neque fermentum porta. Pellentesque pretium purus sed tortor pellentesque pulvinar. Nullam lobortis diam suscipit turpis fringilla, vitae luctus mi imperdiet. In eget tellus eget nulla euismod eleifend in id sapien. Vivamus posuere elit bibendum lectus interdum varius. In dapibus egestas nisi, id pulvinar nunc rhoncus sed. Pellentesque interdum rutrum dui vel suscipit. Phasellus pulvinar, mi sit amet scelerisque viverra, mi metus blandit velit, vitae hendrerit enim mi ut odio. Vivamus fringilla cursus nibh vel lacinia. Vivamus ut sem ultricies, pharetra dolor eget, facilisis felis.\r\n\r\nSuspendisse eu egestas sapien, ut venenatis enim. Vestibulum ut sapien porttitor, mattis odio non, feugiat eros. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce eros metus, tincidunt sed rutrum nec, accumsan eget elit. Maecenas gravida justo at enim elementum venenatis. Integer quis maximus lectus. Fusce quis pharetra quam. Mauris lobortis, enim at tincidunt luctus, augue odio facilisis nisl, sit amet aliquet justo elit vel nisl.\r\n\r\nSuspendisse hendrerit, odio id lobortis interdum, nibh diam tempor nunc, a finibus magna dui a elit. Vestibulum odio lectus, dignissim eget felis ut, malesuada eleifend diam. Sed et sodales nisi. Ut dignissim eros sem, eu condimentum nibh dictum quis. Praesent nibh nunc, pharetra eget vehicula ut, pretium quis ante. Cras vitae tellus in purus euismod rutrum. Aenean elementum arcu at facilisis egestas. Aliquam sit amet eleifend velit. Ut gravida vehicula augue quis facilisis. Proin rutrum, nisl sed volutpat congue, mi lorem gravida est, ac vestibulum elit nisl nec ipsum. Proin tristique massa eleifend ex vehicula, nec ultricies ipsum tincidunt. Sed tortor eros, semper a lacinia eget, sollicitudin non purus. Suspendisse interdum tincidunt justo nec molestie.\r\n\r\nNulla enim dui, blandit sit amet odio eget, pulvinar semper felis. Praesent varius suscipit metus sit amet aliquet. Donec semper odio quis erat pellentesque scelerisque. Nunc sodales, lectus vitae iaculis lobortis, elit augue tincidunt augue, ac pulvinar libero quam sed enim. Duis euismod velit nec ante porta condimentum nec ac nisi. Vestibulum scelerisque congue enim ac ultricies. Sed sed sollicitudin enim. Nunc non augue at purus fringilla finibus. Nam vulputate ultrices odio nec pellentesque. Suspendisse semper, ipsum ut hendrerit rutrum, dolor risus aliquam augue, eget tempus urna felis vel diam. Phasellus sagittis mi tempor vestibulum porta. Sed vehicula, arcu vel semper ultricies, dolor velit sollicitudin nisl, in congue arcu neque vel ipsum. Donec bibendum consectetur lorem, a sodales sem iaculis vel. Sed consectetur purus vel nisl consequat scelerisque. Vestibulum eu metus auctor, efficitur risus sit amet, volutpat eros. Pellentesque et sapien vitae ex tempor molestie et sed ligula.\r\n\r\nSuspendisse potenti. Aenean posuere libero leo. Nulla maximus eget quam vitae pretium. Vivamus quis vestibulum lacus. Nunc aliquam eros pretium, accumsan augue non, interdum ex. Etiam vitae eros enim. Duis vel odio a diam porta fermentum. In eleifend neque pulvinar elit rhoncus fringilla.\r\n\r\nPellentesque erat erat, pulvinar eu elementum in, ultrices quis est. Aliquam erat volutpat. Vivamus iaculis sem in lacus porta, at congue arcu efficitur. Duis porta ornare malesuada. Maecenas nisl neque, porta finibus arcu sed, ultrices ullamcorper erat. In nec euismod dui, sit amet feugiat libero. Donec id dictum nibh. Praesent fringilla tincidunt nisi, cursus condimentum arcu.\r\n\r\nInteger id lorem eu metus malesuada blandit. Ut non metus nisi. Maecenas id ipsum felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ante diam, facilisis at pretium sed, fermentum sit amet nisi. Suspendisse sagittis turpis nisi, viverra tincidunt urna imperdiet et. Praesent vulputate mauris velit, consectetur tempor turpis rhoncus eu. Aenean et ipsum ante. In hac habitasse platea dictumst.\r\n\r\nInteger at placerat neque. Duis auctor ipsum vel urna posuere ultricies. Donec feugiat ligula ac justo porta ornare ut id libero. Aliquam ullamcorper semper orci ac dictum. Sed ultrices arcu nisi, eleifend tempus massa sollicitudin a. Vestibulum iaculis rutrum volutpat. In laoreet dictum justo, at ultricies ligula. Fusce ut eros quam. Vestibulum interdum quam ut justo tempor, et viverra lacus porttitor. Nunc quis condimentum dui. Nam ornare mollis lorem, non mattis ipsum consequat eget. Donec ut dolor ornare, congue elit vel, tincidunt magna. Sed sagittis libero sed eros iaculis, eu imperdiet risus tincidunt.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Nulla sollicitudin ullamcorper nisl, quis tincidunt purus suscipit quis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse vitae elementum sem, sed ornare mauris. In hac habitasse platea dictumst. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed varius tincidunt rutrum. Phasellus congue tincidunt velit, vel gravida dolor venenatis a.\r\n\r\nMauris nec purus eros. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam id orci felis. Donec quis ligula augue. Suspendisse justo lectus, gravida id laoreet efficitur, fringilla vel lacus. Curabitur leo metus, efficitur vel vestibulum quis, lobortis sit amet elit. Sed lorem nulla, consequat vel purus et, gravida dictum sapien. Duis mattis aliquet gravida. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi et elementum lacus, eu accumsan libero. Donec viverra ut libero at suscipit. Pellentesque ultrices urna nisi, in pharetra tortor tincidunt sit amet. Duis id condimentum libero. Integer ultrices accumsan quam eu tristique. Donec non dictum tellus. Donec a mi lectus.\r\n\r\nInteger eget suscipit massa. Suspendisse a turpis magna. Nam cursus mauris non metus porttitor, nec aliquet libero auctor. In dignissim imperdiet sapien a efficitur. Mauris in nibh odio. Proin sagittis placerat urna et tempor. Sed condimentum nisi non magna tristique, id finibus eros consequat. Nulla vehicula, massa eget aliquet tristique, felis ligula tincidunt nisl, vel facilisis diam risus et dui. Proin ac mauris elit. Aliquam eleifend orci accumsan, convallis orci vitae, ornare justo. Vivamus id ligula nec nulla euismod finibus vel non nisl. Morbi ac augue purus. Suspendisse vitae nulla neque. In blandit interdum est quis egestas. Cras vestibulum ex in ligula volutpat, nec fringilla quam aliquet. Nullam quis elit semper, molestie velit a, maximus sapien.\r\n\r\nCurabitur tempus egestas magna eget hendrerit. Morbi volutpat odio tellus, sed cursus mauris volutpat vitae. Nunc convallis pharetra erat vel commodo. Quisque faucibus consectetur est, nec luctus nisl tempor ac. Praesent suscipit quis risus malesuada lobortis. Sed sodales velit quis urna convallis, ac interdum libero condimentum. Mauris at dignissim risus, quis viverra enim. In hac habitasse platea dictumst. Integer pharetra, erat non cursus condimentum, erat est rutrum lorem, vitae convallis tortor nisl sit amet felis.\r\n\r\nNullam sit amet mauris ac nunc vulputate facilisis sed in augue. Nam vestibulum quam vitae scelerisque laoreet. Nullam et enim a dui dictum interdum. Nulla ipsum magna, lobortis in ipsum sit amet, condimentum aliquet metus. Sed nec rutrum nunc. In nulla est, interdum vitae ornare non, sagittis eget enim. Donec mattis diam nec leo posuere cursus. Vivamus justo tortor, dictum sed odio sed, bibendum facilisis sem. Mauris in nunc erat. Duis egestas est orci, non pharetra libero placerat id.\r\n\r\nMauris consectetur dui lobortis, euismod enim sit amet, maximus risus. Donec hendrerit, nulla at sagittis maximus, ipsum erat tincidunt eros, nec dictum nibh augue at nisl. In hac habitasse platea dictumst. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec mollis erat. Aenean ut lorem feugiat lacus tristique mollis sit amet quis neque. Suspendisse blandit viverra finibus. Nullam in ligula leo. Donec nisl metus, mollis a purus vehicula, bibendum accumsan turpis. In ultricies felis nec sem laoreet, eu ultricies mauris sollicitudin. Ut nulla turpis, pulvinar non gravida maximus, faucibus eleifend orci. Aenean blandit, tortor sodales mattis tristique, velit purus finibus ligula, sit amet commodo erat sapien et arcu. Aenean consequat urna in tristique tristique. Donec ac nisl lacinia, facilisis justo vitae, vehicula diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur ac turpis bibendum, fringilla enim eget, congue augue.\r\n\r\nVestibulum vel tellus a nibh tincidunt iaculis. Donec ullamcorper aliquam consequat. Aliquam rutrum posuere fringilla. Ut vel sapien tincidunt, feugiat augue nec, posuere massa. Maecenas viverra mauris est, commodo dictum ante vestibulum sed. Aliquam lobortis luctus risus, vitae eleifend quam pulvinar sed. Integer bibendum suscipit magna, quis egestas lorem elementum a. Maecenas tincidunt arcu odio, in mollis erat blandit eget.\r\n\r\nNunc vestibulum condimentum enim vitae laoreet. Vestibulum sapien sem, tristique ac lectus non, iaculis faucibus urna. Fusce rhoncus mattis suscipit. Vivamus tincidunt purus sed risus placerat, sodales finibus orci imperdiet. Phasellus varius eget tellus nec vestibulum. Mauris feugiat purus eu ante sodales, sed varius urna sagittis. Cras et nisi nibh.\r\n\r\nAenean sagittis lacus libero, ullamcorper bibendum quam condimentum et. Ut blandit sit amet nunc ut pellentesque. Integer sollicitudin eu odio id bibendum. Duis a nisi metus. Sed ut dapibus urna. Vivamus fringilla euismod justo, ac luctus est. Sed vestibulum, mi eget efficitur vestibulum, dui lectus hendrerit neque, et tincidunt diam odio elementum nunc. Nulla porta sapien elementum, porttitor justo non, aliquam mi. Sed ornare semper velit in semper. Nam dolor massa, accumsan et magna a, rhoncus consequat nibh. Aliquam faucibus turpis sed imperdiet tincidunt.\r\n\r\nProin rutrum dui vitae dignissim pretium. Quisque id vestibulum purus. Donec pharetra ac libero in scelerisque. Aenean ligula velit, tempor nec urna in, porttitor fringilla nibh. Nulla ultrices nibh interdum quam laoreet imperdiet. In imperdiet sapien ut lectus aliquet, non ultrices elit faucibus. Phasellus molestie, libero id tempus suscipit, ligula nunc vehicula ipsum, eget dignissim lectus est ut odio. Aenean ipsum elit, blandit eget felis eu, aliquet fermentum odio. Proin nulla metus, porta non massa molestie, posuere varius enim. Proin vel dictum orci. Nullam nec nisl at sem pellentesque venenatis eget sed justo. Aenean erat dolor, tincidunt sit amet auctor egestas, rhoncus vitae nunc. Cras interdum, est id finibus tempus, ligula turpis viverra tortor, at blandit metus elit ac ex. Nulla a ipsum accumsan, tempus leo ac, vehicula quam. Quisque scelerisque mi vitae urna ultricies, non imperdiet ligula sagittis.\r\n\r\nDuis ullamcorper neque eget quam vehicula commodo. Donec sed dictum velit. Donec lectus libero, tristique eget tellus eget, egestas sodales libero. Curabitur ex quam, condimentum sed lacus vitae, tincidunt posuere nibh. Donec porta metus quis turpis iaculis, vel dignissim risus aliquam. Aliquam mollis tempus ultricies. In fringilla metus in orci molestie sodales. Quisque suscipit mi sed neque tristique, sit amet varius orci vestibulum. Mauris vel est eu sem tincidunt ullamcorper quis quis justo. In vel aliquet purus, sed tempus turpis. Phasellus vulputate ac orci sed bibendum. Ut neque lacus, iaculis eu augue vitae, varius condimentum tortor. Curabitur congue est id molestie fermentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent ac lacus lectus. Donec ut malesuada sapien.\r\n\r\nPraesent porttitor elit non nisi porttitor luctus. Mauris quis orci id orci ornare viverra. Quisque pulvinar lorem sed mollis placerat. Praesent in eleifend arcu, ut tristique lorem. Proin gravida volutpat nunc, eu sodales eros pulvinar vitae. Ut vitae feugiat mi. Vivamus gravida justo sed dignissim aliquam. In porta enim sapien, ac tempor metus laoreet in. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed maximus cursus augue at faucibus.\r\n\r\nPhasellus vitae orci est. Mauris sed est non elit facilisis iaculis. Morbi in massa convallis, rhoncus enim sit amet, suscipit nisi. Integer consequat neque non quam feugiat varius. Mauris vel vehicula sem, nec consequat ex. Nullam interdum sapien a feugiat fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed nec arcu tincidunt, gravida massa a, semper odio. Donec efficitur consequat volutpat. Vestibulum dapibus ut metus nec convallis. Cras hendrerit dignissim nulla, eget vehicula justo volutpat quis. Proin gravida ipsum nisi, in accumsan augue condimentum non. Pellentesque elementum in dolor vitae rhoncus. Nulla luctus, massa ut posuere scelerisque, velit risus ornare arcu, eget cursus velit magna eu ex. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Praesent condimentum justo leo, eget gravida metus suscipit et. Vestibulum ornare iaculis elit, nec pulvinar purus ornare quis. Morbi efficitur pellentesque dignissim. Donec ac felis eros. Integer sagittis, diam ac convallis convallis, orci turpis lacinia nisl, eu fringilla quam arcu ac turpis. Mauris eros leo, condimentum in nibh eget, volutpat placerat risus. Curabitur in dui ut dolor tincidunt vehicula. Aenean ultrices pellentesque consequat. Phasellus dapibus eget purus eu finibus. Nulla semper ante odio, vitae hendrerit sem maximus non. Aenean nisi nibh, venenatis non imperdiet porta, sodales id ex. Pellentesque pellentesque imperdiet mi id gravida.\r\n\r\nNulla pulvinar arcu nisi, vulputate venenatis enim elementum vitae. Vivamus aliquam ut odio ut sollicitudin. Pellentesque magna turpis, aliquam et rhoncus vel, iaculis id ipsum. Praesent est sem, iaculis quis nisi sed, suscipit blandit elit. Etiam feugiat sem massa, ut gravida mi consectetur sed. Phasellus blandit placerat lacus in posuere. Donec a posuere ex. Mauris purus sapien, pellentesque sed varius sed, venenatis ut nulla. Etiam sagittis justo est, vel semper augue ornare eu.\r\n\r\nVivamus ultricies dolor at est tincidunt pellentesque. Aliquam metus dui, cursus quis pharetra sit amet, pretium sit amet diam. Phasellus vitae accumsan libero, et sollicitudin enim. Morbi est odio, ultrices quis bibendum eget, accumsan et urna. Quisque vulputate dapibus malesuada. Praesent lectus tortor, maximus quis suscipit ultricies, mollis a orci. Nullam lacus lacus, interdum nec magna nec, faucibus pharetra enim. Curabitur tincidunt velit non turpis vestibulum, vitae lobortis tortor blandit. In sit amet metus nec ex laoreet scelerisque. Cras faucibus mi consequat dui varius sagittis. Duis egestas venenatis nisl, nec gravida erat maximus in. Vestibulum at libero gravida, tincidunt urna eget, feugiat metus.\r\n\r\nUt consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.\r\n\r\nNulla ornare ornare blandit. Pellentesque ut nisi placerat, pharetra dolor ac, vehicula neque. Duis vitae lectus quis ex volutpat varius. Phasellus ultrices vel mauris ut rhoncus. Vestibulum viverra tortor elit, quis consequat metus eleifend sit amet. Maecenas non ligula volutpat, cursus arcu vel, tempor magna. Praesent vestibulum ante quis accumsan dignissim. Donec eu augue facilisis, commodo metus eget, vulputate leo. Nulla non commodo magna. Suspendisse eget tellus nec dui rhoncus auctor non id lorem.\r\n\r\nSed massa lectus, ultricies sit amet vulputate egestas, convallis ut ante. Etiam lacinia vitae felis sed condimentum. Vestibulum tempus in tortor sed malesuada. Mauris hendrerit ornare suscipit. Integer rutrum placerat dui, ut pretium tortor laoreet sed. Sed ac lacinia elit. Morbi congue, ante congue fringilla tincidunt, orci purus aliquam libero, eget mattis diam odio ac odio. Nulla eros leo, malesuada et eleifend maximus, convallis dapibus lacus. Morbi tempor vehicula cursus. Fusce tincidunt, dui nec auctor sagittis, arcu libero accumsan est, nec porttitor nisi quam ac ante. Nam pellentesque feugiat purus vitae rhoncus. Vestibulum tincidunt ac nisi ac sollicitudin. Aliquam id fermentum dolor. Vivamus malesuada dui eget dui aliquam placerat vitae id orci.\r\n\r\nProin imperdiet elit nibh, at commodo ipsum facilisis sit amet. Cras tincidunt aliquet purus ac luctus. Praesent viverra quis ipsum vel rhoncus. Duis eget quam vitae ipsum pulvinar viverra vitae nec libero. Quisque sodales orci orci, nec faucibus elit imperdiet malesuada. Integer egestas sapien ut turpis posuere luctus. Integer ut dolor at arcu fringilla convallis in vel purus. In hac habitasse platea dictumst. Etiam ut elit leo. Nullam semper consequat lorem. Quisque eleifend arcu id urna aliquet, id sodales purus feugiat. In aliquet lorem suscipit, hendrerit ex vel, aliquam ex.\r\n\r\nCurabitur consequat non purus vel porttitor. Cras ullamcorper sollicitudin magna sed gravida. Sed elementum sed ante ut tincidunt. In nec mi sodales, viverra risus eu, pellentesque tellus. Duis ornare eleifend metus vel mollis. Vivamus varius consectetur neque vitae pharetra. Mauris nec velit ut nunc efficitur lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nQuisque vel condimentum dui. Pellentesque id lorem massa\r\n', '/app/topics/1/1.jpg', '2021-02-09 14:38:23', '2021-02-09 14:38:23'),
(11, 1, 3, 1, 'fffffffffffffff', '<h2>asdasdasdasdsdasasdasd</h2><ul><li>sefaef</li><li>ef</li><li>aefeq</li><li>qe</li><li>f</li><li>qef</li><li>qe</li></ul><table class=\"table table-bordered\"><tbody><tr><td><br></td><td>fefe</td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td>efe</td><td><br></td><td><br></td><td><br></td></tr><tr><td><br></td><td><br></td><td><br></td><td><br></td><td><br></td></tr></tbody></table><ul><li><br></li></ul>', '/app/topics/fffffffffffffff.png', '2021-02-24 18:22:28', '2021-02-24 18:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `parenting_topic_categories`
--

DROP TABLE IF EXISTS `parenting_topic_categories`;
CREATE TABLE IF NOT EXISTS `parenting_topic_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_topic_categories`
--

INSERT INTO `parenting_topic_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Category 1', NULL, NULL),
(2, 'Category 2', NULL, NULL),
(3, 'Category 3', NULL, NULL),
(4, 'Category 4', NULL, NULL),
(5, 'Category 5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parenting_topic_statuses`
--

DROP TABLE IF EXISTS `parenting_topic_statuses`;
CREATE TABLE IF NOT EXISTS `parenting_topic_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parenting_topic_statuses`
--

INSERT INTO `parenting_topic_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Draft', '#284ec9', NULL, NULL),
(2, 'Under Review', '#c928c9', NULL, NULL),
(3, 'Published', '#4ec928', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `cost` double(8,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `cost`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Cash On Delivery', 0.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(2, 'browse_bread', NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(3, 'browse_database', NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(4, 'browse_media', NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(5, 'browse_compass', NULL, '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(6, 'browse_menus', 'menus', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(7, 'read_menus', 'menus', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(8, 'edit_menus', 'menus', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(9, 'add_menus', 'menus', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(10, 'delete_menus', 'menus', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(11, 'browse_roles', 'roles', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(12, 'read_roles', 'roles', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(13, 'edit_roles', 'roles', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(14, 'add_roles', 'roles', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(15, 'delete_roles', 'roles', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(16, 'browse_users', 'users', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(17, 'read_users', 'users', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(18, 'edit_users', 'users', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(19, 'add_users', 'users', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(20, 'delete_users', 'users', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(21, 'browse_settings', 'settings', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(22, 'read_settings', 'settings', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(23, 'edit_settings', 'settings', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(24, 'add_settings', 'settings', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(25, 'delete_settings', 'settings', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(26, 'browse_categories', 'categories', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(27, 'read_categories', 'categories', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(28, 'edit_categories', 'categories', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(29, 'add_categories', 'categories', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(30, 'delete_categories', 'categories', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(31, 'browse_posts', 'posts', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(32, 'read_posts', 'posts', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(33, 'edit_posts', 'posts', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(34, 'add_posts', 'posts', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(35, 'delete_posts', 'posts', '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(36, 'browse_pages', 'pages', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(37, 'read_pages', 'pages', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(38, 'edit_pages', 'pages', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(39, 'add_pages', 'pages', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(40, 'delete_pages', 'pages', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(41, 'browse_hooks', NULL, '2020-11-14 12:06:02', '2020-11-14 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-11-14 12:06:02', '2020-11-14 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `sku` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_section_id` int(11) NOT NULL,
  `product_category_id` int(11) NOT NULL,
  `product_sub_category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `min_age_id` int(11) NOT NULL,
  `max_age_id` int(11) NOT NULL,
  `thumbnail` text COLLATE utf8_unicode_ci,
  `product_running_cost_percentage_id` int(11) NOT NULL,
  `product_taxes_percentage` int(11) NOT NULL DEFAULT '14',
  `product_status_id` int(11) NOT NULL,
  `sold_timex` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `sku`, `product_section_id`, `product_category_id`, `product_sub_category_id`, `brand_id`, `gender_id`, `min_age_id`, `max_age_id`, `thumbnail`, `product_running_cost_percentage_id`, `product_taxes_percentage`, `product_status_id`, `sold_timex`, `created_at`, `updated_at`) VALUES
(1, 'Zara \r\n Basic T-shirt', 'Zara Basic T-shirt Full Description', 'HGJU543', 1, 1, 1, 1, 2, 1, 3, '/products/1/zara-tshirt-basic-thumbnail.jpg', 3, 14, 1, 5, NULL, NULL),
(2, 'Beone SP Group Baby Car Seat', 'Beone SP Group Baby Car SeatBeone SP Group Baby Car SeatBeone SP Group Baby Car SeatBeone SP Group Baby Car SeatBeone SP Group Baby Car SeatBeone SP Group Baby Car Seat', NULL, 4, 2, 2, 2, 4, 1, 4, '/products/2/img1.jpg', 3, 14, 1, 2, NULL, NULL),
(3, 'Slim Fit Jeans Pant For Men', 'Is Adult Product : 1\r\nTargeted Group : Men\r\nType : Jeans\r\nFabric Type : Denim\r\nMaterial Composition : 85.5% Cotton 13% Polyester 1.5% Elastane\r\nPants Style : Slim Fit\r\nBrand : Other', 'JJHGG7272', 1, 1, 4, 1, 2, 3, 8, NULL, 3, 14, 1, 0, NULL, NULL),
(4, 'P1', '<p>asdasdasdsad</p>', NULL, 1, 1, 1, 1, 1, 1, 1, NULL, 3, 14, 1, 0, '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(5, 'ejfjenfj', '<p>rrgrgj</p>', NULL, 1, 1, 4, 2, 1, 1, 1, NULL, 5, 14, 1, 0, '2021-01-20 21:33:07', '2021-01-20 21:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_section_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_section_id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Boy Wear', NULL, '/categories/boy_fashion.jpg', NULL, NULL),
(2, 4, 'Baby Gear', NULL, NULL, NULL, NULL),
(3, 2, 'Baby Essentials', 'Baby Essentials', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
CREATE TABLE IF NOT EXISTS `product_colors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_colors`
--

INSERT INTO `product_colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(0, 'None', '#ffffff', NULL, NULL),
(1, 'Black', '#111111', NULL, NULL),
(2, 'Blue', '#1b70f7', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_revenue_percentages`
--

DROP TABLE IF EXISTS `product_revenue_percentages`;
CREATE TABLE IF NOT EXISTS `product_revenue_percentages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `percent` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_revenue_percentages`
--

INSERT INTO `product_revenue_percentages` (`id`, `percent`, `status`, `created_at`, `updated_at`) VALUES
(0, 0, 1, NULL, NULL),
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rating` double(8,2) NOT NULL,
  `review` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_running_cost_percentages`
--

DROP TABLE IF EXISTS `product_running_cost_percentages`;
CREATE TABLE IF NOT EXISTS `product_running_cost_percentages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `percent` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_running_cost_percentages`
--

INSERT INTO `product_running_cost_percentages` (`id`, `percent`, `status`, `created_at`, `updated_at`) VALUES
(0, 0, 1, NULL, NULL),
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sections`
--

DROP TABLE IF EXISTS `product_sections`;
CREATE TABLE IF NOT EXISTS `product_sections` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_sections`
--

INSERT INTO `product_sections` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 'Clothes, Footwear, etc', '/sections/toys.jpg', NULL, NULL),
(2, 'Essentials', 'All Essentials stuff', '/sections/toys.jpg', NULL, NULL),
(3, 'Toys', 'Children Play toys', '/sections/toys.jpg', NULL, NULL),
(4, 'Gears', 'Babay and children gears', '/sections/toys.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
CREATE TABLE IF NOT EXISTS `product_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `name`, `short_name`, `sub_category_id`, `created_at`, `updated_at`) VALUES
(0, 'Standard', 'STD', 0, NULL, NULL),
(1, 'Small', 'S', 1, NULL, NULL),
(2, 'Medium', 'M', 1, NULL, NULL),
(3, 'Large', 'L', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_statuses`
--

DROP TABLE IF EXISTS `product_statuses`;
CREATE TABLE IF NOT EXISTS `product_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_statuses`
--

INSERT INTO `product_statuses` (`id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Active', 'green', NULL, NULL),
(2, 'Draft', 'orange', NULL, NULL),
(3, 'Disabled', 'gray', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_categories`
--

DROP TABLE IF EXISTS `product_sub_categories`;
CREATE TABLE IF NOT EXISTS `product_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_sub_categories`
--

INSERT INTO `product_sub_categories` (`id`, `product_category_id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'T-Shirts', NULL, '/subcategories/t-shirts.jpg', NULL, NULL),
(2, 2, 'Car Seats', NULL, '/subcategories/t-shirts.jpg', NULL, NULL),
(3, 3, 'Baby Diapers', 'Baby Diapers', '/subcategories/t-shirts.jpg', NULL, NULL),
(4, 1, 'Pants', 'pants', '/subcategories/t-shirts.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
CREATE TABLE IF NOT EXISTS `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

DROP TABLE IF EXISTS `product_variants`;
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_color_id` int(11) NOT NULL,
  `product_size_id` int(11) NOT NULL,
  `dimensions` text COLLATE utf8_unicode_ci,
  `weight` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `product_color_id`, `product_size_id`, `dimensions`, `weight`, `sku`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '25x25', '0.5', 'FFDDSS', NULL, '2021-01-10 12:57:01'),
(2, 1, 1, 2, '25x25', '0.5', 'FFDDSS', NULL, NULL),
(3, 1, 1, 3, '25x25', '0.5', 'FFDDSS', NULL, NULL),
(4, 1, 2, 1, '25x25', '0.5', 'FFDDSS', NULL, NULL),
(5, 1, 2, 2, '25x25', '0.5', 'FFDDSS', NULL, NULL),
(6, 1, 2, 3, '25x25', '0.5', 'FFDDSS', NULL, NULL),
(9, 2, 1, 0, '60x80', '5', 'KKKJHT76', NULL, '2021-01-10 13:15:59'),
(10, 3, 0, 0, '60x80', '0.5', 'KKKJHT76', NULL, NULL),
(11, 4, 1, 1, '1x1x1', '5', NULL, '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(12, 5, 2, 2, 'xx', NULL, NULL, '2021-01-20 21:33:07', '2021-01-20 21:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_images`
--

DROP TABLE IF EXISTS `product_variant_images`;
CREATE TABLE IF NOT EXISTS `product_variant_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_variant_id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variant_images`
--

INSERT INTO `product_variant_images` (`id`, `product_variant_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '/products/1/zara-tshirt-basic-black-1.jpg', NULL, NULL),
(2, 2, '/products/1/zara-tshirt-basic-black-1.jpg', NULL, NULL),
(3, 3, '/products/1/zara-tshirt-basic-black-1.jpg', NULL, NULL),
(5, 1, '/products/1/zara-tshirt-basic-black-2.jpg', NULL, NULL),
(6, 2, '/products/1/zara-tshirt-basic-black-2.jpg', NULL, NULL),
(7, 3, '/products/1/zara-tshirt-basic-black-2.jpg', NULL, NULL),
(8, 4, '/products/1/zara-tshirt-basic-blue-1.jpg', NULL, NULL),
(9, 5, '/products/1/zara-tshirt-basic-blue-1.jpg', NULL, NULL),
(10, 6, '/products/1/zara-tshirt-basic-blue-1.jpg', NULL, NULL),
(11, 4, '/products/1/zara-tshirt-basic-blue-2.jpg', NULL, NULL),
(12, 5, '/products/1/zara-tshirt-basic-blue-2.jpg', NULL, NULL),
(13, 6, '/products/1/zara-tshirt-basic-blue-2.jpg', NULL, NULL),
(14, 9, '/products/2/img1.jpg', NULL, NULL),
(15, 10, '/products/3/pants.jpg', NULL, NULL),
(23, 11, '/app/products/4/11/11_download.jpg', '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(24, 11, '/app/products/4/11/11_gta_cars_logo.png', '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(25, 11, '/app/products/4/11/11_logo.png', '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(26, 12, '/app/products/5/12/12_download.jpg', '2021-01-20 21:33:07', '2021-01-20 21:33:07'),
(27, 12, '/app/products/5/12/12_gta_cars_logo.png', '2021-01-20 21:33:07', '2021-01-20 21:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_stocks`
--

DROP TABLE IF EXISTS `product_variant_stocks`;
CREATE TABLE IF NOT EXISTS `product_variant_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `product_revenue_percentage_id` int(11) NOT NULL,
  `our_discount_percentage` float NOT NULL DEFAULT '0',
  `vendor_discount_percentage` float NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_variant_stocks`
--

INSERT INTO `product_variant_stocks` (`id`, `product_id`, `product_variant_id`, `vendor_id`, `stock`, `price`, `product_revenue_percentage_id`, `our_discount_percentage`, `vendor_discount_percentage`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 100.00, 15, 5, 10, NULL, '2021-01-12 18:36:19'),
(2, 1, 1, 1, 30, 110.00, 6, 0, 0, NULL, NULL),
(3, 1, 1, 1, 10, 120.00, 6, 0, 0, NULL, NULL),
(4, 1, 1, 1, 70, 130.00, 6, 0, 0, NULL, NULL),
(5, 1, 1, 1, 67, 140.00, 6, 0, 0, NULL, NULL),
(6, 1, 1, 1, 90, 150.00, 10, 0, 0, NULL, NULL),
(7, 1, 4, 1, 90, 155.00, 6, 0, 0, NULL, NULL),
(9, 2, 9, 1, 4, 1200.00, 3, 0, 0, NULL, NULL),
(10, 3, 10, 1, 1, 100.00, 12, 0, 0, NULL, NULL),
(11, 2, 9, 1, 50, 1300.00, 3, 0, 0, NULL, NULL),
(12, 1, 1, 1, 5, 30.00, 1, 3, 2, '2021-01-12 19:16:45', '2021-01-12 19:16:45'),
(13, 1, 6, 1, 11, 123.00, 1, 1, 1, '2021-01-12 19:20:00', '2021-01-12 19:20:00'),
(14, 4, 11, 1, 123, 123.00, 14, 0, 0, '2021-01-18 16:03:44', '2021-01-18 16:03:44'),
(15, 5, 12, 1, 5, 100.00, 13, 0, 0, '2021-01-20 21:33:07', '2021-01-20 21:33:07'),
(16, 5, 12, 1, 100, 200.00, 10, 0, 0, '2021-01-20 21:34:05', '2021-01-20 21:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Cairo', NULL, NULL),
(2, 'Giza', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(2, 'user', 'Normal User', '2020-11-14 12:06:00', '2020-11-14 12:06:00'),
(100, 'customer', 'Customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin'),
(11, 'admin.free_shipping_min_total', 'Free Shipping Minimum Total', '500', NULL, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE IF NOT EXISTS `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `days_info` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `days_min` int(11) NOT NULL,
  `days_max` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `free_shipping` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `details`, `days_info`, `days_min`, `days_max`, `price`, `free_shipping`, `created_at`, `updated_at`) VALUES
(2, 'Primum Plan', 'Primum', '3-6 Days', 3, 6, 25.00, 0, NULL, NULL),
(3, 'Elite Plan', '1 Day', '1-2 Days', 1, 2, 50.00, 0, NULL, NULL),
(4, 'Same Day', 'Same Day', 'Same Day', 0, 0, 75.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

DROP TABLE IF EXISTS `shipping_types`;
CREATE TABLE IF NOT EXISTS `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_days` int(11) NOT NULL,
  `fee` double(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `name`, `shipping_days`, `fee`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Standard', 7, 30.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
CREATE TABLE IF NOT EXISTS `translations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-11-14 12:06:02', '2020-11-14 12:06:02'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-11-14 12:06:02', '2020-11-14 12:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED DEFAULT '100',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `bio` text COLLATE utf8_unicode_ci,
  `birthdate` date DEFAULT NULL,
  `have_children` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `last_name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `bio`, `birthdate`, `have_children`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'admin@admin.com', '/users/default.png', NULL, '$2y$10$tt8PYvmyqrN3oP15d3VCpORXLC8XcS5Y5hT4RT/no.juQqHoTwpra', 'Zgh3E3p0cfQChaoHOQXtr6eOlG4ftP7NYdUO2cIHooO9ogaGzZ5S7m34jp5a', NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(4, 2, 'Omar', 'Ibrahim', 'omar@live.com', '/users/default.png', NULL, '$2y$10$0fNi9u6y/w114OFNpHsOD.9wb/ZDuVnxr7hovMouLA84bV9tZEwym', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, \r\n\r\n', NULL, 0, '2020-12-05 15:32:52', '2020-12-05 15:32:52'),
(5, 2, 'asdasd', NULL, 'asdasd@asdasd.com', '/users/default.png', NULL, '$2y$10$MWgGytw/VRQ3l6uvvPwgUedBM4CyMGPz4tN8RH.SmY28/H6CozYSm', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-05 15:37:23', '2020-12-05 15:37:23'),
(6, 2, 'qweqwe', NULL, 'ascweeq@asdasd.com', '/users/default.png', NULL, '$2y$10$1Rr3YiWQReKYb23MITjcjeWfY1p/HTwzfJfigqACf1rff/zJdt4A.', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-05 15:38:54', '2020-12-05 15:38:54'),
(7, 2, 'uibyivi', NULL, 'ibiubiu@asda.com', '/users/default.png', NULL, '$2y$10$rCBZsrRsG..fSzp0x2SSEOYMzr/AUoxSUk/sZGkG7eoN6QHIobivm', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-05 15:45:29', '2020-12-05 15:45:29'),
(8, 100, 'zczcx', NULL, 'fknvfub@asdasd.com', '/users/default.png', NULL, '$2y$10$GHigtvJ4tSWbf0b/V8xZpezdgYZqsKnqPOzMDkdV0h5MTpc9HK2eG', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-05 16:03:32', '2020-12-05 16:03:32'),
(9, 100, 'El -', 'Jumbo', 'jumbo@live.com', '/users/default.png', NULL, '$2y$10$DhjISuZcveu5RQDiTsxfUu0DA3htso8Eofw7wywTxtqoDgAGJGtP.', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-13 15:34:39', '2020-12-13 15:34:39'),
(10, 100, 'Jumbozo', 'Jumbozo', 'jumbozo@live.com', '/users/default.png', NULL, '$2y$10$QDULDtbWOSngStEPg7zVgOJ/FItepZvt/DubWzAc6p/bkqj/5ozMu', NULL, NULL, 'Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut faucibus purus eu mauris egestas dictum. Etiam rutrum erat in magna auctor, vel vulputate diam rhoncus. Donec at pharetra dolor. Pellentesque venenatis tortor ac elit maximus bibendum. Sed sollicitudin sapien sed quam egestas suscipit. Morbi sed imperdiet leo. Nam sodales sapien nec libero laoreet, in mollis arcu vehicula. Aliquam eu nisl pharetra, consequat mi eu, finibus ligula. Nulla nec felis dui.Ut consequat nisl et neque congue hendrerit. Aenean eget odio enim. Duis lacus elit, auctor id porta ut, suscipit vitae tellus. Quisque imperdiet sed massa id iaculis. Nam est orci, auctor id nunc eu, sollicitudin lobortis magna. Ut', NULL, 0, '2020-12-13 15:39:57', '2020-12-13 15:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE IF NOT EXISTS `user_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `default_select` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `region_id`, `city_id`, `address`, `default_select`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '22 Ali ameen st, 1st floor apt 2', 1, NULL, '2020-12-13 15:17:10'),
(2, 1, 2, 3, 'address2address2address2address2, address2', 0, NULL, '2020-12-13 15:13:10'),
(3, 1, 2, 3, 'address3address3address3address3, address3', 0, NULL, '2020-12-13 15:17:10'),
(6, 9, 1, 1, 'jumbo address', 1, NULL, NULL),
(7, 4, 1, 1, 'asdadsasd', 1, '2020-12-13 17:13:22', '2020-12-13 17:13:22'),
(8, 4, 1, 1, 'asdadsasd', 1, '2020-12-13 17:13:37', '2020-12-13 17:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `user_cart_items`
--

DROP TABLE IF EXISTS `user_cart_items`;
CREATE TABLE IF NOT EXISTS `user_cart_items` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `product_variant_stock_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_cart_items`
--

INSERT INTO `user_cart_items` (`id`, `user_id`, `product_id`, `product_variant_id`, `product_variant_stock_id`, `quantity`, `created_at`, `updated_at`) VALUES
(33, 10, 1, 1, 1, 5, '2020-12-27 18:50:04', '2020-12-27 18:50:04'),
(34, 10, 2, 9, 9, 3, '2020-12-27 18:50:16', '2020-12-27 18:50:16'),
(35, 10, 3, 10, 10, 8, '2020-12-27 18:50:30', '2020-12-27 18:50:30'),
(36, 1, 1, 1, 12, 1, '2021-02-08 15:54:11', '2021-02-08 15:54:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_children`
--

DROP TABLE IF EXISTS `user_children`;
CREATE TABLE IF NOT EXISTS `user_children` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_children`
--

INSERT INTO `user_children` (`id`, `user_id`, `gender_id`, `name`, `birthday`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Jumbo Junior', '2020-08-26', NULL, NULL),
(2, 1, 1, 'Baby Jumbo', '2020-12-12', '2021-02-24 16:01:07', '2021-02-24 16:21:48'),
(3, 10, 1, 'Baby Jumbo', '2020-12-12', '2021-02-24 17:29:17', '2021-02-24 17:29:17');

-- --------------------------------------------------------

--
-- Table structure for table `user_discounts`
--

DROP TABLE IF EXISTS `user_discounts`;
CREATE TABLE IF NOT EXISTS `user_discounts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_discounts`
--

INSERT INTO `user_discounts` (`id`, `user_id`, `percentage`, `description`, `used`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Sign Up Discount', 1, NULL, NULL, NULL),
(2, 1, 2, 'After Problem Discount', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_discount_codes`
--

DROP TABLE IF EXISTS `user_discount_codes`;
CREATE TABLE IF NOT EXISTS `user_discount_codes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `discount_code_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_discount_codes`
--

INSERT INTO `user_discount_codes` (`id`, `user_id`, `discount_code_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL),
(2, 1, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_phones`
--

DROP TABLE IF EXISTS `user_phones`;
CREATE TABLE IF NOT EXISTS `user_phones` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_status` int(11) DEFAULT NULL,
  `default_select` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_phones`
--

INSERT INTO `user_phones` (`id`, `user_id`, `phone`, `confirmation_code`, `confirmation_status`, `default_select`, `created_at`, `updated_at`) VALUES
(1, 1, '01114030995', NULL, 0, 0, NULL, '2020-12-10 12:21:09'),
(2, 1, '01111111111', NULL, 0, 0, NULL, NULL),
(3, 1, '02222222222', NULL, 0, 0, NULL, NULL),
(4, 1, '222222222222', NULL, 0, 0, '2020-12-10 12:21:09', '2020-12-10 12:21:23'),
(5, 1, '5555555555555555', NULL, 0, 1, '2020-12-10 12:21:23', '2020-12-10 12:21:23'),
(6, 10, '77777777777777', NULL, 0, 1, NULL, NULL),
(7, 4, '99999999999999', NULL, NULL, 1, '2020-12-13 17:13:37', '2020-12-13 17:13:37'),
(8, 9, '55555555555555', NULL, NULL, 1, '2020-12-16 20:21:18', '2020-12-16 20:21:18');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `vendor_type_id` int(11) NOT NULL,
  `vendor_field_type` int(11) NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `maps_link` text COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `vendor_type_id`, `vendor_field_type`, `address`, `maps_link`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Jumbo Stores', 1, 1, ' vendor adress, vendor adress, Cairo', 'wefwefwefe.com', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_contacts`
--

DROP TABLE IF EXISTS `vendor_contacts`;
CREATE TABLE IF NOT EXISTS `vendor_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendor_contacts`
--

INSERT INTO `vendor_contacts` (`id`, `vendor_id`, `name`, `title`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'Omar Ibrahim', 'Manager', '01114030995', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_field_types`
--

DROP TABLE IF EXISTS `vendor_field_types`;
CREATE TABLE IF NOT EXISTS `vendor_field_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendor_field_types`
--

INSERT INTO `vendor_field_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Supplier', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_types`
--

DROP TABLE IF EXISTS `vendor_types`;
CREATE TABLE IF NOT EXISTS `vendor_types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendor_types`
--

INSERT INTO `vendor_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Statndard', NULL, NULL),
(2, 'Sponser', NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
