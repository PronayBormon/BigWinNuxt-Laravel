-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2025 at 06:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
(3, 'Dolore similique rer', 'image', 'ads/1750176677.jpeg', '2025-06-17 16:11:17', '2025-06-17 16:11:17');

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
(1, 1, 1, 1, 0, 0, 97, 88, '2025-06-03 16:06:23', '2025-06-03 16:06:23');

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
(1, 1, 1, 1, 69, 0, 0, 24, '2025-06-03 15:20:54', '2025-06-03 15:20:54');

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
(1, 2, 9, 121, 121, '2025-06-20 14:40:21', '2025-06-20 14:40:21');

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
(1, 'singleMatchPage', NULL, NULL, NULL, 'cms/1750261213.png', NULL, NULL, '2025-06-18 15:40:13', '2025-06-18 15:40:13'),
(2, 'maxpredictPage', NULL, NULL, NULL, 'cms/1750262695.jpeg', NULL, NULL, '2025-06-18 16:04:55', '2025-06-18 16:04:55'),
(3, 'walletPage', NULL, NULL, NULL, 'cms/1750262738.jpg', NULL, NULL, '2025-06-18 16:05:38', '2025-06-18 16:05:38'),
(4, 'winnerPage', NULL, NULL, NULL, 'cms/1750262747.png', NULL, NULL, '2025-06-18 16:05:47', '2025-06-18 16:05:47'),
(5, 'profilePage', NULL, NULL, NULL, 'cms/1750262753.jpeg', NULL, NULL, '2025-06-18 16:05:53', '2025-06-18 16:05:53');

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
(48, 'India', '183903118.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(49, 'Pakistan', '1221114629.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(50, 'Australia', '86463351.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(51, 'England', '28099063.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(52, 'West Indies', '1638743264.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(53, 'South Africa', '2117990730.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(54, 'New Zealand', '1467618457.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(55, 'Sri Lanka', '508868760.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(56, 'Bangladesh', '198824309.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(57, 'Afghanistan', '2013001144.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(58, 'Zimbabwe', '1314592742.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(59, 'Ireland', '1365042192.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(60, 'Scotland', '29602780.jpg', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(61, 'Netherlands', '1386039070.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(62, 'Namibia', '1062870303.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(63, 'UAE', '820332060.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(65, 'Nepal', '1071760655.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(66, 'USA', '1672732692.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(67, 'Oman', '2053599473.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(68, 'PNG', '955292146.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(69, 'Canada', '813515040.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(70, 'Lahore Qalandars', '1235794920.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(71, 'Karachi Kings', '1413710988.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(72, 'Islamabad United', '658878190.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(73, 'Peshawar Zalmi', '700357201.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(74, 'Quetta Gladiators', '310917500.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(75, 'Multan Sultans', '20888909.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(76, 'Sydney Sixers', '847026229.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(77, 'Sydney Thunder', '1743476068.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(78, 'Melbourne Stars', '1889465609.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(79, 'Melbourne Renegades', '80649637.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(80, 'Brisbane Heat', '1200610315.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(81, 'Adelaide Strikers', '1595626676.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(82, 'Perth Scorchers', '1992450081.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51'),
(83, 'Hobart Hurricanes', '1625087571.png', 1, '2025-06-02 17:47:57', '2025-06-03 14:47:51');

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
(1, 2, 9, 10, 121, 121, 1, '2025-06-20 14:40:11', '2025-06-20 14:40:11');

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
(3, 99, 'https://www.meqozegudiju.net', 'Obcaecati ducimus v', 'active', '2025-06-18 16:30:28', '2025-06-18 16:30:28');

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
(1, 73, 70, '2025-06-03 11:01:00', 1, '1', 1, 'uploads/1748963442.png', '2025-06-03 15:10:42', '2025-06-18 15:31:33', '2025-10-03 11:11:00');

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
(3, 3, 1, 73, NULL, '2025-06-18 15:31:07', '2025-06-18 15:31:07');

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
(3, 1, 3, 0, '2025-06-18 15:31:07', '2025-06-18 15:31:07');

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
(66, '2025_06_19_192815_add_link_id_in_social_rewards', 3);

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
(2, 1, 4, 'unread', '2025-06-18 14:48:09', '2025-06-18 14:48:09');

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
(4, 1, 'Dolorum laboriosam', '2025-06-03 15:21:44', '2025-06-03 15:21:44');

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
(22, 'App\\Models\\User', 2, '', '99a15416c3d10ded61dedcaaf4fedcf2cb6368afd8b72aa0e47eed31bcd93c5a', '[\"*\"]', NULL, NULL, '2025-06-20 15:03:04', '2025-06-20 15:03:04');

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
(2, 'Deserunt alias conse', 'inactive', '2025-06-17 14:02:38', '2025-06-17 14:06:23'),
(3, 'Magna pariatur Vero', 'active', '2025-06-17 14:04:16', '2025-06-17 14:06:48');

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
(5, 4, 3, 10, '2025-06-18 14:48:19', '2025-06-18 14:48:19');

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
(12, 3, 'Officia eos ut dolo', '2025-06-17 14:04:16', '2025-06-17 14:04:16');

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
(1, '2025-02-25 08:56:00', '2025-06-18 10:53:00', '2025-06-03 15:11:30', '2025-06-03 15:11:30', 'inactive');

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
(30, 1, 2, 120, '2025-06-03 15:11:30', '2025-06-03 15:11:30');

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
(2, 1, 71, '2025-06-03 15:11:30', '2025-06-03 15:11:30');

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
(1, 'asdfasdf', '1750258965.jpg', 1, '2025-06-18 15:02:45', '2025-06-18 15:02:45', 2),
(2, 'Maiores qui voluptas', '1750258987.png', 1, '2025-06-18 15:03:07', '2025-06-18 15:03:07', 1),
(3, 'fasd', '1750259058.jpeg', 1, '2025-06-18 15:04:18', '2025-06-18 15:04:18', 3);

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
(1, 'Deleniti fugiat in s', 'active', '2025-06-03 15:21:44', '2025-06-03 15:21:44');

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
(4, 2, 9, 58, 4, 69, 82, 4, 1, '2025-06-20 14:39:39', '2025-06-20 14:39:39');

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
(1, NULL, '1743608337.jpg', 1, '2025-06-04 15:07:16', '2025-06-04 15:07:16');

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
(16, 2, NULL, 1, '2025-06-19 13:31:42', '2025-06-19 13:31:42', 1);

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
(2, 'Dominic Shepard', 1, 19, '2025-06-02 17:48:57', '2025-06-02 17:48:57');

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
(169, NULL, 'Aaron Finch', NULL, 1, '2025-06-03 14:47:51', '2025-06-03 14:47:51');

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
(1, 'Test Tournament one', '2019-08-07 06:09:00', '2006-09-02 07:08:00', 'uploads/1748962127.png', '1', '2025-06-03 14:48:47', '2025-06-03 14:49:01'),
(2, 'Test tournament 2', '2025-03-05 20:20:00', '2025-11-25 15:05:00', 'uploads/1748962251.png', '0', '2025-06-03 14:50:51', '2025-06-03 14:50:51');

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
(16, 2, 54, '1', '2025-06-03 14:50:51', '2025-06-03 14:50:51');

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
(240, 16, 17, '2025-06-03 14:50:51', '2025-06-03 14:50:51', 2);

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
(1, 'admin', 'admin', 'admin@gmail.com', NULL, 1, '2025-06-02 17:47:57', '$2y$10$om8SuIA7R3Svm0DxHqmYY.MvMnBJDxRyZyr47cOzGmZundJNKHF2q', 2, 'DCUqfzKN0X', '2025-06-02 17:47:57', '2025-06-20 14:45:28', '103.159.186.97', NULL, '1', NULL, 0.00, NULL, NULL),
(2, 'user', 'user', 'user@gmail.com', NULL, 810, '2025-06-02 17:47:57', '$2y$10$.FVX5p90b9zvtmyLKAL50eyCmUKttl2gZc.L/l1kHkbMhucGX8bVm', 2, '1QdPKwyIig', '2025-06-02 17:47:57', '2025-06-20 15:03:04', '103.159.186.117', NULL, '1', NULL, 0.00, NULL, NULL),
(3, 'pronay', 'pronay', 'pronaykumar36@gmail.com', '111', 22, NULL, '$2y$10$brpG7nZM8zEzGI4mIUSu3eAS67V6iNI.9W8NxIrKd9230wJncQX8.', 1, NULL, '2025-06-18 14:38:15', '2025-06-20 14:07:52', '103.159.186.68', '103.159.187.117', '1', NULL, 0.00, NULL, NULL),
(4, '@', 'at', 'pronaykumar3@gmail.com', '523648466', 11, NULL, '$2y$10$jmBXtZ5AiO0gXe0kUz2Raur1hOuJuBmS3cnWIf3Pi2qOLwUX.eEWy', 1, NULL, '2025-06-18 14:48:09', '2025-06-18 14:48:19', '103.159.187.97', '103.159.187.97', '1', NULL, 0.00, NULL, NULL);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ballerresult`
--
ALTER TABLE `ballerresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `batsman`
--
ALTER TABLE `batsman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `batsmanresult`
--
ALTER TABLE `batsmanresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `linkads`
--
ALTER TABLE `linkads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `match_list`
--
ALTER TABLE `match_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `match_report`
--
ALTER TABLE `match_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `match_run`
--
ALTER TABLE `match_run`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_user`
--
ALTER TABLE `notification_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poll_answers`
--
ALTER TABLE `poll_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `poll_options`
--
ALTER TABLE `poll_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `predict_matches`
--
ALTER TABLE `predict_matches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `predict_players`
--
ALTER TABLE `predict_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `predict_teams`
--
ALTER TABLE `predict_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `prize_banner`
--
ALTER TABLE `prize_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `semifinal`
--
ALTER TABLE `semifinal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `semifinalresult`
--
ALTER TABLE `semifinalresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `singlematchresult`
--
ALTER TABLE `singlematchresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_rewards`
--
ALTER TABLE `social_rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `spin_list`
--
ALTER TABLE `spin_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_players`
--
ALTER TABLE `team_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tournament_participant`
--
ALTER TABLE `tournament_participant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tournament_teams_players`
--
ALTER TABLE `tournament_teams_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
