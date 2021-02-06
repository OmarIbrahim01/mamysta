-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 06, 2021 at 02:10 PM
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
(1, 'Mom', NULL, NULL),
(2, 'Boy', NULL, NULL),
(3, 'Girl', NULL, NULL),
(4, 'Unisex', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(63, '2020_12_21_203424_create_user_discounts_table', 13);

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `last_name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$tt8PYvmyqrN3oP15d3VCpORXLC8XcS5Y5hT4RT/no.juQqHoTwpra', '1Tr28hot8FoRqV6BC7pQFw7AQYaNxAKat6p6BpTMgArNrknljcFxVKCYmjRj', NULL, '2020-11-14 12:06:01', '2020-11-14 12:06:01'),
(4, 2, 'Omar', NULL, 'omar@live.com', 'users/default.png', NULL, '$2y$10$0fNi9u6y/w114OFNpHsOD.9wb/ZDuVnxr7hovMouLA84bV9tZEwym', NULL, NULL, '2020-12-05 15:32:52', '2020-12-05 15:32:52'),
(5, 2, 'asdasd', NULL, 'asdasd@asdasd.com', 'users/default.png', NULL, '$2y$10$MWgGytw/VRQ3l6uvvPwgUedBM4CyMGPz4tN8RH.SmY28/H6CozYSm', NULL, NULL, '2020-12-05 15:37:23', '2020-12-05 15:37:23'),
(6, 2, 'qweqwe', NULL, 'ascweeq@asdasd.com', 'users/default.png', NULL, '$2y$10$1Rr3YiWQReKYb23MITjcjeWfY1p/HTwzfJfigqACf1rff/zJdt4A.', NULL, NULL, '2020-12-05 15:38:54', '2020-12-05 15:38:54'),
(7, 2, 'uibyivi', NULL, 'ibiubiu@asda.com', 'users/default.png', NULL, '$2y$10$rCBZsrRsG..fSzp0x2SSEOYMzr/AUoxSUk/sZGkG7eoN6QHIobivm', NULL, NULL, '2020-12-05 15:45:29', '2020-12-05 15:45:29'),
(8, 100, 'zczcx', NULL, 'fknvfub@asdasd.com', 'users/default.png', NULL, '$2y$10$GHigtvJ4tSWbf0b/V8xZpezdgYZqsKnqPOzMDkdV0h5MTpc9HK2eG', NULL, NULL, '2020-12-05 16:03:32', '2020-12-05 16:03:32'),
(9, 100, 'El -', NULL, 'jumbo@live.com', 'users/default.png', NULL, '$2y$10$DhjISuZcveu5RQDiTsxfUu0DA3htso8Eofw7wywTxtqoDgAGJGtP.', NULL, NULL, '2020-12-13 15:34:39', '2020-12-13 15:34:39'),
(10, 100, 'Jumbozo', NULL, 'jumbozo@live.com', 'users/default.png', NULL, '$2y$10$QDULDtbWOSngStEPg7zVgOJ/FItepZvt/DubWzAc6p/bkqj/5ozMu', NULL, NULL, '2020-12-13 15:39:57', '2020-12-13 15:39:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_cart_items`
--

INSERT INTO `user_cart_items` (`id`, `user_id`, `product_id`, `product_variant_id`, `product_variant_stock_id`, `quantity`, `created_at`, `updated_at`) VALUES
(33, 10, 1, 1, 1, 5, '2020-12-27 18:50:04', '2020-12-27 18:50:04'),
(34, 10, 2, 9, 9, 3, '2020-12-27 18:50:16', '2020-12-27 18:50:16'),
(35, 10, 3, 10, 10, 8, '2020-12-27 18:50:30', '2020-12-27 18:50:30');

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
