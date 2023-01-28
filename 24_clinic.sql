-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 07:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `24_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(10) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` varchar(5) NOT NULL,
  `appoint_date` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phno` varchar(45) NOT NULL,
  `diseases` varchar(45) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `dob` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `specialist` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `mobno` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `full_name`, `dob`, `qualification`, `specialist`, `email`, `mobno`, `password`) VALUES
(1, 'Adi Primata', '1993-03-20', 'Sp.KG', 'Dentist', 'adi.primate@mail.com', '081295738142', 'adi123'),
(2, 'Aryo Gabus', '1988-12-01', 'Sp.M', 'Ophthalmologist', 'aryo.gabus@mail.com', '081387272927', 'aryo123');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `spec_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`id`, `spec_name`) VALUES
(1, 'Dentist'),
(4, 'Ophthalmologist');

-- --------------------------------------------------------

--
-- Table structure for table `user_dtls`
--

CREATE TABLE `user_dtls` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_dtls`
--

INSERT INTO `user_dtls` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'Farrel Akiela', 'farrel@mail.com', 'farrel123'),
(2, 'John Doe', 'johndoe@yahoo.co.id', 'john123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialist`
--
ALTER TABLE `specialist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_dtls`
--
ALTER TABLE `user_dtls`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_dtls`
--
ALTER TABLE `user_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
