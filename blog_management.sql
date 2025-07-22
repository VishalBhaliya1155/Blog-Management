-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2025 at 08:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Druckair', 'Druckair flight paro to vadodara', 'uploads/Screenshot 2024-07-22 102903.png', '2025-07-21 06:07:29', '2025-07-21 06:08:06'),
(2, 1, 'blog', 'this is bolg', 'uploads/Screenshot (5).png', '2025-07-21 06:35:45', '2025-07-21 06:35:45'),
(3, 1, 'login', 'login page', 'uploads/Screenshot (9).png', '2025-07-21 06:50:22', '2025-07-21 06:50:22'),
(4, 2, 'Weather app', 'this is my react Weather app', 'uploads/Screenshot 2025-07-08 144223.png', '2025-07-21 22:17:15', '2025-07-21 22:17:15'),
(5, 1, 'indigo', 'indigo airline photo', 'uploads/indigo.png', '2025-07-21 23:16:05', '2025-07-21 23:16:05'),
(6, 2, 'Ancient India', 'Ancient India', 'uploads/india.png', '2025-07-21 23:30:04', '2025-07-21 23:30:04'),
(7, 2, 'diamond', 'diamond caret', 'uploads/diamond.png', '2025-07-21 23:34:12', '2025-07-21 23:34:12'),
(8, 2, 'Trion', 'trion vadodara', 'uploads/trion.png', '2025-07-21 23:47:31', '2025-07-21 23:47:31'),
(9, 2, 'tomato', 'The tomato is a round, red fruit that is often used as a vegetable in cooking. It is juicy, slightly sweet, and sometimes a little sour. Tomatoes are commonly used in salads, sauces, soups, and many dishes around the world.', 'uploads/tometo.png', '2025-07-21 23:55:11', '2025-07-21 23:57:03'),
(10, 1, 'Healthy Living Tips', 'Learn daily habits that promote wellness and long-term health.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(11, 2, 'Web Development Basics', 'Introduction to HTML, CSS, and JavaScript for new developers.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(12, 3, 'Power of Daily Reading', 'How reading improves vocabulary and reduces stress.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(13, 1, 'Budget Travel Hacks', 'Explore the world on a budget with practical travel tips.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(14, 2, 'Public Speaking Skills', 'Overcome stage fright and improve your presentation.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(15, 3, 'Getting Started with AI', 'A simple explanation of artificial intelligence and its use.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(16, 1, 'Yoga for Beginners', 'Start practicing yoga for strength, flexibility, and peace.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(17, 2, 'Grow Your Own Garden', 'Learn to grow herbs and veggies at home.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(18, 3, 'Photography Essentials', 'Basics of photography including lighting and composition.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(19, 1, 'Sustainable Living', 'Adopt eco-friendly habits to help the environment.', NULL, '2025-07-20 18:30:00', '2025-07-20 18:30:00'),
(23, 2, 'tomato 2', 'The tomato is a round, red fruit that is often used as a vegetable in cooking. It is juicy, slightly sweet, and sometimes a little sour. Tomatoes are commonly used in salads, sauces, soups, and many dishes around the world.', 'uploads/tometo.png', '2025-07-22 00:45:28', '2025-07-22 00:45:28');

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
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_type`, `likeable_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'App\\Models\\Blog', 1, '2025-07-21 06:09:03', '2025-07-21 06:09:03'),
(2, 1, 'App\\Models\\Blog', 2, '2025-07-21 06:35:53', '2025-07-21 06:35:53'),
(4, 3, 'App\\Models\\Blog', 1, '2025-07-21 06:41:49', '2025-07-21 06:41:49'),
(5, 3, 'App\\Models\\Blog', 4, '2025-07-21 22:17:36', '2025-07-21 22:17:36'),
(7, 2, 'App\\Models\\Blog', 4, '2025-07-21 23:07:44', '2025-07-21 23:07:44'),
(10, 2, 'App\\Models\\Blog', 6, '2025-07-22 00:39:46', '2025-07-22 00:39:46');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_21_035215_create_likes_table', 1),
(6, '2025_07_21_094505_create_blogs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '66638d9e0eca565a3b01a4ec06007ec3efa2809e93afb7f8c0fba5d7705f38b5', '[\"*\"]', NULL, '2025-07-21 06:06:20', '2025-07-21 06:06:20'),
(2, 'App\\Models\\User', 1, 'auth_token', '429ef504754d0f82368af3e6ea000e2c6ec156dc193f9dc6006b782f988694e1', '[\"*\"]', '2025-07-22 00:47:00', '2025-07-21 06:06:53', '2025-07-22 00:47:00'),
(3, 'App\\Models\\User', 2, 'auth_token', 'bf2c09444b17b0698efe6986e04269ffd633e3945c584ee0d0a4f94e23398ffd', '[\"*\"]', NULL, '2025-07-21 06:32:40', '2025-07-21 06:32:40'),
(4, 'App\\Models\\User', 3, 'auth_token', '51ba3804860d15c82ba7c8c1ddb721503db54e6373a15aee42e4b9761200af55', '[\"*\"]', NULL, '2025-07-21 06:32:56', '2025-07-21 06:32:56'),
(5, 'App\\Models\\User', 3, 'auth_token', '8f4fdb651f102f088030183609d62229f093fca14f3228a446964dae5712c75e', '[\"*\"]', '2025-07-21 22:23:43', '2025-07-21 06:40:48', '2025-07-21 22:23:43'),
(6, 'App\\Models\\User', 3, 'auth_token', '0f94e971ae9f7a82cb916f10e23995f8b9b58f6bb5922ea2416b4d46d4f4b9dc', '[\"*\"]', NULL, '2025-07-21 06:48:26', '2025-07-21 06:48:26'),
(7, 'App\\Models\\User', 2, 'auth_token', 'f2c87c5e7ebcd872151806fb7970a8024b421365d9802ee406f0be9aad37a2c4', '[\"*\"]', '2025-07-22 00:45:28', '2025-07-21 22:15:21', '2025-07-22 00:45:28'),
(8, 'App\\Models\\User', 1, 'auth_token', '7031f2c53d17b9ab934532d47b7aecbc6af77feffa3c75f7e6bd9d4dd08e3376', '[\"*\"]', '2025-07-21 23:16:05', '2025-07-21 23:14:28', '2025-07-21 23:16:05'),
(9, 'App\\Models\\User', 4, 'auth_token', '175eb6144bc5029dff151f7955d8b4d80d545df9754c66becb7fa52bc5a9e496', '[\"*\"]', NULL, '2025-07-22 00:24:42', '2025-07-22 00:24:42'),
(10, 'App\\Models\\User', 4, 'auth_token', '6f96127f42fc7fff7a2294f4e27d6e1230552854861fef4e46fb26a9c633d8c8', '[\"*\"]', NULL, '2025-07-22 00:26:27', '2025-07-22 00:26:27'),
(11, 'App\\Models\\User', 1, 'auth_token', '0f21ea887999385cb71f165aa785cb36bfd86b8bf9b02fb69d1c53c4000877a6', '[\"*\"]', NULL, '2025-07-22 00:26:51', '2025-07-22 00:26:51');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Vishal', 'Vishal@Vishal.com', NULL, '$2y$10$SMSgWgzYt4PBVxrIdNKgYONseps9pkJUKvERLkkL0iirqtEr8YGaa', NULL, '2025-07-21 06:06:20', '2025-07-21 06:06:20'),
(2, 'Admin', 'Admin@test.com', NULL, '$2y$10$wZWd6/Z8bi8CRrMW7.T1q.7mAJz/SnwIVAYDZiBNxHepqQ08MPIJm', NULL, '2025-07-21 06:32:40', '2025-07-21 06:32:40'),
(3, 'Admin2', 'Admin2@test.com', NULL, '$2y$10$yWjpTgrB6BWAI1uiF9QB/ud3a2oTSGqQWO.0vjv3oBH7Tpv7klrw2', NULL, '2025-07-21 06:32:56', '2025-07-21 06:32:56'),
(4, 'Admin2', 'Admin3@test.com', NULL, 'Admin@123', NULL, '2025-07-22 00:24:42', '2025-07-22 00:24:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`),
  ADD KEY `likes_likeable_type_likeable_id_index` (`likeable_type`,`likeable_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
