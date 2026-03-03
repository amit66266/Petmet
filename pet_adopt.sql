-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2025 at 03:49 PM
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
-- Database: `pet_adopt`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoptions`
--

CREATE TABLE `adoptions` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `adopted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoptions`
--

INSERT INTO `adoptions` (`id`, `username`, `pet_id`, `adopted_at`) VALUES
(8, 'vipin', 3, '2025-06-14 19:27:05'),
(14, 'komal', 9, '2025-06-14 21:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `username`, `message`, `submitted_at`) VALUES
(3, 'FighterX', 'Hello', '2025-06-14 11:50:50'),
(4, 'FighterX', 'Hello, your service is amazing.\r\n', '2025-06-14 12:00:05'),
(11, 'komal', 'Amazing', '2025-06-14 14:46:39'),
(13, 'vipin', 'Great service!', '2025-06-15 12:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `breed` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT 'Male',
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `breed`, `age`, `gender`, `description`, `image`) VALUES
(3, 'Luna', 'German Shepherd', 2, 'Female', 'Smart and protective. Needs regular exercise.', 'https://www.akc.org/wp-content/uploads/2017/11/German-Shepherd-on-White-00.jpg'),
(6, 'Doggy', 'Siberian Husky', 2, 'Male', 'Cute Husky', 'https://cdn.britannica.com/84/232784-050-1769B477/Siberian-Husky-dog.jpg'),
(9, 'Orry', 'Golden Retriever', 1, 'Female', 'Excellent family dogs', 'https://media.graphassets.com/resize=height:404,width:938/output=format:webp/h5LaoOatTpmJqBNCFmaw?width=938'),
(10, 'Guffy', 'Abyssinian', 1, 'Female', 'Highly active, playful, and social.', 'https://images.happypet.care/breedFiles/cat/653545620a90cd10a7de81ac/galleryImages/large_file_1734812490074.webp'),
(11, 'Soffy', 'Ragdoll', 1, 'Female', 'Distinct colorpoint coat and blue eyes', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcScAt2TstYIaCCBkX110yn9zK0018Pp1N71mtiJAGwREQOMBr6y5x3HRQISNt23OuICD_8k_M5YF70y_nRW4ewQ3R86mkt6iQop5WZTe80t');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(4) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `uname`, `password`, `name`, `email`, `dob`, `city`, `role`) VALUES
(2, 'FighterX', '123456', 'Amol', 'amolguptaid@gmail.com', '2006-06-20', 'Gzb', 'admin'),
(8, 'asdfghjkl', '123456', 'Tester Nikk', 'tester@nikk.com', '2006-06-20', 'Gzb', 'user'),
(10, 'vipin', '123456', 'Vipin', 'vipin@gmail.com', '2011-12-02', 'Goa', 'user'),
(11, 'neha', '123456', 'Neha', 'neha@gmail.com', '2004-12-12', 'Delhi', 'user'),
(12, 'komal', '12345678', 'komal', 'weeer@gmail.com', '2000-10-10', 'delhi', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoptions`
--
ALTER TABLE `adoptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uname` (`uname`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoptions`
--
ALTER TABLE `adoptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
