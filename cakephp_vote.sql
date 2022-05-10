-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 01, 2022 at 02:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cakephp_vote`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `poll_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `poll_id`, `created`, `modified`) VALUES
(1, 'testcomment1', 1, '2022-01-26 07:22:05', '2022-01-26 07:22:05'),
(2, 'testcomment2', 1, '2022-01-26 08:24:32', '2022-01-26 08:24:32'),
(3, 'testcomment1 for poll2', 2, '2022-01-26 08:24:58', '2022-01-26 08:24:58'),
(4, 'commentWithLogin', 1, '2022-01-30 16:35:41', '2022-01-30 16:35:41'),
(5, 'test', 5, '2022-01-31 10:46:01', '2022-01-31 10:46:01'),
(6, 'abc', 1, '2022-02-01 08:05:03', '2022-02-01 08:05:03'),
(7, 'abc', 5, '2022-02-01 08:05:14', '2022-02-01 08:05:14'),
(8, 'いいですね！', 12, '2022-02-01 10:54:59', '2022-02-01 10:54:59'),
(9, '反対です！世界平和！', 12, '2022-02-01 10:55:21', '2022-02-01 10:55:21');

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE `polls` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `result` int(11) NOT NULL DEFAULT 0,
  `yes` int(11) NOT NULL DEFAULT 0,
  `no` int(11) NOT NULL DEFAULT 0,
  `voted_user` longtext NOT NULL DEFAULT '{}',
  `end` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `title`, `body`, `result`, `yes`, `no`, `voted_user`, `end`, `created`, `modified`) VALUES
(1, 'testTitle1', 'testbody1', 1, 2, 1, '[\"1\",\"3\"]', '2022-01-26 00:00:00', '2022-01-26 00:00:00', '2022-02-01 08:44:38'),
(2, 'testTitle2', 'testbody2', 3, 1, 1, '{}', '2022-01-26 06:10:46', '2022-01-26 06:10:46', '2022-02-01 08:45:42'),
(5, 'testWithLogin', 'svsvs', 0, 2, 2, '[\"1\",\"3\"]', '2022-03-26 00:00:00', '2022-01-31 10:39:34', '2022-02-01 14:47:08'),
(6, 'testWithLogin2', 'dvsvsv', 0, 1, 0, '[\"1\"]', '2022-04-26 00:00:00', '2022-01-31 10:43:26', '2022-02-01 08:50:29'),
(7, 'testWithLogin3', 'svsvsv', 1, 1, 0, '[\"1\"]', '2022-01-31 00:00:00', '2022-01-31 10:58:42', '2022-02-01 09:28:17'),
(8, 'testOneWeek', 'weeeeeek', 0, 1, 0, '[\"3\"]', '2022-02-08 10:40:42', '2022-02-01 10:41:02', '2022-02-01 14:18:17'),
(9, 'testOneDay', 'daaaaaaaaay', 0, 0, 0, '{}', '2022-02-02 10:42:57', '2022-02-01 10:43:09', '2022-02-01 10:43:09'),
(10, 'testOneMonth', 'mooooooooonth', 0, 0, 0, '{}', '2022-03-03 09:12:35', '2022-02-01 10:43:57', '2022-02-01 10:43:57'),
(11, 'testOneMonth2', 'ecevsbsbs', 0, 0, 2, '[\"1\",\"3\"]', '2022-03-03 09:14:40', '2022-02-01 10:45:52', '2022-02-01 14:42:03'),
(12, '世界大戦を発動する', '世界を統一にしたい', 0, 2, 1, '[\"1\",\"2\",\"3\"]', '2022-02-02 10:53:21', '2022-02-01 10:54:39', '2022-02-01 10:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`) VALUES
(1, 'abc', '$2a$10$K7Q9lEDTtbcuIELlDLUEkO1ssFa1WCqiO/pftRHFZ8xfR1YWjf3Gu', 'admin', '2022-01-30 16:29:36', '2022-01-30 16:29:36'),
(2, 'abc2', '$2a$10$Mbiu7Kr6rUPq6j.lDcMbL.YLoj/SJeNR6nAG44n3.lXQeRPcRNRRC', 'admin', '2022-01-30 16:33:24', '2022-01-30 16:33:24'),
(3, 'abc3', '$2a$10$NavtGWBeKpp1hWatsl1H3OWcoKYpGeKe6uIWcKpwm5LYn8cpl.E7C', 'admin', '2022-01-30 16:34:02', '2022-01-30 16:34:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `polls`
--
ALTER TABLE `polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `polls`
--
ALTER TABLE `polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
