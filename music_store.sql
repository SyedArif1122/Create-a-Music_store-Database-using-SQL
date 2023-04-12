-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2023 at 12:02 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `country`, `genre_id`) VALUES
(1, 'Bob Dylan', 'USA', 1),
(2, 'Adele', 'UK', 2),
(3, 'Tame Impala', 'Australia', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`) VALUES
(1, 'John Smith', 'john.smith@example.com', '123-456-7890', '123 Main St, Anytown, USA'),
(2, 'Jane Doe', 'jane.doe@example.com', '123-456-7891', '456 Main St, Anytown, USA'),
(3, 'Bob Johnson', 'bob.johnson@example.com', '123-456-7892', '789 Main St, Anytown, USA'),
(4, 'Sara Lee', 'sara.lee@example.com', '123-456-7893', '321 Main St, Anytown, USA'),
(5, 'David Chen', 'david.chen@example.com', '123-456-7894', '654 Main St, Anytown, USA'),
(6, 'Amy Lee', 'amy.lee@example.com', '123-456-7895', '987 Main St, Anytown, USA'),
(7, 'Tom Jones', 'tom.jones@example.com', '123-456-7896', '246 Main St, Anytown, USA'),
(8, 'Mike Smith', 'mike.smith@example.com', '123-456-7897', '135 Main St, Anytown, USA'),
(9, 'Emily Davis', 'emily.davis@example.com', '123-456-7898', '864 Main St, Anytown, USA'),
(10, 'James Wilson', 'james.wilson@example.com', '123-456-7899', '369 Main St, Anytown, USA');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `description`) VALUES
(1, 'Rock', 'Music genre characterized by guitar and drums'),
(2, 'Pop', 'Commercial music often featuring catchy melodies and upbeat rhythms'),
(3, 'Hip hop', 'Music genre originated in African American and Latinx communities');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `artist_id`, `genre_id`, `price`) VALUES
(0, 'Album 2', 2, 2, '11.99'),
(1, 'Album 1', 1, 1, '9.99'),
(2, 'Album 3', 3, 3, '8.99'),
(3, 'Album 3', 3, 3, '10.99');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `date`, `time`, `customer_id`, `product_id`) VALUES
(0, '2022-01-01', '12:00:00', 1, 1),
(1, '0000-00-00', '00:00:00', 2, 0),
(2, '0000-00-00', '00:00:00', 2, 1),
(3, '0000-00-00', '00:00:00', 3, 2),
(4, '0000-00-00', '00:00:00', 3, 2),
(5, '0000-00-00', '00:00:00', 6, 3),
(6, '0000-00-00', '00:00:00', 6, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artists`
--
ALTER TABLE `artists`
  ADD CONSTRAINT `artists_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
