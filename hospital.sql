-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 11:12 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `appoint_date` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phno` varchar(45) NOT NULL,
  `diseases` varchar(500) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `user_id`, `fullname`, `gender`, `age`, `appoint_date`, `email`, `phno`, `diseases`, `doctor_id`, `address`, `status`) VALUES
(10, 16, 'Kanwal Khan', 'female', '25', '2023-02-21', 'kanwal@gmail.com', '096875612', 'Malaria', 10, '000, BNMD, GGGGGG', 'Checked'),
(11, 16, 'Sher Kot', 'male', '55', '2023-02-09', 'sher@gmail.com', '0987654321', 'Cardic Pain', 11, 'Village & P/O Bahadur khel, B.D Shah\r\nKashrote, Gilgit Baltistan', 'Checked'),
(12, 16, 'Amna Rehman', 'female', '24', '2023-02-16', 'amna@gmail.com', '435768987654', 'Headache', 10, '000, KKKK, LLLLLLLLL', 'Pending');

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
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `full_name`, `dob`, `qualification`, `specialist`, `email`, `mobno`, `password`) VALUES
(10, 'Junaid Khan', '1983-06-15', 'Pharm-D + MBBS', 'Pharmacist', 'junaid@gmail.com', '210987233', 'junaid'),
(11, 'Aftab Khan', '2023-02-04', 'MBBS', 'Surgeon', 'aftab@gmail.com', '12314243534', 'aftab');

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(11) NOT NULL,
  `spec_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specialist`
--

INSERT INTO `specialist` (`id`, `spec_name`) VALUES
(6, 'Pharmacist'),
(7, 'Cardiologist'),
(8, 'Dentist'),
(9, 'Surgeon'),
(10, 'Fever'),
(11, 'ENT'),
(12, 'Chest Specialist');

-- --------------------------------------------------------

--
-- Table structure for table `user_dtls`
--

CREATE TABLE `user_dtls` (
  `id` int(11) NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_dtls`
--

INSERT INTO `user_dtls` (`id`, `full_name`, `email`, `password`) VALUES
(16, 'Sajid Khan', 'sajid@gmail.com', 'sajid'),
(17, 'Salman Khan', 'salman@gmail.com', 'salman'),
(18, 'Hasnain Ahmed', 'hasnain@gmail.com', 'hasnain');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid_fk` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `specialist`
--
ALTER TABLE `specialist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_dtls`
--
ALTER TABLE `user_dtls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `uid_fk` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
