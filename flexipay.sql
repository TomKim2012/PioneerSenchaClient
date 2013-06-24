-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: 41.89.68.188
-- Generation Time: May 15, 2013 at 07:10 PM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flexipay`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `account_number` int(25) NOT NULL AUTO_INCREMENT,
  `account_balance` int(50) NOT NULL,
  `account_type_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`account_number`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_number`, `account_balance`, `account_type_id`, `user_id`) VALUES
(1, 0, 2, 1),
(2, 0, 2, 3),
(3, 0, 3, 4),
(4, 0, 3, 5),
(5, 0, 2, 6),
(6, 0, 2, 7),
(7, 0, 2, 8),
(8, 0, 2, 9),
(9, 0, 2, 10),
(10, 0, 2, 11);

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE IF NOT EXISTS `account_types` (
  `account_type_id` int(11) NOT NULL,
  `account_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `agent_description`
--

CREATE TABLE IF NOT EXISTS `agent_description` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `business_name` varchar(255) NOT NULL,
  `business_location` varchar(255) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `user_id` int(12) NOT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `agent_description`
--

INSERT INTO `agent_description` (`agent_id`, `business_name`, `business_location`, `business_address`, `user_id`) VALUES
(1, 'Mudacomm Communication', 'Kivaa, Embu', 'Next to Road, Highway', 1),
(2, 'Mudacomm Communication', 'Kivaa, Embu', 'Next to Road, Highway', 3),
(3, 'AlexOdhis Communication', 'Kisumu', 'Next to Bus Station', 6),
(4, 'Wangunyu Communication', 'Nairobi', 'BuruBuru Phase 4', 7),
(5, 'John Doe Communications', 'Naivasha', 'Shopping Centre', 8),
(6, 'John Doe Communications', 'Naivasha', 'Shopping Centre', 9),
(7, 'Doe Communication', 'Naivasha', 'shopping centre', 10),
(8, 'joe comm', 'Naivasha', 'shopping centre', 11);

-- --------------------------------------------------------

--
-- Table structure for table `ez_access_keys`
--

CREATE TABLE IF NOT EXISTS `ez_access_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ez_access_keys`
--

INSERT INTO `ez_access_keys` (`id`, `user_id`, `program`, `access`) VALUES
(1, 1, 'agents_board', 'agent_user'),
(2, 3, 'agents_board', 'agent_user'),
(3, 4, 'customer_board', 'customer_user'),
(4, 5, 'customer_board', 'customer_user'),
(5, 6, 'agents_board', 'agent_user'),
(6, 7, 'agents_board', 'agent_user'),
(7, 8, 'agents_board', 'agent_user'),
(8, 9, 'agents_board', 'agent_user'),
(9, 10, 'agents_board', 'agent_user'),
(10, 11, 'agents_board', 'agent_user');

-- --------------------------------------------------------

--
-- Table structure for table `ez_auth`
--

CREATE TABLE IF NOT EXISTS `ez_auth` (
  `user_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_code` varchar(255) DEFAULT NULL,
  `cookie_hash` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ez_auth`
--

INSERT INTO `ez_auth` (`user_id`, `password`, `reset_code`, `cookie_hash`, `activation_code`) VALUES
(1, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, '8e7ebec1e3a8e3ee2193d792e2c559ef', '787f39e1b4ce9f55d45f610cdcd68b9d'),
(3, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, 'c108c123312396a2f126b3761868cd38', '51bc5faa90064932a6605315ab263c44'),
(4, 'f0d1b59f86944b4647347370ea4e9f12', NULL, '6dc134d90cb651c41d4a8ad3851fc78c', '07cae346feb98aaf51b39a2494383ee1'),
(5, 'f0d1b59f86944b4647347370ea4e9f12', NULL, 'dbd46b4da556ccbc6092b68dd7e4affd', '7ec1f076e560d186391870c289274849'),
(6, 'f0d1b59f86944b4647347370ea4e9f12', NULL, '9085c1a9adf764bc5040e0f5bdad9e86', '424a01d12e7f2508445dcea186b4382d'),
(7, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, 'c7e867600cf89ce275b5b3312cc24b4d', '07bb4'),
(8, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, '6924445bcc105f9a3d6e3fcdea62030f', 'c6e36'),
(9, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, 'cc809553eda8e3a251574aaeb7f0098d', 'ca4ba'),
(10, '8da8ed11c740ac1f4bd85f24ffef8d1b', NULL, 'fadac8fe654e1c86066660048340de5c', '38d8c'),
(11, 'f0d1b59f86944b4647347370ea4e9f12', NULL, 'c1d87bfb85b406e33ca92af366ba80ff', '6032bfcae211d68dffc6dffd71a512b7');

-- --------------------------------------------------------

--
-- Table structure for table `ez_users`
--

CREATE TABLE IF NOT EXISTS `ez_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `ez_users`
--

INSERT INTO `ez_users` (`id`, `username`, `email`, `register_date`, `first_name`, `last_name`, `mobile_number`) VALUES
(1, NULL, 'kimani@techkenya.co.ke', '2013-05-15 14:38:17', 'njoroge', 'kimani', '254729472421'),
(2, NULL, 'kimani@techkenya.co.ke', '2013-05-15 14:44:26', 'Bernard', 'Banta', '254729472421'),
(3, NULL, 'kimani@techkenya.co.ke', '2013-05-15 14:45:50', 'Bernard', 'Banta', '254729472421'),
(4, NULL, 'tosh0948@gmail.com', '2013-05-15 15:04:29', 'Tom', 'Kimani', '254715972032'),
(5, NULL, 'smuchiri@gmail.com', '2013-05-15 15:10:27', 'Samuel', 'Muchiri', '254729472421'),
(6, NULL, 'aodhis@gmail.com', '2013-05-15 18:29:20', 'Alexander ', 'Odhiambo', '254735418818'),
(7, NULL, 'pwangunyu@gmail.com', '2013-05-15 18:47:11', 'Pauline', 'Wangunyu', '254735418818'),
(8, NULL, 'john@yahoo.com', '2013-05-15 18:58:32', 'John', 'Doe', '254735418818'),
(9, NULL, 'john@yahoo.com', '2013-05-15 18:59:49', 'John', 'Doe', '254735418818'),
(10, NULL, 'john@yahoo.com', '2013-05-15 19:00:49', 'John', 'Doe', '254735418818'),
(11, NULL, 'john@yahoo.com', '2013-05-15 19:03:16', 'John', 'Doe', '254735418818');

-- --------------------------------------------------------

--
-- Table structure for table `merchant_categories`
--

CREATE TABLE IF NOT EXISTS `merchant_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchant_categories`
--


-- --------------------------------------------------------

--
-- Table structure for table `merchant_description`
--

CREATE TABLE IF NOT EXISTS `merchant_description` (
  `business_id` int(11) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_location` varchar(255) NOT NULL,
  `user_id` int(12) NOT NULL,
  PRIMARY KEY (`business_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchant_description`
--


-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` int(20) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `transaction_type` varchar(50) NOT NULL,
  `amount` int(20) NOT NULL,
  `transaction_date` datetime NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `transaction`
--

