-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 02:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chpl_practical`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_email_id` varchar(50) NOT NULL,
  `admin_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email_id`, `admin_password`) VALUES
(1, 'chpl', 'chpl@gmail.com', 'chpl@123'),
(2, 'admin', 'admin@gmail.com', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `customer_mst`
--

CREATE TABLE `customer_mst` (
  `cust_id` int(11) NOT NULL,
  `cust_name` varchar(50) NOT NULL,
  `cust_email_id` varchar(50) NOT NULL,
  `cust_mob_no` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_mst`
--

INSERT INTO `customer_mst` (`cust_id`, `cust_name`, `cust_email_id`, `cust_mob_no`) VALUES
(1, 'jk masala', 'jk@gmail.com', 9875462583),
(2, 'shilp', 'shilp@gmail.com', 9854756214),
(3, 'adani', 'adani@gmail.com', 9873164450),
(4, 'shivalik', 'shivalik@gmail.com', 9874563210);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_mst`
--

CREATE TABLE `invoice_mst` (
  `invoice_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice_mst`
--

INSERT INTO `invoice_mst` (`invoice_id`, `customer_name`, `total_amount`) VALUES
(1, 'jk masala', 100.00),
(2, 'jk masala', 100.00),
(3, 'jk masala', 200.00),
(4, 'jk masala', 400.00),
(5, 'Umang', 100.00),
(6, 'Umang', 100.00),
(7, 'Umang', 300.00),
(8, 'Umang', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `product_mst`
--

CREATE TABLE `product_mst` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_des` text NOT NULL,
  `product_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_mst`
--

INSERT INTO `product_mst` (`product_id`, `product_name`, `product_des`, `product_stock`) VALUES
(1, 'laptop', 'laptop des', 11),
(2, 'cpu', 'cpu des', 48),
(3, 'monitor', 'monitor des', 77),
(4, 'mouse', 'mouse des', 97);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `customer_mst`
--
ALTER TABLE `customer_mst`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `invoice_mst`
--
ALTER TABLE `invoice_mst`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `product_mst`
--
ALTER TABLE `product_mst`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer_mst`
--
ALTER TABLE `customer_mst`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_mst`
--
ALTER TABLE `invoice_mst`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_mst`
--
ALTER TABLE `product_mst`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
