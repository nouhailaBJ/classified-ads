-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2020 at 06:34 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `tags`, `status`, `image`, `created_at`, `updated_at`) VALUES
(10, 'AMD Ryzen 7 3700X 8-Core, 16-Thread Unlocked Desktop Processor with Wraith Prism LED Cooler', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '1594997780.jpeg', '2020-07-17 13:56:20', '2020-07-17 13:56:20'),
(11, 'There are many variations of passages of Lorem Ipsum available,', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '1594997806.jpeg', '2020-07-17 13:56:46', '2020-07-17 13:56:46'),
(12, 'In particular, the garbled words of lorem ipsum bear an unmistakable resemblance to sections', '<h3>HEDONIST ROOTS</h3>\n\n<p>Until recently, the prevailing view assumed&nbsp;<em>lorem ipsum</em>&nbsp;was born as a nonsense text. &ldquo;It&#39;s not Latin, though it looks like it, and it actually says nothing,&rdquo;&nbsp;<em>Before &amp; After</em>&nbsp;magazine&nbsp;<a href=\"https://www.straightdope.com/columns/read/2290/what-does-the-filler-text-lorem-ipsum-mean/\" target=\"_blank\">answered a curious reader</a>, &ldquo;Its &lsquo;words&rsquo; loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.&rdquo;</p>\n\n<p>As Cicero would put it, &ldquo;Um, not so fast.&rdquo;</p>\n\n<p>The placeholder text, beginning with the line&nbsp;<em>&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit&rdquo;</em>, looks like Latin because in its youth, centuries ago, it was Latin.</p>\n\n<p>Richard McClintock, a Latin scholar from Hampden-Sydney College, is&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\" target=\"_blank\">credited</a>&nbsp;with discovering the source behind the ubiquitous filler text. In seeing a sample of&nbsp;<em>lorem ipsum</em>, his interest was piqued by&nbsp;<em>consectetur</em>&mdash;a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from&nbsp;<em>De Finibus Bonorum et Malorum</em>&nbsp;(&ldquo;On the Extremes of Good and Evil&rdquo;), a first-century B.C. text from the Roman philosopher Cicero.</p>\n\n<p>In particular, the garbled words of&nbsp;<em>lorem ipsum</em>&nbsp;bear an unmistakable resemblance to sections 1.10.32&ndash;33 of Cicero&#39;s work, with the most notable passage excerpted below:</p>\n\n<blockquote>&ldquo;Neque porro quisquam est, qui&nbsp;<em>dolorem ipsum</em>&nbsp;quia&nbsp;<em>dolor sit amet, consectetur, adipisci velit, sed</em>&nbsp;quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.&rdquo;</blockquote>', 'tag1,tag2', 1, '1594997837.jpeg', '2020-07-17 13:57:17', '2020-07-17 13:57:17'),
(13, 'What is Lorem Ipsum?', '<h3>HEDONIST ROOTS</h3>\n\n<p>Until recently, the prevailing view assumed&nbsp;<em>lorem ipsum</em>&nbsp;was born as a nonsense text. &ldquo;It&#39;s not Latin, though it looks like it, and it actually says nothing,&rdquo;&nbsp;<em>Before &amp; After</em>&nbsp;magazine&nbsp;<a href=\"https://www.straightdope.com/columns/read/2290/what-does-the-filler-text-lorem-ipsum-mean/\" target=\"_blank\">answered a curious reader</a>, &ldquo;Its &lsquo;words&rsquo; loosely approximate the frequency with which letters occur in English, which is why at a glance it looks pretty real.&rdquo;</p>\n\n<p>As Cicero would put it, &ldquo;Um, not so fast.&rdquo;</p>\n\n<p>The placeholder text, beginning with the line&nbsp;<em>&ldquo;Lorem ipsum dolor sit amet, consectetur adipiscing elit&rdquo;</em>, looks like Latin because in its youth, centuries ago, it was Latin.</p>\n\n<p>Richard McClintock, a Latin scholar from Hampden-Sydney College, is&nbsp;<a href=\"https://en.wikipedia.org/wiki/Lorem_ipsum\" target=\"_blank\">credited</a>&nbsp;with discovering the source behind the ubiquitous filler text. In seeing a sample of&nbsp;<em>lorem ipsum</em>, his interest was piqued by&nbsp;<em>consectetur</em>&mdash;a genuine, albeit rare, Latin word. Consulting a Latin dictionary led McClintock to a passage from&nbsp;<em>De Finibus Bonorum et Malorum</em>&nbsp;(&ldquo;On the Extremes of Good and Evil&rdquo;), a first-century B.C. text from the Roman philosopher Cicero.</p>\n\n<p>In particular, the garbled words of&nbsp;<em>lorem ipsum</em>&nbsp;bear an unmistakable resemblance to sections 1.10.32&ndash;33 of Cicero&#39;s work, with the most notable passage excerpted below:</p>\n\n<blockquote>&ldquo;Neque porro quisquam est, qui&nbsp;<em>dolorem ipsum</em>&nbsp;quia&nbsp;<em>dolor sit amet, consectetur, adipisci velit, sed</em>&nbsp;quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.&rdquo;</blockquote>', 'tag1,tag2', 1, '1594997855.jpeg', '2020-07-17 13:57:35', '2020-07-17 13:57:35'),
(14, 'There are many variations of passages of Lorem Ipsum available,', '<h2>What is Lorem Ipsu</h2>\n\n<h2>&nbsp;</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<h2>m?</h2>', 'tag1,tag2', 1, '1594997875.jpeg', '2020-07-17 13:57:55', '2020-07-17 13:57:55'),
(15, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'tag1,tag2', 1, '1594997897.jpeg', '2020-07-17 13:58:17', '2020-07-17 13:58:17'),
(16, 'There are many variations of passages of Lorem Ipsum available,', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry.</p>\n\n<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '1594997920.jpeg', '2020-07-17 13:58:40', '2020-07-17 13:58:40');

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendars`
--

INSERT INTO `calendars` (`id`, `event_name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(15, 'get the papper', '2020-07-03', '2020-07-04', '2020-07-03 16:34:03', '2020-07-03 16:34:03'),
(17, 'clean my room', '2020-07-03', '2020-07-04', '2020-07-03 16:34:26', '2020-07-03 16:34:34'),
(18, 'hang out', '2020-07-07', '2020-07-09', '2020-07-06 15:03:29', '2020-07-06 15:03:29'),
(20, 'event  test', '2020-07-21', '2020-07-23', '2020-07-08 10:50:49', '2020-07-09 15:30:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parents` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parents`, `created_at`, `updated_at`, `icon`) VALUES
(8, 'IT and multimedia', 0, '2020-07-17 13:05:09', '2020-07-17 13:05:09', 'fa-desktop'),
(9, 'vehicles', 0, '2020-07-17 13:05:48', '2020-07-17 13:05:48', 'fa-car'),
(10, 'immovable', 0, '2020-07-17 13:06:23', '2020-07-17 13:06:23', 'fa-home'),
(11, 'Clothes', 0, '2020-07-17 13:07:32', '2020-07-17 13:07:32', 'fa-user'),
(12, 'Employment', 0, '2020-07-17 13:08:19', '2020-07-17 13:36:44', 'fa-briefcase'),
(13, 'Phone', 8, '2020-07-17 13:32:48', '2020-07-17 13:32:48', 'fa-phone'),
(14, 'Laptop', 8, '2020-07-17 13:33:00', '2020-07-17 13:33:00', 'fa-laptop'),
(15, 'Car', 9, '2020-07-17 13:33:18', '2020-07-17 13:33:18', 'fa-car'),
(16, 'Motorcycle', 9, '2020-07-17 13:33:46', '2020-07-17 13:33:46', 'fa-motorcycle'),
(17, 'Appartement', 10, '2020-07-17 13:34:27', '2020-07-17 13:34:27', 'fa-home'),
(18, 'Loisirs', 10, '2020-07-17 13:34:40', '2020-07-17 13:34:40', 'fa-bed'),
(19, 'Gir lClothes', 11, '2020-07-17 13:35:11', '2020-07-17 13:35:11', 'fa-circle'),
(20, 'Boy Clothes', 11, '2020-07-17 13:35:32', '2020-07-17 13:35:32', 'fa-circle'),
(21, 'Work Emploi', 12, '2020-07-17 13:36:11', '2020-07-17 13:36:11', 'fa-briefcase'),
(22, 'Service', 12, '2020-07-17 13:36:22', '2020-07-17 13:36:22', 'fa-wordpress');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` int(10) UNSIGNED NOT NULL COMMENT 'Own Id',
  `to` int(10) UNSIGNED NOT NULL COMMENT 'Other Id',
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(1, 'JQMIGRATE: Migrate is installed, version 3.0.0', 1, 8, '2020-07-13 00:36:45', '2020-07-13 00:36:45'),
(2, 'SELECT * FROM `users`', 1, 8, '2020-07-13 00:57:10', '2020-07-13 00:57:10'),
(3, 'SELECT * FROM `users`', 1, 6, '2020-07-13 00:57:22', '2020-07-13 00:57:22'),
(4, 'SELECT * FROM `users`', 1, 9, '2020-07-13 00:57:45', '2020-07-13 00:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'fes', NULL, '2020-07-17 13:47:19'),
(2, 'marrakech', NULL, NULL),
(3, 'ben guerrir', NULL, NULL),
(5, 'ifrane', '2020-07-17 13:45:50', '2020-07-17 13:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medias`
--

INSERT INTO `medias` (`id`, `image`, `created_at`, `updated_at`) VALUES
(247, '159343057390399266_588438651754097_2320479473066860875_n.jpg', '2020-06-29 10:36:13', '2020-06-29 10:36:13'),
(249, '159343059391575960_107717954077583_476435846935725855_n.jpg', '2020-06-29 10:36:33', '2020-06-29 10:36:33'),
(250, '159343059392214063_266541101017458_3679872679421725828_n.jpg', '2020-06-29 10:36:33', '2020-06-29 10:36:33'),
(251, '159343059392338489_134129198169297_4198962140996995396_n.jpg', '2020-06-29 10:36:33', '2020-06-29 10:36:33'),
(252, '159343088392214063_266541101017458_3679872679421725828_n.jpg', '2020-06-29 10:41:23', '2020-06-29 10:41:23'),
(254, '159343318161381455_2329087384011790_4658023259705754749_n.jpg', '2020-06-29 11:19:41', '2020-06-29 11:19:41'),
(255, '15942086382019_mercedes-benz_g-class_39_1600x1200.jpg', '2020-07-08 10:43:59', '2020-07-08 10:43:59'),
(256, '15942086392019_mercedes-benz_g-class_40_1600x1200.jpg', '2020-07-08 10:43:59', '2020-07-08 10:43:59'),
(257, '15942086392019_mercedes-benz_g-class_41_1600x1200.jpg', '2020-07-08 10:43:59', '2020-07-08 10:43:59'),
(258, '15942086392019_mercedes-benz_g-class_42_1600x1200.jpg', '2020-07-08 10:43:59', '2020-07-08 10:43:59'),
(259, '15942090282019_mercedes-benz_g-class_43_1600x1200.jpg', '2020-07-08 10:50:28', '2020-07-08 10:50:28'),
(260, '15942090292019_mercedes-benz_g-class_44_1600x1200.jpg', '2020-07-08 10:50:29', '2020-07-08 10:50:29'),
(262, '15942090292019_mercedes-benz_g-class_46_1600x1200.jpg', '2020-07-08 10:50:29', '2020-07-08 10:50:29'),
(263, '1594311696berline-réaliste-de-voiture-119213337.jpg', '2020-07-09 15:21:36', '2020-07-09 15:21:36'),
(264, '159431226701-mercedes-benz-g-500-w-463-wallpaper.jpg', '2020-07-09 15:31:08', '2020-07-09 15:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(4, 'ahmed mouhamed', 'mouhamed_ahmed@gmail.com', 'Nesciunt tofu stumptown aliqua,you probably haven\'t heard of them jean', 'Nesciunt tofu stumptown aliqua,you probably haven\'t heard of them jean', 1, NULL, NULL),
(5, 'salma malak', 'salma_malak@live.fr', 'It is a long established fact that a reader', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \r\n', 0, NULL, NULL),
(6, 'rayan bja', 'rayan_bja@outlook.fr', 'it to make a type specimen book.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 1, NULL, NULL),
(7, 'nouhaila', 'best_car@outlook.fr', 'best_car@outlook.fr', 'best_car@outlook.fr', 0, '2020-07-11 14:47:52', '2020-07-11 14:47:52'),
(8, 'nouhaila', 'best_car@outlook.fr', 'v-if=\"error\"', 'v-if=\"error\"', 0, '2020-07-11 14:50:39', '2020-07-11 14:50:39'),
(9, 'nouhaila', 'test_test@outlook.fr', 'best_car@outlook.fr', '<div v-if=\"success\" role=\"alert\" class=\"alert alert-success alert-dismissible\">\n                                                <button aria-label=\"Close\" data-dismiss=\"alert\" class=\"close\" type=\"button\"><span aria-hidden=\"true\">×</span></button>\n                                                <strong>Success</strong> - {{ success }}\n                                            </div>', 0, '2020-07-11 14:51:18', '2020-07-11 14:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_resets_table', 1),
(17, '2020_06_26_183749_create_products_table', 1),
(18, '2020_06_26_183923_create_products_imgs_table', 1),
(19, '2020_06_26_184003_create_blogs_table', 1),
(20, '2020_06_26_184027_create_blogs_imgs_table', 1),
(21, '2020_06_26_184050_create_todos_table', 1),
(22, '2020_06_26_184232_create_pages_table', 1),
(23, '2020_06_26_184347_create_medias_table', 1),
(24, '2020_06_26_184444_create_messages_table', 1),
(25, '2020_06_27_153220_create_categories_table', 2),
(26, '2020_07_03_105754_create_calendars_table', 3),
(27, '2020_07_03_184347_create_settings_table', 4),
(28, '2016_06_01_000001_create_oauth_auth_codes_table', 5),
(29, '2016_06_01_000002_create_oauth_access_tokens_table', 5),
(30, '2016_06_01_000003_create_oauth_refresh_tokens_table', 5),
(31, '2016_06_01_000004_create_oauth_clients_table', 5),
(32, '2016_06_01_000005_create_oauth_personal_access_clients_table', 5),
(33, '2020_07_11_122127_create_chats_table', 6),
(34, '2020_07_13_012339_create_comments_table', 7),
(35, '2020_07_13_145938_create_chats_table', 8),
(36, '2020_07_14_002450_create_websockets_statistics_entries_table', 9),
(37, '2020_07_15_165844_create_sessions_table', 10),
(38, '2020_07_15_174009_create_sessions_table', 11),
(39, '2020_07_16_133721_create_locations_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('04196acf18784d365df4e48231ed2da0fca61a3eccc1d7a9fb5e8ba6a3aea36fc0b1c17e4ea1e8b3', 1, 1, 'AppName', '[]', 0, '2020-07-12 11:10:06', '2020-07-12 11:10:06', '2021-07-12 12:10:06'),
('09d347486bcc3e6e850ebd1f8c1d8ccc229bd214e5c3784f75f23911bcdd9fa821c6d8796b656aef', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:58:19', '2020-07-12 10:58:19', '2021-07-12 11:58:19'),
('0a029ccc90624d5ee0e56514d0f87ab0f7f83a23e0c5600f015cd60ff3501fddfadd3202c4b13f9b', 12, 1, 'nouhaila', '[]', 1, '2020-07-05 15:40:51', '2020-07-05 15:40:51', '2021-07-05 16:40:51'),
('0a6fb44b11dc16f7b4eef319768d91e3f56341999edbb96e73403796a27e571a2a07557f42f6abc3', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:25:30', '2020-07-12 11:25:30', '2021-07-12 12:25:30'),
('0dd60b34658a9a81aeaf95469919ea358f043466b2e98c138ee3b1e0a81e67b51169986f819840d1', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:31:04', '2020-07-12 11:31:04', '2021-07-12 12:31:04'),
('18c8ecd2c7afadec807786052fdeb282b43885428a8ab5d316c41e9ccf2a9b9966936aafd347945c', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:49:25', '2020-07-12 10:49:25', '2021-07-12 11:49:25'),
('197a9cf20530735151ba87b306e044f6827578410c8d1a2402b99d38dfbd6c432f9bb3d589396208', 1, 1, 'AppName', '[]', 0, '2020-07-12 11:06:24', '2020-07-12 11:06:24', '2021-07-12 12:06:24'),
('2be1f51937d47c54e28b076f0da3911c85ad3471b7a49dfe7b6cefcc3ae1e9c55b2fbc8d6a127265', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:32:35', '2020-07-12 11:32:35', '2021-07-12 12:32:35'),
('2d183e425af144cb2227d82adf06a465c71489cee878e8c5b9633218fb0d63482d411012f12e4712', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:46:10', '2020-07-12 10:46:10', '2021-07-12 11:46:10'),
('30ebf7e913639bcb0dd15b085de90fcb7b5d5baa12ad128ef7b2d0410c9b46e64810bb6e9d0fd172', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:31:29', '2020-07-12 11:31:29', '2021-07-12 12:31:29'),
('4478ecf2aaf67034379874a8c87838972d420610092759612bc25ed9a30d4650a0a04ccd08a51e9e', 1, 1, 'AppName', '[]', 0, '2020-07-12 11:10:24', '2020-07-12 11:10:24', '2021-07-12 12:10:24'),
('4e064198e7fc53139a8a1d3aafc966db7942048422b4525b5cbf6037f209bf2397b3eba5244a2f2d', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:47:16', '2020-07-12 10:47:16', '2021-07-12 11:47:16'),
('56abfe973949bac2d3293d1d366341ca5203dc1f82841d1bc76671c0a0cc550ea06b294cfff5c43c', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:25:59', '2020-07-12 11:25:59', '2021-07-12 12:25:59'),
('575236d3bd58ce371dc4e5643492464d8c62eee0668b6db7953d6c716a2718d9621c4e937ac56952', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:52:14', '2020-07-12 10:52:14', '2021-07-12 11:52:14'),
('631d346b975051d85b3887c37a40341727ab0995e7799b3cd38cb3754bdcd302afe5380a3c7e9896', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:31:50', '2020-07-12 11:31:50', '2021-07-12 12:31:50'),
('63d567c583d434ebc568dbc0c9e7647eea5142c2790295914a665369158100f93d03a965725e9d47', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:22:47', '2020-07-12 11:22:47', '2021-07-12 12:22:47'),
('67991cf9c64f68a56427cc780ef2acf6eff84da8a426c194d6112ab7f628ddf91d862cb025e90e35', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:52:35', '2020-07-12 10:52:35', '2021-07-12 11:52:35'),
('69a50cba5598848bf08f2e1f7669b1fccc34819c8acaf2bc6b76222f36eff0c00b816de18ecf5a1b', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:52:46', '2020-07-12 10:52:46', '2021-07-12 11:52:46'),
('6a9c25a911bd13cf11051f8aa99083e92d3ae59f7b5e714119f2ace9541a274fec33cdf699dbac21', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:22:27', '2020-07-12 11:22:27', '2021-07-12 12:22:27'),
('72ebf226678d1cc60f9840ccc84c1ad79a5563f84f1c29e4eb5d757b71b0e367afdbfeff436add79', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:54:37', '2020-07-12 10:54:37', '2021-07-12 11:54:37'),
('84a2bd5866f7d8bcb154f547ed647a191cc206197c352302779909400f95437654a64ac31a0b4b96', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:35:50', '2020-07-12 10:35:50', '2021-07-12 11:35:50'),
('9c826bf9cd26a5bf7e8feacabc75a6ff44745061ed9d59fdef72c1c0b87b451aaee8c066c62733d5', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:36:03', '2020-07-12 11:36:03', '2021-07-12 12:36:03'),
('ada8fd19f38e6025c4fa380abe5c75c6b572c1783793ad283761dfd5926f9cb387f14dc5f731c696', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:37:54', '2020-07-12 10:37:54', '2021-07-12 11:37:54'),
('b02a7777e9ff0c733370d7a2a12adc17b1c9596a6f8983c92603e3fcb9f8f55c30fccb849631a351', 1, 1, 'AppName', '[]', 0, '2020-07-12 10:54:28', '2020-07-12 10:54:28', '2021-07-12 11:54:28'),
('b1173149ffb65e5758f3e4724d194e830faf968ecc76a3625c499e1f2fc6b10b2538c433abc7969a', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:30:57', '2020-07-12 11:30:57', '2021-07-12 12:30:57'),
('bf0dc48eaca4317207a167cf4a510ddda3b894688c095950bbf975b7fee03797de537161638729fc', 1, 1, 'AppName', '[]', 0, '2020-07-12 11:11:07', '2020-07-12 11:11:07', '2021-07-12 12:11:07'),
('c83f3ff44dc92cf005c606e09be29db99158748e816d6bf88378afe010da4ebc6a9cbaa128a368f8', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:50:21', '2020-07-12 10:50:21', '2021-07-12 11:50:21'),
('ce76ad2247e485eb78846a8f977458446ad3c7c1ef11182c18ddc3111ab92b871a1a8318b7dafac9', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:41:09', '2020-07-12 10:41:09', '2021-07-12 11:41:09'),
('dba2b2c08a919b0d9ce13030507f05e869da9a829f6616e521fc032709bab928ed9fe3ae47c64dc2', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:43:48', '2020-07-12 10:43:48', '2021-07-12 11:43:48'),
('dc309a91ed3e9f4214fe736bce7ea8460b4bc47ffe2705fc9f2920404192a5840357b3a2f56e8645', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:36:30', '2020-07-12 11:36:30', '2021-07-12 12:36:30'),
('dd1fd8e5a908461e392f39517d2ca35246d82bbb508c23326fe822dfa3b71c0598731f8e01019490', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:22:45', '2020-07-12 11:22:45', '2021-07-12 12:22:45'),
('e2b217b701398df0a1e3f92401b98ccdbff47ad8368d476988167a329b3bf5563e75d79500d3e541', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:22:48', '2020-07-12 11:22:48', '2021-07-12 12:22:48'),
('e76b62de9d5bf84ff26bdf7e53e46b8d90dec4b67a44e3a3fb3c99470e69f87fce3702a2822d8bdc', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:48:07', '2020-07-12 10:48:07', '2021-07-12 11:48:07'),
('fe27e45f6a9683d631d4dbbf8a19d4954ef761137e2c3344ce0f4208dca94112e6b1929d2c079b85', 1, 1, 'MyApp', '[]', 0, '2020-07-12 11:24:03', '2020-07-12 11:24:03', '2021-07-12 12:24:03'),
('ffd5b09828d5de3758be1dba1a065d2bb29b783a175ac3912c3b2f03081ccc29b225e42534e8bcc8', 1, 1, 'MyApp', '[]', 0, '2020-07-12 10:35:09', '2020-07-12 10:35:09', '2021-07-12 11:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '1zN3Doz1vq4s16EwjjoN0HiyyzrZIj1Mbu2UYRI4', 'http://localhost', 1, 0, 0, '2020-07-05 15:33:37', '2020-07-05 15:33:37'),
(2, NULL, 'Laravel Password Grant Client', 'ObQbLLSNH0bRV9XRhMfnu6ckAHbHfEwgU4ab6wQF', 'http://localhost', 0, 1, 0, '2020-07-05 15:33:37', '2020-07-05 15:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-07-05 15:33:37', '2020-07-05 15:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `description`, `tags`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Police Service', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'police, service', 1, '2020-07-17 13:51:08', '2020-07-17 13:51:08'),
(6, 'Privacy Service', '<h2 style=\"font-style:italic;\">What is Lorem Ipsum?</h2>\n\n<blockquote>\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n</blockquote>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:51:53', '2020-07-17 13:51:53'),
(7, 'Terms And Service', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:52:08', '2020-07-17 13:52:08'),
(8, 'Another Page', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:52:53', '2020-07-17 13:52:53'),
(9, 'Service Police', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:53:07', '2020-07-17 13:53:07'),
(10, 'About Us', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:53:17', '2020-07-17 13:53:17'),
(11, 'How to ?', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:53:33', '2020-07-17 13:53:33'),
(12, 'Buy and Sell', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:53:52', '2020-07-17 13:53:52'),
(13, 'Our location', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:54:32', '2020-07-17 13:54:32'),
(14, 'Found us', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:54:43', '2020-07-17 13:54:43'),
(15, 'Investor', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n\n<h2>Why do we use it?</h2>\n\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n\n<p>&nbsp;</p>\n\n<h2>Where does it come from?</h2>\n\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\n\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n\n<h2>Where can I get some?</h2>\n\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'tag1,tag2', 1, '2020-07-17 13:55:01', '2020-07-17 13:55:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `cat_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `tags`, `price`, `status`, `cat_id`, `sub_id`, `image`, `user_id`, `location`, `created_at`, `updated_at`) VALUES
(54, 'AMD Ryzen 7 3700X 8-Core, 16-Thread Unlocked Desktop Processor with Wraith Prism LED Cooler', 'Processor Socket	Socket AM4\nPlatform	Windows\nSecondary Cache	4 MB\nWattage	65 Watts\nProcessor Count	8\nAbout this item\nThe world\'s most advanced processor in the desktop PC gaming segment\nCan deliver ultra-fast 100+ FPS performance in the world\'s most popular games\n8 cores and 16 processing threads, bundled with the AMD Wraith Prism cooler with color controlled LED support\n4 4 GHz max boost unlocked for overclocking 36 MB of game cache DDR4 3200 MHz system memory specification\nFor the advanced socket AM4 platform can support PCIe 4 0 on x570 motherboards', 'tag1,tag2', '100', 1, 8, 14, '1594997979.webp', 61, 'fes', '2020-07-17 13:59:39', '2020-07-17 13:59:39'),
(55, '-mercedes-benz-g-class-40th-anniversary', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '2323223', 1, 9, 15, '1594998020.jpeg', 22, 'ben guerrir', '2020-07-17 14:00:20', '2020-07-17 14:00:20'),
(56, 'Best car to buy and sell found your own', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '1000000', 1, 9, 15, '1594998088.jpeg', 20, 'marrakech', '2020-07-17 14:01:30', '2020-07-17 14:01:30'),
(57, 'car Vehisil many variations of passages', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '20000', 1, 9, 15, '1594998139.jpeg', 5, 'ben guerrir', '2020-07-17 14:02:19', '2020-07-17 14:02:19'),
(58, 'computer variations of passages of Lorem Ipsum available,', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '20000', 1, 8, 14, '1594998309.jpeg', 4, 'marrakech', '2020-07-17 14:05:09', '2020-07-17 14:05:09'),
(59, 'ASUS VivoBook L203MA Laptop, 11.6” HD Display,', 'ASUS VivoBook L203MA Laptop, 11.6” HD Display, Intel Celeron Dual Core CPU, 4GB RAM, 64GB Storage, USB-C, Windows 10 Home In S Mode, Up To 10 Hours Battery Life, One Year of Microsoft 365, L203MA-DS04\nASUS VivoBook L203MA Laptop, 11.6” HD Display, Intel Celeron Dual Core CPU, 4GB RAM, 64GB Storage, USB-C, Windows 10 Home In S Mode, Up To 10 Hours Battery Life, One Year of Microsoft 365, L203MA-DS04\nASUS VivoBook L203MA Laptop, 11.6” HD Display, Intel Celeron Dual Core CPU, 4GB RAM, 64GB Storage, USB-C, Windows 10 Home In S Mode, Up To 10 Hours Battery Life, One Year of Microsoft 365, L203MA-DS04', 'tag1,tag2', '2000', 1, 8, 14, '1594998385.webp', 3, 'ben guerrir', '2020-07-17 14:06:25', '2020-07-17 14:06:25'),
(60, 'Samsung Galaxy S20+ 5G Factory Unlocked New Android Cell Phone US Version | 128GB of Storage | Fingerprint', 'Samsung Galaxy S20+ 5G Factory Unlocked New Android Cell Phone US Version | 128GB of Storage | Fingerprint ID and Facial Recognition | Long-Lasting Battery | US Warranty |Cosmic Gray', 'tag1,tag2', '100', 1, 8, 13, '1594998460.jpeg', 3, 'fes', '2020-07-17 14:07:40', '2020-07-17 14:07:40'),
(61, 'Long-Lasting Battery | US Warranty |Cosmic Gray', 'Samsung Galaxy S20+ 5G Factory Unlocked New Android Cell Phone US Version | 128GB of Storage | Fingerprint ID and Facial Recognition | Long-Lasting Battery | US Warranty |Cosmic Gray', 'tag1,tag2', '200', 1, 8, 13, '1594998515.webp', 5, 'ben guerrir', '2020-07-17 14:08:35', '2020-07-17 14:08:35'),
(62, 'appartement for familly', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '20000', 1, 10, 17, '1594998562.jpeg', 6, 'marrakech', '2020-07-17 14:09:22', '2020-07-17 14:09:22'),
(63, 'Villa here any variations of passages of Lorem Ipsum available,', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '100000', 1, 10, 17, '1594998591.jpeg', 9, 'ben guerrir', '2020-07-17 14:09:51', '2020-07-17 14:09:51'),
(64, 'Brita Water Replacement Filters for Pitchers and Dispensers, 3ct, White', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'tag1,tag2', '20', 1, 10, 18, '1594998683.webp', 17, 'ben guerrir', '2020-07-17 14:11:24', '2020-07-17 14:11:24'),
(65, 'Blendtec Total Classic Original Blender - WildSide+ Jar (90 oz) - Professional-Grade Power - 6 Pre-programmed Cycles - 10-speeds - Black (Renewed)', 'Blendtec Total Classic Original Blender - WildSide+ Jar (90 oz) - Professional-Grade Power - 6 Pre-programmed Cycles - 10-speeds - Black (Renewed)', 'tag1,tag2', '200', 1, 10, 18, '1594998709.webp', 16, 'marrakech', '2020-07-17 14:11:49', '2020-07-17 14:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `products_imgs`
--

CREATE TABLE `products_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_imgs`
--

INSERT INTO `products_imgs` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(44, 45, '159457469192338489_134129198169297_4198962140996995396_n.jpg', '2020-07-12 16:24:51', '2020-07-12 16:24:51'),
(45, 46, '159457483597051438_702723757178780_8074971860609898046_n.jpg', '2020-07-12 16:27:15', '2020-07-12 16:27:15'),
(46, 46, '159457483597070945_621066218753954_9177058157232135628_n.jpg', '2020-07-12 16:27:15', '2020-07-12 16:27:15'),
(47, 46, '159457483597111087_918092285317562_5706149105260568629_n.jpg', '2020-07-12 16:27:15', '2020-07-12 16:27:15'),
(48, 47, '159457491497051438_702723757178780_8074971860609898046_n.jpg', '2020-07-12 16:28:34', '2020-07-12 16:28:34'),
(49, 47, '159457491497070945_621066218753954_9177058157232135628_n.jpg', '2020-07-12 16:28:34', '2020-07-12 16:28:34'),
(50, 47, '159457491497111087_918092285317562_5706149105260568629_n.jpg', '2020-07-12 16:28:34', '2020-07-12 16:28:34'),
(51, 48, '159457590698330291_728793501191357_6946893610125223174_n.jpg', '2020-07-12 16:45:06', '2020-07-12 16:45:06'),
(52, 48, '159457590698339085_169870967822996_2163826207742014345_n.jpg', '2020-07-12 16:45:06', '2020-07-12 16:45:06'),
(53, 29, '159460147369904598_2461917257250426_1460371525444478535_n.jpg', '2020-07-12 23:51:13', '2020-07-12 23:51:13'),
(55, 56, '15949987902019_mercedes-benz_g-class_240_1600x1200.jpg', '2020-07-17 14:13:11', '2020-07-17 14:13:11'),
(56, 56, '15949987912019_mercedes-benz_g-class_241_1600x1200.jpg', '2020-07-17 14:13:11', '2020-07-17 14:13:11'),
(57, 56, '15949987912019_mercedes-benz_g-class_242_1600x1200.jpg', '2020-07-17 14:13:11', '2020-07-17 14:13:11'),
(58, 56, '15949987912019_mercedes-benz_g-class_253_1600x1200.jpg', '2020-07-17 14:13:11', '2020-07-17 14:13:11'),
(59, 55, '15949988022019_mercedes-benz_g-class_106_1600x1200.jpg', '2020-07-17 14:13:22', '2020-07-17 14:13:22'),
(60, 55, '15949988022019_mercedes-benz_g-class_110_1600x1200.jpg', '2020-07-17 14:13:22', '2020-07-17 14:13:22'),
(61, 55, '15949988032019_mercedes-benz_g-class_238_1600x1200.jpg', '2020-07-17 14:13:23', '2020-07-17 14:13:23'),
(62, 55, '15949988032019_mercedes-benz_g-class_239_1600x1200.jpg', '2020-07-17 14:13:23', '2020-07-17 14:13:23'),
(63, 57, '15949988142019_mercedes-benz_g-class_240_1600x1200.jpg', '2020-07-17 14:13:34', '2020-07-17 14:13:34'),
(64, 57, '15949988142019_mercedes-benz_g-class_241_1600x1200.jpg', '2020-07-17 14:13:35', '2020-07-17 14:13:35'),
(65, 57, '15949988152019_mercedes-benz_g-class_242_1600x1200.jpg', '2020-07-17 14:13:35', '2020-07-17 14:13:35'),
(66, 57, '15949988152019_mercedes-benz_g-class_253_1600x1200.jpg', '2020-07-17 14:13:35', '2020-07-17 14:13:35'),
(67, 57, '15949988152019_mercedes-benz_g-class_364_1600x1200.jpg', '2020-07-17 14:13:35', '2020-07-17 14:13:35'),
(68, 57, '15949988152019_mercedes-benz_g-class_366_1600x1200.jpg', '2020-07-17 14:13:35', '2020-07-17 14:13:35'),
(69, 57, '15949988162019_mercedes-benz_g-class_391_1600x1200.jpg', '2020-07-17 14:13:36', '2020-07-17 14:13:36'),
(70, 57, '15949988162019_mercedes-benz_g-class_393_1600x1200.jpg', '2020-07-17 14:13:36', '2020-07-17 14:13:36');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `to_id`, `message`, `status`, `created_at`, `updated_at`, `product_id`, `from_id`) VALUES
(30, 20, 'hello can you buy me this car', 0, '2020-07-17 14:16:57', '2020-07-17 14:16:57', 56, 1),
(31, 5, 'hello can you buy me this car', 0, '2020-07-17 14:17:01', '2020-07-17 14:17:01', 57, 1),
(32, 4, 'i like this computer how much the final price ?', 0, '2020-07-17 14:17:19', '2020-07-17 14:17:19', 58, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namesetting` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `slug`, `namesetting`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Title Name', 'title_name', 'test  site Adminpanel |  Change and Control what you want', 0, NULL, '2020-07-08 10:51:25'),
(3, 'Number phone', 'number', '0606060606', 0, NULL, '2020-07-05 13:02:54'),
(4, 'Description Site', 'desc_site', 'test \nFar far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at  the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.', 1, NULL, '2020-07-05 13:18:32'),
(6, 'tags', 'tags', 'tags,tags,tags', 0, NULL, NULL),
(7, 'Footer', 'footer', '© 2020 Carspot All rights reserved.', 0, NULL, NULL),
(8, 'Url facebook', 'facebook', 'facebook', 0, NULL, NULL),
(9, 'Url Twitter', 'twitter', 'twitter', 0, NULL, NULL),
(10, 'Url LinkedIn', 'Linkedin', 'LinkedIn', 0, NULL, NULL),
(11, 'Url goole +', 'google', 'gooole ', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(17, 'wake up early', 0, '2020-07-01 10:35:17', '2020-07-08 10:43:35'),
(18, 'doing homework', 1, '2020-07-08 10:43:17', '2020-07-08 10:43:22'),
(21, 'rfwef', 1, '2020-07-09 15:12:37', '2020-07-09 15:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user.png',
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `number`, `avatar`, `admin`, `email`, `email_verified_at`, `password`, `location`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'nouhaila bjaghou', '438308402655', '1594590550.jpeg', 1, 'best_car@outlook.fr', NULL, '$2y$10$ZvLxeCRpDQpox3r9u8LgOeB/3xYz7xWAsNPPiCqXhLeoRlsfn8tNa', 'ben guerrir', NULL, '2020-06-26 17:56:43', '2020-07-16 18:23:55'),
(3, 'nouhaila', '438308402222', '1593217448.jpeg', 1, 'hello_woeerld@outlook.fr', NULL, '$2y$10$kXKHEk0T66d7qzu1yvI9BeFJyr0cM9TCXHGMGLXQiqYGRUBhsmLLW', '', NULL, '2020-06-26 21:10:29', '2020-06-26 23:24:09'),
(4, 'fsdfa', '438308402222', '1593217441.jpeg', 1, 'hello_whhorld@outlook.fr', NULL, '$2y$10$ZvLxeCRpDQpox3r9u8LgOeB/3xYz7xWAsNPPiCqXhLeoRlsfn8tNa', '', NULL, '2020-06-26 21:20:39', '2020-06-26 23:24:01'),
(5, '123nouhaila', '438308402222', '1593217433.jpeg', 0, 'hedllo_worldd@outlook.fd', NULL, '$2y$10$yGm.SahM6lnEFXclqz4pQe1rGamM.nbXxr2wi6glCfGIttkigtRdm', '', NULL, '2020-06-26 21:21:18', '2020-06-26 23:23:54'),
(6, 'fsdfa', '438308402222', '1593217426.jpeg', 0, 'hello_wsdsrld@outlook.fr', NULL, '$2y$10$LfYpFQ7BjJBAHhYCoWz3dueRhKuqNL1ip1bmQ3HXiPXUPc0Wy8O8C', '', NULL, '2020-06-26 21:23:52', '2020-06-26 23:23:46'),
(8, 'nbj', '438308402222', '1593217282.jpeg', 0, 'hello_wordld@outlook.fr', NULL, '$2y$10$2NdDDFBCqmmr/59XYvMI1OFeSV47cpEbX9MlLzmPaIpE.yPdrZh1y', '', NULL, '2020-06-26 21:25:33', '2020-06-26 23:21:23'),
(9, 'nouha1234', '438308402222', '1594310966.jpeg', 1, 'hello_wordlsdd@outlook.fr', NULL, '$2y$10$Qtrrq7iXjCzMacW35PvKMemdG0E5hEBAXeHt2Fb8hYC.aNUB33NAK', '', NULL, '2020-06-26 21:26:48', '2020-07-09 15:09:26'),
(12, 'nouhaila', '0606938610', '1594055371.jpeg', 0, 'test_test@outlook.fr', NULL, '$2y$10$FqZqy/nYhGgI0PF2NVllJuy0wx5l58IEsVfZz/bSkz9xM2.F1QOq.', '', NULL, '2020-06-26 23:36:23', '2020-07-08 10:40:32'),
(16, 'nouhaila', '438308402222', '1594311020.jpeg', 1, 'best_caree@outlook.fr', NULL, '$2y$10$1PEwFb9i8.GcWgoXMvlbi.YBskjUOLPtQ1WB6RfZK5uXIKVQvtrS.', '', NULL, '2020-07-09 15:10:21', '2020-07-09 15:10:21'),
(17, 'nouhaila333', '438308402222', '1594485435.jpeg', 0, 'best333_car@outlook.fr', NULL, '$2y$10$poJphDnenNz6Dl0uJuxBvu9RtIuqlguehZwsFUY7q3Ao1YbMvpmCu', '', NULL, '2020-07-11 15:37:15', '2020-07-11 15:37:15'),
(20, 'nouhaila', 'best_ca3434r@outlook.fr', 'user.png', 0, 'best_ca3434r@outlook.fr', NULL, '$2y$10$qtzoKRedb5Onos.vXhcNp./FqHr5ARGArfHQFjslS8V7/3VmqYGdC', '', NULL, '2020-07-11 16:50:36', '2020-07-11 16:50:36'),
(21, 'nouhaila', 'bes433ft_car@outlook.fr', 'user.png', 0, 'bes433ft_car@outlook.fr', NULL, '$2y$10$ND.VQ2FO3Q.RH76WHV3wYOl8cbvG9Dm4.DgbC3Of/IIT4fnTOEZzu', '', NULL, '2020-07-12 12:33:50', '2020-07-12 12:33:50'),
(22, 'nouhaila', 'hellofssdrdld@outlook.fr', 'user.png', 0, 'hellofssdrdld@outlook.fr', NULL, '$2y$10$/f0wsIgNxMdCgdtog244auzlkEYMhyJg2Oe4x47JXOJezsUkT8J6W', '', NULL, '2020-07-12 12:53:49', '2020-07-12 12:53:49'),
(61, 'nouhaila', '060060606060', '1594909304.jpeg', 1, 'best_ca3fr@outlook.fr', NULL, '$2y$10$bn7YRCQ8xSygQUZMlc3tP.lnNh9/ETAZ1iWALfHjwQCoPwHQyji8O', 'fes', NULL, '2020-07-16 13:21:44', '2020-07-16 13:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_imgs`
--
ALTER TABLE `products_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `products_imgs`
--
ALTER TABLE `products_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
