-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2025 at 05:33 PM
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
-- Database: `bigwin`
--

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
(1, 1, 2, 30, 2, 2, 2, 2, '2025-04-05 18:22:51', '2025-04-05 18:22:51'),
(2, 1, 2, 29, 3, 3, 3, 3, '2025-04-05 18:23:01', '2025-04-05 18:23:01');

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
(1, 1, 2, 30, 4, 1, 1, 1, 1, '0', '2025-04-11 14:53:24', '2025-04-11 14:53:24'),
(2, 1, 2, 28, 6, 4, 4, 4, 4, '0', '2025-04-11 14:53:49', '2025-04-11 14:53:49'),
(3, 1, 1, 1, 17, 1, 1, 1, 1, '0', '2025-04-13 16:46:58', '2025-04-13 16:46:58');

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
(1, 1, 2, 30, 1, 1, 1, 1, '2025-04-05 18:22:43', '2025-04-05 18:22:43'),
(2, 1, 2, 28, 4, 4, 4, 4, '2025-04-05 18:23:09', '2025-04-05 18:23:09');

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
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2025-04-07 18:10:14', '2025-04-07 18:10:14'),
(2, 1, 2, 4, 30, 2, 2, 2, 2, 1, '2025-04-11 14:12:20', '2025-04-11 14:12:20'),
(3, 1, 2, 5, 29, 3, 3, 3, 3, 1, '2025-04-11 14:17:03', '2025-04-11 14:17:03'),
(4, 1, 1, 17, 8, 1, 1, 1, 1, 1, '2025-04-13 16:47:33', '2025-04-13 16:47:33');

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
(1, 4, 2, 1, 1, 2, '2025-04-11 15:41:43', '2025-04-11 15:41:43'),
(2, 5, 3, 4, 46, 47, '2025-04-11 16:28:22', '2025-04-11 16:28:22'),
(5, 4, 3, 4, 46, 47, '2025-04-11 16:50:29', '2025-04-11 16:50:29'),
(6, 5, 3, 4, 46, 47, '2025-04-11 16:51:56', '2025-04-11 16:51:56'),
(7, 6, 3, 4, 46, 47, '2025-04-11 17:14:41', '2025-04-11 17:14:41'),
(8, 4, 3, 5, 46, 53, '2025-04-11 17:21:41', '2025-04-11 17:21:41'),
(9, 8, 3, 4, 46, 47, '2025-04-11 17:29:21', '2025-04-11 17:29:21'),
(10, 7, 3, 4, 46, 47, '2025-04-11 17:30:52', '2025-04-11 17:30:52'),
(11, 10, 3, 7, 46, 47, '2025-04-11 17:35:23', '2025-04-11 17:35:23');

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
(1, 2, 1, 1, 2, '2025-04-11 15:43:59', '2025-04-11 15:43:59'),
(2, 3, 4, 46, 47, '2025-04-11 16:29:18', '2025-04-11 16:29:18');

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
(48, 'India', '183903118.png', 1, '2025-04-04 19:12:56', '2025-04-04 19:12:56'),
(49, 'Pakistan', '1221114629.png', 1, '2025-04-04 19:13:18', '2025-04-04 19:13:18'),
(50, 'Australia', '86463351.jpg', 1, '2025-04-04 19:13:54', '2025-04-04 19:13:54'),
(51, 'England', '28099063.jpg', 1, '2025-04-04 19:14:22', '2025-04-04 19:14:22'),
(52, 'West Indies', '1638743264.jpg', 1, '2025-04-04 19:14:45', '2025-04-04 19:14:45'),
(53, 'South Africa', '2117990730.png', 1, '2025-04-04 19:15:05', '2025-04-04 19:15:05'),
(54, 'New Zealand', '1467618457.png', 1, '2025-04-04 19:15:22', '2025-04-04 19:15:22'),
(55, 'Sri Lanka', '508868760.png', 1, '2025-04-04 19:15:58', '2025-04-04 19:15:58'),
(56, 'Bangladesh', '198824309.jpg', 1, '2025-04-04 19:16:16', '2025-04-04 19:16:16'),
(57, 'Afghanistan', '2013001144.jpg', 1, '2025-04-04 19:16:31', '2025-04-04 19:16:31'),
(58, 'Zimbabwe', '1314592742.png', 1, '2025-04-04 19:16:48', '2025-04-04 19:16:48'),
(59, 'Ireland', '1365042192.png', 1, '2025-04-04 19:17:12', '2025-04-04 19:17:12'),
(60, 'Scotland', '29602780.jpg', 1, '2025-04-04 19:17:29', '2025-04-04 19:17:29'),
(61, 'Netherlands', '1386039070.png', 1, '2025-04-04 19:17:44', '2025-04-04 19:17:44'),
(62, 'Namibia', '1062870303.png', 1, '2025-04-04 19:18:19', '2025-04-04 19:18:19'),
(63, 'UAE', '820332060.png', 1, '2025-04-04 19:18:32', '2025-04-04 19:18:32'),
(65, 'Nepal', '1071760655.png', 1, '2025-04-04 19:19:05', '2025-04-04 19:19:05'),
(66, 'USA', '1672732692.png', 1, '2025-04-04 19:19:22', '2025-04-04 19:19:22'),
(67, 'Oman', '2053599473.png', 1, '2025-04-04 19:19:42', '2025-04-04 19:19:42'),
(68, 'PNG', '955292146.png', 1, '2025-04-04 19:19:59', '2025-04-04 19:19:59'),
(69, 'Canada', '813515040.png', 1, '2025-04-04 19:20:15', '2025-04-04 19:20:15'),
(70, 'Lahore Qalandars', '1235794920.png', 1, '2025-04-04 19:37:42', '2025-04-04 19:37:42'),
(71, 'Karachi Kings', '1413710988.png', 1, '2025-04-04 19:38:03', '2025-04-04 19:38:03'),
(72, 'Islamabad United', '658878190.png', 1, '2025-04-04 19:38:24', '2025-04-04 19:38:24'),
(73, 'Peshawar Zalmi', '700357201.png', 1, '2025-04-04 19:38:50', '2025-04-04 19:38:50'),
(74, 'Quetta Gladiators', '310917500.png', 1, '2025-04-04 19:39:16', '2025-04-04 19:39:16'),
(75, 'Multan Sultans', '20888909.png', 1, '2025-04-04 19:39:40', '2025-04-04 19:39:40'),
(76, 'Sydney Sixers', '847026229.png', 1, '2025-04-04 20:13:10', '2025-04-04 20:13:10'),
(77, 'Sydney Thunder', '1743476068.png', 1, '2025-04-04 20:13:30', '2025-04-04 20:13:30'),
(78, 'Melbourne Stars', '1889465609.png', 1, '2025-04-04 20:13:51', '2025-04-04 20:13:51'),
(79, 'Melbourne Renegades', '80649637.png', 1, '2025-04-04 20:14:12', '2025-04-04 20:14:12'),
(80, 'Brisbane Heat', '1200610315.png', 1, '2025-04-04 20:14:33', '2025-04-04 20:14:33'),
(81, 'Adelaide Strikers', '1595626676.png', 1, '2025-04-04 20:15:07', '2025-04-04 20:15:07'),
(82, 'Perth Scorchers', '1992450081.png', 1, '2025-04-04 20:15:38', '2025-04-04 20:15:38'),
(83, 'Hobart Hurricanes', '1625087571.png', 1, '2025-04-04 20:16:12', '2025-04-04 20:16:12');

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
(1, NULL, 'Future', 20.00, 1, '2025-04-14 14:53:43', '2025-04-14 14:53:43'),
(2, NULL, '2', 2.00, 1, '2025-04-14 14:54:35', '2025-04-14 14:54:35'),
(3, NULL, '2', 2.00, 0, '2025-04-14 14:55:43', '2025-04-14 14:55:43'),
(4, NULL, '3', 3.00, 1, '2025-04-14 14:56:47', '2025-04-14 14:56:47'),
(5, NULL, '4', 4.00, 1, '2025-04-14 14:56:58', '2025-04-14 14:56:58'),
(6, NULL, '5', 5.00, 1, '2025-04-14 14:58:06', '2025-04-14 14:58:06'),
(7, NULL, '6', 6.00, 1, '2025-04-14 14:58:45', '2025-04-14 14:58:45'),
(8, NULL, 'Test Update', 7.00, 1, '2025-04-14 14:59:05', '2025-04-14 15:24:52');

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
(1, 4, 2, 1, 2, 4, 7, 1, '2025-04-11 15:40:49', '2025-04-11 15:40:49'),
(5, 4, 3, 4, 5, 46, 47, 1, '2025-04-11 16:50:18', '2025-04-11 16:50:18'),
(6, 5, 3, 4, 5, 46, 47, 1, '2025-04-11 16:51:39', '2025-04-11 16:51:39'),
(7, 6, 3, 4, 5, 46, 47, 1, '2025-04-11 17:14:30', '2025-04-11 17:14:30'),
(8, 8, 3, 4, 5, 46, 47, 1, '2025-04-11 17:29:09', '2025-04-11 17:29:09'),
(9, 7, 3, 5, 6, 51, 56, 1, '2025-04-11 17:30:40', '2025-04-11 17:30:40'),
(10, 10, 3, 4, 5, 46, 47, 1, '2025-04-11 17:35:06', '2025-04-11 17:35:06');

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
(1, 2, 1, 2, 4, 6, 1, '2025-04-11 15:43:25', '2025-04-11 15:43:25'),
(2, 3, 4, 5, 46, 47, 1, '2025-04-11 16:29:08', '2025-04-11 16:29:08');

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
(1, 81, 57, '2025-04-08 11:01:00', 1, '1', 1, 'uploads/1743877034.png', '2025-04-05 18:17:14', '2025-04-05 18:17:14', '2025-04-10 11:00:00'),
(2, 56, 50, '2025-04-24 11:00:00', 1, '1', 1, 'uploads/1744469641.png', '2025-04-12 14:54:01', '2025-04-12 14:54:01', '2025-05-02 11:00:00');

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
(1, 4, 1, 81, NULL, '2025-04-05 18:17:35', '2025-04-05 18:17:35'),
(2, 5, 1, 57, NULL, '2025-04-05 18:17:43', '2025-04-05 18:17:43'),
(3, 7, 1, 81, NULL, '2025-04-05 18:17:54', '2025-04-05 18:17:54'),
(4, 6, 1, 57, NULL, '2025-04-05 18:18:12', '2025-04-05 18:18:12'),
(5, 8, 1, 57, NULL, '2025-04-05 18:18:22', '2025-04-05 18:18:22'),
(6, 17, 2, 56, NULL, '2025-04-13 16:35:19', '2025-04-13 16:35:19');

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
(1, 1, 4, 253, '2025-04-05 18:17:35', '2025-04-05 18:17:35'),
(2, 1, 5, 300, '2025-04-05 18:17:43', '2025-04-05 18:17:43'),
(3, 1, 7, 324, '2025-04-05 18:17:54', '2025-04-05 18:17:54'),
(4, 1, 6, 121, '2025-04-05 18:18:12', '2025-04-05 18:18:12'),
(5, 1, 8, 0, '2025-04-05 18:18:22', '2025-04-05 18:18:22'),
(6, 2, 17, 0, '2025-04-13 16:35:19', '2025-04-13 16:35:19');

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
(6, '2025_03_04_173428_add_username_role_login_ip_register_ip__status_to_user_table', 2),
(7, '2025_03_04_174059_add_username_role_login_ip_register_ip__status_to_user_table', 3),
(8, '2025_03_05_164105_add_phone_to_user_table', 4),
(9, '2025_03_05_172527_create_countries_list_table', 5),
(10, '2025_03_09_123051_add_api_token_to_users_table', 6),
(11, '2025_03_09_143850_create_cricket_match_list_table', 7),
(12, '2025_03_11_041218_create_prize_banner_table', 8),
(13, '2025_03_11_042126_add_type_to_prize_banner', 9),
(14, '2025_03_11_142755_create_spin_list_table', 10),
(15, '2025_03_11_171832_create_notification_table', 11),
(16, '2025_03_11_173544_create_notification_table', 12),
(17, '2025_03_12_141514_create_slider_table', 13),
(18, '2025_03_12_162135_add_end_time_to_match_list', 14),
(19, '2025_03_12_165841_create_match_list', 15),
(20, '2025_03_12_170054_add_end_time_to_match_list', 16),
(21, '2025_03_13_175847_create_batsman_table_', 17),
(22, '2025_03_13_180241_create_bollers_predict_table', 17),
(23, '2025_03_13_182522_create_batsman_table_', 18),
(24, '2025_03_13_183303_add_user_id_to_bollar_table', 19),
(25, '2025_03_13_183323_add_user_id_to_batsman_table', 19),
(26, '2025_03_14_180403_create_player_table_for_match', 20),
(27, '2025_03_14_225401_create_tournaments_table', 21),
(28, '2025_03_14_225411_create_tournament_teams_table', 21),
(29, '2025_03_16_205044_create_team_players', 22),
(30, '2025_03_17_012755_create_tournament_teams_players_table', 23),
(31, '2025_03_17_022454_add_tournament_id_to_tournament_teams_players_table', 24),
(32, '2025_03_17_145902_create_predict_tables', 25),
(33, '2025_03_18_130422_create_match_report_table', 26),
(34, '2025_03_18_233922_create_batsman_table', 27),
(35, '2025_03_18_234225_create_batsman_table', 28),
(36, '2025_03_19_021554_create_boller_table', 29),
(37, '2025_03_19_024228_create_tournament_participant_table', 30),
(38, '2025_03_19_024939_create_semi_final_prediction_table', 31),
(39, '2025_03_19_024940_create__finalist_table', 31),
(40, '2025_03_19_024940_create_final_prediction_table', 31),
(41, '2025_03_19_142939_add_user_id_match_id_to_finalist_table', 32),
(42, '2025_03_19_143230_add_user_id_match_id_to_finalist_table', 33),
(43, '2025_03_27_205007_create_single_match_result_table', 34),
(44, '2025_03_28_010458_create_baller_result_table', 35),
(45, '2025_03_28_010548_create_batsman_result_table', 35),
(46, '2025_03_28_124143_create_semifinalresult_table', 36),
(47, '2025_03_28_170221_create_finalistresult_table', 37),
(48, '2025_03_28_173232_create_championresult_table', 38),
(49, '2025_04_05_155104_add_creadit_point_to_user_table', 39),
(50, '2025_04_05_162729_add_image_column_top_match_list_table', 39),
(51, '2025_04_05_170810_create_mat_run_table', 39),
(52, '2025_04_12_202129_create_notification_user_table', 40),
(53, '2025_04_13_214712_create_site_settings_table', 41),
(54, '2025_04_14_202834_add_balance_crypto_address_and_paypal_add', 42),
(55, '2025_04_14_204909_create_credits_table', 43),
(56, '2025_04_14_213033_add_spin_creadit_to_settings_table', 44);

-- --------------------------------------------------------

--
-- Table structure for table `notificaion`
--

CREATE TABLE `notificaion` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Hello! New User, Welcome To our Platform. You got 10 Creadit point free.', 1, '2025-03-11 11:35:57', '2025-03-12 08:06:48'),
(3, 'Hi! I am Pronay.', 1, '2025-03-11 11:58:33', '2025-03-12 08:06:23'),
(4, 'Hi mr. admin.', 1, '2025-03-11 11:58:53', '2025-03-11 11:58:53'),
(5, 'Hi Mrs. Admin', 1, '2025-03-11 11:59:05', '2025-03-12 08:06:09'),
(6, 'Hi Mr. user', 1, '2025-03-11 12:02:07', '2025-03-12 08:05:51'),
(7, 'Greetings', 1, '2025-03-11 12:02:59', '2025-03-11 12:02:59'),
(8, 'Time Test Two', 1, '2025-03-11 12:10:46', '2025-03-12 08:05:37'),
(9, 'Time Test One', 1, '2025-03-11 18:12:07', '2025-03-12 08:04:12'),
(10, 'Test 2nd time', 1, '2025-03-17 18:24:46', '2025-03-17 18:25:13'),
(11, 'test user', 1, '2025-04-12 14:54:19', '2025-04-12 14:54:19'),
(12, 'test user', 1, '2025-04-12 14:55:38', '2025-04-12 14:55:38');

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
(1, 12, 1, 'read', '2025-04-12 14:55:38', '2025-04-14 14:32:33'),
(2, 12, 4, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(3, 12, 5, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(4, 12, 6, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(5, 12, 7, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(6, 12, 8, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(7, 12, 9, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(8, 12, 10, 'unread', '2025-04-12 14:55:38', '2025-04-12 14:55:38'),
(9, 1, 11, 'unread', '2025-04-12 16:46:39', '2025-04-12 16:46:39'),
(10, 1, 12, 'unread', '2025-04-12 16:54:43', '2025-04-12 16:54:43'),
(11, 1, 13, 'unread', '2025-04-12 19:28:56', '2025-04-12 19:28:56'),
(12, 1, 14, 'unread', '2025-04-12 19:33:27', '2025-04-12 19:33:27'),
(13, 1, 15, 'unread', '2025-04-12 19:39:36', '2025-04-12 19:39:36'),
(14, 1, 16, 'unread', '2025-04-12 19:50:42', '2025-04-12 19:50:42'),
(15, 1, 17, 'unread', '2025-04-13 16:20:52', '2025-04-13 16:20:52');

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
(33, 'App\\Models\\User', 5, '', '4477e644ad4bc1ebc50d36965cc694c89a8e0620faddc7ae98ad0b98d315de93', '[\"*\"]', '2025-03-09 05:03:54', NULL, '2025-03-09 05:01:56', '2025-03-09 05:03:54'),
(47, 'App\\Models\\User', 1, '', 'f352da0cd4937025d90c3d74995ae7099a29973a93d3d95bb137762f3f786ad3', '[\"*\"]', '2025-03-09 06:04:07', NULL, '2025-03-09 06:02:10', '2025-03-09 06:04:07'),
(48, 'App\\Models\\User', 1, '', '2f79c7240522fb3ff02e98fe0d10f39e07dd8432cf149f44877bd373d7eef643', '[\"*\"]', NULL, NULL, '2025-03-09 06:13:12', '2025-03-09 06:13:12'),
(49, 'App\\Models\\User', 1, '', 'c4c8bd0b6969d1f98e7677c51154897c933e870a020b3c4036bd423ab8130de5', '[\"*\"]', NULL, NULL, '2025-03-09 06:42:44', '2025-03-09 06:42:44'),
(50, 'App\\Models\\User', 4, '', '8732e7e4bdd8736e04c76a0a09730ada75de2bae4ce644c258cd7cc4c3b30b17', '[\"*\"]', NULL, NULL, '2025-03-09 06:48:56', '2025-03-09 06:48:56'),
(51, 'App\\Models\\User', 1, '', 'a333ade48aef44e10add7913867d708ae4a0de8cfe136a549fe0cb8fbecd86e9', '[\"*\"]', NULL, NULL, '2025-03-09 06:51:14', '2025-03-09 06:51:14'),
(52, 'App\\Models\\User', 1, '', '86aef0e6928869f54f61c0dcb8d12f851517d74765c812a5feb7be95e63e2ff2', '[\"*\"]', NULL, NULL, '2025-03-09 06:56:19', '2025-03-09 06:56:19'),
(53, 'App\\Models\\User', 1, '', '33a26467d560384f9c77339c11b83a707ceb923b06804686f5c5fe9a76971b1f', '[\"*\"]', NULL, NULL, '2025-03-09 06:56:51', '2025-03-09 06:56:51'),
(54, 'App\\Models\\User', 1, '', '039bb726a4b7c3c658e391fbe650f87a8bcb6bf67b1d529c2da0ddf71ef88cd4', '[\"*\"]', NULL, NULL, '2025-03-09 06:56:59', '2025-03-09 06:56:59'),
(55, 'App\\Models\\User', 1, '', '3c64cff52d22d93b3737d9cf4c8dfec929362f7a0f4f9f0d3f9d9c15b32a5b51', '[\"*\"]', '2025-03-09 07:06:03', NULL, '2025-03-09 07:02:41', '2025-03-09 07:06:03'),
(56, 'App\\Models\\User', 4, '', '28b0dd6a794111f587d02e18de7545ae3cc5bc1cae924e1e02ac83118d9f06b4', '[\"*\"]', '2025-03-09 07:09:21', NULL, '2025-03-09 07:06:02', '2025-03-09 07:09:21'),
(57, 'App\\Models\\User', 1, '', '0bb811689d8b41fb5db677b9a3f8703d9251d65d0d42a0e006b9fc9589b9ee49', '[\"*\"]', '2025-03-09 07:10:03', NULL, '2025-03-09 07:09:20', '2025-03-09 07:10:03'),
(58, 'App\\Models\\User', 4, '', '4165f2ae642559c5ec2a4aad0be8146f6d47993668993a3f9b5ac63d7d78b44e', '[\"*\"]', '2025-03-09 07:10:57', NULL, '2025-03-09 07:10:02', '2025-03-09 07:10:57'),
(59, 'App\\Models\\User', 1, '', '90ca543f05905e01de93208fedbe9ebc9b3db25bb9f65a4b9f8bb34603577f57', '[\"*\"]', '2025-03-09 07:11:54', NULL, '2025-03-09 07:10:56', '2025-03-09 07:11:54'),
(60, 'App\\Models\\User', 4, '', 'a3eca31b13fb8568fb166a5a4285d050403ec8029b6f347950f5be7908b80ce5', '[\"*\"]', '2025-03-09 07:13:10', NULL, '2025-03-09 07:11:53', '2025-03-09 07:13:10'),
(61, 'App\\Models\\User', 1, '', 'eedc4e09e12588e433d26718b3c000a1a3384b0113f3f08ce9a007d751f0b391', '[\"*\"]', '2025-03-09 07:13:30', NULL, '2025-03-09 07:13:09', '2025-03-09 07:13:30'),
(62, 'App\\Models\\User', 4, '', 'e5e3de05115c2eca5f2c50194800470f73dd5a5810e429d5ebfa1bb95a2f660a', '[\"*\"]', NULL, NULL, '2025-03-09 07:13:29', '2025-03-09 07:13:29'),
(63, 'App\\Models\\User', 1, '', 'fd15376c6995de5a91ed59d9e5d19b6ba9525df4a6bfb9c4305c14abd1f8ee97', '[\"*\"]', NULL, NULL, '2025-03-09 07:15:35', '2025-03-09 07:15:35'),
(64, 'App\\Models\\User', 1, '', '7131f8528d735c58b23074bbb7e563c6690b1509b0ffac8f415dc89d412af1da', '[\"*\"]', '2025-03-09 07:17:09', NULL, '2025-03-09 07:15:46', '2025-03-09 07:17:09'),
(65, 'App\\Models\\User', 4, '', 'c950e0467a529cccecfcd2ae3de500e619ae1a3155c01e6d28e36c77c592112d', '[\"*\"]', '2025-03-09 07:18:37', NULL, '2025-03-09 07:17:08', '2025-03-09 07:18:37'),
(66, 'App\\Models\\User', 1, '', '1852ceb987ba4628bc198cfe0f2f51651731b53dd11ac026c293676b8f386ae5', '[\"*\"]', '2025-03-09 07:21:32', NULL, '2025-03-09 07:18:36', '2025-03-09 07:21:32'),
(67, 'App\\Models\\User', 4, '', '25ca56a5efb217a2a2aa305229241f671daf42cad88f4309938c964e272d0069', '[\"*\"]', '2025-03-09 07:28:06', NULL, '2025-03-09 07:21:31', '2025-03-09 07:28:06'),
(68, 'App\\Models\\User', 1, '', '547fe68115cfef25f2b3145219d4154f630a517ed80e0edb501baa63e4dccf7d', '[\"*\"]', '2025-03-09 07:28:19', NULL, '2025-03-09 07:28:05', '2025-03-09 07:28:19'),
(69, 'App\\Models\\User', 4, '', '1db258e11ce2731535067b9817421929ff6d113ad0230011ebfc7bb3351c223b', '[\"*\"]', '2025-03-09 07:28:41', NULL, '2025-03-09 07:28:19', '2025-03-09 07:28:41'),
(70, 'App\\Models\\User', 1, '', '37c96fb877ea45cb195131b6f3d36e6ff24ee7cee7585008c9e116141cbe6016', '[\"*\"]', '2025-03-09 07:33:29', NULL, '2025-03-09 07:28:41', '2025-03-09 07:33:29'),
(71, 'App\\Models\\User', 4, '', '673ad273316901db4dc7c6c163aaaad7766733ee9a034be6c2c0f20bef77aba7', '[\"*\"]', '2025-03-09 07:38:00', NULL, '2025-03-09 07:33:28', '2025-03-09 07:38:00'),
(72, 'App\\Models\\User', 1, '', '849d3c2856d4ca8b38f26f8087102523232add10afcebb9e54209766d93a12ee', '[\"*\"]', '2025-03-09 07:40:58', NULL, '2025-03-09 07:37:59', '2025-03-09 07:40:58'),
(73, 'App\\Models\\User', 4, '', 'be5d14bd56a77aba0ec27961a40fae397eb8b7cbae675ea1218d078b18c479ab', '[\"*\"]', NULL, NULL, '2025-03-09 07:38:15', '2025-03-09 07:38:15'),
(74, 'App\\Models\\User', 1, '', 'e50e800daa5d6fdf49c4f3837a4cfe33ffa8c1ec0e2ba2aee01b929101d3650e', '[\"*\"]', NULL, NULL, '2025-03-09 07:41:08', '2025-03-09 07:41:08'),
(75, 'App\\Models\\User', 1, '', 'be8785ef608b92dab791054637d82ecafc0650ed530d47c05b983a36a2ac3234', '[\"*\"]', '2025-03-09 07:42:41', NULL, '2025-03-09 07:41:58', '2025-03-09 07:42:41'),
(76, 'App\\Models\\User', 4, '', 'dea7bbb6e4054412a60a20bdb42c75b2967d0ff597176c57f0c275a1d668b57b', '[\"*\"]', NULL, NULL, '2025-03-09 07:42:12', '2025-03-09 07:42:12'),
(77, 'App\\Models\\User', 1, '', '43ef252b6b66de5c12f882ac6918ef7597687d6ff38c7d4c350b37fc09d2300a', '[\"*\"]', NULL, NULL, '2025-03-09 07:42:17', '2025-03-09 07:42:17'),
(78, 'App\\Models\\User', 1, '', 'f5d1a572e0049b263f5094c8c4235dda298ac9d17c17e044cbdea745131414dc', '[\"*\"]', NULL, NULL, '2025-03-09 07:42:27', '2025-03-09 07:42:27'),
(79, 'App\\Models\\User', 4, '', '5214147ceb6b2782f134f7c9a8af9084bd5d77e018b6144d00fa8f4b00c9c909', '[\"*\"]', '2025-03-09 07:43:28', NULL, '2025-03-09 07:42:41', '2025-03-09 07:43:28'),
(80, 'App\\Models\\User', 1, '', 'b81ac908e30f6f0ded1e95529aa4dfaf4d9cb9b13f48568c2b9de8ef0f930a9b', '[\"*\"]', '2025-03-09 07:44:11', NULL, '2025-03-09 07:43:27', '2025-03-09 07:44:11'),
(81, 'App\\Models\\User', 4, '', '1b2a01efcf4a866fb02be78261ebf645de05c582a34f015eb0422731c634cf4e', '[\"*\"]', '2025-03-09 07:44:17', NULL, '2025-03-09 07:44:11', '2025-03-09 07:44:17'),
(82, 'App\\Models\\User', 1, '', '7228bcb05d27c32f09390a2960cc7790d98006dea114e144fe0a31ca15964e89', '[\"*\"]', '2025-03-09 07:45:17', NULL, '2025-03-09 07:45:15', '2025-03-09 07:45:17'),
(83, 'App\\Models\\User', 4, '', '0983bd3fb21985d6e35596e5dd5722a8337d5820cea8968223655f33a52a5a1d', '[\"*\"]', '2025-03-09 07:45:27', NULL, '2025-03-09 07:45:25', '2025-03-09 07:45:27'),
(84, 'App\\Models\\User', 1, '', 'f77ba7c9c902db850ae52c3968e00bfa8de445dd4d626148331b859c4eee5f3a', '[\"*\"]', '2025-03-09 07:47:20', NULL, '2025-03-09 07:45:42', '2025-03-09 07:47:20'),
(85, 'App\\Models\\User', 4, '', '65945830526c845f77a73616e55a43f209096728654c2d6db3d382e381a93d3c', '[\"*\"]', '2025-03-09 07:47:55', NULL, '2025-03-09 07:47:20', '2025-03-09 07:47:55'),
(86, 'App\\Models\\User', 1, '', 'cdf47866520f0458aaee08e7ca64a50773a8c79104e62e52009d47764e06c222', '[\"*\"]', '2025-03-09 07:53:51', NULL, '2025-03-09 07:47:54', '2025-03-09 07:53:51'),
(87, 'App\\Models\\User', 4, '', 'f5b5cd5dbf41a261e88975d342334495f6396350bb9b2c1af11926f7e236cc5d', '[\"*\"]', '2025-03-09 07:56:11', NULL, '2025-03-09 07:54:11', '2025-03-09 07:56:11'),
(88, 'App\\Models\\User', 1, '', 'd7641325e3ce799de2f30fa3ca0641158c6add40c4e5b84f9a6aff4decf26766', '[\"*\"]', '2025-03-09 07:56:19', NULL, '2025-03-09 07:56:16', '2025-03-09 07:56:19'),
(89, 'App\\Models\\User', 4, '', '5f7e4bfd7a111b2cfe0a2d0ecc3a820e0384a1794d592cf2da8dd9a07d7cb359', '[\"*\"]', NULL, NULL, '2025-03-09 07:56:40', '2025-03-09 07:56:40'),
(90, 'App\\Models\\User', 4, '', 'f6925b5c17b6b5b369a07d74ec16b3bae9ca04fd8bf84c1e1dc6741a70885c08', '[\"*\"]', NULL, NULL, '2025-03-09 07:56:47', '2025-03-09 07:56:47'),
(91, 'App\\Models\\User', 4, '', 'd8fbebd20452b886e884f2d3755f72e40e08603e6f779a0b803be282a9a5e1fa', '[\"*\"]', NULL, NULL, '2025-03-09 07:57:11', '2025-03-09 07:57:11'),
(92, 'App\\Models\\User', 1, '', '36e6039b04062dae7918bb8217e427cee0a14f13bb15af05f540a62357b6ac0a', '[\"*\"]', '2025-03-09 07:58:14', NULL, '2025-03-09 07:57:16', '2025-03-09 07:58:14'),
(93, 'App\\Models\\User', 1, '', 'f1875392859b7236680444782904d41497b635d9825328b41a51c586c5861baa', '[\"*\"]', '2025-03-09 08:03:08', NULL, '2025-03-09 08:03:06', '2025-03-09 08:03:08'),
(94, 'App\\Models\\User', 4, '', 'c4f8dbac3872d3ad7f09c42eaacb153186f203382e8a8b7137e0a6a38becccba', '[\"*\"]', NULL, NULL, '2025-03-09 08:03:14', '2025-03-09 08:03:14'),
(95, 'App\\Models\\User', 1, '', '0d4fcd5669814bd1ca4fdf22b0f56d75bddc072a5d9083a52c0d738a632719d7', '[\"*\"]', '2025-03-09 08:16:56', NULL, '2025-03-09 08:16:27', '2025-03-09 08:16:56'),
(96, 'App\\Models\\User', 4, '', 'ba01daf32ea7becf2fb00e2c83b91ba0a193d2b01a3909bc25c72d8b2690dd39', '[\"*\"]', NULL, NULL, '2025-03-09 08:17:05', '2025-03-09 08:17:05'),
(97, 'App\\Models\\User', 1, '', '3f9c5b6d5fc12e341bffdc57a02c0101862860f69041d869b9b54ae15202e3b9', '[\"*\"]', '2025-03-09 11:34:49', NULL, '2025-03-09 08:17:12', '2025-03-09 11:34:49'),
(98, 'App\\Models\\User', 4, '', '48b22c04de1a006a75071d7c72c5ed590588d0f3cdf9e9029eb40814cde43ab5', '[\"*\"]', NULL, NULL, '2025-03-09 11:44:10', '2025-03-09 11:44:10'),
(99, 'App\\Models\\User', 9, '', 'b35bbc39abe6b6d7966bb4ca1bea63884dadd7226d7f64a6349201594b9358f0', '[\"*\"]', NULL, NULL, '2025-03-09 11:46:32', '2025-03-09 11:46:32'),
(100, 'App\\Models\\User', 9, '', '90c6b739c4c88e2c2b66b0799890a198efd115295f5c572355bb143b105f0be4', '[\"*\"]', '2025-03-10 22:08:32', NULL, '2025-03-09 11:47:10', '2025-03-10 22:08:32'),
(101, 'App\\Models\\User', 1, '', '56decbe98bb1b68eb32cca8a7538e9e49337193c68c0220e0841c0a6529f4323', '[\"*\"]', '2025-03-10 23:07:20', NULL, '2025-03-10 22:08:37', '2025-03-10 23:07:20'),
(102, 'App\\Models\\User', 1, '', '761a6f927aabea3d9f8a29c9de0a9a17da243e00ca2c2368d7a3ef6b518d86ba', '[\"*\"]', '2025-03-10 23:43:09', NULL, '2025-03-10 23:07:24', '2025-03-10 23:43:09'),
(103, 'App\\Models\\User', 1, '', '476a54df1d38908d24e544ba77b2012c03ab63d116ce4eaa9196bb48627f8f2b', '[\"*\"]', '2025-03-11 02:57:10', NULL, '2025-03-11 02:55:50', '2025-03-11 02:57:10'),
(104, 'App\\Models\\User', 1, '', 'cb5987d03bf5aabf0d319bccc163c7be369818837e6ae5c21007eec54afd4e1c', '[\"*\"]', '2025-03-11 03:01:44', NULL, '2025-03-11 03:01:41', '2025-03-11 03:01:44'),
(105, 'App\\Models\\User', 1, '', '2f14c5598a4f1f3cfc32fadec07d539aaf42d237c1cc09eb516a848fa5e1b9ad', '[\"*\"]', '2025-03-11 03:01:53', NULL, '2025-03-11 03:01:51', '2025-03-11 03:01:53'),
(106, 'App\\Models\\User', 4, '', '39b45c60a57a3f199ec3e9f213416a003f487fd0bf2e839a07637c9a39ce40f1', '[\"*\"]', NULL, NULL, '2025-03-11 03:02:44', '2025-03-11 03:02:44'),
(107, 'App\\Models\\User', 1, '', 'fabba3febf6b8cf6f2044229e0b23cfbd4579f13c2d4108317663a04c389fa1a', '[\"*\"]', '2025-03-11 03:02:51', NULL, '2025-03-11 03:02:49', '2025-03-11 03:02:51'),
(108, 'App\\Models\\User', 1, '', '0ded8c41352d7bc576e651b90e4ab250b367ae765771cc3945a706e3018ebe1b', '[\"*\"]', '2025-03-11 03:03:42', NULL, '2025-03-11 03:03:07', '2025-03-11 03:03:42'),
(109, 'App\\Models\\User', 1, '', 'b33f0d2d7a481e5639fc5ee86370ea6891d91a88f2106ef8a701d56a5210d4c1', '[\"*\"]', '2025-03-11 03:06:58', NULL, '2025-03-11 03:06:56', '2025-03-11 03:06:58'),
(110, 'App\\Models\\User', 1, '', 'b71d99b0003bfc77b4f03ff30ad2b05710f62f287b85c1428dd12ec56441b6a1', '[\"*\"]', '2025-03-11 03:08:51', NULL, '2025-03-11 03:07:59', '2025-03-11 03:08:51'),
(111, 'App\\Models\\User', 1, '', '4af318b7811e683d7514757033023327100811c91229fed146d6a24f419d0b05', '[\"*\"]', '2025-03-11 03:09:43', NULL, '2025-03-11 03:09:03', '2025-03-11 03:09:43'),
(112, 'App\\Models\\User', 1, '', '0b6fb3648a763ada0fc99a9c3070d202d6ee5b12ef8c90277e178fa5a2cdef75', '[\"*\"]', '2025-03-11 03:10:41', NULL, '2025-03-11 03:09:51', '2025-03-11 03:10:41'),
(113, 'App\\Models\\User', 1, '', '2497c3e1391dca7c13280b4a8055e8c971cf103ea942aa84462ebeaf4d91df5f', '[\"*\"]', '2025-03-11 03:11:57', NULL, '2025-03-11 03:10:50', '2025-03-11 03:11:57'),
(114, 'App\\Models\\User', 1, '', 'fc88b55fdc3f46db7ae4b699a85a9f167f36f7acb8f48904e11fbd260d94592e', '[\"*\"]', '2025-03-11 03:12:32', NULL, '2025-03-11 03:12:04', '2025-03-11 03:12:32'),
(115, 'App\\Models\\User', 1, '', '7ff3dce30c1da8cf79e0f9b19041d68b5e78c86135b327f86ad5503ecaf02fef', '[\"*\"]', '2025-03-11 03:12:41', NULL, '2025-03-11 03:12:39', '2025-03-11 03:12:41'),
(116, 'App\\Models\\User', 1, '', 'ca877a8de6521ef3dbc7aa3cee9ef174f121824ef1a8307fd117f0ce6eef1112', '[\"*\"]', '2025-03-11 03:13:08', NULL, '2025-03-11 03:13:06', '2025-03-11 03:13:08'),
(117, 'App\\Models\\User', 1, '', '8df038a3b1a7539974c147b6b689e6e45ba3a7f8cd6c71ac41537dff0db19339', '[\"*\"]', '2025-03-11 03:13:57', NULL, '2025-03-11 03:13:54', '2025-03-11 03:13:57'),
(118, 'App\\Models\\User', 1, '', 'dd80edaf5efcef7cb74516ea88b422298f42d605fc98da18c3b3ccfc44c8bc86', '[\"*\"]', '2025-03-11 03:20:04', NULL, '2025-03-11 03:18:24', '2025-03-11 03:20:04'),
(122, 'App\\Models\\User', 1, '', '21de951bf3ff75007cdfbfcfe90c19c01a3581187378e0c3bb701ccf547a32f3', '[\"*\"]', '2025-03-11 07:33:53', NULL, '2025-03-11 06:48:42', '2025-03-11 07:33:53'),
(123, 'App\\Models\\User', 1, '', 'd4307c5861707c3e6b826309c6a900e4c6985af7d29761b03b3852cd15404bde', '[\"*\"]', '2025-03-11 07:52:21', NULL, '2025-03-11 07:50:32', '2025-03-11 07:52:21'),
(124, 'App\\Models\\User', 1, '', '634f11ad2891f2d15ce8b6538209bb997d6e14e45e03bd10f2ee7427845b68af', '[\"*\"]', '2025-03-11 11:42:23', NULL, '2025-03-11 07:52:27', '2025-03-11 11:42:23'),
(125, 'App\\Models\\User', 1, '', '076051fd050533870ad3c2b633ba1344d2a58964247e21f1fd57410364458af8', '[\"*\"]', '2025-03-12 07:30:53', NULL, '2025-03-11 11:42:43', '2025-03-12 07:30:53'),
(126, 'App\\Models\\User', 1, '', '99fc597f02e5f378b42c429c49ebc0d032db8b96f9c523b87a1b173543dd3c26', '[\"*\"]', '2025-03-12 14:49:21', NULL, '2025-03-12 07:30:58', '2025-03-12 14:49:21'),
(127, 'App\\Models\\User', 1, '', '4c9b8fe6d9b12945d041ad0edb55b3147a7bf523f82b46de882e483ef27be29d', '[\"*\"]', '2025-03-12 15:00:44', NULL, '2025-03-12 14:51:24', '2025-03-12 15:00:44'),
(128, 'App\\Models\\User', 1, '', '66ef332540d967aa5008f092fd01d98260ab41e93ca88f1361d8ee5f652ffd71', '[\"*\"]', '2025-03-13 09:46:00', NULL, '2025-03-12 15:02:01', '2025-03-13 09:46:00'),
(129, 'App\\Models\\User', 1, '', '169555b0ee0abaff7b606dac40f92d84694593fded86f3849fd7820f3465589d', '[\"*\"]', '2025-03-13 16:25:38', NULL, '2025-03-13 09:46:04', '2025-03-13 16:25:38'),
(130, 'App\\Models\\User', 1, '', '507b403e61cd5dcd730efdc0cd5f14c5540274ec46e603b80a68e5d77b3b871a', '[\"*\"]', '2025-03-13 18:51:09', NULL, '2025-03-13 16:27:45', '2025-03-13 18:51:09'),
(131, 'App\\Models\\User', 1, '', '3bbd8b9048bc639d2018c36d4b073397bfe3a570a642d3fc47916898d7603b72', '[\"*\"]', '2025-03-14 10:55:28', NULL, '2025-03-14 09:40:18', '2025-03-14 10:55:28'),
(132, 'App\\Models\\User', 1, '', '89ec0f773214bcee436fecac57d567b3b6f2fe8ed3e91308504b226573c8fc8f', '[\"*\"]', '2025-03-17 18:42:10', NULL, '2025-03-14 11:41:45', '2025-03-17 18:42:10'),
(133, 'App\\Models\\User', 1, '', 'e8a11e601ca343c4761857ae5861e4f5e190d0526721759524a5bb5428db274d', '[\"*\"]', '2025-03-17 18:44:05', NULL, '2025-03-17 18:44:01', '2025-03-17 18:44:05'),
(134, 'App\\Models\\User', 4, '', 'b45e6ec9d020b7c85e40fe98fd9de131b26c7091ec537b90077bc352d4aa5ffb', '[\"*\"]', NULL, NULL, '2025-03-17 18:44:12', '2025-03-17 18:44:12'),
(135, 'App\\Models\\User', 4, '', '3cd12e44ed5b94e5fca590f1ea9bcec4c36ceb31f14d90e4a540a46f550e9092', '[\"*\"]', NULL, NULL, '2025-03-17 18:44:27', '2025-03-17 18:44:27'),
(136, 'App\\Models\\User', 4, '', 'e467f2e0be3df4916a08106e01ff66dd7ebf9880709c12c13573cf5e9e664417', '[\"*\"]', NULL, NULL, '2025-03-17 18:48:29', '2025-03-17 18:48:29'),
(137, 'App\\Models\\User', 4, '', 'e5fee1b2679b64122429df9fa9eebd2bdc34bdeb897c75dd6c857b4f3e5b6fc8', '[\"*\"]', NULL, NULL, '2025-03-17 18:49:42', '2025-03-17 18:49:42'),
(138, 'App\\Models\\User', 4, '', '318fd37f3b83f72a4cb74285d251e272afa6f83dcd0e9a836436bdfc9a91bec0', '[\"*\"]', NULL, NULL, '2025-03-17 18:49:47', '2025-03-17 18:49:47'),
(139, 'App\\Models\\User', 1, '', 'fd65ec9b7a57bca4ce66fbcae0e96a153e59558ccaec12a01de80606313ec2ed', '[\"*\"]', '2025-03-17 19:03:46', NULL, '2025-03-17 18:50:05', '2025-03-17 19:03:46'),
(140, 'App\\Models\\User', 4, '', '36853a3b022e1142f6af627ed6895958313c2aa5a258d00b8a48cc45fcd5580a', '[\"*\"]', NULL, NULL, '2025-03-17 19:04:56', '2025-03-17 19:04:56'),
(141, 'App\\Models\\User', 1, '', '7dfe83d91a7dad27740c909fbbc653c17eb34c040354320406c136e1a60f8ec0', '[\"*\"]', NULL, NULL, '2025-03-17 19:05:05', '2025-03-17 19:05:05'),
(142, 'App\\Models\\User', 1, '', 'd2953990f3cec83c3507e241727346d788bddfd22cfac83b4fa9cda258e686d5', '[\"*\"]', '2025-03-17 19:17:08', NULL, '2025-03-17 19:11:09', '2025-03-17 19:17:08'),
(143, 'App\\Models\\User', 1, '', '869c95aff1ec8c8eec76a64d074b584ddf467d9500732afc1bdf2bf89bbd333c', '[\"*\"]', '2025-03-18 07:03:02', NULL, '2025-03-18 06:54:44', '2025-03-18 07:03:02'),
(144, 'App\\Models\\User', 1, '', '35ef77df0c62ce525e7fa450570edd011f8559eb363c000c089aeeca3cb3598c', '[\"*\"]', '2025-03-21 05:44:17', NULL, '2025-03-18 07:23:48', '2025-03-21 05:44:17'),
(145, 'App\\Models\\User', 1, '', '71810738042a67fed53f96569e5928a9806e6c10ebd24b142f5a8d55aa666dea', '[\"*\"]', '2025-03-22 12:38:30', NULL, '2025-03-21 05:44:22', '2025-03-22 12:38:30'),
(146, 'App\\Models\\User', 1, '', '882baa2e2c0fa1c1c5090e511e464a8c8b67ec61bbc3ee63fdf421387303d1b9', '[\"*\"]', '2025-03-22 12:48:09', NULL, '2025-03-22 12:44:35', '2025-03-22 12:48:09'),
(147, 'App\\Models\\User', 1, '', '4dd034d95e9a9e96880453ba55ba7e5747e12885c162112f9c62b2b380b29fd1', '[\"*\"]', '2025-04-04 23:55:45', NULL, '2025-03-22 18:56:58', '2025-04-04 23:55:45'),
(148, 'App\\Models\\User', 1, '', 'bff249eb86486d42ced506e8aba38f7eafb4c2813b10acc0a97d813a3e08e949', '[\"*\"]', '2025-03-26 16:36:01', NULL, '2025-03-22 18:57:33', '2025-03-26 16:36:01'),
(149, 'App\\Models\\User', 5, '', '0ae617164ba11e3bfa98fa2702c27a297cbce27431734483601d5598a60795a6', '[\"*\"]', NULL, NULL, '2025-03-23 10:37:57', '2025-03-23 10:37:57'),
(150, 'App\\Models\\User', 4, '', '87d4ef0b4a7f2d488c30a08bce353eacb146f3e37333b252e6102bc899b856c6', '[\"*\"]', NULL, NULL, '2025-03-23 10:39:07', '2025-03-23 10:39:07'),
(151, 'App\\Models\\User', 4, '', '9081f9037e016976e9fab3e2f4ba08f67d516c7ef1fd18eda383e5fe78aa1261', '[\"*\"]', NULL, NULL, '2025-03-23 10:47:02', '2025-03-23 10:47:02'),
(152, 'App\\Models\\User', 1, '', 'f1e544cd38d4d3f2684d4067226a112cee4ce23ef14b62baefe0086f588aed30', '[\"*\"]', NULL, NULL, '2025-03-23 10:47:28', '2025-03-23 10:47:28'),
(153, 'App\\Models\\User', 1, '', 'b20e26547114b25b83b8e434d4efe6dd7f1729ec0e0a4bfbb6c65530c6a1d967', '[\"*\"]', NULL, NULL, '2025-03-23 10:50:53', '2025-03-23 10:50:53'),
(154, 'App\\Models\\User', 4, '', 'f84ac8d1c4d79e7354709f3e1cdecc69fd9f6c42a6d823ce2d281aef34e59a2a', '[\"*\"]', NULL, NULL, '2025-03-23 10:51:35', '2025-03-23 10:51:35'),
(155, 'App\\Models\\User', 5, '', 'f67ca530a1d90fdbe1e5f8e42c18aedb82c9d8eba2352f3dbc0f5aac021faf5a', '[\"*\"]', NULL, NULL, '2025-03-23 10:52:05', '2025-03-23 10:52:05'),
(156, 'App\\Models\\User', 4, '', 'ca398a8fa4326d99e3fa959dbc2121b99a18387a9f31c3625cc2c0b39e1bbff7', '[\"*\"]', NULL, NULL, '2025-03-23 11:03:18', '2025-03-23 11:03:18'),
(157, 'App\\Models\\User', 4, '', '15dff740511e607483b262faa255cddddcf3501e6250c6df9d1e4d923c611198', '[\"*\"]', '2025-04-10 10:11:31', NULL, '2025-03-23 14:12:36', '2025-04-10 10:11:31'),
(158, 'App\\Models\\User', 1, '', 'b05c5e807c26fe7b12c144153fbe172450b151fedcb9e0b44b80e938e0316e95', '[\"*\"]', NULL, NULL, '2025-03-24 03:42:57', '2025-03-24 03:42:57'),
(159, 'App\\Models\\User', 4, '', 'e01c124bac9e8fafa02d520b81d438cf134807e167e385efacdca8643ddc055c', '[\"*\"]', NULL, NULL, '2025-03-26 11:56:27', '2025-03-26 11:56:27'),
(160, 'App\\Models\\User', 4, '', '11b82f7f69536998c1dbb74ee72e261614f1300e3005dfcb746bb81222df730d', '[\"*\"]', NULL, NULL, '2025-03-26 12:02:18', '2025-03-26 12:02:18'),
(161, 'App\\Models\\User', 4, '', '75f17907b23d55844bb3412069813e4c61bd235471fd437ae612190bdfac00ee', '[\"*\"]', NULL, NULL, '2025-03-26 12:03:54', '2025-03-26 12:03:54'),
(162, 'App\\Models\\User', 4, '', '321e0f135c3a545f9ae1e65f079a9d2f3bba25e7f9981225c97a3113ed2a6e11', '[\"*\"]', NULL, NULL, '2025-03-26 12:05:50', '2025-03-26 12:05:50'),
(163, 'App\\Models\\User', 4, '', 'f0a5ebd8ad2f87f973dc3784ccf2acde1f10fea0e4c5ff4c038451504292b23a', '[\"*\"]', NULL, NULL, '2025-03-26 13:45:09', '2025-03-26 13:45:09'),
(164, 'App\\Models\\User', 4, '', '90f7fbd29c504149b0c9556519411a5f3f7bde9bc07d1c1f24c71929ca54b763', '[\"*\"]', NULL, NULL, '2025-03-26 13:56:48', '2025-03-26 13:56:48'),
(165, 'App\\Models\\User', 4, '', '6ac582c4130ee900a61bd76236946e969249f25617f56fed30db08b7c15d2006', '[\"*\"]', NULL, NULL, '2025-03-26 13:57:58', '2025-03-26 13:57:58'),
(166, 'App\\Models\\User', 4, '', '90544bae030e3118d8407d135ec4b9afbb6dbbf6839b3983b2ceb9203d6325d7', '[\"*\"]', NULL, NULL, '2025-03-26 14:05:40', '2025-03-26 14:05:40'),
(167, 'App\\Models\\User', 4, '', '6a251205e4a0f6b74d1e839fc41bf3c718657a687c0902f8c1d49a2303c7b37b', '[\"*\"]', NULL, NULL, '2025-03-26 14:07:24', '2025-03-26 14:07:24'),
(168, 'App\\Models\\User', 4, '', '0242cf30f56a0f44169c6157e3e8d825f3ca084bc82c42a12cc8faeb5ca505dd', '[\"*\"]', NULL, NULL, '2025-03-26 16:37:25', '2025-03-26 16:37:25'),
(169, 'App\\Models\\User', 1, '', '7f2e6e6fb07d884133eb548a84dc1995ee925e64be4b24d1b8e25d387eb2c799', '[\"*\"]', '2025-04-04 23:52:40', NULL, '2025-03-26 16:38:27', '2025-04-04 23:52:40'),
(170, 'App\\Models\\User', 1, '', '5d1660f07605b914a2b90235cc35eb7398d95a0a763eaf2fa6df625bbfb3d791', '[\"*\"]', '2025-04-04 16:46:36', NULL, '2025-03-26 18:59:46', '2025-04-04 16:46:36'),
(171, 'App\\Models\\User', 4, '', 'f744fec3528bb01502d68b2406d090abd6833d6d058a11659a8d0ef4586c1536', '[\"*\"]', NULL, NULL, '2025-03-26 23:22:35', '2025-03-26 23:22:35'),
(172, 'App\\Models\\User', 4, '', '48d27e66aa6752debba17d8bf660234f25fc4bc3122c40e194301a4fec5fdc58', '[\"*\"]', NULL, NULL, '2025-03-27 00:24:30', '2025-03-27 00:24:30'),
(173, 'App\\Models\\User', 4, '', '037343427c5761be86d8adce80f2fe1c025f8d2ce2c8136b002deca272661689', '[\"*\"]', NULL, NULL, '2025-03-27 10:06:35', '2025-03-27 10:06:35'),
(174, 'App\\Models\\User', 4, '', '33806f03a15f0264672eda75249f206b07fb0cbba8da96c1de448d1430a8c5d3', '[\"*\"]', NULL, NULL, '2025-03-27 10:11:18', '2025-03-27 10:11:18'),
(175, 'App\\Models\\User', 4, '', '598f05685c87d7a9fc29e067ec168b79e9cd6f4e6c3a9aa50081b7cc88558301', '[\"*\"]', NULL, NULL, '2025-03-27 12:06:46', '2025-03-27 12:06:46'),
(176, 'App\\Models\\User', 4, '', 'cbfe6b7d1950b4b9ff9dd41a4d469186430a6a43dfcf92c816b8ee7e09548908', '[\"*\"]', NULL, NULL, '2025-03-27 12:07:43', '2025-03-27 12:07:43'),
(177, 'App\\Models\\User', 4, '', 'dd3dbbbe252aa43d767fe78a7221df57d38278e0c16204b313b6bbac20d11178', '[\"*\"]', NULL, NULL, '2025-03-27 12:11:05', '2025-03-27 12:11:05'),
(178, 'App\\Models\\User', 4, '', '8a8105d22ece654ede2d2e4b82895c5aad0194145517e38467637d6ad0fedd59', '[\"*\"]', NULL, NULL, '2025-03-27 12:12:00', '2025-03-27 12:12:00'),
(179, 'App\\Models\\User', 4, '', '4009559219137792d2a5a34a76038368dddfefd677d0138f1ed1e74066b6c406', '[\"*\"]', NULL, NULL, '2025-03-27 12:45:53', '2025-03-27 12:45:53'),
(180, 'App\\Models\\User', 4, '', '19e8ecd34426207cff46a208c123d6ffb56329e8f525a5b0dbde587ab05d2760', '[\"*\"]', NULL, NULL, '2025-03-27 13:22:53', '2025-03-27 13:22:53'),
(181, 'App\\Models\\User', 5, '', '582a67ec8f2196548f82e634776dbe86ae97ccbc5213ebd540daf6717cbf2c88', '[\"*\"]', NULL, NULL, '2025-03-27 19:24:41', '2025-03-27 19:24:41'),
(182, 'App\\Models\\User', 1, '', '6bac4e3ea0ece980e496b6638a35cab6851792b9cf280e2fff9d22952f38ccbd', '[\"*\"]', '2025-04-01 18:51:38', NULL, '2025-03-27 15:05:02', '2025-04-01 18:51:38'),
(183, 'App\\Models\\User', 1, '', '4bd7ee756a24cf3afbcd2887601ae760583a137507b6958911f645e456ad82f1', '[\"*\"]', '2025-04-04 08:29:26', NULL, '2025-04-02 07:40:02', '2025-04-04 08:29:26'),
(184, 'App\\Models\\User', 1, '', 'a3764b083e5b00ceeb6e510b059d93ae5e6f5cae34b0f55a27b5d8d7cce3438a', '[\"*\"]', '2025-04-04 15:11:27', NULL, '2025-04-04 15:00:39', '2025-04-04 15:11:27'),
(185, 'App\\Models\\User', 1, '', '82d0aa296551e1b98022cd99203d5923d4afb04e9aa33043249c5dcf65d9c138', '[\"*\"]', '2025-04-05 20:43:40', NULL, '2025-04-04 18:47:36', '2025-04-05 20:43:40'),
(186, 'App\\Models\\User', 4, '', '759fc4b51c336a2ff3cd6bb956357621615b94551a8fe9292a30c10210f4f122', '[\"*\"]', NULL, NULL, '2025-04-04 23:08:08', '2025-04-04 23:08:08'),
(187, 'App\\Models\\User', 4, '', 'ae53e04eced18a4020819e45a72b66d13bc930397ef9de373c342a13325c8dc1', '[\"*\"]', NULL, NULL, '2025-04-04 23:53:31', '2025-04-04 23:53:31'),
(188, 'App\\Models\\User', 1, '', '1d36b174f3b870ef46b6e84983d61b73216e1b8b575be6d473629a539490bb38', '[\"*\"]', '2025-04-05 22:06:14', NULL, '2025-04-05 22:06:09', '2025-04-05 22:06:14'),
(189, 'App\\Models\\User', 1, '', 'd105d8c019a43c961e2b728dd007a8f7339d8136f014fa810d1d98ad29bd3977', '[\"*\"]', '2025-04-10 10:07:05', NULL, '2025-04-05 18:11:41', '2025-04-10 10:07:05'),
(190, 'App\\Models\\User', 1, '', '30f21d1819e4f3aed3efbe51c87099b5164f167d98a170b13d9825ceeaa3266a', '[\"*\"]', '2025-04-11 13:46:17', NULL, '2025-04-11 13:46:14', '2025-04-11 13:46:17'),
(191, 'App\\Models\\User', 1, '', 'b22e6f558974e738e54550794c5b84e82e0f93e2053e567b7d0da6a9a0359440', '[\"*\"]', '2025-04-12 15:15:16', NULL, '2025-04-11 13:52:43', '2025-04-12 15:15:16'),
(192, 'App\\Models\\User', 11, '', '1b79409cc9ba2309c9c959abc6b1c6badc099bb3eb365360fe301cff56e8feca', '[\"*\"]', NULL, NULL, '2025-04-12 16:46:39', '2025-04-12 16:46:39'),
(193, 'App\\Models\\User', 12, '', 'd155a8505de22da2a0805049737778038258bb4a39f1a94cc49edff2e48c989d', '[\"*\"]', NULL, NULL, '2025-04-12 16:54:43', '2025-04-12 16:54:43'),
(194, 'App\\Models\\User', 13, '', '9cc3f7aa7cadebc017e8177c3e54ffb0251446ad7ec259f6ac3de14ece9af2e3', '[\"*\"]', NULL, NULL, '2025-04-12 19:28:56', '2025-04-12 19:28:56'),
(195, 'App\\Models\\User', 14, '', '5987adf60ece3fa92cd1f140da122f7f9bccf3198ec343ff30b2194133d9cf89', '[\"*\"]', NULL, NULL, '2025-04-12 19:33:27', '2025-04-12 19:33:27'),
(196, 'App\\Models\\User', 15, '', '4ae8cdb93e57cd1c45549cd3a302c4b68b71386a814f2a64cbbd34f0fa87d382', '[\"*\"]', NULL, NULL, '2025-04-12 19:39:36', '2025-04-12 19:39:36'),
(197, 'App\\Models\\User', 16, '', 'f7b297d46cb09ab0ebe6610bcc931e1f247ff34f328104f7324c421fa5395a47', '[\"*\"]', NULL, NULL, '2025-04-12 19:50:42', '2025-04-12 19:50:42'),
(198, 'App\\Models\\User', 1, '', '206812c7ac0f8f27d84951261dbe291c1cc332515fae98ff1d87cad225468364', '[\"*\"]', '2025-04-13 16:22:37', NULL, '2025-04-13 15:15:19', '2025-04-13 16:22:37'),
(199, 'App\\Models\\User', 1, '', 'a508e4f3077a2a32663cd28a712712b2ce8e8422d6d9f2f6345a7db36f0e7db8', '[\"*\"]', NULL, NULL, '2025-04-13 15:15:21', '2025-04-13 15:15:21'),
(200, 'App\\Models\\User', 17, '', 'cd75ddb5ce311c035e734ff43343d1daadfbf65f29d78e32369fba7e24cb35a1', '[\"*\"]', NULL, NULL, '2025-04-13 16:20:52', '2025-04-13 16:20:52'),
(201, 'App\\Models\\User', 1, '', '0f45b5c8fd46da8889a06c3fc72b403252b0691755e0c76c796a20bf9e7684d1', '[\"*\"]', '2025-04-14 15:32:18', NULL, '2025-04-13 16:22:11', '2025-04-14 15:32:18');

-- --------------------------------------------------------

--
-- Table structure for table `predict_matches`
--

CREATE TABLE `predict_matches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `predict_matches`
--

INSERT INTO `predict_matches` (`id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, '2025-04-09 11:11:00', '2025-04-18 22:22:00', '2025-04-05 18:22:25', '2025-04-05 18:22:25');

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
(1, 1, 1, 1, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(2, 1, 1, 2, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(3, 1, 1, 3, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(4, 1, 1, 4, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(5, 1, 1, 5, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(6, 1, 1, 6, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(7, 1, 1, 6, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(8, 1, 1, 7, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(9, 1, 1, 8, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(10, 1, 1, 9, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(11, 1, 1, 10, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(12, 1, 1, 11, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(13, 1, 1, 12, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(14, 1, 1, 13, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(15, 1, 1, 14, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(16, 1, 2, 15, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(17, 1, 2, 16, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(18, 1, 2, 17, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(19, 1, 2, 18, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(20, 1, 2, 19, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(21, 1, 2, 20, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(22, 1, 2, 21, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(23, 1, 2, 22, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(24, 1, 2, 23, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(25, 1, 2, 24, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(26, 1, 2, 25, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(27, 1, 2, 26, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(28, 1, 2, 27, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(29, 1, 2, 28, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(30, 1, 2, 29, '2025-04-05 18:22:25', '2025-04-05 18:22:25');

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
(1, 1, 81, '2025-04-05 18:22:25', '2025-04-05 18:22:25'),
(2, 1, 83, '2025-04-05 18:22:25', '2025-04-05 18:22:25');

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
(1, 'sdfasdfa', '1741671655.png', 1, '2025-03-10 23:40:55', '2025-03-10 23:40:55', 1),
(2, '22222222', '1741671737.png', 1, '2025-03-10 23:42:17', '2025-03-10 23:42:17', 1),
(3, '3333333333', '1741671789.png', 1, '2025-03-10 23:43:09', '2025-03-10 23:43:09', 1),
(4, 'asdfa', '1741685918.png', 1, '2025-03-11 03:38:38', '2025-03-11 03:38:38', 2),
(5, 'asdfadf', '1741701551.png', 1, '2025-03-11 07:59:11', '2025-03-11 07:59:11', 1),
(6, 'bowling', '1741701563.png', 1, '2025-03-11 07:59:23', '2025-03-11 07:59:23', 2),
(7, 'Tournament', '1741701571.png', 1, '2025-03-11 07:59:31', '2025-03-11 07:59:31', 3),
(8, 'test 1', '1741702649.png', 1, '2025-03-11 08:17:29', '2025-03-11 08:17:29', 3),
(9, 'sadfa', '1741702673.png', 1, '2025-03-11 08:17:53', '2025-03-11 08:17:53', 1),
(10, 'bd', '1741702733.png', 1, '2025-03-11 08:18:53', '2025-03-11 08:18:53', 2),
(11, 'banner1', '1741709644.png', 1, '2025-03-11 10:14:04', '2025-03-11 10:14:04', 1),
(12, 'banner 2', '1741709750.png', 1, '2025-03-11 10:15:50', '2025-03-11 10:15:50', 2),
(13, 'Banner 3', '1741709784.png', 1, '2025-03-11 10:16:24', '2025-03-11 10:16:24', 3),
(14, '111', '1741709968.png', 1, '2025-03-11 10:19:28', '2025-03-11 10:19:28', 1),
(15, '333', '1741709977.png', 1, '2025-03-11 10:19:37', '2025-03-11 10:19:37', 2),
(16, '444', '1741709987.png', 1, '2025-03-11 10:19:47', '2025-03-11 10:19:47', 3),
(17, '1', '1741709999.png', 1, '2025-03-11 10:19:59', '2025-03-11 10:19:59', 1),
(18, '1', '1741710009.png', 1, '2025-03-11 10:20:09', '2025-03-11 10:20:09', 2),
(19, '1', '1741710020.png', 1, '2025-03-11 10:20:20', '2025-03-11 10:20:20', 3),
(20, 'qqq', '1742236471.png', 1, '2025-03-17 18:34:31', '2025-03-17 18:34:31', 2),
(21, 'bbb', '1742236506.png', 1, '2025-03-17 18:35:06', '2025-03-17 18:35:06', 2),
(22, 't', '1742236566.png', 1, '2025-03-17 18:36:06', '2025-03-17 18:36:06', 3);

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
(1, 2, 4, 1, 1, 1, 1, 1, 1, 1, '2025-04-11 15:39:37', '2025-04-11 15:39:37'),
(2, 2, 5, 2, 1, 1, 1, 1, 1, 1, '2025-04-11 15:39:37', '2025-04-11 15:39:37'),
(8, 3, 4, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 16:48:51', '2025-04-11 16:48:51'),
(9, 3, 4, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 16:48:51', '2025-04-11 16:48:51'),
(10, 3, 4, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 16:48:52', '2025-04-11 16:48:52'),
(11, 3, 4, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 16:48:52', '2025-04-11 16:48:52'),
(12, 3, 8, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 17:12:06', '2025-04-11 17:12:06'),
(13, 3, 8, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 17:12:06', '2025-04-11 17:12:06'),
(14, 3, 8, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 17:12:06', '2025-04-11 17:12:06'),
(15, 3, 8, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 17:12:06', '2025-04-11 17:12:06'),
(16, 3, 6, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:01', '2025-04-11 17:14:01'),
(17, 3, 6, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:01', '2025-04-11 17:14:01'),
(18, 3, 6, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:01', '2025-04-11 17:14:01'),
(19, 3, 6, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:01', '2025-04-11 17:14:01'),
(20, 3, 5, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:52', '2025-04-11 17:14:52'),
(21, 3, 5, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:52', '2025-04-11 17:14:52'),
(22, 3, 5, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:52', '2025-04-11 17:14:52'),
(23, 3, 5, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 17:14:52', '2025-04-11 17:14:52'),
(24, 3, 7, 4, 2, 2, 2, 2, 2, 1, '2025-04-11 17:31:39', '2025-04-11 17:31:39'),
(25, 3, 7, 5, 2, 2, 2, 2, 2, 1, '2025-04-11 17:31:39', '2025-04-11 17:31:39'),
(26, 3, 7, 7, 2, 2, 2, 2, 2, 1, '2025-04-11 17:31:39', '2025-04-11 17:31:39'),
(27, 3, 7, 6, 2, 2, 2, 2, 2, 1, '2025-04-11 17:31:39', '2025-04-11 17:31:39'),
(28, 3, 10, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 17:34:46', '2025-04-11 17:34:46'),
(29, 3, 10, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 17:34:46', '2025-04-11 17:34:46'),
(30, 3, 10, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 17:34:46', '2025-04-11 17:34:46'),
(31, 3, 10, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 17:34:46', '2025-04-11 17:34:46'),
(32, 3, 17, 4, 1, 1, 1, 1, 1, 1, '2025-04-13 19:01:47', '2025-04-13 19:01:47'),
(33, 3, 17, 5, 1, 1, 1, 1, 1, 1, '2025-04-13 19:01:47', '2025-04-13 19:01:47'),
(34, 3, 17, 6, 1, 1, 1, 1, 1, 1, '2025-04-13 19:01:47', '2025-04-13 19:01:47'),
(35, 3, 17, 7, 1, 1, 1, 1, 1, 1, '2025-04-13 19:01:47', '2025-04-13 19:01:47');

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
(1, 2, 1, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:42', '2025-04-11 15:42:42'),
(2, 2, 2, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:42', '2025-04-11 15:42:42'),
(3, 2, 3, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:42', '2025-04-11 15:42:42'),
(4, 2, 1, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:53', '2025-04-11 15:42:53'),
(5, 2, 2, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:53', '2025-04-11 15:42:53'),
(6, 2, 3, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:53', '2025-04-11 15:42:53'),
(7, 2, 3, 1, 1, 1, 1, 1, 1, '2025-04-11 15:42:53', '2025-04-11 15:42:53'),
(8, 3, 4, 1, 1, 1, 1, 1, 1, '2025-04-11 16:28:56', '2025-04-11 16:28:56'),
(9, 3, 5, 1, 1, 1, 1, 1, 1, '2025-04-11 16:28:56', '2025-04-11 16:28:56'),
(10, 3, 6, 1, 1, 1, 1, 1, 1, '2025-04-11 16:28:56', '2025-04-11 16:28:56'),
(11, 3, 7, 1, 1, 1, 1, 1, 1, '2025-04-11 16:28:56', '2025-04-11 16:28:56');

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
(1, 1, 81, '2025-04-07 18:18:37', '2025-04-07 18:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website_name` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `register_bonus` varchar(255) DEFAULT NULL,
  `spin_creadit` int(11) DEFAULT NULL,
  `single_match_bonus` varchar(255) DEFAULT NULL,
  `max_predict_bonus` varchar(255) DEFAULT NULL,
  `tournament_bonus` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `support_email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
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

INSERT INTO `site_settings` (`id`, `website_name`, `logo_path`, `register_bonus`, `spin_creadit`, `single_match_bonus`, `max_predict_bonus`, `tournament_bonus`, `admin_email`, `support_email`, `phone`, `facebook`, `whatsapp`, `telegram`, `instagram`, `twitter`, `linkedin`, `youtube`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`) VALUES
(1, 'BigWin=Win Big', 'uploads/1744560773.jpg', '50', 5, '12', '12', '40', 'admin@gmail.com', 'support@mail.com', '000000000000', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', 'https://web.com', '2025-04-13 15:55:36', '2025-04-14 15:31:36');

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
(3, NULL, '220383518.png', 1, '2025-03-12 09:23:01', '2025-03-12 09:23:01');

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
(1, 'Test1', 1, 11, '2025-03-11 09:22:44', '2025-03-11 10:12:32'),
(2, 'test2', 1, 20, '2025-03-11 09:23:09', '2025-03-11 09:23:09'),
(3, 'test3', 1, 30, '2025-03-11 09:23:17', '2025-03-11 09:23:17'),
(4, 'asdf', 1, 22, '2025-03-11 09:39:33', '2025-03-11 09:39:33'),
(5, 'asdfa', 1, 3, '2025-03-11 09:39:38', '2025-03-11 09:39:38'),
(6, 'asdfa', 1, 38, '2025-03-11 09:39:55', '2025-03-11 10:13:12'),
(7, 'sdfas', 1, 21, '2025-03-11 09:40:00', '2025-03-17 18:11:57'),
(8, 'asdfa', 1, 44, '2025-03-11 09:40:25', '2025-03-11 09:40:25'),
(9, 'safdsad', 1, 44, '2025-03-11 09:40:30', '2025-03-17 18:10:22'),
(10, 'test1', 1, 10, '2025-03-17 18:12:53', '2025-03-17 18:12:53'),
(11, 'Notify test', 1, 15, '2025-03-17 18:13:29', '2025-03-17 18:13:29'),
(12, 'Notify', 1, 11, '2025-03-17 18:14:22', '2025-03-17 18:14:22');

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
(1, NULL, 'Virat Kohli', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(2, NULL, 'Babar Azam', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(3, NULL, 'Rohit Sharma', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(4, NULL, 'Shakib Al Hasan', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(5, NULL, 'Rashid Khan', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(6, NULL, 'Kane Williamson', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(7, NULL, 'Mushfiqur Rahim', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(8, NULL, 'Hardik Pandya', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(9, NULL, 'Mohammad Rizwan', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(10, NULL, 'Jasprit Bumrah', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(11, NULL, 'Mujeeb Ur Rahman', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(12, NULL, 'Shaheen Afridi', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(13, NULL, 'Tamim Iqbal', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(14, NULL, 'KL Rahul', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(15, NULL, 'Azmatullah Omarzai', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(16, NULL, 'Iftikhar Ahmed', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(17, NULL, 'Mehidy Hasan Miraz', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(18, NULL, 'Mustafizur Rahman', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(19, NULL, 'Yuzvendra Chahal', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(20, NULL, 'Ravindra Jadeja', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(21, NULL, 'Mohammed Shami', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(22, NULL, 'Surya Kumar Yadav', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(23, NULL, 'Imam-ul-Haq', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(24, NULL, 'Haris Rauf', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(25, NULL, 'Naseem Shah', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(26, NULL, 'Taskin Ahmed', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(27, NULL, 'Afif Hossain', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(28, NULL, 'Najmul Hossain Shanto', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(29, NULL, 'Mohammad Nabi', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(30, NULL, 'Litton Das', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(31, NULL, 'Fakhar Zaman', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(32, NULL, 'Asif Ali', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(33, NULL, 'Shreyas Iyer', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(34, NULL, 'Deepak Chahar', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(35, NULL, 'Rahmat Shah', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(36, NULL, 'Mohammad Wasim Jr', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(37, NULL, 'Shivam Dube', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(38, NULL, 'Agha Salman', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(39, NULL, 'Hashmatullah Shahidi', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(40, NULL, 'Ibrahim Zadran', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(41, NULL, 'Gulbadin Naib', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(42, NULL, 'Rahmanullah Gurbaz', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(43, NULL, 'Sadeera Samarawickrama', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(44, NULL, 'Dinesh Chandimal', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(45, NULL, 'Angelo Mathews', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(46, NULL, 'Kusal Mendis', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(47, NULL, 'Pathum Nissanka', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(48, NULL, 'Wanindu Hasaranga', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(49, NULL, 'Dasun Shanaka', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(50, NULL, 'Maheesh Theekshana', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(51, NULL, 'Dunith Wellalage', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(52, NULL, 'Chamika Karunaratne', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(53, NULL, 'Lahiru Kumara', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(54, NULL, 'Dushmantha Chameera', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(55, NULL, 'Mohammad Nawaz', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(56, NULL, 'Shan Masood', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(57, NULL, 'Washington Sundar', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(58, NULL, 'Axar Patel', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(59, NULL, 'Ruturaj Gaikwad', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(60, NULL, 'Prasidh Krishna', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(61, NULL, 'Mohammad Haris', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(62, NULL, 'Shubman Gill', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(63, NULL, 'Arshdeep Singh', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(64, NULL, 'Sanju Samson', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(65, NULL, 'Kamindu Mendis', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(66, NULL, 'Shoaib Malik', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(67, NULL, 'Anamul Haque', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(68, NULL, 'Yasir Ali', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(69, NULL, 'Mahmudullah Riyad', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(70, NULL, 'Mohammad Saifuddin', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(71, NULL, 'Soumya Sarkar', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(72, NULL, 'Shoriful Islam', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(73, NULL, 'Saud Shakeel', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(74, NULL, 'Ramesh Mendis', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(75, NULL, 'Avishka Fernando', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(76, NULL, 'Asitha Fernando', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(77, NULL, 'Kusal Perera', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(78, NULL, 'Dilshan Madushanka', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(79, NULL, 'Matheesha Pathirana', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(80, NULL, 'Nuwan Pradeep', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(81, NULL, 'Tim Southee', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(82, NULL, 'Trent Boult', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(83, NULL, 'Lockie Ferguson', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(84, NULL, 'Martin Guptill', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(85, NULL, 'Devon Conway', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(86, NULL, 'Tom Latham', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(87, NULL, 'Daryl Mitchell', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(88, NULL, 'Glenn Phillips', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(89, NULL, 'Finn Allen', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(90, NULL, 'Ish Sodhi', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(91, NULL, 'Rachin Ravindra', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(92, NULL, 'Mitchell Santner', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(93, NULL, 'Ben Lister', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(94, NULL, 'Mark Chapman', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(95, NULL, 'Kyle Jamieson', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(96, NULL, 'James Neesham', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(97, NULL, 'Will Young', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57'),
(98, NULL, 'Michael Bracewell', NULL, 1, '2025-03-28 16:49:57', '2025-03-28 16:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `tournaments`
--

CREATE TABLE `tournaments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tournaments`
--

INSERT INTO `tournaments` (`id`, `name`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'T-20 AisaCup', '2025-03-31 15:00:00', '2025-04-05 15:00:00', '1', '2025-03-28 18:25:27', '2025-03-28 18:25:27'),
(2, 'IPL', '2025-04-12 11:11:00', '2025-05-11 10:00:00', '1', '2025-04-11 15:35:23', '2025-04-11 15:35:23'),
(3, 'Test Tournament', '2025-11-08 12:00:00', '2025-04-26 12:00:00', '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21');

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
(1, 2, 81, '1', '2025-04-11 15:35:23', '2025-04-11 15:35:23'),
(2, 2, 50, '1', '2025-04-11 15:35:23', '2025-04-11 15:35:23'),
(3, 2, 53, '1', '2025-04-11 15:35:23', '2025-04-11 15:35:23'),
(4, 3, 81, '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21'),
(5, 3, 57, '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21'),
(6, 3, 50, '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21'),
(7, 3, 56, '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21'),
(8, 3, 59, '1', '2025-04-11 16:26:21', '2025-04-11 16:26:21');

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
(1, 1, 1, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(2, 1, 2, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(3, 1, 3, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(4, 1, 4, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(5, 1, 5, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(6, 1, 6, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(7, 1, 6, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(8, 1, 7, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(9, 1, 8, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(10, 1, 9, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(11, 1, 10, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(12, 1, 11, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(13, 1, 12, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(14, 1, 13, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(15, 1, 14, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(16, 2, 15, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(17, 2, 15, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(18, 2, 16, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(19, 2, 17, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(20, 2, 18, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(21, 2, 8, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(22, 2, 9, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(23, 2, 10, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(24, 2, 21, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(25, 2, 43, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(26, 2, 53, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(27, 2, 44, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(28, 2, 50, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(29, 2, 56, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(30, 2, 56, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(31, 3, 47, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(32, 3, 60, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(33, 3, 67, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(34, 3, 93, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(35, 3, 92, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(36, 3, 91, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(37, 3, 94, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(38, 3, 96, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(39, 3, 97, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(40, 3, 94, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(41, 3, 98, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(42, 3, 88, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(43, 3, 92, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(44, 3, 91, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(45, 3, 88, '2025-04-11 15:35:23', '2025-04-11 15:35:23', 2),
(46, 4, 1, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(47, 4, 2, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(48, 4, 3, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(49, 4, 4, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(50, 4, 5, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(51, 4, 6, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(52, 4, 7, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(53, 4, 8, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(54, 4, 9, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(55, 4, 10, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(56, 4, 11, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(57, 4, 12, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(58, 4, 13, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(59, 4, 14, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(60, 4, 15, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(61, 5, 16, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(62, 5, 17, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(63, 5, 18, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(64, 5, 19, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(65, 5, 20, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(66, 5, 21, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(67, 5, 22, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(68, 5, 23, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(69, 5, 24, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(70, 5, 25, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(71, 5, 26, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(72, 5, 27, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(73, 5, 28, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(74, 5, 29, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(75, 5, 30, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(76, 6, 31, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(77, 6, 32, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(78, 6, 33, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(79, 6, 34, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(80, 6, 35, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(81, 6, 36, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(82, 6, 37, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(83, 6, 38, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(84, 6, 39, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(85, 6, 40, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(86, 6, 41, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(87, 6, 42, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(88, 6, 43, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(89, 6, 44, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(90, 6, 45, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(91, 7, 46, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(92, 7, 47, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(93, 7, 48, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(94, 7, 49, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(95, 7, 50, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(96, 7, 51, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(97, 7, 52, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(98, 7, 53, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(99, 7, 54, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(100, 7, 55, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(101, 7, 56, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(102, 7, 57, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(103, 7, 58, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(104, 7, 59, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(105, 7, 60, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(106, 8, 61, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(107, 8, 62, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(108, 8, 63, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(109, 8, 72, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(110, 8, 73, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(111, 8, 74, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(112, 8, 75, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(113, 8, 64, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(114, 8, 65, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(115, 8, 66, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(116, 8, 67, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(117, 8, 68, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(118, 8, 69, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(119, 8, 70, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3),
(120, 8, 71, '2025-04-11 16:26:21', '2025-04-11 16:26:21', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `Credit_Points` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT '1',
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

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `Credit_Points`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `login_ip`, `register_ip`, `status`, `api_token`, `balance`, `crypto_address`, `paypal_address`) VALUES
(1, 'admin', 'admin', 'admin@mail.com', NULL, 0, '0000-00-00 00:00:00', '$2y$10$.ohlH5T5zL30jUlLVEQuruipW5V76FJljiDHjGGjh1qWb/ER2.A..', '2', NULL, '2025-03-03 13:22:36', '2025-04-13 15:15:19', '103.159.186.64', '103.159.186.74', '1', NULL, 0.00, NULL, NULL),
(4, 'pronay', 'pronay', 'pronay@mail.com', '6666666', 0, NULL, '$2y$10$ocIfoFeUy1ZfdaV6YEZBKOnWw/Uz.fZnrLiPSRL0NdW4RePtN1hDC', '1', NULL, '2025-03-05 06:04:06', '2025-04-04 23:08:08', '103.159.186.115', '103.159.186.74', '1', NULL, 0.00, NULL, NULL),
(5, 'pronay', 'pronay1', 'pronay1@mail.com', '52584', 0, NULL, '$2y$10$QAVjNAol48hkN5rvDHRs3OztX1OAmK1.7O0NTX6MpXmJbC.KpRu66', '1', NULL, '2025-03-05 06:04:35', '2025-03-27 19:24:41', '103.159.186.107', '103.159.186.74', '1', NULL, 0.00, NULL, NULL),
(6, 'pronay', 'pronay2', 'pronay2@mail.com', '8888888888888', 0, NULL, '$2y$10$yKbVNyKrqzJw26EyFu/DwuiTqaCTAnPnwCNcaHuhEcHBIato7gi5G', '1', NULL, '2025-03-05 07:18:54', '2025-03-05 10:48:09', '103.159.186.102', '103.159.186.102', '1', NULL, 0.00, NULL, NULL),
(7, 'pronay', 'pronay3', 'pronay3@mail.com', '01755555555', 0, NULL, '$2y$10$0TFxjjTiIlnpd.ZvWEjdxuULMEjo5i/bIuNCpWiZb93XRUq6MsFeK', '1', NULL, '2025-03-05 07:19:45', '2025-03-17 17:44:43', '69.65.43.86', '69.65.43.86', '1', NULL, 0.00, NULL, NULL),
(8, 'pronay', 'pronay4', 'pronay4@gmail.com', NULL, 0, NULL, '$2y$10$Odxr9/f04IJb..QDeXisu.n0QzOP2apXY42OJCmHNUXkLRxelUY0q', '1', NULL, '2025-03-09 11:45:10', '2025-03-09 11:45:10', '103.159.186.102', '103.159.186.102', '1', NULL, 0.00, NULL, NULL),
(9, 'pronay@gmail.com', 'pronay-at-gmailcom', 'pronay@gmail.com', NULL, 0, NULL, '$2y$10$NZeDquQXzL669cA9UXNVSeU59KcL.TmwXFtQxpQlk8kIouhKZ/.TS', '2', NULL, '2025-03-09 11:46:14', '2025-03-09 11:46:14', '103.159.186.102', '103.159.186.102', '1', NULL, 0.00, NULL, NULL),
(10, 'user@mail.com', 'user-at-mailcom', 'user@mail.com', NULL, 0, NULL, '$2y$10$tFoLklg08AlSY/hx.Ech5uT3gSCLmXxR1jWhBwdVDQmgYT2bhzs4a', '1', NULL, '2025-04-11 17:33:31', '2025-04-11 17:33:31', '103.159.186.64', '103.159.186.64', '1', NULL, 0.00, NULL, NULL),
(11, 'test', 'test', 'test@mail.com', '11111', 10, NULL, '$2y$10$EG1Z/2ekZ3nWWAfyVuSzhurE5wMVmKA2xVPvh0pdBGewys16PWn/S', '1', NULL, '2025-04-12 16:46:39', '2025-04-12 16:46:39', '103.159.186.64', '103.159.186.64', '0', NULL, 0.00, NULL, NULL),
(12, 'user1', 'user1', 'user1@mail.com', '2222', 10, NULL, '$2y$10$LL0BwFp.6U/LNq2/73w0O.ZhoaMqgJ3z7W3VTrMOmLnwxBqsFP1.C', '1', NULL, '2025-04-12 16:54:43', '2025-04-12 16:54:43', '111111', '111111', '0', NULL, 0.00, NULL, NULL),
(13, 'user3', 'user3', 'user3@mail.com', '11111', 10, NULL, '$2y$10$Ryb4UodNh.jGLeSqLLpM1O5w3m0pVVRiyKziM1a0N8V1a0p789efS', '1', NULL, '2025-04-12 19:28:56', '2025-04-12 19:28:56', '103.159.186.64', '103.159.186.64', '0', NULL, 0.00, NULL, NULL),
(14, 'user5', 'user5', 'user5@mail.com', '2222', 10, NULL, '$2y$10$spTF5ODhIoavH.fRDvNo2uYyrJaLNlqyoPfQyUZ6ZZilrAgqT.7ZG', '1', NULL, '2025-04-12 19:33:27', '2025-04-12 19:33:27', '111111', '111111', '0', NULL, 0.00, NULL, NULL),
(15, 'user', 'user', 'user6@mail.com', '222222222', 10, NULL, '$2y$10$3wMe9HvIuIBlvCazHBtL3eMSPg6d5w5AzCbhM6qpu3grlz2ybQSki', '1', NULL, '2025-04-12 19:39:36', '2025-04-12 19:39:36', '111111', '111111', '0', NULL, 0.00, NULL, NULL),
(16, 'user', 'user2', 'user7@mail.com', '222222222', 10, NULL, '$2y$10$KODJ82PkF/EF6KeqrYYMTuDFI0rLEBusk9D5KDIwv2bKVbUB7PVRy', '1', NULL, '2025-04-12 19:50:42', '2025-04-12 19:50:42', NULL, NULL, '0', NULL, 0.00, NULL, NULL),
(17, 'testcreadit', 'testcreadit', 'testcreadit@mail.com', '11111', 74, NULL, '$2y$10$gBeFe5K4JwyAD/G1GKjVJuxxTm0lFia0BPTlwGYXXG9FCXCfmkf4e', '1', NULL, '2025-04-13 16:20:52', '2025-04-13 16:47:33', '103.159.186.64', '103.159.186.64', '0', NULL, 0.00, NULL, NULL);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `notificaion`
--
ALTER TABLE `notificaion`
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
-- AUTO_INCREMENT for table `ballerresult`
--
ALTER TABLE `ballerresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `batsman`
--
ALTER TABLE `batsman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `batsmanresult`
--
ALTER TABLE `batsmanresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `boller`
--
ALTER TABLE `boller`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `champion`
--
ALTER TABLE `champion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `championresult`
--
ALTER TABLE `championresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `credits`
--
ALTER TABLE `credits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finalist`
--
ALTER TABLE `finalist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `finalistresult`
--
ALTER TABLE `finalistresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `match_list`
--
ALTER TABLE `match_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `match_report`
--
ALTER TABLE `match_report`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `match_run`
--
ALTER TABLE `match_run`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `notificaion`
--
ALTER TABLE `notificaion`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notification_user`
--
ALTER TABLE `notification_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `semifinal`
--
ALTER TABLE `semifinal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `semifinalresult`
--
ALTER TABLE `semifinalresult`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `spin_list`
--
ALTER TABLE `spin_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `team_players`
--
ALTER TABLE `team_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `tournaments`
--
ALTER TABLE `tournaments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tournament_participant`
--
ALTER TABLE `tournament_participant`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tournament_teams`
--
ALTER TABLE `tournament_teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tournament_teams_players`
--
ALTER TABLE `tournament_teams_players`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

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
