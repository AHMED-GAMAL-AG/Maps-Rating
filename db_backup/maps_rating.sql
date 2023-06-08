-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2023 at 12:55 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maps_rating`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` bigint UNSIGNED NOT NULL,
  `place_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `place_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'فنادق', 'فنادق', '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(2, 'مطاعم', 'مطاعم', '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(3, 'تسوق', 'تسوق', '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(4, 'مدارس وجامعات', 'مدارس-جامعات', '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(5, 'مستشفيات', 'مستشفيات', '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(6, 'صيدليات', 'صيدليات', '2023-05-10 06:33:16', '2023-05-10 06:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `review_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `review_id`, `created_at`, `updated_at`) VALUES
(3, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2023_05_02_045445_create_sessions_table', 1),
(10, '2023_05_03_113051_create_places_table', 1),
(11, '2023_05_03_113150_create_reviews_table', 1),
(12, '2023_05_03_113231_create_categories_table', 1),
(13, '2023_05_03_113248_create_bookmarks_table', 1),
(14, '2023_05_03_113300_create_roles_table', 1),
(15, '2023_05_03_113309_create_likes_table', 1),
(16, '2023_05_03_113316_create_reports_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `category_id` int NOT NULL,
  `overview` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `view_count` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `slug`, `image`, `category_id`, `overview`, `address`, `user_id`, `latitude`, `longitude`, `view_count`, `created_at`, `updated_at`) VALUES
(1, 'سوق مكة', 'سوق-مكة', '1.jpg', 3, 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم ت وليد هذا النص من مولد النص العربى، حيث', 'الطريق الدائري الثالث، حي الهجرة، مكة ، المملكة العربية السعودية', 1, 21.3924513, 39.8226124, 3, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(2, 'مطعم مكة', 'مطعم-مكة', '2.jpg', 2, 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\n        إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.\n        ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.\n        هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.', 'الكعكية، مكة ، المملكة العربية السعودية', 2, 35.74333, -5.81987, 2, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(3, 'صيدلية مكة', 'صيدلية-مكة', '3.jpg', 6, 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\n        إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.\n        ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.\n        هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.', 'شارع ذات النطاقين، الهجرة، مكة ، المملكة العربية السعودية', 1, 21.35768, 39.86084, 1, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(4, 'صيدلية نهي', 'صيدلية-نهي', '4.jpg', 6, 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.\n        إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.\n        ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق.\n        هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.', 'شارع خالد بن عبدالعزيز، العزيزية الجنوبية، مكة ، المملكة العربية السعودية', 3, 21.4318, 39.29138, 0, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(5, 'سوق', 'سوق-2', '1685971087.jpg', 1, 'نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة نبذة', 'التجمع الخامس', 1, 30.033912127103985, 31.49642944335938, 0, '2023-06-05 10:18:07', '2023-06-05 10:18:07');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `name`, `email`, `place_url`, `created_at`, `updated_at`) VALUES
(1, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:14:28', '2023-05-10 08:14:28'),
(2, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:15:55', '2023-05-10 08:15:55'),
(3, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:17:10', '2023-05-10 08:17:10'),
(4, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:18:01', '2023-05-10 08:18:01'),
(5, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:15', '2023-05-10 08:19:15'),
(6, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:16', '2023-05-10 08:19:16'),
(7, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:17', '2023-05-10 08:19:17'),
(8, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:17', '2023-05-10 08:19:17'),
(9, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:17', '2023-05-10 08:19:17'),
(10, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:17', '2023-05-10 08:19:17'),
(11, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:17', '2023-05-10 08:19:17'),
(12, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:18', '2023-05-10 08:19:18'),
(13, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:18', '2023-05-10 08:19:18'),
(14, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:18', '2023-05-10 08:19:18'),
(15, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:18', '2023-05-10 08:19:18'),
(16, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:39', '2023-05-10 08:19:39'),
(17, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:40', '2023-05-10 08:19:40'),
(18, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:40', '2023-05-10 08:19:40'),
(19, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:40', '2023-05-10 08:19:40'),
(20, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:40', '2023-05-10 08:19:40'),
(21, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:19:40', '2023-05-10 08:19:40'),
(22, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:20:02', '2023-05-10 08:20:02'),
(23, 'test', 'ahmed2@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:22:04', '2023-05-10 08:22:04'),
(24, 'cae', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:24:07', '2023-05-10 08:24:07'),
(25, 'cae', 'ahmed@gmail.com', 'http://maps-rating.localhost/report/create', '2023-05-10 08:24:53', '2023-05-10 08:24:53'),
(26, 'ahmed', 'ahmed@gmail.com', 'http://maps-rating.localhost/1/سوق-مكة', '2023-06-05 10:05:50', '2023-06-05 10:05:50'),
(27, 'ahmed', 'ahmed2@gmail.com', 'http://maps-rating.localhost/report/create', '2023-06-05 10:07:13', '2023-06-05 10:07:13'),
(28, 'ahmed', 'ahmed1@gmail.com', 'http://maps-rating.localhost/report/create', '2023-06-05 10:09:05', '2023-06-05 10:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_rating` int DEFAULT NULL,
  `quality_rating` int DEFAULT NULL,
  `cleanliness_rating` int DEFAULT NULL,
  `pricing_rating` int DEFAULT NULL,
  `place_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `service_rating`, `quality_rating`, `cleanliness_rating`, `pricing_rating`, `place_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا ممتاز جدًا', 5, 5, 5, 5, 1, 1, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(2, 'جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا جيد جدًا', 5, 4, 3, 4, 1, 2, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(3, ' جيد جيد جيد جيد جيد جيد جيد جيد جيد جيد جيد ', 4, 1, 3, 3, 1, 3, '2023-05-10 06:33:16', '2023-05-10 06:33:16'),
(4, '  جيد جدًاجيد جدًا جيد جدًا', 5, 4, 3, 4, 2, 1, '2023-05-10 06:33:16', '2023-05-10 06:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Owner', '2023-05-10 06:33:17', '2023-05-10 06:33:17'),
(2, 'User', '2023-05-10 06:33:17', '2023-05-10 06:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Rn3WKHkVoaJZr4F5JEKy23blNPsBqGmoMXQvATJx', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVGM0NzhDY01Ja0RhU2M2UzFKdk9xUTNzb1FOaVFzbFIxZEtSN01LTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly9tYXBzLXJhdGluZy5sb2NhbGhvc3QvJUQ5JTgxJUQ5JTg2JUQ4JUE3JUQ4JUFGJUQ5JTgyIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1685971678);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint UNSIGNED NOT NULL,
  `team_id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint UNSIGNED NOT NULL,
  `team_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL DEFAULT '2',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role_id`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'أحمد جمال', 'ahmed@gmail.com', 2, '2023-05-10 06:33:16', '$2y$10$pPb6Kv7dRJ7Xdn0QQ1Aj8.dzycC96kM9cRq72w50cA1eV1j66CKx6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-10 09:14:40'),
(2, 'أحمد محمد', 'user@gmail.com', 1, '2023-05-10 06:33:16', '$2y$10$hiPgH.pU30YfSnl2q1jhKOkcpg2P9LL30VtueHkPmxdrrwRMaHbHC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'فاطمة عمر', 'user2@gmail.com', 2, '2023-05-10 06:33:16', '$2y$10$SKxF2XXI9CrwfkMXR82NiefsC.SHp1.gHsgrSikQv4OSlPh72mWra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `places_slug_unique` (`slug`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

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
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
