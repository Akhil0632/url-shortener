-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2025 at 09:10 AM
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
-- Database: `url_shortener`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1755153737),
('laravel-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1755153737;', 1755153737),
('laravel-cache-shorturl:appleiphone15', 'a:2:{s:3:\"url\";s:126:\"https://www.amazon.in/Apple-iPhone-15-128-GB/dp/B0CHX3X6CM/ref=sr_1_1_sspa?keywords=iphone+15&qid=1723456789&sr=8-1-spons&th=1\";s:10:\"expires_at\";i:1756881216;}', 1755239616),
('laravel-cache-shorturl:h4xfna6', 'a:2:{s:3:\"url\";s:135:\"https://edition.cnn.com/2024/07/15/tech/ai-startup-growth-2024/index.html?utm_source=twitter&utm_medium=social&utm_campaign=global_news\";s:10:\"expires_at\";N;}', 1755239644),
('laravel-cache-shorturl:rb7d5y6', 'a:2:{s:3:\"url\";s:780:\"https://www.example.com/articles/2025/08/14/this-is-a-very-long-url-that-is-used-for-testing-url-shortener-functionality-and-it-includes-a-lot-of-unnecessary-but-valid-query-parameters-to-make-it-super-long?utm_source=test&utm_medium=chatgpt&utm_campaign=url-shortener-testing&utm_content=long-url-case&ref=long-url-demo&click_id=1234567890abcdef&session_id=abcdefghijklmnopqrstuvwxyz123456&feature_flag=beta_feature_on&debug_mode=true&user_id=99887766554433221100&tracking_code=ZZZZYYYYXXXXWWWWVVVVUUUUTTTTSSSSRQQQPPPOOOONNNNMMMMLLLLKKKKJJJJIIIIHHHHGGGGFFFFEEEE&extra_param1=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz&extra_param2=123456789012345678901234567890123456789012345678901234567890\";s:10:\"expires_at\";N;}', 1755239711),
('laravel-cache-shorturl:supervideo', 'a:2:{s:3:\"url\";s:99:\"https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=PLzMcBGfZo4-lB8MZfHPLTEHO9zJDDLpYj&index=23&t=154s\";s:10:\"expires_at\";N;}', 1755239667),
('laravel-cache-shorturl:video', 'a:2:{s:3:\"url\";s:43:\"https://www.youtube.com/watch?v=KdlcbUWj880\";s:10:\"expires_at\";i:1756017679;}', 1755240079);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_14_055414_create_short_urls_table', 1);

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jJUPE7lvZy0WCaok10NMc8lQQkCBu2770MYOh3Jp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36 Edg/139.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0tDZDBsbG01U04yakR1STVWY3hpaDRRRDJ3MmFzTnVGNlo0T2dLRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755153682);

-- --------------------------------------------------------

--
-- Table structure for table `short_urls`
--

CREATE TABLE `short_urls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `original_url` text NOT NULL,
  `code` varchar(16) NOT NULL,
  `clicks` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `short_urls`
--

INSERT INTO `short_urls` (`id`, `original_url`, `code`, `clicks`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'https://www.amazon.in/Apple-iPhone-15-128-GB/dp/B0CHX3X6CM/ref=sr_1_1_sspa?keywords=iphone+15&qid=1723456789&sr=8-1-spons&th=1', 'appleiphone15', 0, '2025-09-03 01:03:36', '2025-08-14 01:03:36', '2025-08-14 01:03:36'),
(2, 'https://edition.cnn.com/2024/07/15/tech/ai-startup-growth-2024/index.html?utm_source=twitter&utm_medium=social&utm_campaign=global_news', 'h4xfna6', 0, NULL, '2025-08-14 01:04:04', '2025-08-14 01:04:04'),
(3, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&list=PLzMcBGfZo4-lB8MZfHPLTEHO9zJDDLpYj&index=23&t=154s', 'supervideo', 0, NULL, '2025-08-14 01:04:27', '2025-08-14 01:04:27'),
(4, 'https://www.example.com/articles/2025/08/14/this-is-a-very-long-url-that-is-used-for-testing-url-shortener-functionality-and-it-includes-a-lot-of-unnecessary-but-valid-query-parameters-to-make-it-super-long?utm_source=test&utm_medium=chatgpt&utm_campaign=url-shortener-testing&utm_content=long-url-case&ref=long-url-demo&click_id=1234567890abcdef&session_id=abcdefghijklmnopqrstuvwxyz123456&feature_flag=beta_feature_on&debug_mode=true&user_id=99887766554433221100&tracking_code=ZZZZYYYYXXXXWWWWVVVVUUUUTTTTSSSSRQQQPPPOOOONNNNMMMMLLLLKKKKJJJJIIIIHHHHGGGGFFFFEEEE&extra_param1=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz&extra_param2=123456789012345678901234567890123456789012345678901234567890', 'rb7d5y6', 0, NULL, '2025-08-14 01:05:11', '2025-08-14 01:05:11'),
(5, 'https://www.youtube.com/watch?v=KdlcbUWj880', 'video', 0, '2025-08-24 01:11:19', '2025-08-14 01:11:19', '2025-08-14 01:11:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `short_urls`
--
ALTER TABLE `short_urls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `short_urls_code_unique` (`code`),
  ADD KEY `short_urls_code_index` (`code`),
  ADD KEY `short_urls_expires_at_index` (`expires_at`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `short_urls`
--
ALTER TABLE `short_urls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
