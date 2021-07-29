-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 01:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proj`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteinfo` (IN `did` INT)  BEGIN
	
    DELETE FROM test WHERE id=did;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `qdeleteinfo` (IN `did` INT)  BEGIN
	DELETE FROM quarantine_center WHERE pid=did;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `qupdateinfo` (IN `pid` INT, IN `ufname` VARCHAR(50), IN `ulname` VARCHAR(50), IN `ugender` VARCHAR(50), IN `uage` INT, IN `uadd` VARCHAR(100), IN `ucnum` VARCHAR(50), IN `ucid` INT, IN `ucname` VARCHAR(50))  NO SQL
BEGIN
	UPDATE quarantine_center
    SET fname=ufname,lname=ulname,gender=ugender,age=uage,address=uadd,contactnum=ucnum,
    centerid=ucid,centername=ucname
    WHERE pid=pid;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateinfo` (IN `did` INT, IN `ufname` VARCHAR(50), IN `ulname` VARCHAR(50), IN `ugender` VARCHAR(50), IN `uage` INT, IN `uadd` VARCHAR(100), IN `ucnum` VARCHAR(50), IN `usym` VARCHAR(50))  BEGIN
 UPDATE test SET fname=ufname, lname=ulname, gender=ugender, age=uage, address=uadd, contactnum=ucnum, symptoms=usym WHERE id=did;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `adminreg`
--

CREATE TABLE `adminreg` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `contactnum` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adminreg`
--

INSERT INTO `adminreg` (`fname`, `lname`, `email`, `password`, `gender`, `contactnum`) VALUES
('abc', 'xyz', '123@gmail.com', '2345', 'MALE', '7895646'),
('theekshana', 'r', 'sneha@gmail.com', '23452345', 'FEMALE', '7829581914');

-- --------------------------------------------------------

--
-- Table structure for table `discharge`
--

CREATE TABLE `discharge` (
  `pid` int(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  `no_of_days_of_stay` int(10) NOT NULL,
  `totamt` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discharge`
--

INSERT INTO `discharge` (`pid`, `cid`, `bed_type`, `no_of_days_of_stay`, `totamt`) VALUES
(6, 1, 'GENERAL BED', 14, 0),
(9, 1, 'VIP BED', 14, 0),
(14, 101, 'GENERAL BED', 14, 0),
(15, 102, 'VIP BED', 12, 0),
(16, 103, '-----------SELECT-----------', 12, 0),
(17, 1, 'GEN', 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `plasma_donation`
--

CREATE TABLE `plasma_donation` (
  `pname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `mobileno` int(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plasma_donation`
--

INSERT INTO `plasma_donation` (`pname`, `gender`, `blood_group`, `mobileno`, `address`) VALUES
('sowmya', 'Female', 'O+', 123, '98657896828');

-- --------------------------------------------------------

--
-- Table structure for table `quarantine_center`
--

CREATE TABLE `quarantine_center` (
  `pid` int(10) NOT NULL,
  `contactnum` varchar(15) NOT NULL,
  `centerid` int(10) NOT NULL,
  `centername` varchar(100) NOT NULL,
  `discharge_status` varchar(50) NOT NULL,
  `bedtype` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarantine_center`
--

INSERT INTO `quarantine_center` (`pid`, `contactnum`, `centerid`, `centername`, `discharge_status`, `bedtype`) VALUES
(6, '2147483647', 1, 'art of living', '', ''),
(9, '2147483647', 1, 'art of living', '', ''),
(16, '9916310298', 103, 'apollo', '', 'vip'),
(17, '9110403204', 108, 'fortis', '', 'vip');

-- --------------------------------------------------------

--
-- Table structure for table `quarantine_center_table`
--

CREATE TABLE `quarantine_center_table` (
  `centerid` int(10) NOT NULL,
  `centername` varchar(100) NOT NULL,
  `genbeds` int(11) NOT NULL,
  `vipbeds` int(11) NOT NULL,
  `address` varchar(150) NOT NULL,
  `district` varchar(100) NOT NULL,
  `contactnum` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quarantine_center_table`
--

INSERT INTO `quarantine_center_table` (`centerid`, `centername`, `genbeds`, `vipbeds`, `address`, `district`, `contactnum`) VALUES
(101, 'Treebo Trend Hotel', 24, 8, '84 Hosur Rd, Madiwala 1st Stage BTM Layout', 'Bengaluru Urban 560068', 26592096),
(102, 'Haj Bhavan', 24, 13, 'Kannuru Bellahalli BBMP Yelahanka Zone', 'Bangalore Urban 560064', 23679876),
(103, 'OYO Rajmahal comforts', 16, 3, 'New BEL Rd, Chikamanahalli Sadashiv Nagar', 'Bangalore Urban 560094', 27634233),
(104, 'Keys Hotel', 6, 14, 'Plot No 6 1st Phase ITPL Main Rd', 'Bangalore Urban 560048', 20887546),
(105, 'MVJ MC and RH', 50, 13, 'Kolar Road Dandupalya Hosakote Town', 'Bangalore Rural 	\r\n562114', 29983422),
(106, 'Akash Hospital', 71, 43, 'Prasannahalli Devanahalli Taluk', 'Bangalore Rural 562110', 25445676);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `contactnum` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`fname`, `lname`, `email`, `password`, `contactnum`, `gender`) VALUES
('123', 'xyz', 'abcxyz321@gmail.com', '1234', '2000-01-01', 'FEMALE'),

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `pid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contactnum` varchar(15) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `centerid` int(11) NOT NULL,
  `centername` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`pid`, `fname`, `lname`, `gender`, `age`, `address`, `contactnum`, `status`, `centerid`, `centername`) VALUES
(12, 'sneha', 'g', 'FEMALE', 20, 'abc street', '3288235871', 'NEGATIVE', 0, ''),
(15, 'abc', 'xyz', 'MALE', 19, 'NO 88/89 3RD CROSS SILVER STREET', '876543290', NULL, 102, 'art of living'),
(17, 'theekshana', 'V', 'FEMALE', 21, 'bannergatta', '9877603204', NULL, 1, 'art of living');

-- --------------------------------------------------------

--
-- Table structure for table `testing_center`
--

CREATE TABLE `testing_center` (
  `centerid` int(11) NOT NULL,
  `centername` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `district` varchar(100) NOT NULL,
  `contactnum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `testing_center`
--

INSERT INTO `testing_center` (`centerid`, `centername`, `address`, `district`, `contactnum`) VALUES
(701, 'Sri Jayadeva Institute of Cardiovascular Sciences and Research', 'Heart hospital, Bannerghatta Main Rd', 'Bangalore 560065', 27666755),
(702, 'Lab Services Apollo Hospitals', 'Medical laboratory,154, 11, Bannerghatta Main', 'Bangalore 560065', 20989889),
(703, 'SRL Limited at Fortis hospitals', '154, 9, Bannerghatta Main Rd, opposite IIM, Sahyadri Layout, Panduranga Nagar', 'Bengaluru 560076', 27676554),
(704, 'Sagar Hospitals', '#44, 54, 30th Cross Rd, Jayanagara', 'Bangalore 560072', 42888888),
(705, 'Urban Primary Health Centre', '78, 4th Main Rd, Arekere MICO Layout 2nd stage, Lakshmi Layout', 'Bangalore 560076', 45090090);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discharge`
--
ALTER TABLE `discharge`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `plasma_donation`
--
ALTER TABLE `plasma_donation`
  ADD PRIMARY KEY (`mobileno`);

--
-- Indexes for table `quarantine_center`
--
ALTER TABLE `quarantine_center`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `testing_center`
--
ALTER TABLE `testing_center`
  ADD PRIMARY KEY (`centerid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quarantine_center`
--
ALTER TABLE `quarantine_center`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
