-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 09:05 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mypoemdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `commentBody` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PostId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `commentBody`, `username`, `createdAt`, `updatedAt`, `PostId`) VALUES
(1, 'Nice ', 'lukas', '2022-05-31 19:03:20', '2022-05-31 19:03:20', 1),
(2, 'Fantastic', 'lukas', '2022-05-31 19:03:30', '2022-05-31 19:03:30', 4),
(3, 'nice', 'lukas', '2022-05-31 19:03:41', '2022-05-31 19:03:41', 5),
(4, 'Nice bro', 'alexander', '2022-05-31 19:04:26', '2022-05-31 19:04:26', 5),
(5, 'Great poem', 'alexander', '2022-05-31 19:04:34', '2022-05-31 19:04:34', 2);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `PostId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `createdAt`, `updatedAt`, `PostId`, `UserId`) VALUES
(1, '2022-05-31 18:59:01', '2022-05-31 18:59:01', 1, 1),
(2, '2022-05-31 19:00:44', '2022-05-31 19:00:44', 1, 2),
(4, '2022-05-31 19:01:13', '2022-05-31 19:01:13', 2, 2),
(5, '2022-05-31 19:01:19', '2022-05-31 19:01:19', 3, 2),
(6, '2022-05-31 19:01:57', '2022-05-31 19:01:57', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `postText` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `postText`, `username`, `createdAt`, `updatedAt`) VALUES
(1, 'Mary Had a Little Lamb', 'Mary had a little lamb, Little lamb, little lamb, Mary had a little lamb, Its fleece was white as snow, And every where that Mary went, Mary went, Mary went, Everywhere that Mary went, The lamb was sure to go;', 'alexander', '2022-05-31 18:58:58', '2022-05-31 18:58:58'),
(2, '. Twinkle, Twinkle Little Star', 'Twinkle, twinkle, little star, How I wonder what you are. Up above the world so high, Like a diamond in the sky. Twinkle, twinkle, little star, How I wonder what you are!', 'alexander', '2022-05-31 18:59:35', '2022-05-31 18:59:35'),
(3, 'Baa, Baa Black Sheep', 'Baa, baa, black sheep, Have you any wool? Yes sir, yes sir, Three bags full; One for the master, And one for the dame, And one for the little boy Who lives down the lane', 'julian', '2022-05-31 19:01:05', '2022-05-31 19:01:05'),
(4, ' Wee Willie Winkie', 'Wee Willie Winkie Runs through the town, Upstairs and downstairs In his night gown. Tapping at the window, Crying at the lock, “Are the children all in bed, For it’s past ten o’clock?” “Hey Willie Winkie, Are you coming in?', 'lukas', '2022-05-31 19:02:34', '2022-05-31 19:02:34'),
(5, 'My Cat Is Fat', 'I’ve a cat named Vesters, And he eats all day. He always lays around, And never wants to play.  Not even with a squeaky toy,  Nor anything that moves. When I have him exercise, He always disapproves.', 'lukas', '2022-05-31 19:02:58', '2022-05-31 19:02:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'alexander', '$2b$10$7GJYIyTKpaSJ0nQVdeByA.A794Vi0PpSIValhFuTpju4rzyzvH5Za', '2022-05-31 18:56:38', '2022-05-31 18:56:38'),
(2, 'julian', '$2b$10$UjOOJvIMSVFiEKcmkxQfSOijEz9rAbEyHGrW5K4SSueEWF.WF/GDC', '2022-05-31 19:00:27', '2022-05-31 19:00:27'),
(3, 'lukas', '$2b$10$jmGvKWmP1u/uuBcKdbPfHuQ1fOLupU7RqtGU0rL4IzK.ITP5ZFVwK', '2022-05-31 19:01:45', '2022-05-31 19:01:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PostId` (`PostId`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PostId` (`PostId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`PostId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`PostId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
