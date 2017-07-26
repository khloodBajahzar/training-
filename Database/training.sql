-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2017 at 12:38 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `training`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(10) NOT NULL,
  `Admpassword` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Admpassword`) VALUES
(1, '1111'),
(2, '2222');

-- --------------------------------------------------------

--
-- Table structure for table `oraganzation`
--

CREATE TABLE `oraganzation` (
  `OrgID` int(10) NOT NULL,
  `OrgName` varchar(40) NOT NULL,
  `City` varchar(20) NOT NULL,
  `OrgEmail` varchar(40) NOT NULL,
  `OrgPhoneNO` int(10) NOT NULL,
  `Workfield` varchar(30) NOT NULL,
  `Trainingrecruitment` varchar(50) NOT NULL,
  `Ratio` int(10) NOT NULL,
  `WebsiteLink` varchar(50) NOT NULL,
  `AdminID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sendnotification`
--

CREATE TABLE `sendnotification` (
  `SuperID` int(10) NOT NULL,
  `StudID` int(10) NOT NULL,
  `Message` varchar(80) NOT NULL,
  `Date` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `college` varchar(40) NOT NULL,
  `StudDepartment` varchar(50) NOT NULL,
  `companyname` varchar(40) NOT NULL,
  `StudPassword` varchar(40) NOT NULL,
  `SuperID` int(10) NOT NULL,
  `StudID` int(10) NOT NULL,
  `StudFName` varchar(30) NOT NULL,
  `StudLName` varchar(30) NOT NULL,
  `StudEmail` varchar(50) NOT NULL,
  `StudPhoneNo` int(10) NOT NULL,
  `university` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_comments`
--

CREATE TABLE `student_comments` (
  `StudID` int(10) NOT NULL,
  `OrgID` int(10) NOT NULL,
  `comment` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `SuperID` int(10) NOT NULL,
  `supPassword` varchar(40) NOT NULL,
  `supFName` varchar(30) NOT NULL,
  `supLName` varchar(30) NOT NULL,
  `supEmail` varchar(30) NOT NULL,
  `OfficeNO` varchar(15) NOT NULL,
  `SuperDepartment` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`);

--
-- Indexes for table `oraganzation`
--
ALTER TABLE `oraganzation`
  ADD PRIMARY KEY (`OrgID`),
  ADD KEY `AdminID` (`AdminID`);

--
-- Indexes for table `sendnotification`
--
ALTER TABLE `sendnotification`
  ADD PRIMARY KEY (`SuperID`,`StudID`),
  ADD KEY `stID` (`StudID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudID`),
  ADD KEY `advisorID` (`SuperID`);

--
-- Indexes for table `student_comments`
--
ALTER TABLE `student_comments`
  ADD PRIMARY KEY (`StudID`) KEY_BLOCK_SIZE=10,
  ADD KEY `OrgID` (`OrgID`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`SuperID`),
  ADD UNIQUE KEY `SuperID` (`SuperID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oraganzation`
--
ALTER TABLE `oraganzation`
  ADD CONSTRAINT `AdminID` FOREIGN KEY (`AdminID`) REFERENCES `admin` (`AdminID`);

--
-- Constraints for table `sendnotification`
--
ALTER TABLE `sendnotification`
  ADD CONSTRAINT `stID` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudID`),
  ADD CONSTRAINT `superID` FOREIGN KEY (`SuperID`) REFERENCES `supervisor` (`SuperID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `advisorID` FOREIGN KEY (`SuperID`) REFERENCES `supervisor` (`SuperID`);

--
-- Constraints for table `student_comments`
--
ALTER TABLE `student_comments`
  ADD CONSTRAINT `OrgID` FOREIGN KEY (`OrgID`) REFERENCES `oraganzation` (`OrgID`),
  ADD CONSTRAINT `SutID` FOREIGN KEY (`StudID`) REFERENCES `student` (`StudID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
