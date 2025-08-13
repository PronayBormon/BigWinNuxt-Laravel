-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 02:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigwin_backend`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('image','video') NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `type`, `file_path`, `created_at`, `updated_at`) VALUES
(1, 'Itaque a aut ratione', 'image', 'ads/1750176633.png', '2025-06-17 16:10:33', '2025-06-17 16:10:33'),
(3, 'Dolore similique rer', 'image', 'ads/1750176677.jpeg', '2025-06-17 16:11:17', '2025-06-17 16:11:17'),
(4, 'jjj', 'video', 'ads/1752600170.mp4', '2025-07-15 17:22:50', '2025-07-15 17:22:50'),
(6, 'Tempor aut amet tem', 'image', 'ads/1753288869.jpg', '2025-07-23 16:41:09', '2025-07-23 16:41:09'),
(7, 'sadfsd', 'video', 'ads/1753445093.mp4', '2025-07-25 12:04:53', '2025-07-25 12:04:53'),
(8, 'Dolorum animi expli', 'image', 'ads/1753445364.jpg', '2025-07-25 12:09:24', '2025-07-25 12:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `user_id`, `question_id`, `option_id`, `created_at`, `updated_at`) VALUES
(4, 2, 1, 1, '2025-06-17 13:30:45', '2025-06-17 13:30:45'),
(5, 3, 1, 4, '2025-06-18 14:46:06', '2025-06-18 14:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `ballerresult`
--

CREATE TABLE `ballerresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `over` int(11) DEFAULT NULL,
  `maden_over` int(11) DEFAULT NULL,
  `run` int(11) DEFAULT NULL,
  `wicket` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ballerresult`
--

INSERT INTO `ballerresult` (`id`, `match_id`, `team_id`, `player_id`, `over`, `maden_over`, `run`, `wicket`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 0, 0, 97, 88, '2025-06-03 16:06:23', '2025-06-03 16:06:23'),
(2, 1, 2, 30, NULL, NULL, 1, 1, '2025-07-12 17:38:05', '2025-07-12 17:38:05'),
(3, 1, 2, 29, NULL, NULL, 1, 1, '2025-07-27 12:59:19', '2025-07-27 12:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `batsman`
--

CREATE TABLE `batsman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `run` int(11) NOT NULL DEFAULT 0,
  `ball` int(11) NOT NULL DEFAULT 0,
  `total_4` int(11) NOT NULL DEFAULT 0,
  `total_6` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batsman`
--

INSERT INTO `batsman` (`id`, `match_id`, `team_id`, `player_id`, `user_id`, `run`, `ball`, `total_4`, `total_6`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 69, 0, 0, 24, '0', '2025-06-03 15:16:38', '2025-06-03 15:16:38'),
(2, 1, 1, 1, 2, 50, 0, 0, 100, '0', '2025-06-17 13:24:25', '2025-06-17 13:24:25'),
(3, 1, 1, 2, 2, 50, 0, 0, 100, '0', '2025-06-17 13:24:29', '2025-06-17 13:24:29'),
(4, 1, 2, 19, 3, 94, 0, 0, 17, '0', '2025-06-18 15:34:08', '2025-06-18 15:34:08'),
(5, 1, 2, 28, 4, 92, 0, 0, 76, '0', '2025-06-18 15:34:25', '2025-06-18 15:34:25');

-- --------------------------------------------------------

--
-- Table structure for table `batsmanresult`
--

CREATE TABLE `batsmanresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `run` int(11) DEFAULT NULL,
  `ball` int(11) DEFAULT NULL,
  `total_4` int(11) DEFAULT NULL,
  `total_6` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `batsmanresult`
--

INSERT INTO `batsmanresult` (`id`, `match_id`, `team_id`, `player_id`, `run`, `ball`, `total_4`, `total_6`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 69, 0, 0, 24, '2025-06-03 15:20:54', '2025-06-03 15:20:54'),
(2, 1, 2, 30, 2, NULL, NULL, 2, '2025-07-12 17:38:17', '2025-07-12 17:38:17'),
(3, 1, 2, 29, 1, NULL, NULL, 1, '2025-07-27 12:59:11', '2025-07-27 12:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `big_shorts`
--

CREATE TABLE `big_shorts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_one` int(11) DEFAULT NULL,
  `team_two` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `boller`
--

CREATE TABLE `boller` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `over` int(11) DEFAULT NULL,
  `maden_over` int(11) NOT NULL DEFAULT 0,
  `run` int(11) NOT NULL DEFAULT 0,
  `wicket` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boller`
--

INSERT INTO `boller` (`id`, `match_id`, `team_id`, `user_id`, `player_id`, `over`, `maden_over`, `run`, `wicket`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 1, NULL, 0, 97, 88, 1, '2025-06-03 15:16:28', '2025-06-03 15:16:28'),
(2, 1, 1, 2, 11, NULL, 0, 2, 3, 1, '2025-06-17 13:24:07', '2025-06-17 13:24:07'),
(3, 1, 1, 2, 1, NULL, 0, 2, 3, 1, '2025-06-17 13:24:13', '2025-06-17 13:24:13'),
(4, 1, 2, 2, 22, NULL, 0, 19, 47, 1, '2025-06-18 15:34:42', '2025-06-18 15:34:42'),
(5, 1, 1, 4, 5, NULL, 0, 64, 12, 1, '2025-06-18 15:34:54', '2025-06-18 15:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `champion`
--

CREATE TABLE `champion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `mom` int(11) DEFAULT NULL,
  `mot` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `champion`
--

INSERT INTO `champion` (`id`, `user_id`, `match_id`, `team_id`, `mom`, `mot`, `created_at`, `updated_at`) VALUES
(11, 3, 2, 9, NULL, 121, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(12, 2, 2, 9, NULL, 121, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(13, 1, 2, 9, NULL, 121, '2025-06-20 14:46:07', '2025-06-20 14:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `championresult`
--

CREATE TABLE `championresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `mom` int(11) DEFAULT NULL,
  `mot` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `championresult`
--

INSERT INTO `championresult` (`id`, `match_id`, `team_id`, `mom`, `mot`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 121, 121, '2025-06-20 14:40:21', '2025-06-20 14:40:21'),
(2, 1, 3, NULL, 109, '2025-06-24 14:48:54', '2025-06-24 14:48:54'),
(3, 3, 17, NULL, 250, '2025-07-27 13:09:00', '2025-07-27 13:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `page`, `section`, `title`, `description`, `image`, `video`, `url`, `created_at`, `updated_at`) VALUES
(1, 'singleMatchPage', NULL, NULL, NULL, 'cms/1753284598.jpg', NULL, NULL, '2025-06-18 15:40:13', '2025-07-23 15:29:58'),
(2, 'maxpredictPage', NULL, NULL, NULL, 'cms/1753285508.jpg', NULL, NULL, '2025-06-18 16:04:55', '2025-07-23 15:45:08'),
(3, 'walletPage', NULL, NULL, NULL, 'cms/1753285467.jpg', NULL, NULL, '2025-06-18 16:05:38', '2025-07-23 15:44:27'),
(4, 'winnerPage', NULL, NULL, NULL, 'cms/1753285456.jpg', NULL, NULL, '2025-06-18 16:05:47', '2025-07-23 15:44:16'),
(5, 'profilePage', NULL, NULL, NULL, 'cms/1753285567.jpg', NULL, NULL, '2025-06-18 16:05:53', '2025-07-23 15:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(48, 'India', '183903118.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(49, 'Pakistan', '1221114629.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(50, 'Australia', '86463351.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(51, 'England', '28099063.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(52, 'West Indies', '1638743264.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(53, 'South Africa', '2117990730.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(54, 'New Zealand', '1467618457.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(55, 'Sri Lanka', '508868760.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(56, 'Bangladesh', '198824309.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(57, 'Afghanistan', '2013001144.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(58, 'Zimbabwe', '1314592742.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(59, 'Ireland', '1365042192.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(60, 'Scotland', '29602780.jpg', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(61, 'Netherlands', '1386039070.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(62, 'Namibia', '1062870303.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(63, 'UAE', '820332060.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(65, 'Nepal', '1071760655.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(66, 'USA', '1672732692.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(67, 'Oman', '2053599473.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(68, 'PNG', '955292146.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(69, 'Canada', '813515040.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(70, 'Lahore Qalandars', '1235794920.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(71, 'Karachi Kings', '1413710988.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(72, 'Islamabad United', '658878190.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(73, 'Peshawar Zalmi', '700357201.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(74, 'Quetta Gladiators', '310917500.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(75, 'Multan Sultans', '20888909.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(76, 'Sydney Sixers', '847026229.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(77, 'Sydney Thunder', '1743476068.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(78, 'Melbourne Stars', '1889465609.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(79, 'Melbourne Renegades', '80649637.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(80, 'Brisbane Heat', '1200610315.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(81, 'Adelaide Strikers', '1595626676.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(82, 'Perth Scorchers', '1992450081.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30'),
(83, 'Hobart Hurricanes', '1625087571.png', 1, '2025-06-02 17:47:57', '2025-08-04 16:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `credits`
--

CREATE TABLE `credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credits`
--

INSERT INTO `credits` (`id`, `user_id`, `name`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'dfd', 38.00, 1, '2025-06-17 16:15:25', '2025-06-17 16:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_pages`
--

CREATE TABLE `dynamic_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dynamic_pages`
--

INSERT INTO `dynamic_pages` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Rules', 'rules', '<p>How it works</p><p><br></p>', '2025-08-04 16:32:31', '2025-08-07 17:52:21'),
(2, 'App Link', 'app-link', 'App Link message here', '2025-08-04 16:32:31', '2025-08-07 17:36:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finalist`
--

CREATE TABLE `finalist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_one` int(11) DEFAULT NULL,
  `team_two` int(11) DEFAULT NULL,
  `hwt` int(11) DEFAULT NULL,
  `hs` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finalist`
--

INSERT INTO `finalist` (`id`, `user_id`, `match_id`, `team_one`, `team_two`, `hwt`, `hs`, `status`, `created_at`, `updated_at`) VALUES
(12, 3, 2, 9, 10, 121, 121, 1, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(13, 2, 2, 9, 10, 121, 121, 1, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(14, 1, 2, 9, 10, 121, 121, 1, '2025-06-20 14:46:07', '2025-06-20 14:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `finalistresult`
--

CREATE TABLE `finalistresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_one` int(11) DEFAULT NULL,
  `team_two` int(11) DEFAULT NULL,
  `hwt` int(11) DEFAULT NULL,
  `hs` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `finalistresult`
--

INSERT INTO `finalistresult` (`id`, `match_id`, `team_one`, `team_two`, `hwt`, `hs`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 9, 10, 121, 121, 1, '2025-06-20 14:40:11', '2025-06-20 14:40:11'),
(2, 1, 4, 5, 121, 9, 1, '2025-06-24 14:48:47', '2025-06-24 14:48:47'),
(3, 3, 17, 17, NULL, 247, 1, '2025-07-27 13:17:32', '2025-07-27 13:17:32');

-- --------------------------------------------------------

--
-- Table structure for table `linkads`
--

CREATE TABLE `linkads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creadit` int(11) DEFAULT NULL,
  `links` text DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `linkads`
--

INSERT INTO `linkads` (`id`, `creadit`, `links`, `comments`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://pronay.top/', 'comments here', 'active', '2025-06-17 16:16:45', '2025-06-17 16:16:45'),
(2, 800, 'https://www.fifafetypa.cm', 'Reiciendis dolores e', 'active', '2025-06-18 16:26:14', '2025-06-18 16:26:14'),
(3, 99, 'https://www.meqozegudiju.net', 'Obcaecati ducimus v', 'inactive', '2025-06-18 16:30:28', '2025-07-23 16:55:42'),
(4, 4, 'https://www.kevosi.me.uk', 'Necessitatibus reici', 'active', '2025-07-23 16:55:50', '2025-07-23 16:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `match_list`
--

CREATE TABLE `match_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_a` int(11) DEFAULT NULL,
  `team_b` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `match_type` int(11) DEFAULT NULL COMMENT '1=oneday, 2= t20, 3=championship, 4=test, 5=worldcup',
  `game_type` varchar(255) DEFAULT NULL COMMENT 'football,cricket,buscatball,tanis',
  `status` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `match_list`
--

INSERT INTO `match_list` (`id`, `team_a`, `team_b`, `time`, `match_type`, `game_type`, `status`, `image`, `created_at`, `updated_at`, `end_date`) VALUES
(1, 73, 70, '2025-06-03 11:01:00', 1, '1', 2, 'uploads/1748963442.png', '2025-06-03 15:10:42', '2025-06-22 15:31:07', '2025-10-03 11:11:00'),
(2, 50, 48, '2025-06-22 14:32:00', 1, '1', 1, 'uploads/1750584596.png', '2025-06-22 15:29:56', '2025-06-24 19:27:01', '2025-07-12 14:28:00'),
(3, 81, 56, '2222-02-22 22:22:00', 1, '1', 2, 'uploads/1753618623.png', '2025-07-27 12:17:03', '2025-07-27 13:23:04', '2222-02-22 22:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `match_report`
--

CREATE TABLE `match_report` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `match_id` int(11) DEFAULT NULL,
  `predict_team_id` int(11) DEFAULT NULL,
  `predict_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `match_report`
--

INSERT INTO `match_report` (`id`, `user_id`, `match_id`, `predict_team_id`, `predict_status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 73, NULL, '2025-06-04 17:13:46', '2025-06-04 17:13:46'),
(2, 4, 1, 70, NULL, '2025-06-18 15:30:46', '2025-06-18 15:30:46'),
(3, 3, 1, 73, NULL, '2025-06-18 15:31:07', '2025-06-18 15:31:07'),
(4, 5, 3, 10, NULL, '2025-06-22 18:21:36', '2025-06-22 18:21:36'),
(5, 2, 2, 50, NULL, '2025-06-22 22:58:55', '2025-06-22 22:58:55'),
(6, 6, 2, 50, NULL, '2025-06-24 19:27:15', '2025-06-24 19:27:15'),
(7, 7, 2, 48, NULL, '2025-06-24 19:35:29', '2025-06-24 19:35:29'),
(8, 8, 2, 48, NULL, '2025-06-24 19:38:46', '2025-06-24 19:38:46'),
(9, 9, 2, 50, NULL, '2025-06-24 19:40:10', '2025-06-24 19:40:10'),
(10, 10, 2, 50, NULL, '2025-06-24 19:42:43', '2025-06-24 19:42:43'),
(11, 11, 2, 50, NULL, '2025-06-24 13:58:49', '2025-06-24 13:58:49'),
(12, 12, 2, 50, NULL, '2025-06-24 14:04:04', '2025-06-24 14:04:04'),
(13, 13, 2, 48, NULL, '2025-06-24 14:04:46', '2025-06-24 14:04:46');

-- --------------------------------------------------------

--
-- Table structure for table `match_run`
--

CREATE TABLE `match_run` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `run` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `match_run`
--

INSERT INTO `match_run` (`id`, `match_id`, `user_id`, `run`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 0, '2025-06-04 17:13:46', '2025-06-04 17:13:46'),
(2, 1, 4, 0, '2025-06-18 15:30:46', '2025-06-18 15:30:46'),
(3, 1, 3, 0, '2025-06-18 15:31:07', '2025-06-18 15:31:07'),
(4, 3, 5, 0, '2025-06-22 18:21:36', '2025-06-22 18:21:36'),
(5, 2, 2, 193, '2025-06-22 22:58:55', '2025-06-24 19:12:30'),
(6, 2, 6, 193, '2025-06-24 19:27:15', '2025-06-24 19:34:10'),
(7, 2, 7, 87, '2025-06-24 19:35:29', '2025-06-24 19:35:41'),
(8, 2, 8, 0, '2025-06-24 19:38:46', '2025-06-24 19:38:46'),
(9, 2, 9, 337, '2025-06-24 19:40:10', '2025-06-24 19:41:54'),
(10, 2, 10, 19, '2025-06-24 19:42:43', '2025-06-24 19:43:31'),
(11, 2, 11, 144, '2025-06-24 13:58:49', '2025-06-24 14:02:34'),
(12, 2, 12, 38, '2025-06-24 14:04:04', '2025-06-24 14:04:19'),
(13, 2, 13, 19, '2025-06-24 14:04:46', '2025-06-24 14:04:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_10_20_043655_create_sessions_table', 1),
(6, '2025_03_04_174059_add_username_role_login_ip_register_ip__status_to_user_table', 1),
(7, '2025_03_05_164105_add_phone_to_user_table', 1),
(8, '2025_03_05_172527_create_countries_list_table', 1),
(9, '2025_03_09_123051_add_api_token_to_users_table', 1),
(10, '2025_03_11_041218_create_prize_banner_table', 1),
(11, '2025_03_11_042126_add_type_to_prize_banner', 1),
(12, '2025_03_11_142755_create_spin_list_table', 1),
(13, '2025_03_11_173544_create_notification_table', 1),
(14, '2025_03_12_141514_create_slider_table', 1),
(15, '2025_03_12_165841_create_match_list', 1),
(16, '2025_03_12_170054_add_end_time_to_match_list', 1),
(17, '2025_03_13_180241_create_bollers_predict_table', 1),
(18, '2025_03_13_182522_create_batsman_table_', 1),
(19, '2025_03_13_183303_add_user_id_to_bollar_table', 1),
(20, '2025_03_13_183323_add_user_id_to_batsman_table', 1),
(21, '2025_03_14_225401_create_tournaments_table', 1),
(22, '2025_03_14_225411_create_tournament_teams_table', 1),
(23, '2025_03_16_205044_create_team_players', 1),
(24, '2025_03_17_012755_create_tournament_teams_players_table', 1),
(25, '2025_03_17_022454_add_tournament_id_to_tournament_teams_players_table', 1),
(26, '2025_03_17_145902_create_predict_tables', 1),
(27, '2025_03_18_130422_create_match_report_table', 1),
(28, '2025_03_19_024228_create_tournament_participant_table', 1),
(29, '2025_03_19_024939_create_semi_final_prediction_table', 1),
(30, '2025_03_19_024940_create__finalist_table', 1),
(31, '2025_03_19_024940_create_final_prediction_table', 1),
(32, '2025_03_19_142939_add_user_id_match_id_to_finalist_table', 1),
(33, '2025_03_19_143230_add_user_id_match_id_to_finalist_table', 1),
(34, '2025_03_27_205007_create_single_match_result_table', 1),
(35, '2025_03_28_010458_create_baller_result_table', 1),
(36, '2025_03_28_010548_create_batsman_result_table', 1),
(37, '2025_03_28_124143_create_semifinalresult_table', 1),
(38, '2025_03_28_170221_create_finalistresult_table', 1),
(39, '2025_03_28_173232_create_championresult_table', 1),
(40, '2025_04_05_155104_add_creadit_point_to_user_table', 1),
(41, '2025_04_05_162729_add_image_column_top_match_list_table', 1),
(42, '2025_04_05_170810_create_mat_run_table', 1),
(43, '2025_04_12_202129_create_notification_user_table', 1),
(44, '2025_04_13_214712_create_site_settings_table', 1),
(45, '2025_04_14_202834_add_balance_crypto_address_and_paypal_add', 1),
(46, '2025_04_14_204909_create_credits_table', 1),
(47, '2025_04_14_213033_add_spin_creadit_to_settings_table', 1),
(48, '2025_04_18_222248_create_ads_table', 1),
(49, '2025_04_18_235830_add_image_to_tournament', 1),
(50, '2025_04_25_002114_create_cms_table', 1),
(51, '2025_05_24_214328_create_big_shorts_table', 1),
(52, '2025_05_29_200020_create_linkads_table', 1),
(53, '2025_06_01_123114_create_social_rewards_table', 1),
(54, '2025_06_01_152741_create_questions_table', 1),
(55, '2025_06_01_153602_create_options_table', 1),
(56, '2025_06_01_155629_create_answers_table', 1),
(57, '2025_06_01_163718_add_pull_credit_to_site_settings', 1),
(58, '2025_06_01_164655_create_polls_table', 1),
(59, '2025_06_01_164749_create_poll_options_table', 1),
(60, '2025_06_01_165156_create_poll_answers_table', 1),
(61, '2025_06_01_175941_add_status_to_question_table', 1),
(62, '2025_06_01_175956_add_status_to_poll_table', 1),
(63, '2025_06_02_220710_add_status_to_predict_matches', 1),
(64, '2025_03_18_234225_create_batsman_table', 2),
(65, '2025_03_19_021554_create_boller_table', 2),
(66, '2025_06_19_192815_add_link_id_in_social_rewards', 3),
(67, '2025_08_04_222407_create_dynamic_pages_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sadfsd', 1, '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(2, 'Incidunt nesciunt', 1, '2025-07-25 12:31:35', '2025-07-25 12:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `notification_user`
--

CREATE TABLE `notification_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_user`
--

INSERT INTO `notification_user` (`id`, `notification_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'unread', '2025-06-18 14:38:15', '2025-06-18 14:38:15'),
(2, 1, 4, 'unread', '2025-06-18 14:48:09', '2025-06-18 14:48:09'),
(3, 1, 5, 'unread', '2025-06-22 16:14:56', '2025-06-22 16:14:56'),
(4, 1, 6, 'read', '2025-06-24 19:26:13', '2025-06-24 14:38:17'),
(5, 1, 1, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(6, 1, 2, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(7, 1, 3, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(8, 1, 4, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(9, 1, 5, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(10, 1, 6, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(11, 1, 7, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(12, 1, 8, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(13, 1, 9, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(14, 1, 10, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(15, 1, 11, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(16, 1, 12, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(17, 1, 13, 'unread', '2025-07-23 16:59:54', '2025-07-23 16:59:54'),
(18, 2, 1, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(19, 2, 2, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(20, 2, 3, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(21, 2, 4, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(22, 2, 5, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(23, 2, 6, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(24, 2, 7, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(25, 2, 8, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(26, 2, 9, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(27, 2, 10, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(28, 2, 11, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(29, 2, 12, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35'),
(30, 2, 13, 'unread', '2025-07-25 12:31:35', '2025-07-25 12:31:35');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `question_id`, `option_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Molestiae ut saepe a', '2025-06-03 15:21:44', '2025-06-03 15:21:44'),
(2, 1, 'Dolore molestiae sae', '2025-06-03 15:21:44', '2025-06-03 15:21:44'),
(3, 1, 'Molestiae proident', '2025-06-03 15:21:44', '2025-06-03 15:21:44'),
(4, 1, 'Dolorum laboriosam', '2025-06-03 15:21:44', '2025-06-03 15:21:44'),
(5, 2, 'Beatae illum perfer', '2025-07-23 15:53:06', '2025-07-23 15:53:06'),
(6, 2, 'Blanditiis expedita', '2025-07-23 15:53:06', '2025-07-23 15:53:06'),
(7, 2, 'Aute quas eius repre', '2025-07-23 15:53:06', '2025-07-23 15:53:06'),
(8, 2, 'Vitae consectetur v', '2025-07-23 15:53:06', '2025-07-23 15:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, '', '004ade61392ffea0210c04f9889fbe1820a63ce186865168f4c88c4cfeeefd1f', '[\"*\"]', '2025-06-05 11:57:40', NULL, '2025-06-02 17:48:15', '2025-06-05 11:57:40'),
(2, 'App\\Models\\User', 1, '', '880238b07613d1a1a3b99b4cc098ff240cf0123e7727741fde9ba7d5d8b6b434', '[\"*\"]', NULL, NULL, '2025-06-05 11:57:46', '2025-06-05 11:57:46'),
(3, 'App\\Models\\User', 1, '', 'ec6af951b1178ed0d54aa6cc7af8ce4eae3ff8d0a9b4256fc2d2c9e29ce58028', '[\"*\"]', '2025-06-05 11:58:11', NULL, '2025-06-05 11:57:49', '2025-06-05 11:58:11'),
(4, 'App\\Models\\User', 1, '', '00019ba2003586657f4a02cd4b5e09e910ff591437cf2eeaaed3c82488274314', '[\"*\"]', NULL, NULL, '2025-06-05 12:44:13', '2025-06-05 12:44:13'),
(5, 'App\\Models\\User', 1, '', 'd103ee4e3c1f2d0228a70d2a6bd4ba06e7d3153f02f56dfa7c79a43762d865af', '[\"*\"]', '2025-06-05 12:48:42', NULL, '2025-06-05 12:48:22', '2025-06-05 12:48:42'),
(6, 'App\\Models\\User', 2, '', '151706743f61cc1cee769e673fe5a3bd3b0e893faaf029b28df0c3efb1bcbeff', '[\"*\"]', NULL, NULL, '2025-06-17 13:23:09', '2025-06-17 13:23:09'),
(7, 'App\\Models\\User', 2, '', '64f17cc3ed04803e0f89d5320837b2c6a1f0ebec997bcd8d5ca563d9adb87aa5', '[\"*\"]', NULL, NULL, '2025-06-17 13:23:49', '2025-06-17 13:23:49'),
(8, 'App\\Models\\User', 2, '', 'f827bd258dfd5c1ff9b19358ce36c0575e3a8a86ec9c7d1c55147abebdee79ad', '[\"*\"]', NULL, NULL, '2025-06-17 13:25:35', '2025-06-17 13:25:35'),
(9, 'App\\Models\\User', 2, '', '0ab5455467cc631a5dd47d0d148a975503425198a3dd82914e191ad4476813ae', '[\"*\"]', NULL, NULL, '2025-06-18 13:05:13', '2025-06-18 13:05:13'),
(10, 'App\\Models\\User', 3, '', 'eac48de5d5e24a1d90402ef1b1d940d580d5ea3790e239755a4e55c8111b3416', '[\"*\"]', NULL, NULL, '2025-06-18 14:38:15', '2025-06-18 14:38:15'),
(11, 'App\\Models\\User', 3, '', 'fe38422c30cc96e8d52ad0e5f1045d161a1be0eabe963cde40f4e3ea07dba5c6', '[\"*\"]', NULL, NULL, '2025-06-18 14:40:08', '2025-06-18 14:40:08'),
(12, 'App\\Models\\User', 4, '', '7594b9c2cc766d4b1dd864a0fccdd9a9a3c7151bb530682e0dbf93c5df6d4ee8', '[\"*\"]', NULL, NULL, '2025-06-18 14:48:10', '2025-06-18 14:48:10'),
(13, 'App\\Models\\User', 3, '', '31dae42685ed980a439f046f9f11daca9a028275e76c2e919ddc2423c667194f', '[\"*\"]', NULL, NULL, '2025-06-18 15:04:55', '2025-06-18 15:04:55'),
(14, 'App\\Models\\User', 3, '', '9a643b3d6ef541aa9ce03fe948228c87831b90bb31718c07dd66476e42db698b', '[\"*\"]', NULL, NULL, '2025-06-18 15:32:18', '2025-06-18 15:32:18'),
(15, 'App\\Models\\User', 2, '', '7137ab810f264a62099de275b687656b462516a66737a57883a5710ae9136f1e', '[\"*\"]', NULL, NULL, '2025-06-18 16:26:53', '2025-06-18 16:26:53'),
(16, 'App\\Models\\User', 2, '', '8adace4d3c3ba730a7575ca4a24bfa1c987c5f1d6f115ea5b64cf5325d68a48d', '[\"*\"]', NULL, NULL, '2025-06-19 13:15:59', '2025-06-19 13:15:59'),
(17, 'App\\Models\\User', 2, '', '9bb458fdaadfcf1bf41aa4116be6620aa7e243a226bc646b1b1087172372701f', '[\"*\"]', NULL, NULL, '2025-06-20 13:56:45', '2025-06-20 13:56:45'),
(18, 'App\\Models\\User', 2, '', 'fb5efc50ab00e3b47e9207205f9a3bb99c5635f2deac0ed9f1148120f594464b', '[\"*\"]', NULL, NULL, '2025-06-20 13:57:49', '2025-06-20 13:57:49'),
(19, 'App\\Models\\User', 3, '', '6741974d5b157f84ccd70921db51ec210e4630baf37dfbe806d3b73e65620196', '[\"*\"]', NULL, NULL, '2025-06-20 14:07:52', '2025-06-20 14:07:52'),
(20, 'App\\Models\\User', 2, '', 'b9cb9d80c27a9767acc985f233bdc13b162f5a8b631a6273537e811303e5f74d', '[\"*\"]', NULL, NULL, '2025-06-20 14:37:02', '2025-06-20 14:37:02'),
(21, 'App\\Models\\User', 1, '', '30f9d7d2f53620a2b74481f6e1c35b532e3b824a678c8fed14ba514ba473b339', '[\"*\"]', NULL, NULL, '2025-06-20 14:45:28', '2025-06-20 14:45:28'),
(22, 'App\\Models\\User', 2, '', '99a15416c3d10ded61dedcaaf4fedcf2cb6368afd8b72aa0e47eed31bcd93c5a', '[\"*\"]', NULL, NULL, '2025-06-20 15:03:04', '2025-06-20 15:03:04'),
(23, 'App\\Models\\User', 1, '', '717b536be4b0acf6a98f29a3b3b8af55b4ea1a3d2fd0ee0b2fd2457489137bf7', '[\"*\"]', NULL, NULL, '2025-06-22 12:35:24', '2025-06-22 12:35:24'),
(24, 'App\\Models\\User', 1, '', '8e1c47de68fcf731be1fd3152a9382116d1d6fb6a4b3ff43e5db7a313fdf5c0a', '[\"*\"]', NULL, NULL, '2025-06-22 13:17:00', '2025-06-22 13:17:00'),
(25, 'App\\Models\\User', 1, '', 'a6d549b379790b9fb2d57c83855be542e1c959a6a0b437419a106704ab3db240', '[\"*\"]', NULL, NULL, '2025-06-22 13:29:05', '2025-06-22 13:29:05'),
(26, 'App\\Models\\User', 2, '', 'e5a1fd45a2ec9e7363c032ee03a098624e1208ad55deaae07994137693e1c043', '[\"*\"]', NULL, NULL, '2025-06-22 15:21:30', '2025-06-22 15:21:30'),
(27, 'App\\Models\\User', 5, '', 'b2090fe095659e326c7d626c04618ebed35c12ad8df1ae6a04703d14d0398cff', '[\"*\"]', NULL, NULL, '2025-06-22 16:14:56', '2025-06-22 16:14:56'),
(28, 'App\\Models\\User', 1, '', '9a6ea6ad790fa628e987596f293084b9b2748dd4e0e22559d568491bcde64f79', '[\"*\"]', NULL, NULL, '2025-06-22 18:12:44', '2025-06-22 18:12:44'),
(29, 'App\\Models\\User', 2, '', '55a282ecd0651b26c190951e0db5602d1a9a6206e757cc41fcdf1d9d79eaa930', '[\"*\"]', NULL, NULL, '2025-06-22 18:12:59', '2025-06-22 18:12:59'),
(30, 'App\\Models\\User', 2, '', '0bfcf484873781f390608fb61be61b377b6509e93e517bf79c43ade7a76fcda9', '[\"*\"]', NULL, NULL, '2025-06-22 18:15:47', '2025-06-22 18:15:47'),
(31, 'App\\Models\\User', 2, '', '98be7961ea8faed8f6b3804303325bcc0a7dfb41ed1f48b94b6d2dfa9a0b53e4', '[\"*\"]', NULL, NULL, '2025-06-24 19:11:31', '2025-06-24 19:11:31'),
(32, 'App\\Models\\User', 6, '', '9aca005ea7bd1349d4355b523801a5874c358f5cd55dfe8cda926f2e54183bff', '[\"*\"]', NULL, NULL, '2025-06-24 19:26:13', '2025-06-24 19:26:13'),
(33, 'App\\Models\\User', 6, '', 'ffd1a8d43bfd9eea9235dcf5fdc9eeb775ef5e16442d2c84a4e2299149896d54', '[\"*\"]', NULL, NULL, '2025-06-24 19:33:23', '2025-06-24 19:33:23'),
(34, 'App\\Models\\User', 7, '', '56ef7e4719caa14d9249d9aa7cda470a61c70228ec214599c9e0f5c44f97aa69', '[\"*\"]', NULL, NULL, '2025-06-24 19:35:23', '2025-06-24 19:35:23'),
(35, 'App\\Models\\User', 8, '', '8b586e93d89431af81185f416eec7ddbe31537bd0285356da9f41e186df1cb58', '[\"*\"]', NULL, NULL, '2025-06-24 19:38:37', '2025-06-24 19:38:37'),
(36, 'App\\Models\\User', 9, '', 'e01430b78227a83f3f24539debc5d89deeb0f6fbf4bdc6b055ca9d494f8188ed', '[\"*\"]', NULL, NULL, '2025-06-24 19:39:38', '2025-06-24 19:39:38'),
(37, 'App\\Models\\User', 10, '', 'd030147bcd20312e5d8a73b1fe381c250e602bd02b03260f8e98287e65d80e31', '[\"*\"]', NULL, NULL, '2025-06-24 19:42:26', '2025-06-24 19:42:26'),
(38, 'App\\Models\\User', 11, '', '43741386c986301198159fb9c431435035507c39f092d67d4e8e66a9073254fc', '[\"*\"]', NULL, NULL, '2025-06-24 13:58:31', '2025-06-24 13:58:31'),
(39, 'App\\Models\\User', 11, '', '5be5efa2bbd1c10062705b5a763d36f7b4a66b84be039628a3014433f208f42d', '[\"*\"]', NULL, NULL, '2025-06-24 14:03:15', '2025-06-24 14:03:15'),
(40, 'App\\Models\\User', 12, '', '54e48801287006d9c40e2c3c253fca8f28106522e4426fb8e9ba664e2bd95b0e', '[\"*\"]', NULL, NULL, '2025-06-24 14:03:58', '2025-06-24 14:03:58'),
(41, 'App\\Models\\User', 13, '', '7f9a30419aa27ee48722b59de23ba00aa38a03c544b6441d102d7844dc803d93', '[\"*\"]', NULL, NULL, '2025-06-24 14:04:36', '2025-06-24 14:04:36'),
(42, 'App\\Models\\User', 6, '', '40ba0d8acbfee2b37e93550a3c5ceb1459e37c3aa165f939bb76d77304618fdd', '[\"*\"]', NULL, NULL, '2025-06-24 14:05:37', '2025-06-24 14:05:37'),
(43, 'App\\Models\\User', 1, '', '00af726243a49f20605af0f18febd240a3ca542123f8c46604336d2abe2d5c37', '[\"*\"]', NULL, NULL, '2025-07-12 16:12:41', '2025-07-12 16:12:41'),
(44, 'App\\Models\\User', 1, '', 'abaf51d3b7c3acefd0828e584f468df61ae081d502ffb3e141ad5cc3a34f2bfc', '[\"*\"]', NULL, NULL, '2025-07-23 13:31:48', '2025-07-23 13:31:48'),
(45, 'App\\Models\\User', 1, '', '55ea5a89bd7acbf8fa6b1794bd8316bf8ae30c7d79a43d44c839b26410805a37', '[\"*\"]', NULL, NULL, '2025-07-23 13:43:51', '2025-07-23 13:43:51'),
(46, 'App\\Models\\User', 1, '', 'f1a32769f452095f983b4be2182323cff302a87d41fdae859d87b4028af0db3e', '[\"*\"]', NULL, NULL, '2025-07-23 13:52:13', '2025-07-23 13:52:13'),
(47, 'App\\Models\\User', 1, '', '1a84a774a7fe3feb6032a3e98c462fc02fc26bcb0eeb3107d27ea44bef19a8a4', '[\"*\"]', NULL, NULL, '2025-07-23 13:53:19', '2025-07-23 13:53:19'),
(48, 'App\\Models\\User', 1, '', 'a91d897f88e7131b1106cfda3f1a612274c80231dada00e0cbb911c0fdebaf69', '[\"*\"]', NULL, NULL, '2025-07-23 13:53:54', '2025-07-23 13:53:54'),
(49, 'App\\Models\\User', 1, '', '460778afd557ec269beb14f9e25441890d8ac90f5764d5b6b4d7c75115ce6799', '[\"*\"]', NULL, NULL, '2025-07-23 14:01:44', '2025-07-23 14:01:44'),
(50, 'App\\Models\\User', 1, '', '1f283fcd7ef3cf9751f62731ffda93ae9f8726c970baed5191afe37d553f2c9f', '[\"*\"]', NULL, NULL, '2025-07-23 14:02:15', '2025-07-23 14:02:15'),
(51, 'App\\Models\\User', 1, '', '2f7c002612f9edf32f2094f54ce484bfb76dacf7713a026f5c61de94b224aaf8', '[\"*\"]', NULL, NULL, '2025-07-23 14:03:21', '2025-07-23 14:03:21'),
(52, 'App\\Models\\User', 1, '', '233b71aac8d7177aae9b8289ad2232e7c354c0cdb5a7949447a8362d600c85ea', '[\"*\"]', NULL, NULL, '2025-07-23 14:05:32', '2025-07-23 14:05:32'),
(53, 'App\\Models\\User', 1, '', 'ece02ac2e2a7266d3b0adf0e23f7db6698e84b41644f4ec0702a3d3438fad02a', '[\"*\"]', NULL, NULL, '2025-07-23 14:08:27', '2025-07-23 14:08:27'),
(54, 'App\\Models\\User', 2, '', '33cd6a9ed82b2175f28beac2aed23eb2f9b4433da0a3548c61a8fd2c3f411200', '[\"*\"]', NULL, NULL, '2025-07-23 14:08:38', '2025-07-23 14:08:38'),
(55, 'App\\Models\\User', 1, '', '2b22aadc6c6ab3e1301e0d3e728b6e350961a7e05e2c3d7886d6ec8c8e6a5e4a', '[\"*\"]', NULL, NULL, '2025-07-23 14:09:19', '2025-07-23 14:09:19'),
(56, 'App\\Models\\User', 1, '', '25f9756b852b3737e8dbb56b7a1b58f0b716290b6134f1699cabc4bd42d0b6f7', '[\"*\"]', NULL, NULL, '2025-07-23 14:09:38', '2025-07-23 14:09:38'),
(57, 'App\\Models\\User', 1, '', 'efdfd05edc370442e106a943a9de987fe342000a4cf368721e9b7cfc21d7cf96', '[\"*\"]', NULL, NULL, '2025-07-23 14:10:26', '2025-07-23 14:10:26'),
(58, 'App\\Models\\User', 2, '', '540c65d9a6e93fc9d93b720991caafe3ea8bfa24a8d8488e0177db6d5caa9e09', '[\"*\"]', NULL, NULL, '2025-07-23 14:10:34', '2025-07-23 14:10:34'),
(59, 'App\\Models\\User', 2, '', 'a336deb1206625e51313d5aa21d61ec68e7872838e1954ac48f89c51546f24fc', '[\"*\"]', NULL, NULL, '2025-07-23 14:11:23', '2025-07-23 14:11:23'),
(60, 'App\\Models\\User', 1, '', '19c61f67e18284eb85069272dbaec2250ae83f8cf98d598c7b1cddbdd5613dbc', '[\"*\"]', NULL, NULL, '2025-07-23 14:11:37', '2025-07-23 14:11:37'),
(61, 'App\\Models\\User', 1, '', 'e18f418b6b1da306015ba6a123075c781f4be83bca7aeb88a0607ef800e8f80f', '[\"*\"]', NULL, NULL, '2025-07-25 12:03:32', '2025-07-25 12:03:32'),
(62, 'App\\Models\\User', 1, '', '6fd03ba3c216d4ef91e34b0bf58e4c4b6085ad60c72992120e55d1b321680fbe', '[\"*\"]', NULL, NULL, '2025-07-25 12:07:21', '2025-07-25 12:07:21'),
(63, 'App\\Models\\User', 1, '', 'ddc3aa9b81e1182f93850f1b61874ee70268445f4040702864e0f598b1151f76', '[\"*\"]', NULL, NULL, '2025-07-27 03:54:59', '2025-07-27 03:54:59'),
(64, 'App\\Models\\User', 1, '', '8035b28c7035ee999bb16ca063550a3732944e2104056ebf1efd73d2c5db6bed', '[\"*\"]', NULL, NULL, '2025-07-27 03:55:00', '2025-07-27 03:55:00'),
(65, 'App\\Models\\User', 1, '', '6b7af373445423ebafaf13077aeeee94f457e6a4efc12d2465f2bd9f50003567', '[\"*\"]', NULL, NULL, '2025-07-27 12:03:52', '2025-07-27 12:03:52'),
(66, 'App\\Models\\User', 2, '', '72b13f8746ed2588772ed743312a92db9f2c36b5163c570b4f755b1ed267650d', '[\"*\"]', '2025-07-30 14:45:36', NULL, '2025-07-30 13:27:40', '2025-07-30 14:45:36'),
(67, 'App\\Models\\User', 1, '', '4491f098b15bb7263355cdf266c2f48fff70cd803d919ffe65bc364a11f0768f', '[\"*\"]', NULL, NULL, '2025-08-07 17:19:40', '2025-08-07 17:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `question`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deserunt alias conse', 'inactive', '2025-06-17 14:02:23', '2025-06-17 14:06:39'),
(2, 'Deserunt alias conse', 'inactive', '2025-06-17 14:02:38', '2025-07-23 15:51:29'),
(3, 'Magna pariatur Vero', 'inactive', '2025-06-17 14:04:16', '2025-06-22 12:57:43'),
(4, 'Consequatur Quia ve', 'active', '2025-07-23 15:51:10', '2025-07-23 15:51:34'),
(5, 'Minus tempor exceptu', 'inactive', '2025-07-23 15:56:57', '2025-07-23 15:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `poll_answers`
--

CREATE TABLE `poll_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `poll_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_answers`
--

INSERT INTO `poll_answers` (`id`, `user_id`, `poll_id`, `poll_option_id`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 11, '2025-06-17 15:47:33', '2025-06-17 15:47:33'),
(4, 3, 3, 11, '2025-06-18 14:46:16', '2025-06-18 14:46:16'),
(5, 4, 3, 10, '2025-06-18 14:48:19', '2025-06-18 14:48:19'),
(6, 2, 2, 6, '2025-06-22 13:01:55', '2025-06-22 13:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE `poll_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `poll_id` bigint(20) UNSIGNED NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`id`, `poll_id`, `option_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Occaecat itaque eos', '2025-06-17 14:02:23', '2025-06-17 14:02:23'),
(2, 1, 'Nisi est fuga Expe', '2025-06-17 14:02:23', '2025-06-17 14:02:23'),
(3, 1, 'Eligendi culpa cum', '2025-06-17 14:02:23', '2025-06-17 14:02:23'),
(4, 1, 'Porro culpa est vol', '2025-06-17 14:02:23', '2025-06-17 14:02:23'),
(5, 2, 'Occaecat itaque eos', '2025-06-17 14:02:38', '2025-06-17 14:02:38'),
(6, 2, 'Nisi est fuga Expe', '2025-06-17 14:02:38', '2025-06-17 14:02:38'),
(7, 2, 'Eligendi culpa cum', '2025-06-17 14:02:38', '2025-06-17 14:02:38'),
(8, 2, 'Porro culpa est vol', '2025-06-17 14:02:38', '2025-06-17 14:02:38'),
(9, 3, 'Expedita in aut quia', '2025-06-17 14:04:16', '2025-06-17 14:04:16'),
(10, 3, 'Sequi similique susc', '2025-06-17 14:04:16', '2025-06-17 14:04:16'),
(11, 3, 'Hic consectetur ali', '2025-06-17 14:04:16', '2025-06-17 14:04:16'),
(12, 3, 'Officia eos ut dolo', '2025-06-17 14:04:16', '2025-06-17 14:04:16'),
(13, 4, 'Non ea est voluptate', '2025-07-23 15:51:10', '2025-07-23 15:51:10'),
(14, 4, 'Accusantium proident', '2025-07-23 15:51:10', '2025-07-23 15:51:10'),
(15, 4, 'Reprehenderit eius u', '2025-07-23 15:51:10', '2025-07-23 15:51:10'),
(16, 4, 'Placeat cumque veli', '2025-07-23 15:51:10', '2025-07-23 15:51:10'),
(17, 5, 'Enim velit ipsum ea', '2025-07-23 15:56:57', '2025-07-23 15:56:57'),
(18, 5, 'Voluptas est debitis', '2025-07-23 15:56:57', '2025-07-23 15:56:57'),
(19, 5, 'Officia quod repudia', '2025-07-23 15:56:57', '2025-07-23 15:56:57'),
(20, 5, 'Pariatur Qui obcaec', '2025-07-23 15:56:57', '2025-07-23 15:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `predict_matches`
--

CREATE TABLE `predict_matches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predict_matches`
--

INSERT INTO `predict_matches` (`id`, `start_date`, `end_date`, `created_at`, `updated_at`, `status`) VALUES
(1, '2025-02-25 08:56:00', '2025-06-18 10:53:00', '2025-06-03 15:11:30', '2025-07-27 12:50:44', 'active'),
(2, '1993-12-22 04:02:00', '1987-06-17 01:19:00', '2025-07-27 12:20:10', '2025-07-27 12:45:53', 'inactive'),
(3, '1988-03-18 00:54:00', '1972-02-03 15:42:00', '2025-07-27 12:50:06', '2025-07-27 12:50:06', 'inactive'),
(4, '2012-08-18 02:19:00', '1970-05-07 07:10:00', '2025-07-27 12:50:38', '2025-07-27 12:50:38', 'inactive');

-- --------------------------------------------------------

--
-- Table structure for table `predict_players`
--

CREATE TABLE `predict_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `predict_match_id` int(11) DEFAULT NULL,
  `predict_team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predict_players`
--

INSERT INTO `predict_players` (`id`, `predict_match_id`, `predict_team_id`, `player_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 59, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(2, 1, 1, 29, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(3, 1, 1, 167, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(4, 1, 1, 154, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(5, 1, 1, 142, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(6, 1, 1, 144, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(7, 1, 1, 1, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(8, 1, 1, 78, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(9, 1, 1, 151, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(10, 1, 1, 113, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(11, 1, 1, 13, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(12, 1, 1, 37, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(13, 1, 1, 15, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(14, 1, 1, 54, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(15, 1, 1, 2, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(16, 1, 2, 75, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(17, 1, 2, 56, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(18, 1, 2, 155, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(19, 1, 2, 134, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(20, 1, 2, 99, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(21, 1, 2, 34, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(22, 1, 2, 61, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(23, 1, 2, 126, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(24, 1, 2, 39, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(25, 1, 2, 54, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(26, 1, 2, 32, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(27, 1, 2, 99, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(28, 1, 2, 10, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(29, 1, 2, 63, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(30, 1, 2, 120, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(31, 2, 3, 159, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(32, 2, 3, 144, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(33, 2, 3, 140, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(34, 2, 3, 118, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(35, 2, 3, 8, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(36, 2, 3, 119, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(37, 2, 3, 30, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(38, 2, 3, 82, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(39, 2, 3, 66, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(40, 2, 3, 118, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(41, 2, 3, 134, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(42, 2, 3, 42, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(43, 2, 3, 45, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(44, 2, 3, 54, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(45, 2, 3, 119, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(46, 2, 4, 116, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(47, 2, 4, 156, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(48, 2, 4, 141, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(49, 2, 4, 16, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(50, 2, 4, 94, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(51, 2, 4, 156, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(52, 2, 4, 138, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(53, 2, 4, 135, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(54, 2, 4, 61, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(55, 2, 4, 23, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(56, 2, 4, 5, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(57, 2, 4, 54, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(58, 2, 4, 71, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(59, 2, 4, 90, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(60, 2, 4, 53, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(61, 3, 5, 109, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(62, 3, 5, 22, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(63, 3, 5, 109, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(64, 3, 5, 167, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(65, 3, 5, 85, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(66, 3, 5, 124, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(67, 3, 5, 76, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(68, 3, 5, 73, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(69, 3, 5, 151, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(70, 3, 5, 40, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(71, 3, 5, 144, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(72, 3, 5, 16, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(73, 3, 5, 50, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(74, 3, 5, 50, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(75, 3, 5, 101, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(76, 3, 6, 11, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(77, 3, 6, 6, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(78, 3, 6, 41, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(79, 3, 6, 81, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(80, 3, 6, 20, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(81, 3, 6, 109, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(82, 3, 6, 141, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(83, 3, 6, 127, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(84, 3, 6, 132, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(85, 3, 6, 122, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(86, 3, 6, 40, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(87, 3, 6, 102, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(88, 3, 6, 93, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(89, 3, 6, 157, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(90, 3, 6, 122, '2025-07-27 12:50:07', '2025-07-27 12:50:07'),
(91, 4, 7, 159, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(92, 4, 7, 75, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(93, 4, 7, 85, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(94, 4, 7, 151, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(95, 4, 7, 66, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(96, 4, 7, 36, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(97, 4, 7, 42, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(98, 4, 7, 88, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(99, 4, 7, 86, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(100, 4, 7, 139, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(101, 4, 7, 43, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(102, 4, 7, 71, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(103, 4, 7, 118, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(104, 4, 7, 102, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(105, 4, 7, 53, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(106, 4, 8, 61, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(107, 4, 8, 136, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(108, 4, 8, 127, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(109, 4, 8, 94, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(110, 4, 8, 127, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(111, 4, 8, 155, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(112, 4, 8, 91, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(113, 4, 8, 87, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(114, 4, 8, 55, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(115, 4, 8, 91, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(116, 4, 8, 13, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(117, 4, 8, 7, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(118, 4, 8, 84, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(119, 4, 8, 53, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(120, 4, 8, 170, '2025-07-27 12:50:38', '2025-07-27 12:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `predict_teams`
--

CREATE TABLE `predict_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `predict_match_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predict_teams`
--

INSERT INTO `predict_teams` (`id`, `predict_match_id`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 1, 61, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(2, 1, 71, '2025-06-03 15:11:30', '2025-06-03 15:11:30'),
(3, 2, 60, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(4, 2, 75, '2025-07-27 12:20:10', '2025-07-27 12:20:10'),
(5, 3, 73, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(6, 3, 76, '2025-07-27 12:50:06', '2025-07-27 12:50:06'),
(7, 4, 63, '2025-07-27 12:50:38', '2025-07-27 12:50:38'),
(8, 4, 58, '2025-07-27 12:50:38', '2025-07-27 12:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `prize_banner`
--

CREATE TABLE `prize_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `banner` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=bowling, 2=batting,3=tournament'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prize_banner`
--

INSERT INTO `prize_banner` (`id`, `name`, `banner`, `status`, `created_at`, `updated_at`, `type`) VALUES
(1, 'asdfasdf', '1750258965.jpg', 1, '2025-06-18 09:02:45', '2025-06-18 09:02:45', 2),
(2, 'Maiores qui voluptas', '1750258987.png', 1, '2025-06-18 09:03:07', '2025-06-18 09:03:07', 1),
(3, 'fasd', '1750259058.jpeg', 1, '2025-06-18 09:04:18', '2025-06-18 09:04:18', 3);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deleniti fugiat in s', 'inactive', '2025-06-03 15:21:44', '2025-07-23 15:53:30'),
(2, 'Tempor sed inventore', 'active', '2025-07-23 15:53:06', '2025-07-23 15:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `semifinal`
--

CREATE TABLE `semifinal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `match` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `los` int(11) DEFAULT NULL,
  `tie` int(11) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semifinal`
--

INSERT INTO `semifinal` (`id`, `match_id`, `user_id`, `team_id`, `match`, `win`, `los`, `tie`, `pts`, `status`, `created_at`, `updated_at`) VALUES
(35, 2, 3, 9, NULL, 1, NULL, NULL, 1, 1, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(36, 2, 3, 10, NULL, 2, NULL, NULL, 2, 1, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(37, 2, 3, 11, NULL, 3, NULL, NULL, 3, 1, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(38, 2, 3, 12, NULL, 4, NULL, NULL, 4, 1, '2025-06-20 14:25:46', '2025-06-20 14:25:46'),
(39, 2, 2, 9, NULL, 1, NULL, NULL, 1, 1, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(40, 2, 2, 10, NULL, 2, NULL, NULL, 2, 1, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(41, 2, 2, 11, NULL, 3, NULL, NULL, 3, 1, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(42, 2, 2, 12, NULL, 4, NULL, NULL, 4, 1, '2025-06-20 14:37:50', '2025-06-20 14:37:50'),
(43, 2, 1, 9, NULL, 1, NULL, NULL, 1, 1, '2025-06-20 14:46:07', '2025-06-20 14:46:07'),
(44, 2, 1, 10, NULL, 2, NULL, NULL, 2, 1, '2025-06-20 14:46:07', '2025-06-20 14:46:07'),
(45, 2, 1, 11, NULL, 3, NULL, NULL, 3, 1, '2025-06-20 14:46:07', '2025-06-20 14:46:07'),
(46, 2, 1, 12, NULL, 4, NULL, NULL, 4, 1, '2025-06-20 14:46:07', '2025-06-20 14:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `semifinalresult`
--

CREATE TABLE `semifinalresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `match` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `los` int(11) DEFAULT NULL,
  `tie` int(11) DEFAULT NULL,
  `pts` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `semifinalresult`
--

INSERT INTO `semifinalresult` (`id`, `match_id`, `team_id`, `match`, `win`, `los`, `tie`, `pts`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 12, 12, 1, 77, 40, 1, 1, '2025-06-20 14:39:39', '2025-06-20 14:39:39'),
(2, 2, 13, 59, 2, 100, 54, 2, 1, '2025-06-20 14:39:39', '2025-06-20 14:39:39'),
(3, 2, 11, 73, 3, 15, 87, 3, 1, '2025-06-20 14:39:39', '2025-06-20 14:39:39'),
(4, 2, 9, 58, 4, 69, 82, 4, 1, '2025-06-20 14:39:39', '2025-06-20 14:39:39'),
(5, 2, 15, NULL, 19, NULL, NULL, 44, 1, '2025-06-24 14:47:35', '2025-06-24 14:47:35'),
(6, 2, 14, NULL, 86, NULL, NULL, 92, 1, '2025-06-24 14:47:35', '2025-06-24 14:47:35'),
(7, 1, 8, NULL, 37, NULL, NULL, 1, 1, '2025-06-24 14:47:52', '2025-06-24 14:47:52'),
(8, 1, 6, NULL, 20, NULL, NULL, 39, 1, '2025-06-24 14:47:52', '2025-06-24 14:47:52'),
(9, 1, 5, NULL, 24, NULL, NULL, 47, 1, '2025-06-24 14:47:52', '2025-06-24 14:47:52'),
(10, 1, 1, NULL, 55, NULL, NULL, 24, 1, '2025-06-24 14:47:52', '2025-06-24 14:47:52'),
(11, 2, 10, NULL, 60, NULL, NULL, 81, 1, '2025-07-27 05:26:53', '2025-07-27 05:26:53'),
(12, 3, 17, NULL, 41, NULL, NULL, 98, 1, '2025-07-27 13:08:36', '2025-07-27 13:08:36');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `singlematchresult`
--

CREATE TABLE `singlematchresult` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `singlematchresult`
--

INSERT INTO `singlematchresult` (`id`, `match_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 73, '2025-06-04 17:35:41', '2025-06-04 17:35:41');

-- --------------------------------------------------------

--
-- Table structure for table `single_match_result`
--

CREATE TABLE `single_match_result` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `single_match_result`
--

INSERT INTO `single_match_result` (`id`, `match_id`, `team_id`, `created_at`, `updated_at`) VALUES
(1, 1, 81, '2025-04-07 18:18:37', '2025-04-07 18:18:37'),
(2, 4, 57, '2025-05-05 18:19:11', '2025-05-05 18:19:11'),
(3, 6, 57, '2025-05-08 12:07:38', '2025-05-08 12:07:38'),
(4, 3, 48, '2025-05-08 12:10:30', '2025-05-08 12:10:30'),
(5, 8, 57, '2025-05-24 17:19:03', '2025-05-24 17:19:03'),
(6, 9, 81, '2025-06-02 16:51:39', '2025-06-02 16:51:39'),
(7, 2, 50, '2025-07-27 04:39:54', '2025-07-27 04:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `register_bonus` varchar(255) DEFAULT NULL,
  `question_credit` int(11) DEFAULT NULL,
  `pull_credit` int(11) DEFAULT NULL,
  `spin_creadit` int(11) DEFAULT NULL,
  `single_match_bonus` varchar(255) DEFAULT NULL,
  `max_predict_bonus` varchar(255) DEFAULT NULL,
  `tournament_bonus` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `ads_prize` int(11) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `website_name`, `logo_path`, `register_bonus`, `question_credit`, `pull_credit`, `spin_creadit`, `single_match_bonus`, `max_predict_bonus`, `tournament_bonus`, `admin_email`, `support_email`, `phone`, `ads_prize`, `facebook`, `whatsapp`, `telegram`, `instagram`, `twitter`, `linkedin`, `youtube`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 'BigWin=Win Big', 'uploads/1745410612.png', '100', 11, 50, 5, '10', '20', '30', 'admin@gmail.com', 'support@mail.com', '000000000000', 5, 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', '2025-04-13 09:55:36', '2025-06-01 05:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, '1743608337.jpg', 1, '2025-06-04 15:07:16', '2025-06-04 15:07:16'),
(2, NULL, '1923844415.jpg', 1, '2025-07-23 16:25:41', '2025-07-23 16:25:41'),
(3, NULL, '2053619081.jpg', 1, '2025-07-23 16:25:49', '2025-07-23 16:25:49');

-- --------------------------------------------------------

--
-- Table structure for table `social_rewards`
--

CREATE TABLE `social_rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `rewarded` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `link_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_rewards`
--

INSERT INTO `social_rewards` (`id`, `user_id`, `platform`, `rewarded`, `created_at`, `updated_at`, `link_id`) VALUES
(8, 2, NULL, 1, '2025-06-19 13:15:03', '2025-06-19 13:15:03', NULL),
(9, 2, NULL, 1, '2025-06-19 13:18:30', '2025-06-19 13:18:30', NULL),
(10, 2, NULL, 1, '2025-06-19 13:18:42', '2025-06-19 13:18:42', NULL),
(11, 2, NULL, 1, '2025-06-19 13:18:54', '2025-06-19 13:18:54', NULL),
(12, 2, NULL, 1, '2025-06-19 13:25:00', '2025-06-19 13:25:00', NULL),
(13, 2, NULL, 1, '2025-06-19 13:25:11', '2025-06-19 13:25:11', NULL),
(14, 2, NULL, 1, '2025-06-19 13:30:45', '2025-06-19 13:30:45', NULL),
(15, 2, NULL, 1, '2025-06-19 13:30:59', '2025-06-19 13:30:59', NULL),
(16, 2, NULL, 1, '2025-06-19 13:31:42', '2025-06-19 13:31:42', 1),
(17, 2, NULL, 1, '2025-06-22 15:22:54', '2025-06-22 15:22:54', 2),
(18, 2, NULL, 1, '2025-06-22 15:22:59', '2025-06-22 15:22:59', 3);

-- --------------------------------------------------------

--
-- Table structure for table `spin_list`
--

CREATE TABLE `spin_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `prize` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `spin_list`
--

INSERT INTO `spin_list` (`id`, `name`, `status`, `prize`, `created_at`, `updated_at`) VALUES
(1, 'Nina Reyes', 1, 87, '2025-06-02 17:48:43', '2025-06-02 17:48:43'),
(2, 'Dominic Shepard', 1, 19, '2025-06-02 17:48:57', '2025-06-02 17:48:57'),
(3, 'Rinah Frederick', 1, 69, '2025-07-23 17:25:29', '2025-07-23 17:25:29'),
(4, 'Ruth Charles', 2, 6, '2025-07-23 17:42:13', '2025-07-23 17:46:25'),
(5, 'Aileen Aguirre', 1, 450, '2025-07-23 17:42:30', '2025-07-23 17:45:21'),
(6, 'Brooke Barton', 1, 41, '2025-07-23 17:47:02', '2025-07-23 17:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `team_players`
--

CREATE TABLE `team_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `player_name` varchar(255) DEFAULT NULL,
  `player_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_players`
--

INSERT INTO `team_players` (`id`, `team_id`, `player_name`, `player_type`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Virat Kohli', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(2, NULL, 'Rohit Sharma', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(3, NULL, 'KL Rahul', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(4, NULL, 'Shubman Gill', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(5, NULL, 'Ishan Kishan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(6, NULL, 'Suryakumar Yadav', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(7, NULL, 'Shreyas Iyer', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(8, NULL, 'Ruturaj Gaikwad', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(9, NULL, 'Sanju Samson', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(10, NULL, 'Manish Pandey', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(11, NULL, 'Hardik Pandya', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(12, NULL, 'Ravindra Jadeja', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(13, NULL, 'Axar Patel', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(14, NULL, 'Washington Sundar', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(15, NULL, 'Deepak Hooda', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(16, NULL, 'Kuldeep Yadav', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(17, NULL, 'Yuzvendra Chahal', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(18, NULL, 'Mohammed Shami', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(19, NULL, 'Jasprit Bumrah', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(20, NULL, 'Arshdeep Singh', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(21, NULL, 'Prasidh Krishna', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(22, NULL, 'Umesh Yadav', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(23, NULL, 'Deepak Chahar', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(24, NULL, 'Bhuvneshwar Kumar', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(25, NULL, 'Jaydev Unadkat', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(26, NULL, 'Khaleel Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(27, NULL, 'Shardul Thakur', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(28, NULL, 'Varun Chakravarthy', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(29, NULL, 'Nitish Rana', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(30, NULL, 'Venkatesh Iyer', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(31, NULL, 'Babar Azam', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(32, NULL, 'Mohammad Rizwan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(33, NULL, 'Fakhar Zaman', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(34, NULL, 'Shan Masood', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(35, NULL, 'Imam-ul-Haq', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(36, NULL, 'Abdullah Shafique', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(37, NULL, 'Asif Ali', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(38, NULL, 'Iftikhar Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(39, NULL, 'Shadab Khan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(40, NULL, 'Mohammad Nawaz', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(41, NULL, 'Mohammad Haris', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(42, NULL, 'Shoaib Malik', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(43, NULL, 'Mohammad Hafeez', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(44, NULL, 'Sarfaraz Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(45, NULL, 'Agha Salman', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(46, NULL, 'Mohammad Wasim Jr', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(47, NULL, 'Haris Rauf', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(48, NULL, 'Shaheen Afridi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(49, NULL, 'Naseem Shah', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(50, NULL, 'Hasan Ali', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(51, NULL, 'Abrar Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(52, NULL, 'Usama Mir', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(53, NULL, 'Zaman Khan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(54, NULL, 'Shakib Al Hasan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(55, NULL, 'Tamim Iqbal', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(56, NULL, 'Mushfiqur Rahim', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(57, NULL, 'Mahmudullah Riyad', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(58, NULL, 'Litton Das', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(59, NULL, 'Anamul Haque', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(60, NULL, 'Soumya Sarkar', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(61, NULL, 'Afif Hossain', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(62, NULL, 'Najmul Hossain Shanto', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(63, NULL, 'Yasir Ali', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(64, NULL, 'Shoriful Islam', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(65, NULL, 'Mustafizur Rahman', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(66, NULL, 'Mehidy Hasan Miraz', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(67, NULL, 'Taskin Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(68, NULL, 'Nasum Ahmed', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(69, NULL, 'Mohammad Saifuddin', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(70, NULL, 'Taijul Islam', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(71, NULL, 'Naim Sheikh', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(72, NULL, 'Mohammad Mithun', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(73, NULL, 'Rubel Hossain', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(74, NULL, 'Kusal Mendis', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(75, NULL, 'Angelo Mathews', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(76, NULL, 'Dinesh Chandimal', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(77, NULL, 'Charith Asalanka', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(78, NULL, 'Pathum Nissanka', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(79, NULL, 'Kusal Perera', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(80, NULL, 'Avishka Fernando', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(81, NULL, 'Dasun Shanaka', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(82, NULL, 'Dhananjaya de Silva', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(83, NULL, 'Wanindu Hasaranga', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(84, NULL, 'Maheesh Theekshana', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(85, NULL, 'Dunith Wellalage', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(86, NULL, 'Chamika Karunaratne', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(87, NULL, 'Lahiru Kumara', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(88, NULL, 'Dushmantha Chameera', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(89, NULL, 'Dilshan Madushanka', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(90, NULL, 'Kasun Rajitha', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(91, NULL, 'Asitha Fernando', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(92, NULL, 'Binura Fernando', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(93, NULL, 'Niroshan Dickwella', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(94, NULL, 'Jeffrey Vandersay', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(95, NULL, 'Ramesh Mendis', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(96, NULL, 'Rashid Khan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(97, NULL, 'Mohammad Nabi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(98, NULL, 'Rahmanullah Gurbaz', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(99, NULL, 'Ibrahim Zadran', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(100, NULL, 'Hazratullah Zazai', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(101, NULL, 'Najibullah Zadran', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(102, NULL, 'Azmatullah Omarzai', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(103, NULL, 'Gulbadin Naib', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(104, NULL, 'Hashmatullah Shahidi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(105, NULL, 'Karim Janat', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(106, NULL, 'Zahir Khan', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(107, NULL, 'Noor Ahmad', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(108, NULL, 'Fareed Ahmad', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(109, NULL, 'Qais Ahmad', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(110, NULL, 'Kane Williamson', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(111, NULL, 'Devon Conway', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(112, NULL, 'Tom Latham', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(113, NULL, 'Daryl Mitchell', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(114, NULL, 'Glenn Phillips', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(115, NULL, 'Finn Allen', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(116, NULL, 'Martin Guptill', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(117, NULL, 'Will Young', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(118, NULL, 'Michael Bracewell', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(119, NULL, 'James Neesham', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(120, NULL, 'Mark Chapman', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(121, NULL, 'Kyle Jamieson', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(122, NULL, 'Tim Southee', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(123, NULL, 'Trent Boult', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(124, NULL, 'Lockie Ferguson', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(125, NULL, 'Ish Sodhi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(126, NULL, 'Rachin Ravindra', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(127, NULL, 'Mitchell Santner', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(128, NULL, 'Ben Lister', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(129, NULL, 'Adam Milne', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(130, NULL, 'Quinton de Kock', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(131, NULL, 'Temba Bavuma', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(132, NULL, 'Aiden Markram', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(133, NULL, 'Rassie van der Dussen', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(134, NULL, 'David Miller', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(135, NULL, 'Heinrich Klaasen', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(136, NULL, 'Reeza Hendricks', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(137, NULL, 'Tristan Stubbs', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(138, NULL, 'Marco Jansen', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(139, NULL, 'Wayne Parnell', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(140, NULL, 'Kagiso Rabada', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(141, NULL, 'Lungi Ngidi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(142, NULL, 'Anrich Nortje', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(143, NULL, 'Tabraiz Shamsi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(144, NULL, 'Keshav Maharaj', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(145, NULL, 'Gerald Coetzee', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(146, NULL, 'Andile Phehlukwayo', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(147, NULL, 'Bjorn Fortuin', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(148, NULL, 'Lizaad Williams', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(149, NULL, 'Tony de Zorzi', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(150, NULL, 'David Warner', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(151, NULL, 'Travis Head', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(152, NULL, 'Steve Smith', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(153, NULL, 'Marnus Labuschagne', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(154, NULL, 'Glenn Maxwell', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(155, NULL, 'Marcus Stoinis', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(156, NULL, 'Cameron Green', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(157, NULL, 'Josh Inglis', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(158, NULL, 'Alex Carey', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(159, NULL, 'Tim David', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(160, NULL, 'Pat Cummins', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(161, NULL, 'Mitchell Starc', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(162, NULL, 'Josh Hazlewood', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(163, NULL, 'Nathan Lyon', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(164, NULL, 'Adam Zampa', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(165, NULL, 'Sean Abbott', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(166, NULL, 'Ashton Agar', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(167, NULL, 'Michael Neser', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(168, NULL, 'Matthew Wade', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51'),
(169, NULL, 'Aaron Finch', NULL, 2, '2025-06-03 14:47:51', '2025-07-23 16:11:34'),
(170, NULL, 'aa', NULL, 1, '2025-07-23 16:11:41', '2025-07-23 16:11:41'),
(171, NULL, 'Virat Kohli', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(172, NULL, 'Rohit Sharma', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(173, NULL, 'KL Rahul', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(174, NULL, 'Shubman Gill', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(175, NULL, 'Ishan Kishan', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(176, NULL, 'Suryakumar Yadav', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(177, NULL, 'Shreyas Iyer', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(178, NULL, 'Ruturaj Gaikwad', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(179, NULL, 'Sanju Samson', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(180, NULL, 'Manish Pandey', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(181, NULL, 'Hardik Pandya', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(182, NULL, 'Ravindra Jadeja', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(183, NULL, 'Axar Patel', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(184, NULL, 'Washington Sundar', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(185, NULL, 'Deepak Hooda', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(186, NULL, 'Kuldeep Yadav', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(187, NULL, 'Yuzvendra Chahal', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(188, NULL, 'Mohammed Shami', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(189, NULL, 'Jasprit Bumrah', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(190, NULL, 'Arshdeep Singh', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(191, NULL, 'Prasidh Krishna', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(192, NULL, 'Umesh Yadav', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(193, NULL, 'Deepak Chahar', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(194, NULL, 'Bhuvneshwar Kumar', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(195, NULL, 'Jaydev Unadkat', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(196, NULL, 'Khaleel Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(197, NULL, 'Shardul Thakur', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(198, NULL, 'Varun Chakravarthy', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(199, NULL, 'Nitish Rana', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(200, NULL, 'Venkatesh Iyer', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(201, NULL, 'Babar Azam', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(202, NULL, 'Mohammad Rizwan', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(203, NULL, 'Fakhar Zaman', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(204, NULL, 'Shan Masood', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(205, NULL, 'Imam-ul-Haq', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(206, NULL, 'Abdullah Shafique', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(207, NULL, 'Asif Ali', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(208, NULL, 'Iftikhar Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(209, NULL, 'Shadab Khan', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(210, NULL, 'Mohammad Nawaz', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(211, NULL, 'Mohammad Haris', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(212, NULL, 'Shoaib Malik', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(213, NULL, 'Mohammad Hafeez', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(214, NULL, 'Sarfaraz Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(215, NULL, 'Agha Salman', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(216, NULL, 'Mohammad Wasim Jr', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(217, NULL, 'Haris Rauf', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(218, NULL, 'Shaheen Afridi', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(219, NULL, 'Naseem Shah', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(220, NULL, 'Hasan Ali', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(221, NULL, 'Abrar Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(222, NULL, 'Usama Mir', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(223, NULL, 'Zaman Khan', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(224, NULL, 'Shakib Al Hasan', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(225, NULL, 'Tamim Iqbal', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(226, NULL, 'Mushfiqur Rahim', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(227, NULL, 'Mahmudullah Riyad', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(228, NULL, 'Litton Das', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(229, NULL, 'Anamul Haque', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(230, NULL, 'Soumya Sarkar', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(231, NULL, 'Afif Hossain', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(232, NULL, 'Najmul Hossain Shanto', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(233, NULL, 'Yasir Ali', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(234, NULL, 'Shoriful Islam', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(235, NULL, 'Mustafizur Rahman', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(236, NULL, 'Mehidy Hasan Miraz', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(237, NULL, 'Taskin Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(238, NULL, 'Nasum Ahmed', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(239, NULL, 'Mohammad Saifuddin', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(240, NULL, 'Taijul Islam', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(241, NULL, 'Naim Sheikh', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(242, NULL, 'Mohammad Mithun', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(243, NULL, 'Rubel Hossain', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(244, NULL, 'Kusal Mendis', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(245, NULL, 'Angelo Mathews', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(246, NULL, 'Dinesh Chandimal', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(247, NULL, 'Charith Asalanka', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(248, NULL, 'Pathum Nissanka', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(249, NULL, 'Kusal Perera', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(250, NULL, 'Avishka Fernando', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(251, NULL, 'Dasun Shanaka', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(252, NULL, 'Dhananjaya de Silva', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(253, NULL, 'Wanindu Hasaranga', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(254, NULL, 'Maheesh Theekshana', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(255, NULL, 'Dunith Wellalage', NULL, 1, '2025-08-04 16:32:30', '2025-08-04 16:32:30'),
(256, NULL, 'Chamika Karunaratne', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(257, NULL, 'Lahiru Kumara', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(258, NULL, 'Dushmantha Chameera', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(259, NULL, 'Dilshan Madushanka', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(260, NULL, 'Kasun Rajitha', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(261, NULL, 'Asitha Fernando', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(262, NULL, 'Binura Fernando', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(263, NULL, 'Niroshan Dickwella', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(264, NULL, 'Jeffrey Vandersay', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(265, NULL, 'Ramesh Mendis', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(266, NULL, 'Rashid Khan', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(267, NULL, 'Mohammad Nabi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(268, NULL, 'Rahmanullah Gurbaz', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(269, NULL, 'Ibrahim Zadran', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(270, NULL, 'Hazratullah Zazai', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(271, NULL, 'Najibullah Zadran', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(272, NULL, 'Azmatullah Omarzai', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(273, NULL, 'Gulbadin Naib', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(274, NULL, 'Hashmatullah Shahidi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(275, NULL, 'Karim Janat', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(276, NULL, 'Zahir Khan', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(277, NULL, 'Noor Ahmad', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(278, NULL, 'Fareed Ahmad', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(279, NULL, 'Qais Ahmad', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(280, NULL, 'Kane Williamson', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(281, NULL, 'Devon Conway', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(282, NULL, 'Tom Latham', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(283, NULL, 'Daryl Mitchell', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(284, NULL, 'Glenn Phillips', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(285, NULL, 'Finn Allen', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(286, NULL, 'Martin Guptill', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(287, NULL, 'Will Young', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(288, NULL, 'Michael Bracewell', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(289, NULL, 'James Neesham', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(290, NULL, 'Mark Chapman', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(291, NULL, 'Kyle Jamieson', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(292, NULL, 'Tim Southee', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(293, NULL, 'Trent Boult', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(294, NULL, 'Lockie Ferguson', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(295, NULL, 'Ish Sodhi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(296, NULL, 'Rachin Ravindra', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(297, NULL, 'Mitchell Santner', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(298, NULL, 'Ben Lister', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(299, NULL, 'Adam Milne', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(300, NULL, 'Quinton de Kock', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(301, NULL, 'Temba Bavuma', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(302, NULL, 'Aiden Markram', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(303, NULL, 'Rassie van der Dussen', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(304, NULL, 'David Miller', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(305, NULL, 'Heinrich Klaasen', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(306, NULL, 'Reeza Hendricks', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(307, NULL, 'Tristan Stubbs', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(308, NULL, 'Marco Jansen', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(309, NULL, 'Wayne Parnell', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(310, NULL, 'Kagiso Rabada', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(311, NULL, 'Lungi Ngidi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(312, NULL, 'Anrich Nortje', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(313, NULL, 'Tabraiz Shamsi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(314, NULL, 'Keshav Maharaj', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(315, NULL, 'Gerald Coetzee', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(316, NULL, 'Andile Phehlukwayo', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(317, NULL, 'Bjorn Fortuin', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(318, NULL, 'Lizaad Williams', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(319, NULL, 'Tony de Zorzi', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(320, NULL, 'David Warner', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(321, NULL, 'Travis Head', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(322, NULL, 'Steve Smith', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(323, NULL, 'Marnus Labuschagne', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(324, NULL, 'Glenn Maxwell', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(325, NULL, 'Marcus Stoinis', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(326, NULL, 'Cameron Green', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(327, NULL, 'Josh Inglis', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(328, NULL, 'Alex Carey', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(329, NULL, 'Tim David', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(330, NULL, 'Pat Cummins', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(331, NULL, 'Mitchell Starc', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(332, NULL, 'Josh Hazlewood', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(333, NULL, 'Nathan Lyon', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(334, NULL, 'Adam Zampa', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(335, NULL, 'Sean Abbott', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(336, NULL, 'Ashton Agar', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(337, NULL, 'Michael Neser', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(338, NULL, 'Matthew Wade', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31'),
(339, NULL, 'Aaron Finch', NULL, 1, '2025-08-04 16:32:31', '2025-08-04 16:32:31');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `image` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `name`, `start_date`, `end_date`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test Tournament one', '2019-08-07 06:09:00', '2006-09-02 07:08:00', 'uploads/1748962127.png', '0', '2025-06-03 14:48:47', '2025-07-27 16:18:13'),
(2, 'Test tournament 2', '2025-03-05 20:20:00', '2025-11-25 15:05:00', 'uploads/1748962251.png', '1', '2025-06-03 14:50:51', '2025-07-27 16:18:15'),
(3, 'Aliquip duis molesti', '1978-06-28 21:46:00', '1992-10-11 06:45:00', 'uploads/1753621657.png', '0', '2025-07-27 13:07:37', '2025-07-27 13:07:37'),
(4, 'Ipsum veniam beata', '2005-06-28 05:11:00', '1990-12-13 22:02:00', 'uploads/1753623406.png', '0', '2025-07-27 13:36:46', '2025-07-27 13:36:46'),
(5, 'adfasdf', '2222-02-22 22:22:00', '2222-02-22 22:22:00', 'uploads/1753633047.png', '0', '2025-07-27 16:17:27', '2025-07-27 16:17:27'),
(6, 'adfasdf', '2222-02-22 22:22:00', '2222-02-22 22:22:00', 'uploads/1753633083.png', '0', '2025-07-27 16:18:03', '2025-07-27 16:18:03'),
(7, 'BPL', '2222-02-22 22:22:00', '2222-02-22 22:22:00', 'uploads/1753633359.png', '0', '2025-07-27 16:22:39', '2025-07-27 16:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_participant`
--

CREATE TABLE `tournament_participant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tournament_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tournament_teams`
--

CREATE TABLE `tournament_teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tournament_id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournament_teams`
--

INSERT INTO `tournament_teams` (`id`, `tournament_id`, `team_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 70, '1', '2025-06-03 14:48:47', '2025-06-03 14:48:47'),
(2, 1, 76, '1', '2025-06-03 14:48:47', '2025-06-03 14:48:47'),
(3, 1, 53, '1', '2025-06-03 14:48:47', '2025-06-03 14:48:47'),
(4, 1, 80, '1', '2025-06-03 14:48:47', '2025-06-03 14:48:47'),
(5, 1, 70, '1', '2025-06-03 14:48:48', '2025-06-03 14:48:48'),
(6, 1, 62, '1', '2025-06-03 14:48:48', '2025-06-03 14:48:48'),
(7, 1, 61, '1', '2025-06-03 14:48:48', '2025-06-03 14:48:48'),
(8, 1, 60, '1', '2025-06-03 14:48:48', '2025-06-03 14:48:48'),
(9, 2, 54, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(10, 2, 48, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(11, 2, 65, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(12, 2, 52, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(13, 2, 83, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(14, 2, 65, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(15, 2, 50, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(16, 2, 54, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51'),
(17, 3, 68, '1', '2025-07-27 13:07:37', '2025-07-27 13:07:37'),
(18, 4, 71, '1', '2025-07-27 13:36:46', '2025-07-27 13:36:46'),
(19, 4, 56, '1', '2025-07-27 13:36:46', '2025-07-27 13:36:46'),
(20, 4, 60, '1', '2025-07-27 13:36:46', '2025-07-27 13:36:46'),
(21, 5, 57, '1', '2025-07-27 16:17:27', '2025-07-27 16:17:27'),
(22, 5, 57, '1', '2025-07-27 16:17:27', '2025-07-27 16:17:27'),
(23, 6, 57, '1', '2025-07-27 16:18:03', '2025-07-27 16:18:03'),
(24, 6, 57, '1', '2025-07-27 16:18:03', '2025-07-27 16:18:03'),
(25, 7, 81, '1', '2025-07-27 16:22:39', '2025-07-27 16:22:39'),
(26, 7, 56, '1', '2025-07-27 16:22:39', '2025-07-27 16:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `tournament_teams_players`
--

CREATE TABLE `tournament_teams_players` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tournament_team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tournament_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournament_teams_players`
--

INSERT INTO `tournament_teams_players` (`id`, `tournament_team_id`, `player_id`, `created_at`, `updated_at`, `tournament_id`) VALUES
(1, 1, 47, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(2, 1, 166, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(3, 1, 157, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(4, 1, 31, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(5, 1, 5, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(6, 1, 27, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(7, 1, 163, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(8, 1, 136, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(9, 1, 38, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(10, 1, 40, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(11, 1, 108, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(12, 1, 42, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(13, 1, 75, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(14, 1, 127, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(15, 1, 14, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(16, 2, 162, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(17, 2, 45, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(18, 2, 168, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(19, 2, 35, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(20, 2, 5, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(21, 2, 150, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(22, 2, 33, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(23, 2, 150, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(24, 2, 119, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(25, 2, 74, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(26, 2, 26, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(27, 2, 149, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(28, 2, 128, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(29, 2, 22, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(30, 2, 114, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(31, 3, 108, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(32, 3, 59, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(33, 3, 136, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(34, 3, 117, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(35, 3, 60, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(36, 3, 43, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(37, 3, 165, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(38, 3, 164, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(39, 3, 93, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(40, 3, 47, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(41, 3, 169, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(42, 3, 54, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(43, 3, 85, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(44, 3, 128, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(45, 3, 97, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(46, 4, 98, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(47, 4, 8, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(48, 4, 82, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(49, 4, 34, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(50, 4, 83, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(51, 4, 19, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(52, 4, 61, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(53, 4, 2, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(54, 4, 160, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(55, 4, 38, '2025-06-03 14:48:47', '2025-06-03 14:48:47', 1),
(56, 4, 38, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(57, 4, 147, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(58, 4, 144, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(59, 4, 120, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(60, 4, 64, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(61, 5, 129, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(62, 5, 41, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(63, 5, 32, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(64, 5, 96, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(65, 5, 105, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(66, 5, 98, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(67, 5, 10, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(68, 5, 65, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(69, 5, 133, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(70, 5, 145, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(71, 5, 37, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(72, 5, 126, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(73, 5, 128, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(74, 5, 124, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(75, 5, 159, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(76, 6, 40, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(77, 6, 53, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(78, 6, 8, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(79, 6, 27, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(80, 6, 105, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(81, 6, 163, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(82, 6, 162, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(83, 6, 97, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(84, 6, 117, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(85, 6, 101, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(86, 6, 168, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(87, 6, 10, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(88, 6, 150, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(89, 6, 153, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(90, 6, 163, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(91, 7, 79, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(92, 7, 121, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(93, 7, 7, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(94, 7, 7, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(95, 7, 69, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(96, 7, 122, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(97, 7, 130, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(98, 7, 140, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(99, 7, 141, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(100, 7, 159, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(101, 7, 145, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(102, 7, 77, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(103, 7, 120, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(104, 7, 88, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(105, 7, 96, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(106, 8, 77, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(107, 8, 141, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(108, 8, 34, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(109, 8, 127, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(110, 8, 143, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(111, 8, 141, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(112, 8, 107, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(113, 8, 35, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(114, 8, 139, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(115, 8, 134, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(116, 8, 147, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(117, 8, 56, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(118, 8, 114, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(119, 8, 90, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(120, 8, 144, '2025-06-03 14:48:48', '2025-06-03 14:48:48', 1),
(121, 9, 84, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(122, 9, 162, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(123, 9, 41, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(124, 9, 139, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(125, 9, 34, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(126, 9, 21, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(127, 9, 133, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(128, 9, 5, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(129, 9, 91, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(130, 9, 94, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(131, 9, 50, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(132, 9, 35, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(133, 9, 21, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(134, 9, 20, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(135, 9, 29, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(136, 10, 46, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(137, 10, 66, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(138, 10, 73, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(139, 10, 143, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(140, 10, 110, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(141, 10, 145, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(142, 10, 100, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(143, 10, 63, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(144, 10, 105, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(145, 10, 147, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(146, 10, 128, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(147, 10, 73, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(148, 10, 85, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(149, 10, 60, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(150, 10, 75, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(151, 11, 53, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(152, 11, 34, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(153, 11, 14, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(154, 11, 67, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(155, 11, 132, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(156, 11, 127, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(157, 11, 57, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(158, 11, 129, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(159, 11, 15, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(160, 11, 43, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(161, 11, 63, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(162, 11, 119, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(163, 11, 41, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(164, 11, 120, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(165, 11, 126, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(166, 12, 149, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(167, 12, 141, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(168, 12, 49, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(169, 12, 168, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(170, 12, 153, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(171, 12, 66, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(172, 12, 98, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(173, 12, 143, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(174, 12, 131, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(175, 12, 48, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(176, 12, 70, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(177, 12, 29, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(178, 12, 83, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(179, 12, 159, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(180, 12, 59, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(181, 13, 14, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(182, 13, 138, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(183, 13, 109, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(184, 13, 159, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(185, 13, 31, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(186, 13, 63, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(187, 13, 19, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(188, 13, 105, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(189, 13, 79, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(190, 13, 158, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(191, 13, 151, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(192, 13, 77, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(193, 13, 151, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(194, 13, 157, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(195, 13, 77, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(196, 14, 99, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(197, 14, 69, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(198, 14, 29, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(199, 14, 59, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(200, 14, 61, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(201, 14, 68, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(202, 14, 137, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(203, 14, 95, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(204, 14, 6, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(205, 14, 4, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(206, 14, 55, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(207, 14, 101, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(208, 14, 79, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(209, 14, 41, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(210, 14, 101, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(211, 15, 18, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(212, 15, 37, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(213, 15, 31, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(214, 15, 124, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(215, 15, 142, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(216, 15, 32, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(217, 15, 5, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(218, 15, 39, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(219, 15, 130, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(220, 15, 30, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(221, 15, 75, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(222, 15, 52, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(223, 15, 32, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(224, 15, 134, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(225, 15, 156, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(226, 16, 154, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(227, 16, 155, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(228, 16, 60, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(229, 16, 20, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(230, 16, 135, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(231, 16, 4, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(232, 16, 75, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(233, 16, 90, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(234, 16, 40, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(235, 16, 81, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(236, 16, 79, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(237, 16, 136, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(238, 16, 164, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(239, 16, 47, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(240, 16, 17, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2),
(241, 17, 125, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(242, 17, 127, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(243, 17, 152, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(244, 17, 75, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(245, 17, 69, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(246, 17, 162, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(247, 17, 17, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(248, 17, 71, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(249, 17, 50, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(250, 17, 152, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(251, 17, 32, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(252, 17, 140, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(253, 17, 67, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(254, 17, 36, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(255, 17, 164, '2025-07-27 13:07:37', '2025-07-27 13:07:37', 3),
(256, 18, 123, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(257, 18, 83, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(258, 18, 78, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(259, 18, 4, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(260, 18, 115, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(261, 18, 73, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(262, 18, 94, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(263, 18, 92, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(264, 18, 127, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(265, 18, 101, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(266, 18, 31, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(267, 18, 37, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(268, 18, 70, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(269, 18, 61, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(270, 18, 58, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(271, 19, 144, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(272, 19, 73, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(273, 19, 104, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(274, 19, 120, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(275, 19, 29, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(276, 19, 126, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(277, 19, 4, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(278, 19, 137, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(279, 19, 25, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(280, 19, 57, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(281, 19, 112, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(282, 19, 79, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(283, 19, 87, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(284, 19, 117, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(285, 19, 152, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(286, 20, 123, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(287, 20, 122, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(288, 20, 13, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(289, 20, 29, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(290, 20, 18, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(291, 20, 155, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(292, 20, 104, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(293, 20, 44, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(294, 20, 43, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(295, 20, 120, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(296, 20, 73, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(297, 20, 165, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(298, 20, 31, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(299, 20, 86, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(300, 20, 80, '2025-07-27 13:36:46', '2025-07-27 13:36:46', 4),
(301, 21, 2, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(302, 21, 1, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(303, 21, 6, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(304, 21, 12, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(305, 22, 2, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(306, 22, 23, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(307, 22, 22, '2025-07-27 16:17:27', '2025-07-27 16:17:27', 5),
(308, 23, 2, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(309, 23, 1, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(310, 23, 6, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(311, 23, 12, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(312, 24, 2, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(313, 24, 23, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(314, 24, 22, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(315, 24, 13, '2025-07-27 16:18:03', '2025-07-27 16:18:03', 6),
(316, 25, 1, '2025-07-27 16:22:39', '2025-07-27 16:22:39', 7),
(317, 25, 2, '2025-07-27 16:22:39', '2025-07-27 16:22:39', 7),
(318, 26, 3, '2025-07-27 16:22:39', '2025-07-27 16:22:39', 7),
(319, 26, 12, '2025-07-27 16:22:39', '2025-07-27 16:22:39', 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `credit_points` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  `register_ip` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `api_token` varchar(80) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00,
  `crypto_address` varchar(255) DEFAULT NULL,
  `paypal_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `credit_points`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `login_ip`, `register_ip`, `status`, `api_token`, `balance`, `crypto_address`, `paypal_address`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', NULL, 1, '2025-06-02 17:47:57', '$2y$10$om8SuIA7R3Svm0DxHqmYY.MvMnBJDxRyZyr47cOzGmZundJNKHF2q', 2, 'sm4A0HpBQqj3vlLHumSDg2TPv0o5gjO0dsxCYOG5tbkpfWbshWnhNRkmEavq', '2025-06-02 17:47:57', '2025-08-07 17:19:40', '103.159.186.105', NULL, '1', NULL, 0.00, NULL, NULL),
(2, 'user', 'user', 'user@gmail.com', NULL, 1705, '2025-06-02 17:47:57', '$2y$10$.FVX5p90b9zvtmyLKAL50eyCmUKttl2gZc.L/l1kHkbMhucGX8bVm', 1, '1QdPKwyIig', '2025-06-02 17:47:57', '2025-07-30 13:27:40', '111111', NULL, '1', NULL, 0.00, NULL, NULL),
(3, 'pronay', 'pronay', 'pronaykumar36@gmail.com', '111', 22, NULL, '$2y$10$brpG7nZM8zEzGI4mIUSu3eAS67V6iNI.9W8NxIrKd9230wJncQX8.', 1, NULL, '2025-06-18 14:38:15', '2025-06-20 14:07:52', '103.159.186.68', '103.159.187.117', '1', NULL, 0.00, NULL, NULL),
(4, 'pronaykumar3', 'at', 'pronaykumar3@gmail.com', '523648466', 11, NULL, '$2y$10$jmBXtZ5AiO0gXe0kUz2Raur1hOuJuBmS3cnWIf3Pi2qOLwUX.eEWy', 1, NULL, '2025-06-18 14:48:09', '2025-06-24 14:20:25', '103.159.187.97', '103.159.187.97', '1', NULL, 0.00, NULL, NULL),
(5, 'user', 'user1', 'user2@gmail.com', '073546194646', 0, NULL, '$2y$10$yB2XRVI/aMdcOg5sM27JV.V8iL52fk4YinQyVgLRMHh81T2IULE1q', 1, NULL, '2025-06-22 16:14:56', '2025-06-22 16:14:56', '103.170.179.106', '103.170.179.106', '1', NULL, 0.00, NULL, NULL),
(6, 'user11', 'user11', 'user11@gmail.com', '123', 1206, NULL, '$2y$10$CplALcSSpF7WKBJHgx2HU./C5DhrDnfWYf/Jkl2fIXDMTISItav1K', 1, NULL, '2025-06-24 19:26:13', '2025-06-24 14:05:37', '103.159.186.71', '103.159.186.95', '1', NULL, 0.00, NULL, NULL),
(7, 'user3', 'user3', 'user3@gmail.com', NULL, 995, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 19:35:37', '103.159.186.112', NULL, '01', NULL, 0.00, NULL, NULL),
(8, 'user4', 'user4', 'user4@gmail.com', NULL, 1000, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 19:38:37', '103.159.186.71', NULL, '01', NULL, 0.00, NULL, NULL),
(9, 'user5', 'user5', 'user5@gmail.com', NULL, 965, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 19:41:50', '103.159.186.71', NULL, '01', NULL, 0.00, NULL, NULL),
(10, 'user6', 'user6', 'user6@gmail.com', NULL, 995, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 19:43:27', '103.159.186.71', NULL, '01', NULL, 0.00, NULL, NULL),
(11, 'user7', 'user7', 'user7@gmail.com', NULL, 980, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 14:02:30', '103.159.186.95', NULL, '01', NULL, 0.00, NULL, NULL),
(12, 'user8', 'user8', 'user8@gmail.com', NULL, 990, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 14:04:15', '103.159.186.112', NULL, '01', NULL, 0.00, NULL, NULL),
(13, 'user9', 'user9', 'user9@gmail.com', NULL, 995, NULL, '$2a$12$.VSyFjQknMXD9I5gzLGib.CkVctI1/v8o.EY3tCBDQr3Y6WRq2.AC', 1, NULL, NULL, '2025-06-24 14:04:51', '103.159.186.112', NULL, '01', NULL, 0.00, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_user_id_foreign` (`user_id`),
  ADD KEY `answers_question_id_foreign` (`question_id`),
  ADD KEY `answers_option_id_foreign` (`option_id`);

--
-- Indexes for table `ballerresult`
--
ALTER TABLE `ballerresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batsman`
--
ALTER TABLE `batsman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `batsmanresult`
--
ALTER TABLE `batsmanresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `big_shorts`
--
ALTER TABLE `big_shorts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `boller`
--
ALTER TABLE `boller`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `champion`
--
ALTER TABLE `champion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `championresult`
--
ALTER TABLE `championresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `finalist`
--
ALTER TABLE `finalist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finalistresult`
--
ALTER TABLE `finalistresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `linkads`
--
ALTER TABLE `linkads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `match_list`
--
ALTER TABLE `match_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `match_report`
--
ALTER TABLE `match_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `match_run`
--
ALTER TABLE `match_run`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_user`
--
ALTER TABLE `notification_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `options_question_id_foreign` (`question_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poll_answers`
--
ALTER TABLE `poll_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_answers_user_id_foreign` (`user_id`),
  ADD KEY `poll_answers_poll_id_foreign` (`poll_id`),
  ADD KEY `poll_answers_poll_option_id_foreign` (`poll_option_id`);

--
-- Indexes for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poll_options_poll_id_foreign` (`poll_id`);

--
-- Indexes for table `predict_matches`
--
ALTER TABLE `predict_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predict_players`
--
ALTER TABLE `predict_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predict_teams`
--
ALTER TABLE `predict_teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prize_banner`
--
ALTER TABLE `prize_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semifinal`
--
ALTER TABLE `semifinal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `semifinalresult`
--
ALTER TABLE `semifinalresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `singlematchresult`
--
ALTER TABLE `singlematchresult`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `single_match_result`
--
ALTER TABLE `single_match_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_rewards`
--
ALTER TABLE `social_rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_rewards_user_id_foreign` (`user_id`);

--
-- Indexes for table `spin_list`
--
ALTER TABLE `spin_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_players`
--
ALTER TABLE `team_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournaments`
--
ALTER TABLE `tournaments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournament_participant`
--
ALTER TABLE `tournament_participant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tournament_teams_tournament_id_foreign` (`tournament_id`),
  ADD KEY `tournament_teams_team_id_foreign` (`team_id`);

--
-- Indexes for table `tournament_teams_players`
--
ALTER TABLE `tournament_teams_players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ballerresult`
--
ALTER TABLE `ballerresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `batsman`
--
ALTER TABLE `batsman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `batsmanresult`
--
ALTER TABLE `batsmanresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `big_shorts`
--
ALTER TABLE `big_shorts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `boller`
--
ALTER TABLE `boller`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `champion`
--
ALTER TABLE `champion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `championresult`
--
ALTER TABLE `championresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dynamic_pages`
--
ALTER TABLE `dynamic_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finalist`
--
ALTER TABLE `finalist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `finalistresult`
--
ALTER TABLE `finalistresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `linkads`
--
ALTER TABLE `linkads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `match_list`
--
ALTER TABLE `match_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `match_report`
--
ALTER TABLE `match_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `match_run`
--
ALTER TABLE `match_run`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notification_user`
--
ALTER TABLE `notification_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `poll_answers`
--
ALTER TABLE `poll_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `predict_matches`
--
ALTER TABLE `predict_matches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `predict_players`
--
ALTER TABLE `predict_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `predict_teams`
--
ALTER TABLE `predict_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prize_banner`
--
ALTER TABLE `prize_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `semifinal`
--
ALTER TABLE `semifinal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `semifinalresult`
--
ALTER TABLE `semifinalresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `singlematchresult`
--
ALTER TABLE `singlematchresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `single_match_result`
--
ALTER TABLE `single_match_result`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_rewards`
--
ALTER TABLE `social_rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `spin_list`
--
ALTER TABLE `spin_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `team_players`
--
ALTER TABLE `team_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tournament_participant`
--
ALTER TABLE `tournament_participant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tournament_teams_players`
--
ALTER TABLE `tournament_teams_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_answers`
--
ALTER TABLE `poll_answers`
  ADD CONSTRAINT `poll_answers_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_answers_poll_option_id_foreign` FOREIGN KEY (`poll_option_id`) REFERENCES `poll_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `poll_answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_poll_id_foreign` FOREIGN KEY (`poll_id`) REFERENCES `polls` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_rewards`
--
ALTER TABLE `social_rewards`
  ADD CONSTRAINT `social_rewards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  ADD CONSTRAINT `tournament_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tournament_teams_tournament_id_foreign` FOREIGN KEY (`tournament_id`) REFERENCES `tournaments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
