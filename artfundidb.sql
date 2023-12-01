-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2023 at 09:08 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artfundidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `id_number` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `uuid`, `id_number`, `date_of_birth`, `first_name`, `last_name`, `email`, `telephone`, `status`, `created_at`, `updated_at`) VALUES
(3, '9abc2c9a-89d2-4625-bdca-075301a7f0fc', '0103305416088', '2001-03-30', 'wellington', 'Smith', 'well-smith@yahoo.com', '0767155690', 'inactive', NULL, '2023-12-01 14:13:12'),
(6, '9abdb75c-85b3-4337-9c58-673653a5383b', '9912255417088', '1999-12-25', 'Victor', 'Ruiz', 'victor-ruiz@met.com', '0137124642', 'active', '2023-12-01 08:02:38', '2023-12-01 08:02:38'),
(8, '9abdbb78-04cf-4c66-9545-05d1fbfc3b00', '8804136547076', '1988-04-13', 'Mlungisi', 'Gumbi', 'mlungisi-gumbi@gmail.com', '0126124642', 'active', '2023-12-01 08:14:07', '2023-12-01 12:19:11'),
(9, '9abdbea6-cf89-49f7-82cf-6ad57e7db60f', '8510106547076', '1985-10-10', 'Zaynep', 'Altin', 'zynepaltin@gmail.com', '0147124642', 'active', '2023-12-01 08:23:01', '2023-12-01 13:41:13'),
(10, '9abdc223-4968-4fd0-8212-0fa8e1e28ac0', '8510015618088', '1985-10-01', 'Cyril', 'Mabuza', 'cyril@yahoo.com', '0115892214', 'active', '2023-12-01 08:32:45', '2023-12-01 08:32:45'),
(12, '9abe43d8-2afd-42f9-aa0f-3bf8a495cb17', '6702205417088', '1967-02-20', 'Maria', 'Ramos', 'maria-ramos@yahoo.com', '0665467896', 'active', '2023-12-01 14:35:27', '2023-12-01 14:35:27'),
(13, '9abe4469-faa1-4c28-aeb5-999b3e83e9b3', '7710205417088', '1977-10-20', 'Pedro', 'Rodriquez', 'pedrorodriquez@met.com', '0647543654', 'inactive', '2023-12-01 14:37:02', '2023-12-01 14:37:02'),
(14, '9abe44e2-afbc-4edb-ad11-78af17caa228', '7612245678088', '1976-12-24', 'Mogatla', 'Motaung', 'mogatla@zsteel.co.za', '0829770325', 'active', '2023-12-01 14:38:21', '2023-12-01 14:38:21'),
(15, '9abe458c-8685-40b2-9efa-4552760fea6d', '8306125417088', '1983-06-12', 'Bangali', 'Keita', 'keita@yahoo.com', '0611457563', 'active', '2023-12-01 14:40:13', '2023-12-01 14:40:13'),
(16, '9abe4600-c8fb-425e-823a-212c5f80e4c9', '6603305417088', '1966-03-30', 'Musa', 'Sedibe', 'musa-sedibe@delta-plant.com', '0749770325', 'active', '2023-12-01 14:41:29', '2023-12-01 14:41:29'),
(17, '9abe4806-52f1-4c36-bdba-d68896b6cf8f', '8602205417088', '1986-02-20', 'Kubrat', 'Pulev', 'kubrat@gmail.com', '0760517896', 'active', '2023-12-01 14:47:08', '2023-12-01 14:47:08'),
(18, '9abe48cc-0971-42d8-ae9f-377eae28e4f2', '9511115417088', '1995-11-11', 'Alphonse', 'Areola', 'alphonse-areola@zsteel.co.za', '0147124246', 'inactive', '2023-12-01 14:49:17', '2023-12-01 14:49:17'),
(19, '9abef951-3856-4d22-abe7-e35f7d545065', '8305055417089', '1983-05-05', 'Johny', 'heiting', 'johny@gmail.com', '0149770325', 'active', '2023-12-01 23:02:53', '2023-12-01 23:02:53'),
(20, '9abf3578-3cef-4957-9e56-76314a24d37c', '9004055417088', '1990-04-05', 'Noluthando', 'Zulu', 'n-zulu@czsteel.com', '0647891245', 'active', '2023-12-02 01:51:05', '2023-12-02 01:51:05'),
(21, '9abf35d8-7da7-4b4e-98e1-5759903a917a', '9103305417088', '1991-03-30', 'Themba', 'Mthombeni', 'themba@yahoo.com', '0767155677', 'active', '2023-12-02 01:52:08', '2023-12-02 01:52:08'),
(22, '9abf3726-aa2d-45c0-b5c3-c3486e38af57', '0305055417088', '2003-05-05', 'Vumile', 'Themba', 'vumile@yahoo.com', '0722568248', 'active', '2023-12-02 01:55:47', '2023-12-02 01:55:47'),
(23, '9abf37d1-c5f0-442b-b78c-1d62f7aa7ce6', '9907315417088', '1999-07-31', 'Martin', 'Petrov', 'martinptrov@gmail.com', '0752568248', 'active', '2023-12-02 01:57:39', '2023-12-02 01:57:39'),
(24, '9abf384b-cefb-4172-a793-0b53f382ee9b', '5012245417088', '1950-12-24', 'Vika', 'Zitha', 'vikazitha@yahoo.com', '0642568248', 'active', '2023-12-02 01:58:59', '2023-12-02 01:58:59'),
(25, '9abf38ed-1b3c-405e-93fe-de0f699817ec', '6712305417088', '1967-12-30', 'Sibongile', 'Nkosi', 's-nkosi@czsteel.com', '0632547896', 'active', '2023-12-02 02:00:44', '2023-12-02 02:00:44'),
(26, '9abf398c-74a8-4ff9-b068-0b53f8d1fdbb', '9603305417088', '1996-03-30', 'Terry', 'Mulondzo', 'terry@gmail.com', '0782568248', 'inactive', '2023-12-02 02:02:29', '2023-12-02 02:03:08');

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
(7, '2014_10_12_000000_create_users_table', 1),
(8, '2014_10_12_100000_create_password_resets_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(11, '2023_11_26_141848_create_clients_table', 1),
(12, '2023_11_26_163045_add_column_expires_at_to_personal_access_tokens', 2);

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Miss Tess Altenwerth', 'germaine.wyman@example.com', '2023-11-26 22:30:30', '$2y$10$F8TKI3aYefktMn5Mh02KNu6ZQ5x.NTw59Q7tZEQHfPAc/1RUoS/fy', 'qimuLvkF4u', '2023-11-26 22:30:31', '2023-11-26 22:30:31'),
(2, 'Rigoberto Trantow', 'mackenzie.considine@example.org', '2023-11-26 22:30:30', '$2y$10$douBvH9RBZLHyiF6CUbtFedU/TaKwLTmeJ8xBzr2FPLXA3U2HxjKC', 'Tox0GjLlfJ', '2023-11-26 22:30:31', '2023-11-26 22:30:31'),
(3, 'Zackary Gulgowski', 'fbernier@example.com', '2023-11-26 22:30:30', '$2y$10$mpVyjBsF97E8IZYzzB5ZEeHLloatBsG0PNPwya10APslGSP.sL7fu', '8E7wOn0e0X', '2023-11-26 22:30:31', '2023-11-26 22:30:31'),
(4, 'Wiley Lemke', 'layla.kshlerin@example.net', '2023-11-26 22:30:30', '$2y$10$bWUzh1nPO0zdYbb8rj.ql..ZKl46B5cgnWCpXgDSszwz7c/Qk35FW', 'xwJV72XSnv', '2023-11-26 22:30:31', '2023-11-26 22:30:31'),
(5, 'Creola Glover', 'qlegros@example.com', '2023-11-26 22:30:30', '$2y$10$dcZLxbJZ/b3iH/l1jtmFfu4TT2Q4lhBR81clNOYVWZoSEe./HMRrC', '1WZdDOA0md', '2023-11-26 22:30:31', '2023-11-26 22:30:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `clients_id_number_unique` (`id_number`),
  ADD UNIQUE KEY `clients_email_unique` (`email`),
  ADD UNIQUE KEY `clients_telephone_unique` (`telephone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
