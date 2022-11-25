-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 24, 2022 at 07:42 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kilburnazon`
DROP DATABASE IF EXISTS kilburnazon ;
CREATE DATABASE kilburnazon;
USE kilburnazon;
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmployeesWithBirthdayM` ()   SELECT employee.*, manager.Name as ManagerName
    FROM employee
    JOIN manager ON employee.ManagerEmpNumber = manager.EmployeeNumber
    WHERE MONTH(DOB) = MONTH(CURDATE()) ORDER BY Number$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `Id` int NOT NULL,
  `Address` varchar(1000) NOT NULL,
  `BuildingType` enum('Office','Warehouse') NOT NULL,
  `Area` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `Number` int NOT NULL,
  `Date` date NOT NULL,
  `PassengerName` varchar(200) NOT NULL,
  `HandlerEmployeeNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaintreason`
--

CREATE TABLE `complaintreason` (
  `ComplaintNumber` int NOT NULL,
  `Reason` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Id` int NOT NULL,
  `EmailAddress` varchar(500) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `PostalAddress` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentNumber` int NOT NULL,
  `Name` varchar(200) NOT NULL,
  `ManagerEmployeeNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentNumber`, `Name`, `ManagerEmployeeNumber`) VALUES
(1, 'HR', NULL),
(2, 'Driving', NULL),
(3, 'Packaging', NULL),
(4, 'Managment', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `EmployeeNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driverassignment`
--

CREATE TABLE `driverassignment` (
  `VehicleId` int NOT NULL,
  `Date` date NOT NULL,
  `DriverEmployeeNumber` int NOT NULL,
  `RouteName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Number` varchar(20) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `HomeAddress` varchar(1000) NOT NULL,
  `Salary` double NOT NULL,
  `DOB` date NOT NULL,
  `NIN` varchar(12) NOT NULL,
  `ManagerEmpNumber` varchar(20) DEFAULT NULL,
  `DepartmentNumber` int DEFAULT NULL,
  `EPhone` varchar(30) NOT NULL,
  `ERelationship` varchar(100) NOT NULL,
  `EName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Number`, `Name`, `HomeAddress`, `Salary`, `DOB`, `NIN`, `ManagerEmpNumber`, `DepartmentNumber`, `EPhone`, `ERelationship`, `EName`) VALUES
('00-4334715', 'Stormie Lowndes', '280 Thompson Plaza', 66017.87, '1964-11-20', 'xn991742p', '74-0303597', 1, '07043 627 535', 'Civil Partner', 'Anastasia Camamile'),
('01-5576008', 'Jaquenetta Rankin', '3249 Dahle Plaza', 42698.62, '1988-12-28', 'ir187391u', '93-5661312', 3, '07689 714 850', 'Husband', 'Gustave Benedikt'),
('01-9065592', 'Catina Josovitz', '09 Center Alley', 78353.1, '1974-12-09', 'gl907590t', '74-0303597', 2, '07670 477 662', 'Girlfriend', 'Zachariah Trassler'),
('01-9983285', 'Evvy Burrill', '18 Pennsylvania Crossing', 65007.09, '1994-08-02', 'pz402630g', '66-0739491', 1, '07983 466 814', 'Wife', 'Dianne Pease'),
('02-1151200', 'Bax Di Gregorio', '34063 Fordem Way', 76631.69, '1983-01-13', 'kt775367m', '87-6633787', 2, '07258 306 130', 'Boyfriend', 'Eb Ludlem'),
('02-4109274', 'Efren Sealove', '7623 Lien Center', 59217.95, '1967-03-30', 'jk980246h', '87-8002965', 2, '07496 100 258', 'Girlfriend', 'Aksel Ticehurst'),
('02-6214516', 'Merrill Joust', '75 Portage Center', 51515.84, '1958-01-16', 'wa104983f', '76-2985832', 2, '07395 862 130', 'Wife', 'Amabelle Ferreiro'),
('02-9566746', 'Dud Firman', '467 Lighthouse Bay Junction', 35155.65, '1961-08-08', 'xs400698x', '65-1738561', 3, '07236 732 030', 'Civil Partner', 'Forster Naisby'),
('03-2826761', 'Pyotr Ingham', '81 John Wall Junction', 38532.11, '1990-01-17', 'ys435194s', '82-6558984', 3, '07570 183 764', 'Husband', 'Brnaby Snoday'),
('03-3544565', 'Feodor Inge', '5 Knutson Plaza', 91614.47, '1961-12-03', 'en390360s', '66-0739491', 3, '07872 652 134', 'Boyfriend', 'Nolie Turfitt'),
('04-1386775', 'Omero Hurles', '878 Vidon Point', 85092.27, '1985-05-25', 'zz594734b', '66-0739491', 2, '07354 878 768', 'Mother', 'Judas Tonn'),
('04-2608361', 'Homer Bresman', '84058 Hayes Parkway', 66224.45, '1970-03-21', 'ku802868l', '33-1897506', 2, '07816 723 310', 'Girlfriend', 'Ileana Wicken'),
('04-2758260', 'Simeon Dilworth', '749 Summit Circle', 63320.02, '1974-04-10', 'ql275702i', '29-2364794', 2, '07719 120 956', 'Wife', 'Filberto Railton'),
('04-2798023', 'Cinda Plesing', '57518 Chinook Park', 49509.39, '1988-06-29', 'bl772452l', '93-5661312', 3, '07171 514 291', 'Girlfriend', 'Corabella Possek'),
('05-1128789', 'Paulita Casewell', '18 Riverside Trail', 73099.76, '1995-06-15', 'ds948250k', '54-9522118', 2, '07411 921 600', 'Father', 'Bambie Bennell'),
('05-1945849', 'Cherilyn Jepps', '062 Nevada Parkway', 85550.33, '1971-10-30', 'xz796669h', '76-2985832', 2, '07996 211 011', 'Civil Partner', 'Michaelina Brahms'),
('05-3647243', 'Yank Vasilyonok', '5 Debs Alley', 38871.26, '1999-02-23', 'kc608204k', '47-3147567', 3, '07348 062 445', 'Husband', 'Arlie Korfmann'),
('05-5059849', 'Giffard Endecott', '13672 Caliangt Terrace', 30809.16, '1953-03-14', 'tu153415t', '54-9522118', 3, '07419 063 793', 'Boyfriend', 'Joela Artois'),
('05-5646283', 'Karole Roderighi', '6281 Hovde Road', 83507.63, '1988-12-22', 'np061992l', '87-8002965', 2, '07787 718 899', 'Father', 'Jacky Schwandt'),
('05-9682452', 'Dorothee Pennell', '90 Rutledge Circle', 44159.39, '1977-04-27', 'bo740928h', '33-1897506', 2, '07530 434 901', 'Wife', 'Odelle Godsmark'),
('06-0280761', 'Odey Smeeth', '46584 Kedzie Point', 97871, '2000-07-23', 'rz638367h', '73-2251057', 1, '07543 372 808', 'Boyfriend', 'Troy Danielis'),
('06-2857563', 'Osgood Sutherby', '88855 Merrick Road', 27045.62, '1990-08-20', 'ya877759r', '73-2251057', 4, '07873 688 139', 'Husband', 'Joyann Spellessy'),
('06-3396053', 'Hayes Butting', '120 Lotheville Pass', 50125.67, '1958-09-26', 'jm300330r', '74-0303597', 3, '07585 007 222', 'Boyfriend', 'Margot Barabich'),
('06-3776558', 'Kristofer Janson', '18140 Straubel Road', 94483.61, '1972-03-01', 'pw205885r', '73-2251057', 3, '07211 259 256', 'Wife', 'Boony Hardwell'),
('06-3850682', 'Celinda Joberne', '5 Jana Way', 61612.72, '1993-12-03', 'lw782748u', '82-6558984', 2, '07285 352 836', 'Civil Partner', 'Harmon Gindghill'),
('06-7381402', 'Pansy Benasik', '777 Welch Junction', 41672.28, '1953-03-04', 'rb727027l', '29-2364794', 2, '07822 069 566', 'Boyfriend', 'Melodee Sillars'),
('06-9710935', 'Wileen Elwell', '82 Tennyson Alley', 78678.52, '1991-09-21', 'no969473z', '65-1738561', 3, '07510 562 958', 'Husband', 'Stevy Cestard'),
('07-4517183', 'Rochell O\'Doohaine', '1802 Hayes Court', 25471.21, '1973-11-08', 'rz111360g', '76-2985832', 3, '07967 811 408', 'Mother', 'Regan Yarn'),
('07-4724394', 'Christiane Barnes', '2958 Butterfield Point', 51949.1, '1965-08-25', 'vw694872r', '73-2251057', 3, '07793 242 869', 'Father', 'Augustine Corstorphine'),
('08-4428147', 'Daryl Chartman', '2413 Ramsey Avenue', 58749.21, '1996-08-06', 'ad905076o', '74-0303597', 3, '07795 010 970', 'Father', 'Sydel Dexter'),
('08-5459846', 'Leola Dayly', '1 Tony Avenue', 43761.91, '1995-02-24', 'xz369649i', '73-2251057', 2, '07358 746 653', 'Civil Partner', 'Claudetta Plaistowe'),
('08-7213723', 'Dorie Brazener', '7720 Miller Way', 14357.12, '1966-01-19', 'qa101983v', '83-4865660', 2, '07735 358 950', 'Wife', 'Melody Brotherwood'),
('09-2857613', 'Faunie Testo', '903 Pawling Terrace', 42813.15, '1952-09-02', 'yh126921t', '87-8002965', 2, '07627 803 411', 'Boyfriend', 'Lorrin Morman'),
('09-4017521', 'Flemming Arnoll', '2 Eggendart Crossing', 22873.04, '2002-08-03', 'sb614856m', '87-8002965', 1, '07267 762 763', 'Husband', 'Brear Kluge'),
('09-4856118', 'Sofie Cavaney', '12677 Northridge Alley', 19096.73, '1966-10-24', 'hg982259y', '33-1897506', 2, '07594 793 358', 'Mother', 'Krisha Mingasson'),
('09-8147999', 'Alfonso Pirdue', '201 Garrison Crossing', 60175.71, '1950-01-27', 'pq325071u', '06-2857563', 3, '07876 106 377', 'Husband', 'Charmain Ewbanck'),
('10-1743239', 'Clareta Bamlet', '1038 Bellgrove Parkway', 46542.99, '1964-04-09', 'tx858508r', '29-2364794', 3, '07937 394 557', 'Husband', 'Selia Sopp'),
('10-4168432', 'Robinetta Triswell', '5 Independence Trail', 74033.43, '1956-09-29', 'eu934314q', '66-0739491', 3, '07016 239 710', 'Boyfriend', 'Ivett Rapier'),
('10-6127924', 'Joshuah Faircliffe', '8 Merry Center', 30666.21, '1992-09-16', 'ft026339d', '54-9522118', 3, '07975 207 662', 'Husband', 'Freddie Lorie'),
('10-6321236', 'Janot Kleinsinger', '4324 Huxley Point', 59407.49, '1982-10-05', 'vw739034c', '76-2985832', 1, '07666 955 404', 'Civil Partner', 'Tasha Bromilow'),
('10-6680137', 'Burnaby McGreay', '55 Hansons Center', 54552.7, '1971-09-13', 'xz020089e', '74-0303597', 2, '07154 115 530', 'Mother', 'Dion Tolson'),
('10-8148353', 'Frannie Pedron', '85 Meadow Valley Avenue', 20034.33, '1979-10-10', 'kw816523w', '87-8002965', 1, '07978 885 045', 'Girlfriend', 'Llywellyn Buckley'),
('10-9736161', 'Pet Littrik', '19 Haas Pass', 99117.25, '1981-10-01', 'fa725896g', '29-2364794', 2, '07480 391 714', 'Wife', 'Cecil Gathercoal'),
('11-0990160', 'Rhea Saffle', '77051 Shasta Circle', 37907.97, '1999-06-12', 'el763944v', '54-9522118', 3, '07452 139 490', 'Girlfriend', 'Jeane Fleet'),
('11-4556284', 'Joceline Oats', '8 East Pass', 19329.56, '1963-08-11', 'iu795663w', '93-5661312', 3, '07474 771 437', 'Mother', 'Mariejeanne Prendeville'),
('11-5411031', 'Joaquin Eringey', '890 Brickson Park Circle', 76521.21, '1959-03-09', 'di653042t', '35-7212754', 2, '07934 375 220', 'Wife', 'Damian Elsworth'),
('11-6489646', 'Alfie Glasebrook', '5942 Del Mar Court', 24207.5, '1987-08-25', 'kc363601g', '29-2364794', 1, '07740 998 062', 'Father', 'Ogden Wynne'),
('11-9162644', 'Ninnette Reach', '018 2nd Parkway', 33411.86, '2002-04-11', 'qi586048l', '76-2985832', 2, '07831 515 385', 'Boyfriend', 'Gerry Bastone'),
('12-0104092', 'Gerladina MacGinney', '270 Melody Park', 26606.61, '1992-12-29', 'pc545418r', '47-3147567', 3, '07655 343 095', 'Girlfriend', 'Sibyl Danovich'),
('12-5128654', 'Hadlee Stealey', '0 4th Court', 52510.07, '1997-11-17', 'tf577069v', '82-6558984', 3, '07643 213 336', 'Mother', 'Renee Kubatsch'),
('12-6888959', 'Benoit Collman', '827 Erie Junction', 74922.96, '1982-12-12', 'yc393041q', '66-0739491', 3, '07794 407 646', 'Girlfriend', 'Neila Haimes'),
('12-8760096', 'Mallorie De Brett', '1 Lillian Drive', 27166.7, '1987-05-25', 'gb976841w', '29-2364794', 3, '07540 241 186', 'Boyfriend', 'Thain Kellard'),
('13-8722134', 'Adler Wheeliker', '018 Lakewood Parkway', 97905.35, '1979-01-25', 'gd959536a', '74-0303597', 3, '07088 509 851', 'Father', 'Karel Gully'),
('13-9234597', 'Katya Ilewicz', '68697 Sutteridge Road', 62528.81, '1977-08-21', 'he783674o', '47-3147567', 3, '07970 418 060', 'Mother', 'Cull Harraway'),
('14-0432288', 'Marius Brosnan', '94941 Fairfield Terrace', 35816.39, '1996-07-07', 'fp824869e', '66-0739491', 2, '07277 220 402', 'Civil Partner', 'Palmer Vial'),
('14-1209073', 'Cheri Cancellieri', '97763 Anhalt Way', 62678.28, '1993-09-07', 'fj377449j', '74-0303597', 2, '07668 929 915', 'Wife', 'Leesa Bonhome'),
('14-2911172', 'Koren McCluskey', '6677 Evergreen Plaza', 73800.93, '1955-08-11', 'ox915931w', '74-0303597', 3, '07388 570 448', 'Wife', 'Rolph Reast'),
('14-4001908', 'Wilmette Jerrom', '6 Monica Way', 34082.14, '1974-10-30', 'gb391445q', '06-2857563', 3, '07529 897 607', 'Mother', 'Zaneta Deddum'),
('14-6532726', 'Salim Cator', '74 Lyons Place', 40060.04, '1988-05-30', 'os724826w', '87-6633787', 3, '07974 403 769', 'Boyfriend', 'Diannne Streight'),
('14-9076003', 'Padgett Casel', '3552 Towne Road', 61058.36, '1956-06-02', 'ws394988s', '47-3147567', 2, '07568 334 465', 'Boyfriend', 'Nathalia Frake'),
('15-4783339', 'Ermengarde Breitling', '2376 Brentwood Place', 18516.54, '1963-07-06', 'qh838641y', '35-7212754', 1, '07369 214 958', 'Mother', 'Bord Bartoletti'),
('15-5837614', 'Loren Kupper', '24 West Plaza', 92010.3, '1999-07-10', 'tx310999b', '65-1738561', 2, '07288 097 464', 'Boyfriend', 'Lazarus Pomeroy'),
('15-6949928', 'Dominique Causon', '2 Mallard Way', 61194.11, '1978-11-16', 'jz826946h', '87-8002965', 2, '07467 024 579', 'Husband', 'Marwin Haburne'),
('16-0283796', 'Delphinia Skelhorn', '115 Cody Point', 91026.23, '1969-08-29', 'mx935884p', '82-6558984', 2, '07672 610 977', 'Father', 'Zita Greasty'),
('16-1242322', 'Gris Elington', '12 School Way', 40776.94, '1963-12-30', 'sp696523t', '33-1897506', 2, '07770 964 956', 'Boyfriend', 'Jon Guisby'),
('17-1342407', 'Mala Eyree', '6 Dorton Circle', 24532.92, '1993-07-14', 'kf326923s', '47-3147567', 2, '07950 182 116', 'Wife', 'Traci Hammersley'),
('17-1925809', 'Donella Chinery', '3 Tennessee Street', 31438.66, '1970-02-12', 'xr596082y', '35-7212754', 3, '07580 481 684', 'Girlfriend', 'Klara Eckford'),
('17-3967296', 'Tiffany Wessing', '422 Darwin Lane', 69965.03, '1983-03-09', 'fi082187y', '73-2251057', 3, '07925 739 484', 'Boyfriend', 'Layne Laurenty'),
('17-5831110', 'Viviana Dreschler', '3 Oak Terrace', 56587.83, '1954-11-28', 'vx435216w', '93-5661312', 2, '07141 801 105', 'Husband', 'Hurley Nadin'),
('18-0534773', 'Alix Ambrogelli', '60 North Place', 62229.76, '1960-10-22', 'ny144248g', '06-2857563', 3, '07469 896 525', 'Mother', 'Harrietta Arpin'),
('18-3863597', 'Tamiko Holton', '49 Cody Lane', 97318.42, '1960-10-15', 'dm359618l', '83-4865660', 3, '07512 531 127', 'Wife', 'Hagen Lantoph'),
('18-3911956', 'Rafferty Edowes', '96 Helena Crossing', 41496.02, '1988-07-24', 'yk522444d', '87-6633787', 1, '07831 756 132', 'Husband', 'Francene Licquorish'),
('18-6142811', 'Starr Akhurst', '42 Golf Course Hill', 16005.59, '1951-06-01', 'qj120357r', '76-2985832', 3, '07997 004 063', 'Mother', 'Augustus Goodluck'),
('18-9171336', 'Sallie Hardwell', '6 Golf View Pass', 80829.14, '1983-09-20', 'yx656704n', '47-3147567', 3, '07026 832 505', 'Wife', 'Marsh Abilowitz'),
('19-0713712', 'Georg De Gouy', '06 Hermina Terrace', 37144.2, '1993-01-18', 'vi744437v', '83-4865660', 3, '07403 137 340', 'Boyfriend', 'Leoine Ayrs'),
('19-1079892', 'Charline Saggers', '32 Burning Wood Alley', 85860.59, '1995-11-26', 'uw710251u', '83-4865660', 3, '07959 795 234', 'Civil Partner', 'Concordia Marklund'),
('19-1277494', 'Perice Abramovitz', '2354 Jenifer Place', 55612.48, '1964-09-30', 'bs437833j', '82-6558984', 3, '07235 827 256', 'Civil Partner', 'Sella Ronca'),
('19-6732633', 'Ferrell Lages', '39705 Goodland Center', 63515.05, '1996-04-23', 'xb032437g', '66-0739491', 2, '07342 317 379', 'Boyfriend', 'Ramsey Denacamp'),
('20-2758343', 'Harrison Waller-Bridge', '73899 Sachtjen Alley', 39846.48, '1991-04-25', 'dw797814s', '66-0739491', 1, '07874 802 135', 'Girlfriend', 'Alaine Gozney'),
('20-3044693', 'Raina Yearn', '7 Havey Point', 91757.16, '1972-09-03', 'uz970481u', '87-6633787', 2, '07276 959 298', 'Father', 'Caroline Brinicombe'),
('20-5440287', 'Doralyn Freemantle', '33 Gateway Crossing', 36023.61, '1994-05-11', 'oj166622v', '74-0303597', 2, '07515 558 479', 'Husband', 'Adena Vasyuchov'),
('20-6300983', 'Juliann Profit', '047 Mandrake Drive', 59829.91, '1963-05-11', 'bx776119o', '29-2364794', 2, '07546 091 676', 'Girlfriend', 'Caresa McGeown'),
('20-7194686', 'Carolin Jagson', '57891 Bultman Circle', 56278.56, '1953-12-06', 'yb039141a', '35-7212754', 1, '07555 870 467', 'Husband', 'Grove Spellissy'),
('20-7886428', 'Dael Confort', '0533 Grasskamp Park', 56391.77, '1999-12-30', 'ee121177l', '33-1897506', 3, '07173 106 494', 'Boyfriend', 'Elisa McNamee'),
('20-9516100', 'Cordula Redsull', '3 Sullivan Lane', 70412.31, '1953-05-14', 'mu901992i', '73-2251057', 2, '07224 883 037', 'Mother', 'Noelle Physick'),
('21-1787461', 'Stefa Stringman', '3 Lake View Lane', 76206.39, '1987-12-09', 'qn206371i', '66-0739491', 2, '07620 851 960', 'Girlfriend', 'Brittan Rubroe'),
('21-2689388', 'Mildrid Ethington', '4 Buhler Pass', 18703.01, '1950-01-06', 'kp709951v', '87-6633787', 3, '07645 326 285', 'Girlfriend', 'Cordey Peer'),
('21-3155551', 'Alaric Santarelli', '8757 Thompson Trail', 24449.19, '1959-09-28', 'hn280217c', '82-6558984', 3, '07324 591 670', 'Father', 'Durand Klassman'),
('21-4089887', 'Corette Mourbey', '246 Wayridge Hill', 76423.32, '1983-06-04', 'km813203w', '35-7212754', 2, '07677 246 578', 'Father', 'Aksel Gallimore'),
('22-0788973', 'Kalvin Corrado', '770 Fallview Trail', 59688.79, '1980-11-07', 'ei247057v', '35-7212754', 2, '07717 672 468', 'Father', 'Eunice Chmarny'),
('22-2051613', 'Alys Feye', '000 Grayhawk Court', 50021.5, '1975-01-21', 'rs859776q', '76-2985832', 3, '07552 624 180', 'Girlfriend', 'Stearne Coveny'),
('22-3052971', 'Giorgia McCrohon', '80323 Myrtle Court', 91699.68, '1984-02-09', 'jk018371c', '47-3147567', 2, '07248 542 532', 'Boyfriend', 'Goddard Schenkel'),
('22-3708071', 'Rab Feast', '9503 Buell Drive', 30397.56, '1986-04-01', 'rb499211c', '47-3147567', 1, '07721 065 357', 'Girlfriend', 'Jereme Slayford'),
('22-6627032', 'Brynna Dyble', '0 Bonner Pass', 23496.3, '1979-05-05', 'al340446b', '47-3147567', 3, '07157 222 552', 'Boyfriend', 'Noland Doret'),
('22-7191567', 'Goddard Bagot', '362 Coleman Way', 90643.98, '1980-05-24', 'lx057194p', '65-1738561', 2, '07425 200 343', 'Father', 'Jeremiah Pavlasek'),
('22-9529013', 'Reginauld Oak', '8 Pleasure Drive', 80693.8, '1955-03-25', 'ju954932e', '83-4865660', 3, '07315 598 289', 'Mother', 'Hieronymus Eldon'),
('24-4585192', 'Elvira Vinson', '37 Kipling Lane', 91216.82, '1966-06-10', 'sa107205q', '82-6558984', 3, '07008 281 309', 'Civil Partner', 'Nariko Illsley'),
('24-4677621', 'Derril Scaife', '4 Tony Street', 82281.31, '1965-01-08', 'qb596623c', '74-0303597', 3, '07196 056 242', 'Father', 'Inness Hendrick'),
('24-6851371', 'Puff Speeding', '22016 New Castle Hill', 78841.84, '1951-11-12', 'mh954487u', '82-6558984', 2, '07291 150 140', 'Girlfriend', 'Esme MacGlory'),
('24-9067553', 'Lief Schimann', '4786 Rowland Trail', 87146.69, '1957-07-01', 'xo554182r', '29-2364794', 3, '07499 192 522', 'Girlfriend', 'Shannon McGinty'),
('24-9840403', 'Ashley Barcke', '7 Eastlawn Alley', 33391.07, '1968-07-30', 'ww328815i', '06-2857563', 3, '07683 879 132', 'Girlfriend', 'Iseabal Leidl'),
('25-4103329', 'Elfrieda Slessar', '5536 Stone Corner Terrace', 64639.39, '1954-02-02', 'ri926857q', '87-6633787', 2, '07594 266 644', 'Wife', 'Baxie De Rye Barrett'),
('25-6187206', 'Farlay Haughan', '99 Schurz Plaza', 63905.08, '1984-08-21', 'fg558529z', '83-4865660', 2, '07383 021 093', 'Husband', 'Sandye De Gouy'),
('25-9736142', 'Aurore Neilson', '9 Darwin Parkway', 53082.75, '1981-02-17', 'bi255825p', '93-5661312', 3, '07640 868 506', 'Mother', 'Stearne Chaffer'),
('26-0938951', 'Fabe Lief', '94 Gerald Crossing', 56639.65, '1980-01-02', 'cc841112d', '87-8002965', 2, '07180 333 916', 'Boyfriend', 'Kev Bradmore'),
('26-3324931', 'Nelle Thams', '04 Weeping Birch Junction', 12571.28, '1982-12-16', 'qj455525d', '54-9522118', 2, '07745 996 565', 'Mother', 'Jaime Picford'),
('26-9050326', 'Dode Hurtado', '12322 Cottonwood Point', 40814.61, '2002-02-06', 'lm182202b', '87-8002965', 2, '07898 839 206', 'Civil Partner', 'Cully Galilee'),
('27-1540713', 'Raphaela Symon', '41109 Stephen Plaza', 72118.42, '1983-03-07', 'ry550614d', '06-2857563', 2, '07315 752 509', 'Girlfriend', 'Baudoin Danigel'),
('27-8037561', 'Junina McAirt', '45 Ramsey Junction', 39500.15, '1988-07-08', 'cx516631k', '73-2251057', 3, '07054 012 385', 'Mother', 'Xaviera Chaves'),
('27-8094243', 'Rhodia Realy', '2748 Wayridge Junction', 54901.54, '1959-12-23', 'sh464311u', '73-2251057', 3, '07556 017 337', 'Husband', 'Byran Greaser'),
('27-8387260', 'Annetta Cock', '76245 Hoffman Court', 90559.92, '1984-07-16', 'vd818340c', '93-5661312', 2, '07189 537 844', 'Civil Partner', 'Sara-ann Knoller'),
('28-4979315', 'Sashenka Artin', '71 Talmadge Drive', 36543.57, '1982-09-22', 'tp697018e', '65-1738561', 2, '07508 127 404', 'Civil Partner', 'Nichol Rawsthorne'),
('28-7012669', 'Rahel Gallo', '798 Karstens Parkway', 60391.38, '1997-05-15', 'kz848071o', '33-1897506', 1, '07028 898 207', 'Boyfriend', 'Ahmad Muge'),
('28-7818998', 'Alfi MacFadzean', '6 Old Shore Center', 45825.46, '1983-05-07', 'tp307139n', '73-2251057', 3, '07448 651 046', 'Mother', 'Caz Dartnell'),
('29-2364794', 'Guido Hoopper', '51 Prairieview Alley', 78530.16, '1986-07-16', 'in158664i', '35-7212754', 4, '07080 664 959', 'Girlfriend', 'Joel Fairham'),
('29-2785103', 'Agnes Dendon', '158 Twin Pines Crossing', 17734.18, '1986-02-17', 'kk792060s', '33-1897506', 3, '07477 622 496', 'Husband', 'Eimile Vial'),
('29-5105992', 'Borg Szymanzyk', '41 Amoth Crossing', 77828.8, '1998-02-26', 'hm134578n', '93-5661312', 2, '07156 132 741', 'Boyfriend', 'Bobby Breslin'),
('29-5209106', 'Mellisa Mapam', '65 Maryland Junction', 85398.19, '1961-12-21', 'wn277158x', '87-6633787', 3, '07250 548 384', 'Girlfriend', 'Bastien Hollingshead'),
('29-6350132', 'Pietro Ochterlony', '75 Weeping Birch Junction', 51249.75, '1989-08-28', 'fv388894k', '74-0303597', 3, '07475 627 111', 'Girlfriend', 'Willis Deary'),
('29-6571924', 'Arne Bosson', '77803 Messerschmidt Park', 73371.57, '2001-01-28', 'ux813250n', '66-0739491', 3, '07369 136 446', 'Husband', 'Haroun Izakovitz'),
('29-6656577', 'Lynne Muccino', '65 Northland Avenue', 63251.24, '1960-05-27', 'rg151568q', '82-6558984', 2, '07818 864 970', 'Boyfriend', 'Mose Pulham'),
('29-7832408', 'Lexine Joney', '73817 Muir Court', 19232.41, '1974-04-07', 'pk696816m', '82-6558984', 3, '07755 486 861', 'Husband', 'Quinn Goodfellow'),
('30-1322103', 'Earl Wagerfield', '34 Lillian Center', 91770.28, '1998-04-05', 'zw251674d', '47-3147567', 3, '07695 349 556', 'Civil Partner', 'Bastian Walliker'),
('30-2374884', 'Felicdad Escala', '26 Holy Cross Place', 22260.8, '1976-11-27', 'ei636866y', '65-1738561', 2, '07404 498 162', 'Boyfriend', 'Alonzo Whilder'),
('30-3058947', 'Hettie Broadbent', '5 Rowland Road', 74439.57, '1950-05-29', 'an167975t', '66-0739491', 3, '07747 283 371', 'Husband', 'Paten Velten'),
('30-7334418', 'Lorita Fere', '9899 Johnson Park', 64340.92, '1973-07-26', 'yh523785h', '83-4865660', 3, '07194 892 472', 'Husband', 'Darby Lias'),
('30-8456021', 'Tandi Dmitrovic', '5447 Lyons Center', 99223.26, '1970-01-19', 'sr314203n', '65-1738561', 3, '07465 428 558', 'Wife', 'Florentia Cornelisse'),
('30-8953969', 'Will Craik', '50 Florence Junction', 85698.44, '1998-04-23', 'rk384949o', '87-6633787', 2, '07117 843 636', 'Civil Partner', 'Aaren Lomaz'),
('31-5831645', 'Sofia Skoof', '47354 Clyde Gallagher Point', 58714.12, '1965-11-26', 'va211893v', '73-2251057', 2, '07220 519 362', 'Father', 'Coleen Tolley'),
('31-7111614', 'Artemis Adami', '99842 Spenser Point', 58500.47, '1960-06-17', 'bp682069w', '73-2251057', 2, '07648 096 231', 'Mother', 'Ardyce McAree'),
('31-7167962', 'Emanuele Strickland', '3772 Dawn Drive', 15549.15, '1967-04-14', 'qy726870d', '87-8002965', 1, '07510 608 683', 'Wife', 'Winfred Moncey'),
('31-8312411', 'Georgine Winspare', '2732 Cottonwood Way', 50921.83, '1966-10-10', 'eo514879y', '82-6558984', 2, '07194 463 040', 'Girlfriend', 'Nickolaus Riepel'),
('31-9709677', 'Heda Cathersides', '7 Laurel Park', 32079.57, '1995-10-05', 'fp198238e', '35-7212754', 2, '07971 986 560', 'Civil Partner', 'Orelie Balasin'),
('32-3604971', 'Sterling Elgood', '428 8th Point', 14162.95, '1999-12-05', 'eh265089x', '83-4865660', 2, '07003 409 288', 'Boyfriend', 'Dougy Hamlen'),
('32-4834306', 'Andra Bamfield', '9799 Russell Crossing', 59706.55, '1967-12-08', 'rw267230v', '87-8002965', 2, '07918 827 977', 'Boyfriend', 'Corabella Bitten'),
('32-6251861', 'Frederic Ginnaly', '2 Drewry Circle', 98924.54, '1971-10-02', 'rs647299i', '83-4865660', 3, '07870 877 830', 'Husband', 'Terrijo Piatto'),
('33-0071114', 'Nola Wilcox', '7055 Southridge Drive', 61500.7, '1985-01-06', 'aq503711l', '54-9522118', 1, '07734 801 502', 'Mother', 'Madelaine Hutt'),
('33-0489054', 'Onfre Woolmore', '7868 Pearson Hill', 61377.23, '1983-11-22', 'xa033094e', '74-0303597', 3, '07055 738 740', 'Civil Partner', 'Erie Wardingly'),
('33-1261585', 'Bary Skoof', '20630 Tony Avenue', 95728.74, '2001-12-02', 'fh221614b', '35-7212754', 2, '07639 903 071', 'Wife', 'Benni Botting'),
('33-1897506', 'Verla Seacroft', '0134 Fieldstone Trail', 52928.18, '2000-05-18', 'un133384d', '73-2251057', 4, '07584 205 419', 'Husband', 'Georgena Clappison'),
('33-5159037', 'Ina Farrans', '65968 Fairview Center', 67306.02, '1952-03-10', 'vk466721d', '73-2251057', 3, '07399 003 920', 'Mother', 'Hollie Hebble'),
('33-7183053', 'Lucinda McGhee', '625 Mitchell Point', 53031.5, '1981-03-26', 'nn735991o', '73-2251057', 1, '07642 004 857', 'Civil Partner', 'Jacquette Cardenosa'),
('33-7614004', 'Modesty Chicchelli', '74 Bashford Pass', 23376.55, '1961-01-22', 'zz664726s', '87-8002965', 3, '07676 274 711', 'Father', 'Antoine De Caville'),
('34-2543597', 'Rodina Ofener', '5556 Schmedeman Court', 92118.32, '1973-07-13', 'dy170889s', '33-1897506', 3, '07100 762 873', 'Wife', 'Megen Vynall'),
('34-2817296', 'Jemmy Levens', '298 Elka Alley', 31521.7, '1950-09-26', 'dw387671h', '47-3147567', 3, '07543 934 498', 'Father', 'Shannon Kesteven'),
('34-4740678', 'Germain Stockow', '102 Haas Junction', 56278.62, '1981-05-30', 'yo417120d', '82-6558984', 3, '07035 382 913', 'Mother', 'Nobie Scardifeild'),
('34-8601206', 'Dulcia Antonutti', '9 Kingsford Plaza', 61015.9, '1996-07-19', 'za364662q', '47-3147567', 2, '07519 157 083', 'Husband', 'Pandora Furnell'),
('34-8695852', 'Reg Lanphier', '049 Cambridge Road', 93925.1, '1979-12-09', 'lr289379r', '06-2857563', 1, '07018 375 399', 'Mother', 'Penelope Hancill'),
('35-2689059', 'Junette Hackforth', '74801 Lakewood Trail', 36180.91, '1998-03-26', 'pr407605t', '87-6633787', 2, '07089 659 356', 'Girlfriend', 'Wain Corneck'),
('35-6685131', 'Shaw Brandsen', '55545 Toban Trail', 47949.95, '1974-10-22', 'ps562104c', '83-4865660', 2, '07065 792 686', 'Girlfriend', 'Ada Vaissiere'),
('35-7212754', 'Dorian Claringbold', '7422 Crownhardt Avenue', 13347.31, '1955-11-18', 'uw834458r', '93-5661312', 4, '07633 415 279', 'Mother', 'Amye Brecknock'),
('35-8208617', 'Sayre Simnel', '761 Kennedy Lane', 72894, '1952-05-19', 'jr596419t', '65-1738561', 3, '07184 248 686', 'Husband', 'Flory Billham'),
('36-1132600', 'Danyette Kendrew', '1 Karstens Point', 98386.6, '2000-06-23', 'dc106173c', '06-2857563', 2, '07187 549 944', 'Wife', 'Madonna McCague'),
('36-1480567', 'Skell Swainson', '31 Sundown Terrace', 80604.76, '1994-05-12', 'ib067151y', '82-6558984', 1, '07556 127 597', 'Mother', 'Nola Yeowell'),
('36-4190617', 'Glyn Canet', '565 Glendale Park', 54281.26, '1999-11-25', 'gr760688u', '54-9522118', 2, '07942 102 464', 'Wife', 'Nap Muzzlewhite'),
('36-4580826', 'Olivia MacPhee', '09 Saint Paul Point', 85391.76, '1963-02-01', 'dj312271a', '66-0739491', 2, '07275 260 538', 'Husband', 'Trey Shannon'),
('36-6348131', 'Tedda Daggett', '12 Lindbergh Place', 25694.32, '1989-05-30', 'bm829464z', '47-3147567', 3, '07136 718 165', 'Boyfriend', 'Stanley Duffitt'),
('36-6943031', 'Wolfgang Frake', '97152 Waubesa Center', 21505.69, '1982-01-28', 'op535073z', '76-2985832', 3, '07013 596 878', 'Father', 'Ulick Snyder'),
('36-7073092', 'Thelma Wilkie', '113 Badeau Plaza', 32280.23, '1984-10-01', 'bl221585z', '87-6633787', 3, '07625 474 049', 'Wife', 'Tabbitha Shemmans'),
('37-0478226', 'Jenn Alsina', '281 Marquette Drive', 40753.2, '1987-12-08', 'pw357899l', '65-1738561', 3, '07396 626 394', 'Husband', 'Christoforo Decker'),
('37-1673392', 'Constantine Gilfillan', '87 Washington Junction', 32245.83, '1961-12-01', 'ct112101i', '93-5661312', 1, '07373 224 784', 'Wife', 'Alasteir McKeand'),
('37-6605556', 'Jacobo Pashba', '101 Linden Crossing', 67037.04, '1976-05-15', 'vg977309d', '65-1738561', 2, '07475 211 884', 'Girlfriend', 'Goldia Nisard'),
('37-7900056', 'Victoir Loveitt', '7 Judy Parkway', 24486.52, '1996-02-05', 'vd479897l', '83-4865660', 3, '07126 636 219', 'Father', 'Leon McCotter'),
('37-8247167', 'Elaina Ramplee', '9 Merry Hill', 70979.93, '1983-09-12', 'eo273727q', '93-5661312', 3, '07081 377 359', 'Wife', 'Fidela Heaviside'),
('38-0609594', 'Bev Yakunikov', '50563 Waubesa Point', 69660.66, '1973-02-07', 'ku940218f', '73-2251057', 3, '07295 123 244', 'Girlfriend', 'Bren Epperson'),
('38-1272080', 'Mozes Fishleigh', '2636 Burning Wood Crossing', 42919.29, '1952-04-10', 'zx396808c', '35-7212754', 3, '07006 963 911', 'Girlfriend', 'Iolanthe Carlick'),
('38-1884801', 'Valida Bootes', '06 Bluejay Way', 75580.43, '1968-07-23', 'hy568138e', '74-0303597', 2, '07417 261 693', 'Civil Partner', 'Waldemar Plunket'),
('38-2126707', 'Vinni Champneys', '38416 Susan Plaza', 35513.16, '1976-05-01', 'vn364397s', '82-6558984', 3, '07101 430 354', 'Wife', 'Giustina Stephen'),
('38-3647372', 'Carey Netley', '279 Helena Place', 67072.08, '1963-10-22', 'lb767754c', '35-7212754', 2, '07685 471 321', 'Wife', 'Giuseppe Petican'),
('38-4369228', 'Merwin Partener', '29021 Clemons Terrace', 13685.06, '1988-04-16', 'ef765749d', '29-2364794', 2, '07366 799 382', 'Civil Partner', 'Samaria Rennie'),
('38-5473326', 'Feodora Benning', '620 Sachtjen Center', 89549.75, '1994-02-18', 'kz832424w', '54-9522118', 3, '07135 140 819', 'Husband', 'Chaddie Kelcey'),
('38-8885296', 'Ginelle Morgon', '411 2nd Pass', 84423.53, '1960-04-26', 'ps334310v', '82-6558984', 3, '07905 196 224', 'Boyfriend', 'Audrey Calafate'),
('38-9798664', 'Minor Bennion', '9756 Cottonwood Lane', 17020.16, '1958-07-14', 'fl067205y', '47-3147567', 2, '07717 918 115', 'Boyfriend', 'Calv Alelsandrovich'),
('39-1227728', 'Tandy Goodbourn', '719 Sloan Drive', 47852.85, '1996-10-03', 'go119787t', '35-7212754', 1, '07457 814 451', 'Husband', 'Colette Reisk'),
('39-4788866', 'Phillida Musicka', '111 Twin Pines Center', 84543.42, '1973-10-22', 'pg674068r', '66-0739491', 3, '07695 675 287', 'Father', 'Coleen McPhater'),
('40-0786243', 'Oswell Beddingham', '12989 Village Green Street', 97980.89, '1953-04-24', 'lh106861m', '93-5661312', 1, '07765 606 938', 'Father', 'Leslie Keningham'),
('40-1037983', 'Odelinda Wardingly', '069 Mesta Road', 90622.48, '1980-07-07', 'bk920804k', '65-1738561', 2, '07493 098 720', 'Boyfriend', 'Lanny Pendred'),
('40-1136806', 'Julio Featherstonhalgh', '35498 Jackson Pass', 89162.28, '1987-02-20', 'qr454157y', '35-7212754', 2, '07797 601 369', 'Boyfriend', 'Scotti Nowill'),
('40-2208062', 'Sonny Tabrett', '25326 Briar Crest Hill', 62818.83, '1989-01-29', 'zs026946u', '74-0303597', 3, '07829 257 797', 'Wife', 'Bibbie Tradewell'),
('40-5288701', 'Ame Balser', '2282 Sutteridge Lane', 71557.8, '1998-01-22', 'dt545040m', '06-2857563', 3, '07489 365 686', 'Boyfriend', 'Kipp Lavens'),
('40-6943405', 'Charlena Marques', '2800 Dahle Avenue', 83307.32, '1966-11-24', 'vz886203m', '82-6558984', 2, '07410 675 062', 'Girlfriend', 'Marylinda Titta'),
('41-1429269', 'Jacki Rumin', '84 Kipling Parkway', 81648.46, '1991-01-21', 'rp562470q', '47-3147567', 2, '07603 027 379', 'Mother', 'Northrup Pittendreigh'),
('41-3216938', 'Joeann Beckerleg', '6442 Dennis Street', 56988.53, '1992-12-14', 'zi901356n', '65-1738561', 3, '07462 515 206', 'Husband', 'Rustie Ridge'),
('41-3268639', 'Sherlocke Cornner', '00811 Morning Crossing', 43444.78, '1960-03-15', 'uo254689s', '06-2857563', 2, '07607 490 054', 'Mother', 'Melinda Edelston'),
('41-3659990', 'Ruperta Stobie', '2825 Pepper Wood Center', 83681.2, '1976-09-17', 'qf137469l', '87-6633787', 3, '07106 575 891', 'Girlfriend', 'Joly Doram'),
('41-3975053', 'Felipe Ferschke', '5508 Hauk Terrace', 63359.81, '1986-12-25', 'pu346240t', '76-2985832', 1, '07924 859 819', 'Civil Partner', 'Sibyl Mabson'),
('41-6555988', 'Marwin Raybould', '925 Novick Lane', 51081.29, '1983-05-31', 'dp016938u', '87-6633787', 1, '07794 678 823', 'Girlfriend', 'Margette Osman'),
('41-9319442', 'Luisa Burtonwood', '554 Marcy Crossing', 48099.78, '1975-12-02', 'ji602428k', '93-5661312', 3, '07929 318 804', 'Boyfriend', 'Ezmeralda Ertel'),
('41-9645109', 'Merrel Miklem', '00 Marcy Trail', 39131.1, '2000-07-27', 'ls403208x', '93-5661312', 2, '07394 851 273', 'Girlfriend', 'Creighton Hinzer'),
('42-0131259', 'Kelsi Cunney', '5 Toban Terrace', 92101.67, '1955-07-02', 'nm508435w', '82-6558984', 2, '07612 472 814', 'Wife', 'Cassandre Attawell'),
('42-0717807', 'Robin Bartkowiak', '5559 Shelley Circle', 89053.24, '1988-07-14', 'mu698813c', '93-5661312', 3, '07268 021 034', 'Mother', 'Rollo Olczak'),
('42-1134854', 'Norma Budgeon', '5061 Northland Place', 45208.71, '1986-01-19', 'gq875183d', '74-0303597', 2, '07583 207 317', 'Wife', 'Allie Hambleton'),
('42-2072103', 'Oates Snepp', '684 Park Meadow Junction', 42019.18, '1967-07-29', 'ie180913g', '06-2857563', 3, '07413 999 083', 'Girlfriend', 'Papageno Baiyle'),
('42-5263028', 'Corny Leynham', '8 Hansons Drive', 82698.63, '1972-03-03', 'kc800413c', '93-5661312', 3, '07030 945 316', 'Civil Partner', 'Dorise Polin'),
('42-7011523', 'Giorgia Hynes', '23948 Ruskin Place', 44916.43, '1963-01-15', 'xh499685d', '65-1738561', 3, '07349 039 768', 'Father', 'Harper Crutchley'),
('42-7240015', 'Godfrey Napoleon', '030 Fallview Court', 89542.77, '1966-10-12', 'hg523274c', '74-0303597', 3, '07935 559 320', 'Husband', 'Brose Jepp'),
('42-8848918', 'Zahara Pepis', '15 2nd Crossing', 17215.7, '1992-03-16', 'vv722651o', '66-0739491', 3, '07958 131 810', 'Wife', 'Hayden Monkley'),
('43-2037577', 'Leisha Mieville', '027 Clarendon Center', 68826.28, '1950-11-23', 'nj080641o', '65-1738561', 2, '07204 386 023', 'Boyfriend', 'Alyosha Halewood'),
('43-6568300', 'Gillan Stolberger', '04255 Mayfield Way', 92147.29, '1985-06-01', 'hx200738r', '87-8002965', 3, '07163 688 713', 'Husband', 'Nickie Driscoll'),
('43-7385696', 'Nicky Ipplett', '7153 Merrick Terrace', 48895.33, '1983-10-25', 'tk845900k', '47-3147567', 2, '07389 587 350', 'Wife', 'Maritsa McGann'),
('43-8492699', 'Hortense Berecloth', '2 Barby Parkway', 38548, '1987-07-29', 'zt656754o', '29-2364794', 2, '07789 751 694', 'Boyfriend', 'Baird Fingleton'),
('44-1072008', 'Jacob Kelf', '48033 Forest Run Parkway', 66228.12, '1965-11-25', 'zi651705l', '47-3147567', 2, '07498 555 907', 'Civil Partner', 'Merlina Adolthine'),
('44-4915402', 'Phaidra Ivey', '46 Toban Lane', 61580.95, '1970-01-02', 'yg637206i', '87-6633787', 2, '07304 601 591', 'Mother', 'Franz Barribal'),
('44-7083318', 'Dari Siene', '57 Randy Point', 85262.11, '1971-01-29', 'ku592945q', '66-0739491', 3, '07814 082 485', 'Girlfriend', 'Galvan Kaszper'),
('45-1060690', 'Morgen Shortland', '3 Doe Crossing Trail', 81649.14, '2002-08-17', 'vr974451g', '54-9522118', 1, '07228 676 244', 'Husband', 'Cooper Sillars'),
('45-1168337', 'Jade Yaakov', '13 Parkside Avenue', 95249.87, '1986-02-17', 'eb401601e', '06-2857563', 3, '07888 296 305', 'Boyfriend', 'Marybeth Dibben'),
('45-2811300', 'Veradis Wagstaff', '592 Sullivan Pass', 54982.88, '1951-08-08', 've944995l', '47-3147567', 2, '07142 691 496', 'Mother', 'Odo Frame'),
('45-3804689', 'Pauly McDell', '4 Fordem Trail', 66117.54, '2001-09-18', 'ac869050u', '29-2364794', 2, '07107 484 803', 'Boyfriend', 'Tam Howler'),
('45-3951342', 'Chris Skittrell', '174 Namekagon Court', 80039.37, '1986-08-23', 'io334297g', '74-0303597', 1, '07679 670 222', 'Mother', 'Arthur Landsborough'),
('45-5773014', 'Patric Etienne', '87269 Huxley Place', 22053.53, '1954-12-24', 'nd673205l', '66-0739491', 2, '07771 820 262', 'Mother', 'Ken Sloane'),
('45-6995640', 'Sigfrid Mankor', '9773 Old Shore Way', 12758.05, '1997-07-13', 'fi299116a', '47-3147567', 2, '07603 307 243', 'Boyfriend', 'Troy Connock'),
('45-7500187', 'Juditha Pesterfield', '076 Heath Drive', 37428.34, '1952-10-19', 'zf490474b', '47-3147567', 2, '07269 336 319', 'Husband', 'Agnella Wyman'),
('46-0059406', 'Marylou McClunaghan', '7 Bluestem Pass', 60710.92, '1982-09-24', 'ys652384q', '87-8002965', 3, '07689 398 886', 'Father', 'Paule Willingham'),
('46-2600043', 'Del Fitter', '4290 Superior Terrace', 54544.33, '1982-11-26', 'tt394813q', '47-3147567', 3, '07295 967 993', 'Wife', 'Adolph Hedgeman'),
('46-4344763', 'Benny Lander', '86904 Montana Road', 88061.49, '1991-01-06', 'sq353921l', '35-7212754', 2, '07204 662 049', 'Father', 'Rorke Biles'),
('47-1387266', 'Bevon Gaskoin', '549 Oakridge Avenue', 56671.63, '2000-06-06', 'ce665632s', '87-6633787', 3, '07116 235 571', 'Civil Partner', 'Bobbette Ruddlesden'),
('47-3147567', 'Britta Northin', '757 Ramsey Terrace', 74080.45, '1959-09-11', 'yz717919v', '73-2251057', 4, '07996 723 103', 'Wife', 'Sigmund McLafferty'),
('47-5302795', 'Gerardo Brosio', '6949 Bonner Junction', 92669.35, '1968-03-20', 'rb204617t', '47-3147567', 2, '07487 727 188', 'Girlfriend', 'Haley Kellock'),
('48-1799687', 'Charissa Peattie', '6497 Haas Park', 32502.37, '1952-06-23', 'lw132386n', '93-5661312', 2, '07262 636 173', 'Girlfriend', 'Prudi Blum'),
('48-5840838', 'Raquel Stave', '8 Springview Plaza', 91219.79, '1998-06-21', 'yl966209u', '87-8002965', 1, '07567 015 757', 'Girlfriend', 'Brien Narrie'),
('48-9328765', 'Orsola Francillo', '31360 Debra Junction', 98161.15, '1970-06-06', 'tq009471b', '47-3147567', 3, '07353 747 279', 'Wife', 'Poul Poznan'),
('49-1036239', 'Onofredo Joontjes', '938 2nd Way', 36626.2, '1990-04-01', 'so040048u', '73-2251057', 2, '07005 138 853', 'Husband', 'Reinold Kaubisch'),
('49-1159362', 'Valeria Proschek', '6 Red Cloud Court', 97436.14, '1996-02-18', 'xd817271x', '74-0303597', 2, '07472 485 627', 'Girlfriend', 'Der Merner'),
('49-1457327', 'Sinclair Byfford', '201 Melody Parkway', 50636.92, '1981-12-10', 'hp128399x', '66-0739491', 2, '07731 937 530', 'Mother', 'Sallee Hughes'),
('49-2217652', 'Georas Divisek', '25 Moulton Lane', 87452.13, '1951-05-10', 'ht175666x', '76-2985832', 3, '07326 502 172', 'Civil Partner', 'Nessy Panting'),
('49-5299749', 'Vonny Meeny', '06702 Lawn Plaza', 83205.62, '1982-01-24', 'ah996640u', '06-2857563', 2, '07452 090 283', 'Husband', 'Farleigh Norwich'),
('49-6102253', 'Annabelle Fairnie', '12384 Warrior Point', 60436.09, '1992-11-27', 'dl892664i', '87-6633787', 2, '07257 411 126', 'Boyfriend', 'Gideon Gillivrie'),
('49-9705882', 'Quentin Devine', '09 Knutson Park', 23326.81, '1962-02-08', 'fm907610k', '93-5661312', 2, '07480 332 736', 'Girlfriend', 'Kass Haysman'),
('50-0945563', 'Ashbey England', '3 Oneill Crossing', 66223.46, '1979-09-18', 'uj306006a', '83-4865660', 2, '07764 772 037', 'Girlfriend', 'Tim Stiff'),
('50-5810953', 'Jarad Thorowgood', '01 East Hill', 80581.88, '2000-03-24', 'fe255201p', '87-8002965', 2, '07016 639 458', 'Father', 'Hurlee Bendle'),
('50-6111855', 'Shepard Johansson', '22 Hudson Trail', 86414.16, '1986-07-24', 'ng987509r', '35-7212754', 3, '07792 360 390', 'Girlfriend', 'Matias Ruckert'),
('50-7117246', 'Everett Hoggetts', '4809 Gale Trail', 99084.22, '1999-11-15', 'pk662258w', '73-2251057', 3, '07978 286 641', 'Girlfriend', 'Justina Steinson'),
('50-9092071', 'Jodie Busswell', '8 Pepper Wood Avenue', 14441.41, '1958-12-07', 'qz236393m', '35-7212754', 3, '07958 325 944', 'Father', 'Simone Kitchenman'),
('51-0122715', 'Ardyce Calcraft', '953 Green Trail', 63482.01, '1982-08-31', 'kk311112p', '93-5661312', 3, '07425 771 845', 'Mother', 'Damara Dudny'),
('51-6967096', 'Bertina Berard', '1 Almo Place', 21320.75, '1961-10-18', 'ed732328n', '93-5661312', 2, '07107 706 065', 'Boyfriend', 'Shelly Gimblet'),
('51-7315582', 'Kathy Goodnow', '24494 Kenwood Alley', 94364.48, '1988-05-05', 'dn632963a', '82-6558984', 2, '07264 110 068', 'Girlfriend', 'Braden Sabben'),
('51-7472749', 'Bonnibelle Disley', '9 Vermont Trail', 32710.49, '1987-07-30', 'si278865g', '87-6633787', 2, '07219 511 447', 'Girlfriend', 'Peyton MacShirie'),
('51-9601829', 'Maressa Hans', '73 Coolidge Park', 21773.24, '2001-10-13', 'er279775r', '87-8002965', 2, '07174 952 329', 'Wife', 'Nicol Dockray'),
('52-0404205', 'Pierce Kemp', '63008 Raven Place', 82902.41, '1984-06-29', 'dd271029j', '29-2364794', 3, '07643 549 188', 'Husband', 'Seumas Ivantsov'),
('52-1336694', 'Renaldo Fussey', '7 Northland Street', 46099.86, '1955-04-11', 'nz535691o', '87-6633787', 2, '07061 354 829', 'Husband', 'Gloriana McFade'),
('52-4567561', 'Braden Wigin', '9641 Loftsgordon Park', 85761.99, '1983-10-31', 'lc856388d', '65-1738561', 3, '07525 541 001', 'Father', 'Leia MacMearty'),
('52-4726377', 'Vania Simonsson', '666 Hoffman Parkway', 90719.74, '2001-12-22', 'ry740755s', '83-4865660', 1, '07169 495 661', 'Civil Partner', 'Eduino Gainsboro'),
('52-5735024', 'Donica Hewell', '2911 Southridge Hill', 34806.46, '1978-01-03', 'wn058972w', '47-3147567', 3, '07629 713 818', 'Boyfriend', 'Waylan Kochlin'),
('52-6674444', 'Codie Stambridge', '38 Schurz Pass', 29289.03, '1953-02-11', 'ku840832k', '93-5661312', 2, '07206 048 771', 'Father', 'Emera Yearne'),
('53-0431396', 'Demetrius Lowmass', '8 Stone Corner Crossing', 99061.45, '1968-07-24', 'wd175217c', '06-2857563', 2, '07345 326 453', 'Father', 'Emelen Spender'),
('53-5630368', 'Evey Luckman', '898 Butternut Point', 26964.71, '1992-08-10', 'ee740794t', '47-3147567', 2, '07753 919 257', 'Girlfriend', 'Bradford Rudolf'),
('53-6948800', 'Dorothea Trewinnard', '0 Stephen Way', 74486.86, '1998-02-16', 'cd290362a', '76-2985832', 3, '07312 873 616', 'Boyfriend', 'Arielle Etock'),
('53-7191465', 'Delila Folland', '5993 Warner Park', 32281.47, '1955-11-27', 'vk993165i', '35-7212754', 2, '07572 306 041', 'Husband', 'Cori Phillipps'),
('53-9062912', 'Doralynn Suddaby', '4 Springview Plaza', 59458.15, '1952-09-16', 'zh337987i', '87-8002965', 2, '07464 651 444', 'Boyfriend', 'Roddie O\' Molan'),
('54-1117411', 'Schuyler Stoffels', '31 Carioca Terrace', 41087.65, '1980-09-20', 'sh512546i', '54-9522118', 2, '07152 080 965', 'Mother', 'Sisely Castelin'),
('54-5318903', 'Stanislaus Ferreli', '5 Northland Park', 51816.24, '1975-04-20', 'sw345892x', '82-6558984', 1, '07329 818 995', 'Wife', 'Tootsie Holdey'),
('54-6428980', 'Janek Semeradova', '12015 Dayton Trail', 89572.34, '1966-08-06', 'hm636135w', '74-0303597', 3, '07580 556 646', 'Wife', 'Bald Bennoe'),
('54-7676865', 'Pepillo Maha', '2025 Waxwing Drive', 38143.51, '1953-02-26', 'ii522336e', '83-4865660', 2, '07857 880 717', 'Wife', 'Manfred Morston'),
('54-7904459', 'Alexandros Ormesher', '664 Gale Plaza', 51642.73, '1998-03-15', 'sl566148h', '47-3147567', 3, '07904 464 506', 'Mother', 'Gabriela Wehden'),
('54-8296596', 'Tommie Vallintine', '37 Superior Parkway', 87912.38, '1973-11-21', 'tm808573f', '87-6633787', 3, '07097 155 888', 'Civil Partner', 'Porter Nance'),
('54-9522118', 'Nari Chowne', '169 Clemons Drive', 40585.75, '1979-01-17', 'vm874796y', '47-3147567', 4, '07064 930 835', 'Boyfriend', 'Ilsa McAusland'),
('55-0320348', 'Granville McKitterick', '04 Rieder Parkway', 83664.78, '1965-02-20', 'dr180938w', '93-5661312', 2, '07532 693 273', 'Mother', 'Zita Stanborough'),
('55-3650046', 'Gerek Bardnam', '91085 Maple Court', 51185.61, '1966-12-29', 'xh198735c', '73-2251057', 2, '07005 200 200', 'Boyfriend', 'Nanete Hassard'),
('55-4384947', 'Eudora Marten', '6 Corry Road', 80059.87, '1981-08-19', 'mz193764k', '29-2364794', 3, '07708 980 078', 'Husband', 'Bradly Mitrovic'),
('55-5908272', 'Petronille Squelch', '67 Golden Leaf Park', 65853.46, '1987-01-30', 'ly831340g', '66-0739491', 3, '07435 864 662', 'Boyfriend', 'Alden Bourthoumieux'),
('55-6072477', 'Waring Durkin', '9597 Towne Center', 82140.98, '1984-03-07', 'mg195096h', '35-7212754', 3, '07405 739 948', 'Wife', 'Paolina Rosenwasser'),
('55-9616651', 'Murdock Linsay', '8 Shelley Terrace', 55605.57, '1992-12-08', 'tn328405l', '06-2857563', 3, '07698 294 787', 'Boyfriend', 'Fae Whales'),
('55-9770243', 'Janeva Carlet', '5557 Washington Point', 35334.78, '1974-07-18', 'pu508250s', '83-4865660', 3, '07591 865 044', 'Boyfriend', 'Kimmie McKevitt'),
('56-0484045', 'Lyn Topp', '20 Sloan Circle', 36487.51, '1979-06-06', 'np848289h', '82-6558984', 2, '07245 144 587', 'Boyfriend', 'Hermine Sapsed'),
('56-3682739', 'Melany Klugel', '14577 Truax Alley', 41959.59, '1955-05-18', 'tg734644m', '82-6558984', 1, '07885 597 859', 'Mother', 'Shannon Purdy'),
('56-4309508', 'Tessy Cartan', '75834 Burning Wood Parkway', 85017.74, '1985-02-04', 'of985665x', '87-6633787', 3, '07285 064 810', 'Husband', 'Conway Howman'),
('56-7734821', 'Micki Wyness', '26 Novick Plaza', 38060.45, '1974-12-06', 'nh139989u', '83-4865660', 3, '07519 455 911', 'Father', 'Thedric Kenwright'),
('57-1609142', 'Jilly Skirvane', '4227 Darwin Circle', 91296.52, '1961-04-27', 'md982609a', '87-8002965', 3, '07918 823 802', 'Father', 'Gearard Lindback'),
('57-2548391', 'Wynne Flowitt', '8 Harbort Road', 45230.72, '1961-11-09', 'ns537861h', '35-7212754', 3, '07741 907 270', 'Wife', 'Lesya Phebey'),
('57-4162757', 'Beulah Vala', '07601 Sunfield Hill', 37954.91, '1951-09-09', 'ro435900h', '65-1738561', 3, '07959 819 817', 'Girlfriend', 'Scarlet Maps'),
('57-7596762', 'Joelie Bacchus', '0374 Pawling Hill', 14722.35, '1978-10-09', 'ok001999u', '93-5661312', 2, '07456 139 081', 'Boyfriend', 'Emmy Giraldo'),
('58-0128736', 'Sandye How', '2 Fordem Street', 13440.04, '1963-05-24', 'wj636565x', '82-6558984', 2, '07813 571 441', 'Boyfriend', 'Ethelbert Warret'),
('58-0824770', 'Zared Klulicek', '62958 Canary Junction', 40677.89, '1966-07-22', 'hx158296g', '35-7212754', 2, '07783 704 124', 'Civil Partner', 'Johna Radki'),
('58-2471319', 'Constantino Phlippsen', '52 Nevada Road', 77184.02, '1965-08-21', 'vz575305z', '66-0739491', 3, '07239 492 326', 'Boyfriend', 'Salem Courtliff'),
('58-5912504', 'Nappy Ludmann', '3329 Sheridan Junction', 51318.65, '1991-08-15', 'ge941219f', '66-0739491', 3, '07888 438 593', 'Husband', 'El Grishagin'),
('58-8249246', 'Maggi Hamshar', '92344 Main Avenue', 34269.41, '1950-04-19', 'rb919501k', '54-9522118', 2, '07536 036 354', 'Civil Partner', 'Theresina Tring'),
('58-8390431', 'Brandi Andreassen', '008 Service Alley', 19209.8, '2000-07-12', 'ib637202u', '87-6633787', 2, '07726 134 897', 'Husband', 'Bendicty Macek'),
('59-0150604', 'Florry Oblein', '5 Elmside Lane', 87584.21, '1984-12-20', 'vv093891d', '35-7212754', 1, '07394 653 792', 'Civil Partner', 'Casie MacAirt'),
('59-0997098', 'Aila Paolillo', '41 Esker Terrace', 14148.29, '1975-03-19', 'cm005454h', '82-6558984', 3, '07196 432 406', 'Mother', 'Debera Itzkovich'),
('59-1166943', 'Parker Filippov', '9 Granby Terrace', 65946.54, '1995-03-05', 'xp081647h', '87-8002965', 3, '07964 139 091', 'Boyfriend', 'Rora Windross'),
('59-2576093', 'Katerina Barnfield', '34404 Bellgrove Avenue', 61807.51, '2000-10-26', 'jx648488c', '47-3147567', 3, '07031 588 061', 'Father', 'Nancy Masterson'),
('59-4661298', 'Stearne Stennet', '664 Warrior Drive', 37835.13, '1993-04-08', 'vu851838j', '83-4865660', 1, '07434 841 982', 'Wife', 'Jenn Sander'),
('59-4684006', 'Angie Waddams', '82 Truax Crossing', 62378.68, '1996-01-10', 'df003975r', '87-6633787', 3, '07241 523 713', 'Civil Partner', 'Husain Yerborn'),
('59-5937939', 'Blancha McMillian', '59 Buhler Trail', 89177.07, '1991-07-21', 'zp730277w', '66-0739491', 2, '07104 138 411', 'Father', 'Lizbeth Curbishley'),
('59-6274425', 'Talbert Abbotts', '29565 Jenifer Court', 92884.08, '1996-08-13', 'ae100121f', '47-3147567', 3, '07015 001 355', 'Husband', 'Jon McAlester'),
('59-8314806', 'Scotty Keson', '14 Kipling Point', 67107.29, '1967-08-12', 'gx924268x', '29-2364794', 3, '07390 692 263', 'Husband', 'Norrie Aggis'),
('59-8381667', 'Emmey Dallywater', '98705 Forest Run Avenue', 92664.3, '1953-04-10', 'dk443174l', '76-2985832', 1, '07021 173 423', 'Father', 'Gabi Crooks'),
('60-0655971', 'Cherie Murch', '3340 Gale Way', 12502.4, '1963-12-02', 'ap253442h', '87-8002965', 1, '07455 807 075', 'Boyfriend', 'Beitris Morison'),
('60-1691051', 'Winnah Gillott', '40711 Dayton Plaza', 48040.51, '1982-12-31', 'qv299811c', '76-2985832', 3, '07406 136 450', 'Mother', 'Amabelle McFaell'),
('60-2276889', 'Ransell Seakings', '1 Ramsey Park', 43734.59, '1995-07-22', 'uu534964w', '54-9522118', 3, '07439 078 961', 'Girlfriend', 'Monro Piatkowski'),
('60-3158201', 'Carlee Shearmur', '2 Vermont Terrace', 78619.51, '1966-06-28', 'lo612272u', '65-1738561', 2, '07218 567 891', 'Husband', 'Hiram Imrie'),
('60-6270362', 'Theressa Prentice', '2026 Oak Valley Hill', 78594.8, '1973-02-18', 'qf112815j', '87-8002965', 3, '07483 322 111', 'Husband', 'Sanders Firsby'),
('60-6428015', 'Fayette Hackin', '212 Loomis Trail', 51844.54, '1986-03-31', 'rn693599v', '35-7212754', 2, '07161 526 613', 'Wife', 'Birgitta Naerup'),
('60-7601093', 'Elnar Tabrett', '280 Drewry Way', 85741.9, '1963-03-15', 'rf462586d', '93-5661312', 1, '07045 228 558', 'Mother', 'Shara Bernardy'),
('60-9203590', 'Shoshana Downie', '8416 Carberry Crossing', 83867.01, '1998-05-02', 'ee740085i', '29-2364794', 3, '07602 582 994', 'Girlfriend', 'Montague Giles'),
('61-7469906', 'Demetre Headrick', '98692 Forster Hill', 88965.32, '1963-10-11', 'ns990887t', '74-0303597', 1, '07004 401 178', 'Girlfriend', 'Conrado Laker'),
('61-9391449', 'Lester Carmo', '6 Buell Trail', 37061.26, '1997-02-02', 'mt812263o', '33-1897506', 2, '07547 928 939', 'Father', 'Alis Plaster'),
('62-1957072', 'Elliot Allitt', '8 Redwing Court', 41808.84, '1978-03-17', 'nd981367q', '54-9522118', 1, '07699 612 785', 'Husband', 'Christan Leupoldt'),
('62-2186332', 'Meridith Bolton', '9 Hooker Avenue', 81390.66, '1951-01-06', 'vw612487d', '65-1738561', 2, '07050 832 727', 'Civil Partner', 'Delmore Borel'),
('62-4020686', 'Tait Bremeyer', '82 Calypso Junction', 83142.55, '1950-05-29', 'ie609169k', '29-2364794', 3, '07640 597 771', 'Boyfriend', 'Gina Manueli'),
('62-4959178', 'Josie Henricsson', '8035 Brown Lane', 64586.93, '2001-03-06', 'oh486872e', '83-4865660', 3, '07119 333 689', 'Husband', 'Cathyleen Lindfors'),
('62-6726896', 'Marje Cranage', '15 Crescent Oaks Junction', 82421.91, '1981-02-23', 'kt951067x', '66-0739491', 1, '07280 779 671', 'Father', 'Jabez Yewman'),
('62-6894804', 'Merrie Stayt', '0 Manufacturers Alley', 39159.86, '1995-10-04', 'cq847516d', '93-5661312', 3, '07124 699 528', 'Civil Partner', 'Sumner Armer'),
('62-7019089', 'Agnese Murrhardt', '4666 Jay Court', 88965.75, '1955-12-18', 'yz407625p', '74-0303597', 2, '07868 628 411', 'Father', 'Bondie Schruyers'),
('62-7120162', 'Fanni Melrose', '33 Sutteridge Parkway', 97520.73, '1962-06-10', 'na997468x', '82-6558984', 2, '07189 813 349', 'Wife', 'Malissa Scurrah'),
('63-0638100', 'Edd Speere', '812 High Crossing Junction', 13662.8, '1950-01-05', 'au549358u', '87-8002965', 3, '07623 018 398', 'Boyfriend', 'Kristopher Pawfoot'),
('63-1545651', 'Dedra MacConnulty', '22342 Sauthoff Center', 85921.5, '1989-05-13', 'zc732912g', '06-2857563', 3, '07410 226 285', 'Girlfriend', 'Wallache Ropkins'),
('63-1925261', 'Willyt Ezzy', '61751 Burrows Drive', 14811.14, '1983-06-12', 'vy468006g', '66-0739491', 2, '07491 768 068', 'Father', 'Sallyanne Minchinton'),
('63-2539882', 'Darelle Peverell', '52683 Aberg Parkway', 80717.2, '1978-08-08', 'pg514115j', '33-1897506', 3, '07268 106 425', 'Boyfriend', 'Helen Gouda'),
('63-5722038', 'Vikki Guthrie', '6 Farragut Road', 95626.81, '1976-04-10', 'hx643872o', '47-3147567', 3, '07095 123 826', 'Civil Partner', 'Kristin Stanhope'),
('63-6111701', 'Fayre Tomney', '1506 Ryan Point', 58829.33, '1979-07-23', 'ia005234g', '87-6633787', 2, '07765 565 720', 'Girlfriend', 'Berty Brimblecomb'),
('63-8802366', 'Cody Peasey', '6 Dixon Point', 54393.78, '1974-01-26', 'fu609000b', '76-2985832', 2, '07719 695 663', 'Wife', 'Joscelin Dumblton'),
('63-9116461', 'Aylmer Gabbatiss', '8828 Blue Bill Park Avenue', 27880.52, '1950-09-20', 'qj799086z', '74-0303597', 1, '07789 380 331', 'Boyfriend', 'Paxton Aspole'),
('63-9446221', 'Tybie Exell', '1 Anderson Plaza', 56541.59, '1985-09-03', 'gi458830f', '33-1897506', 3, '07785 086 128', 'Boyfriend', 'Alberik Meaton'),
('64-0621633', 'Sigismundo FitzGibbon', '8 Gina Terrace', 55410.48, '1981-06-14', 'au449889p', '54-9522118', 3, '07615 396 907', 'Mother', 'Morley Mastrantone'),
('64-0636526', 'Antonetta Beefon', '68 Blackbird Drive', 39943.08, '1961-12-17', 'hb766263l', '74-0303597', 3, '07972 492 545', 'Boyfriend', 'Lief Wilhelmy'),
('64-6729020', 'Sarajane Abrams', '26499 Warrior Avenue', 87543.1, '1985-01-02', 'yh646941o', '93-5661312', 3, '07608 960 744', 'Civil Partner', 'Jamison Richardet'),
('64-6879023', 'Brose Niece', '18466 Village Green Plaza', 74713.01, '1964-02-02', 'yz865649d', '65-1738561', 3, '07670 530 361', 'Boyfriend', 'Annette Bydaway'),
('65-1738561', 'Say Lodwig', '54399 Forest Dale Avenue', 17891.12, '1987-08-27', 'tj978150h', '54-9522118', 4, '07764 317 881', 'Boyfriend', 'Donella Scullard'),
('65-7661186', 'Lombard Debling', '36 Mayer Drive', 53121.9, '1989-01-13', 'jb039257n', '82-6558984', 3, '07811 367 312', 'Father', 'Ross Little'),
('66-0739491', 'Latashia McGaugan', '1386 Artisan Parkway', 58941.46, '1992-07-08', 'nz662678p', '29-2364794', 4, '07007 182 872', 'Wife', 'Eada Silmon');
INSERT INTO `employee` (`Number`, `Name`, `HomeAddress`, `Salary`, `DOB`, `NIN`, `ManagerEmpNumber`, `DepartmentNumber`, `EPhone`, `ERelationship`, `EName`) VALUES
('66-1883695', 'Jorge Bonham', '8 2nd Trail', 33284.78, '1998-03-19', 'ql642076f', '82-6558984', 2, '07996 433 549', 'Civil Partner', 'Tildy Donett'),
('66-2361006', 'Hillard Milan', '9010 Straubel Park', 81724.41, '1967-04-06', 'og602265e', '06-2857563', 1, '07747 406 557', 'Wife', 'Janela Jeffels'),
('66-2522703', 'Alyss Nance', '0974 Red Cloud Junction', 20416.96, '1952-09-07', 'gy674145h', '87-6633787', 1, '07785 317 092', 'Father', 'Natassia Ludvigsen'),
('66-2765926', 'Jacinta Partleton', '3957 Hoard Place', 96193.45, '1962-10-15', 'sh419152d', '93-5661312', 2, '07252 015 009', 'Civil Partner', 'Rand Madrell'),
('66-5805863', 'Vincents De Bruijne', '3 Claremont Parkway', 81193.24, '1983-03-20', 'na778983r', '74-0303597', 2, '07814 696 449', 'Girlfriend', 'Dominick Schirach'),
('66-7576883', 'Dur Janodet', '91175 Northland Hill', 54589.37, '1950-04-17', 'jd412382q', '87-6633787', 2, '07636 377 875', 'Father', 'Golda Preston'),
('67-4076527', 'Clarissa Houson', '1 Granby Pass', 35964.42, '1975-05-12', 'kh895707v', '83-4865660', 3, '07007 011 997', 'Father', 'Cordy Sudell'),
('67-5029558', 'Gianina Leppington', '1 Jenifer Park', 77499.37, '1979-05-27', 've628368y', '33-1897506', 1, '07772 470 745', 'Father', 'Joycelin Mushet'),
('67-5304822', 'Taber Nuton', '94646 Charing Cross Parkway', 85586.57, '1966-01-29', 'ig939447u', '87-8002965', 2, '07239 031 455', 'Civil Partner', 'Taylor Micka'),
('67-6284946', 'Alia Sygroves', '7 Roth Alley', 19945.2, '1967-12-20', 'ws189951j', '47-3147567', 2, '07244 048 879', 'Wife', 'Alameda Iacobacci'),
('67-6903314', 'Dorene Ipplett', '87 Cardinal Court', 93942.93, '1986-11-16', 'ul176502b', '06-2857563', 3, '07885 465 113', 'Mother', 'Lew O\'Dempsey'),
('67-7636850', 'Felice Plaide', '0617 Daystar Drive', 58909.33, '1953-03-05', 'vl606950t', '33-1897506', 2, '07296 394 678', 'Boyfriend', 'Codee Hurndall'),
('68-3132421', 'Catlaina McInerney', '19 Aberg Plaza', 69134.66, '1953-11-03', 'pr574429q', '66-0739491', 2, '07691 368 084', 'Girlfriend', 'Raphaela Fishlee'),
('68-3172017', 'Hayyim Fleay', '3644 Blaine Court', 55384.02, '1974-02-05', 'yh345037b', '33-1897506', 3, '07717 401 856', 'Boyfriend', 'Aristotle MacGrath'),
('68-4171892', 'Yoshi Peakman', '641 Warner Point', 20293.38, '1953-03-06', 'to907441w', '73-2251057', 3, '07924 918 978', 'Husband', 'Patty Horsburgh'),
('68-5871521', 'Bearnard Parysowna', '60052 Monument Alley', 85175.33, '1985-09-08', 'vg613456a', '87-8002965', 2, '07699 779 427', 'Father', 'Ernestine Syne'),
('68-6940299', 'Tobi Bute', '46 Jenifer Plaza', 97878.28, '1986-01-31', 'mw253204t', '47-3147567', 2, '07477 278 621', 'Father', 'Fifi Lamputt'),
('68-7037451', 'Saree Starling', '1 Artisan Drive', 34145.23, '1973-10-07', 'ct629800a', '54-9522118', 3, '07087 447 204', 'Civil Partner', 'Duane Mitton'),
('68-7096348', 'Darsey Fryman', '996 Sauthoff Circle', 80568.78, '1974-11-30', 'gd794016y', '06-2857563', 3, '07204 221 186', 'Mother', 'Davey Gregan'),
('68-7504033', 'Brandi Clayson', '7 Myrtle Circle', 37302, '1963-11-22', 'kn988197t', '87-6633787', 2, '07613 591 203', 'Civil Partner', 'Glenden Livett'),
('68-8976238', 'Florie Reyes', '2 Heffernan Center', 98224.34, '1999-11-28', 'ub855681n', '93-5661312', 1, '07623 894 854', 'Civil Partner', 'Libbey Van den Bosch'),
('69-0393201', 'Lissa Egalton', '28673 Bultman Junction', 77974.79, '1978-07-16', 'ep586696m', '54-9522118', 3, '07937 182 672', 'Wife', 'Bernadene Lowey'),
('69-0536291', 'Jaime Woolhouse', '59 Jenna Park', 34370.5, '1977-05-01', 'dz195791x', '87-8002965', 3, '07099 769 526', 'Father', 'Denys Tuckwood'),
('69-0803348', 'Editha Anney', '271 Browning Plaza', 67023.77, '2001-08-23', 'mk604551h', '73-2251057', 2, '07416 146 403', 'Boyfriend', 'Lloyd Pidon'),
('69-3965258', 'Archie Godden', '7 Marcy Road', 33511.85, '1979-12-08', 'gk840892x', '54-9522118', 3, '07304 482 930', 'Father', 'Goran Lamburn'),
('69-5458568', 'Elvina Matuszynski', '6 Grover Road', 76167.8, '1956-05-27', 'ob669602j', '33-1897506', 2, '07255 258 700', 'Civil Partner', 'Justinn Maginot'),
('69-5925327', 'Sydelle Pelzer', '34635 Dawn Drive', 15069.38, '1973-11-12', 'ap767547i', '93-5661312', 3, '07216 578 917', 'Civil Partner', 'Katusha Kirkham'),
('69-6968657', 'Diannne Scala', '96290 Bunker Hill Hill', 86102.65, '1955-07-09', 'lw629488e', '29-2364794', 3, '07775 640 640', 'Father', 'Duke Ruske'),
('70-2965789', 'Lyell Brannan', '7 Anzinger Center', 49943.14, '1984-09-05', 'sv922230q', '66-0739491', 2, '07642 910 675', 'Boyfriend', 'Domingo Zuppa'),
('70-4763276', 'Nikaniki Scarman', '81 Fallview Avenue', 92757.77, '1994-12-05', 'uu528507s', '87-8002965', 2, '07764 688 949', 'Boyfriend', 'Letitia Ellph'),
('71-3652304', 'Esteban Ziemen', '4832 Pankratz Road', 16929.76, '1956-07-01', 'wc844307p', '47-3147567', 2, '07228 818 773', 'Wife', 'Ilyse Schultheiss'),
('71-4783541', 'Brandise Kondrachenko', '3 Kenwood Alley', 49471.98, '1961-02-28', 'fm459704k', '35-7212754', 3, '07339 364 526', 'Civil Partner', 'Alica Adnam'),
('71-7374760', 'Alfie Dean', '15 Mccormick Point', 21930.1, '1963-03-10', 'lh444635g', '87-8002965', 3, '07219 099 770', 'Wife', 'Godard Klimmek'),
('71-7837650', 'Shelley Camilletti', '91311 Hauk Avenue', 67736.1, '1974-12-25', 'yx527895g', '93-5661312', 2, '07066 178 667', 'Husband', 'Malory Hawes'),
('72-0413596', 'Philly Halliberton', '33 Sheridan Road', 15689.28, '1994-08-23', 'mo726896p', '35-7212754', 1, '07911 839 364', 'Mother', 'Dorthy Savoury'),
('72-2448628', 'Gina Macrae', '607 Northport Center', 36331.78, '1961-05-14', 'tv211484w', '06-2857563', 3, '07985 842 262', 'Wife', 'Reeta Feary'),
('72-3040567', 'Tanney Marques', '9382 Prairie Rose Alley', 70585.82, '1966-02-19', 'no949821c', '35-7212754', 3, '07781 001 495', 'Girlfriend', 'Joel Laxson'),
('72-3549258', 'Bailey Lewington', '3 Bobwhite Center', 90668.84, '1993-02-02', 'ze015887n', '66-0739491', 3, '07105 859 928', 'Boyfriend', 'Angus Ranscome'),
('72-5913162', 'Rudolfo Norridge', '22 Golf Court', 37428.03, '1968-08-24', 'du615694i', '83-4865660', 3, '07235 513 354', 'Boyfriend', 'Frazier Snelman'),
('72-6079643', 'Leonelle Claridge', '09468 Lunder Place', 61662.41, '1974-01-15', 'qv402258l', '47-3147567', 2, '07054 759 828', 'Husband', 'Harlan Foxton'),
('72-7823438', 'Adrienne Myall', '9 Oneill Place', 31683.24, '1972-08-11', 'uv348158a', '54-9522118', 2, '07029 866 049', 'Civil Partner', 'Taylor Screach'),
('72-9006336', 'Ikey Sholl', '62 North Place', 77016.02, '1985-07-23', 'qf846140g', '54-9522118', 1, '07866 004 620', 'Mother', 'Marianne Elion'),
('72-9328783', 'Constantia Privett', '162 Moland Terrace', 25686.8, '1980-01-29', 'tx491950i', '47-3147567', 3, '07939 930 407', 'Father', 'Bryan Shawdforth'),
('73-2251057', 'Lodovico Ashborne', '7312 Shoshone Court', 72963.41, '1983-08-24', 'cb298473a', '29-2364794', 4, '07750 131 976', 'Mother', 'Vilhelmina Wrangle'),
('73-6200004', 'Marie Gummoe', '4 Debra Terrace', 45954.79, '1954-07-31', 'kw585002h', '76-2985832', 2, '07357 406 936', 'Mother', 'Thibaud Bladder'),
('73-7147493', 'Chelsea Robertucci', '94833 Northview Way', 78083.27, '1956-12-28', 'df426741g', '74-0303597', 2, '07998 104 368', 'Husband', 'Alysa Bonavia'),
('74-0303597', 'Bria Thomkins', '7 Homewood Road', 88871.61, '1952-04-01', 'tx085395s', '29-2364794', 4, '07523 340 134', 'Civil Partner', 'Reed Easterfield'),
('74-9747670', 'Hymie Dows', '12 Dwight Terrace', 62699.64, '1965-11-16', 'aq304702r', '82-6558984', 2, '07753 745 592', 'Girlfriend', 'Gerik Graeser'),
('75-0124112', 'Jennica Welbeck', '78916 Green Ridge Trail', 57947.01, '1952-04-18', 'ma973579k', '66-0739491', 3, '07260 273 133', 'Boyfriend', 'Abbey Waryk'),
('75-0131682', 'Charlot Dignall', '950 Arizona Terrace', 15153.98, '1972-05-12', 'bj869010d', '87-6633787', 3, '07035 352 138', 'Girlfriend', 'Staci Normadell'),
('75-0328049', 'Cassy Hiddersley', '9902 Starling Circle', 71258.15, '1999-09-03', 'sg232892l', '73-2251057', 3, '07037 038 101', 'Wife', 'Samuele Solesbury'),
('75-0958781', 'Velvet Carbine', '682 Kensington Drive', 31440.81, '1987-04-12', 'of014519k', '54-9522118', 2, '07692 074 959', 'Girlfriend', 'Lorri Elkington'),
('75-1340477', 'Ferd Uccello', '90243 Karstens Pass', 72024.81, '1997-01-09', 'nu487701k', '06-2857563', 2, '07382 538 132', 'Husband', 'Edi Haygreen'),
('75-6520267', 'Truda Edleston', '37994 Green Ridge Drive', 23646.9, '1966-03-07', 'lp500272n', '74-0303597', 2, '07753 973 466', 'Wife', 'Tyler Rowsell'),
('75-6891165', 'Robinett Iacopini', '2224 Kensington Street', 62045.69, '1961-08-27', 'lq983512u', '29-2364794', 2, '07728 862 325', 'Husband', 'Stepha Doohan'),
('75-8250680', 'Conney Ferras', '43048 American Ash Hill', 93389.4, '1993-07-19', 'us717372t', '93-5661312', 3, '07367 105 969', 'Mother', 'Dagmar Ranahan'),
('75-9134355', 'Ramonda Overpool', '12879 Mayfield Lane', 28892.13, '1958-03-01', 'ew007431m', '76-2985832', 2, '07880 354 813', 'Civil Partner', 'Alie Lutz'),
('76-0000021', 'Norton Bygrove', '0412 Packers Lane', 43733.47, '1952-12-09', 'xx491915v', '76-2985832', 1, '07895 871 178', 'Girlfriend', 'Agatha Nulty'),
('76-0099650', 'Tymon Smeal', '22635 Toban Court', 65314.49, '1983-12-07', 'ww210857j', '93-5661312', 2, '07427 306 598', 'Boyfriend', 'Phyllys Lamey'),
('76-2727093', 'Nesta Dottrell', '6 Ridgeway Court', 71905.32, '1981-04-26', 'mg608324j', '87-8002965', 2, '07329 779 233', 'Mother', 'Joe MacCleay'),
('76-2985832', 'Desirae Gooch', '6306 Reinke Circle', 42779.29, '1979-01-07', 'uc493497v', '93-5661312', 4, '07925 034 405', 'Husband', 'Phillie Eles'),
('76-3367992', 'Pammy Sterling', '466 Northfield Alley', 86046.49, '1966-04-21', 'sj533699h', '54-9522118', 2, '07432 348 532', 'Husband', 'Milty Corney'),
('76-4036199', 'Noni Szymoni', '6 Kedzie Circle', 90864.71, '1959-02-09', 'yl605202h', '06-2857563', 3, '07184 014 200', 'Civil Partner', 'Joyce Jaynes'),
('76-4086283', 'Laird Stalley', '75447 Norway Maple Park', 91412.37, '1953-12-05', 'fc920310o', '54-9522118', 2, '07834 640 631', 'Mother', 'Krishna Payle'),
('76-4940799', 'Anderea Challicombe', '8 Melvin Terrace', 87575.3, '1999-03-21', 'vv690440b', '06-2857563', 3, '07086 691 240', 'Civil Partner', 'Towny Deetch'),
('76-8791360', 'Afton Cassels', '4 Grover Way', 30662.87, '1984-06-15', 'uu202177x', '87-8002965', 2, '07941 015 817', 'Mother', 'Ryley Schieferstein'),
('77-1835914', 'Annabelle Caddies', '66 Loomis Alley', 94451.03, '1964-03-26', 'mp067841c', '83-4865660', 3, '07665 666 934', 'Husband', 'Lucila Farlamb'),
('77-2348932', 'Sal Dominy', '88006 Charing Cross Hill', 39168.52, '1994-07-30', 'ro907653y', '73-2251057', 1, '07173 823 511', 'Husband', 'Verney Essam'),
('77-5513461', 'Noell Azam', '66 Brown Hill', 60586.79, '1974-05-19', 'zk782722r', '83-4865660', 2, '07066 007 108', 'Boyfriend', 'Dante Snozzwell'),
('77-5748543', 'Fanchon Stebbings', '77689 Donald Alley', 38753.87, '1966-11-15', 'xy286906n', '65-1738561', 3, '07030 174 840', 'Mother', 'Clayton Segar'),
('77-6317806', 'Keelby Pelling', '5 Jay Trail', 57007.18, '1965-12-22', 'hj451937l', '73-2251057', 1, '07680 068 925', 'Father', 'Clyve Pedroli'),
('77-7401728', 'Cloris Truckell', '84521 Pearson Street', 72938.51, '1995-05-03', 'bn687310q', '35-7212754', 2, '07923 010 205', 'Wife', 'Eben Samms'),
('77-8203719', 'Netta McCabe', '1 Lakewood Gardens Plaza', 45095.62, '1998-02-26', 'vy489059e', '29-2364794', 2, '07392 244 305', 'Girlfriend', 'Veradis Glidder'),
('78-0380118', 'Dewitt Gabby', '8 Montana Park', 93187.29, '1961-06-07', 'mo353148n', '66-0739491', 2, '07037 535 429', 'Wife', 'Marjorie Fraine'),
('78-1195027', 'Meade Ketteman', '47 Nevada Center', 17823.35, '1950-07-30', 'ul369491o', '83-4865660', 2, '07881 576 200', 'Civil Partner', 'Meridith Lowes'),
('78-4344207', 'Aldridge Kensett', '94 Dunning Trail', 86064.22, '1987-12-04', 'sk062184b', '93-5661312', 2, '07449 485 950', 'Father', 'Griffith Witherow'),
('78-6321379', 'Thea Bradborne', '3118 Lien Circle', 35665.99, '1967-09-27', 'vb943949c', '83-4865660', 2, '07356 401 825', 'Mother', 'Theo Sheard'),
('78-8816060', 'Marilyn Glassborow', '6 Waubesa Crossing', 90675.1, '1978-11-19', 'lh695834z', '66-0739491', 2, '07544 911 166', 'Husband', 'Rivy Gensavage'),
('78-9623211', 'Margaretha Kikke', '24 Logan Circle', 25726.1, '2000-01-08', 'uv389552l', '83-4865660', 3, '07341 771 237', 'Mother', 'Leshia Allcorn'),
('79-0464882', 'Lia Hargreaves', '721 Graceland Alley', 13755.82, '1995-08-03', 'dt884304c', '83-4865660', 2, '07503 035 492', 'Father', 'Becka Card'),
('79-1576734', 'Malchy Kempshall', '5 Melby Plaza', 48788.98, '1950-04-08', 'nv658761a', '54-9522118', 3, '07137 684 264', 'Civil Partner', 'Ossie McBean'),
('79-4798875', 'Iorgo Dowsey', '904 Pond Park', 14568.84, '2001-07-08', 'vv771459v', '74-0303597', 2, '07558 144 894', 'Father', 'Mile Scholler'),
('79-5517945', 'Darryl Payfoot', '62334 Prairie Rose Drive', 84841.6, '1955-10-15', 'rc413749a', '65-1738561', 3, '07102 109 240', 'Mother', 'Daloris Lanon'),
('79-9536595', 'Noni Abbatucci', '1 Monterey Center', 14602.61, '1989-03-18', 'nt307553s', '33-1897506', 2, '07078 712 010', 'Mother', 'Cybil Bemrose'),
('80-3234805', 'Greer Durnford', '44200 Sauthoff Terrace', 82703.39, '1996-11-16', 'ry037414u', '82-6558984', 3, '07074 285 151', 'Girlfriend', 'Mindy Gatch'),
('80-6524018', 'Ambur Challenor', '2 Morning Crossing', 47033.97, '1955-09-17', 'tn459758p', '87-8002965', 3, '07141 393 691', 'Civil Partner', 'Eilis Domenici'),
('80-7938995', 'Armstrong Ivachyov', '41681 Welch Court', 36204.54, '1973-12-10', 'ly992939e', '06-2857563', 2, '07902 274 458', 'Father', 'Fiorenze Elvey'),
('80-7941049', 'Chiarra Dundridge', '04 Porter Avenue', 67648.79, '1972-01-10', 'ps295181z', '66-0739491', 1, '07244 918 390', 'Husband', 'Leroi Dingivan'),
('80-8617080', 'Salomi Lintin', '29507 Bartillon Terrace', 78695.13, '1985-04-26', 'cc846598u', '83-4865660', 2, '07621 668 278', 'Mother', 'Delainey Benedtti'),
('81-0188200', 'Nadine Davidson', '0 Jana Alley', 23660.37, '1998-05-19', 'eb645921x', '54-9522118', 2, '07068 255 984', 'Civil Partner', 'Frederique Wheatman'),
('81-2733835', 'Magdalen McIlwrick', '2099 Debra Trail', 41997.19, '1974-01-19', 'rr316532p', '35-7212754', 1, '07747 163 685', 'Mother', 'Brendis Saunder'),
('81-4865027', 'Annette Josephs', '532 Kipling Place', 46710.64, '1960-03-07', 'vk802431y', '83-4865660', 2, '07950 739 212', 'Mother', 'Rouvin Von Oertzen'),
('81-5031235', 'Gill Fulford', '9 Susan Avenue', 46429.85, '1968-03-20', 'vg667583e', '66-0739491', 2, '07036 754 544', 'Wife', 'Rafaellle Tweedlie'),
('81-5228790', 'Rene Waddup', '47 Southridge Parkway', 40348.66, '1992-08-08', 'vy525798f', '06-2857563', 2, '07612 660 166', 'Father', 'Katee Dilrew'),
('81-7038918', 'Fraze Maletratt', '96 Rockefeller Circle', 30986.25, '1993-04-02', 'dr489342o', '76-2985832', 3, '07100 170 818', 'Civil Partner', 'Ruggiero Kilgrove'),
('81-8060778', 'Estevan Francesco', '2 Troy Avenue', 85869.29, '1970-09-16', 'sf717839d', '87-8002965', 1, '07890 810 674', 'Boyfriend', 'Jacki Tupling'),
('82-1629865', 'Dag Choules', '53 Blue Bill Park Center', 23537.76, '1998-08-16', 'dz430103g', '29-2364794', 2, '07585 388 400', 'Husband', 'Nikaniki Stenhouse'),
('82-2609006', 'Cyrus Willmetts', '470 Oakridge Circle', 70654.72, '1986-08-02', 'gx740846k', '87-8002965', 1, '07123 594 714', 'Boyfriend', 'Levon Bratt'),
('82-2981878', 'Cherida Gocke', '395 Comanche Center', 31735.68, '1951-12-06', 'ej657352g', '35-7212754', 2, '07683 714 091', 'Boyfriend', 'Erhart Husset'),
('82-6558984', 'Hebert Zaniolini', '8 Buell Place', 50633.71, '1991-09-05', 'kd209714d', '47-3147567', 4, '07962 176 107', 'Father', 'Sim Sacher'),
('82-9457047', 'Merralee Vannuchi', '7 Vera Place', 56425.54, '1986-01-20', 'lf092320a', '47-3147567', 2, '07346 042 351', 'Girlfriend', 'Brnaby Hilhouse'),
('83-1009344', 'Eba Fiander', '0094 Fallview Terrace', 61818.38, '1993-10-17', 'nf421951o', '93-5661312', 3, '07964 772 320', 'Husband', 'Emmet Speedy'),
('83-1217063', 'Viola Holleran', '877 Twin Pines Plaza', 94882.77, '1984-03-23', 'zb232750v', '47-3147567', 2, '07224 909 347', 'Civil Partner', 'Francois Goodrick'),
('83-3514873', 'Roscoe Honeyghan', '89 Golden Leaf Drive', 93281.9, '1977-11-11', 'lv730967l', '54-9522118', 3, '07455 760 917', 'Boyfriend', 'Ferrell Scruton'),
('83-4865660', 'Jase Fulk', '80 Pennsylvania Center', 90529.95, '1984-03-29', 'ak984038n', '65-1738561', 4, '07545 233 448', 'Father', 'Rosabella Howlin'),
('83-5537250', 'Arly Bartolommeo', '759 Esch Way', 67921.89, '1960-02-12', 'la176569w', '33-1897506', 3, '07596 027 218', 'Wife', 'Dickie Prophet'),
('83-6435523', 'Bevan Durrell', '18 Butternut Road', 24202.05, '1950-02-09', 'wa954782v', '54-9522118', 3, '07427 006 306', 'Mother', 'Cris Melladew'),
('83-7810679', 'Davie Cutill', '61998 Fisk Lane', 92319.52, '1961-12-28', 'xq363276d', '73-2251057', 3, '07685 967 303', 'Husband', 'Michale Kluger'),
('84-0386773', 'Nady Yvens', '84 Mayer Court', 82751.39, '1993-05-26', 'rs150649p', '33-1897506', 2, '07654 630 110', 'Husband', 'Randall Corriea'),
('84-3457422', 'Ernestus Dewsnap', '937 Springs Road', 65304.51, '1963-09-14', 'xe947994r', '33-1897506', 2, '07427 129 714', 'Mother', 'Dixie Glazebrook'),
('84-3853067', 'Bianka Druce', '5 Pierstorff Plaza', 98768.78, '1955-02-28', 'xa610379g', '74-0303597', 1, '07055 302 769', 'Civil Partner', 'Marlie Schwaiger'),
('84-5153657', 'Catharine Sharpous', '081 Hermina Trail', 98273.9, '1983-08-10', 'vg979335t', '87-6633787', 2, '07692 458 187', 'Wife', 'Hamnet Hamly'),
('84-8762859', 'Hewett Collcutt', '453 Emmet Center', 21438.35, '1953-07-05', 'nk424390j', '83-4865660', 2, '07044 089 640', 'Father', 'Izzy Ahlf'),
('84-9275069', 'Julina Copnar', '8 Randy Court', 55255.85, '1991-06-01', 'xd785936e', '82-6558984', 2, '07387 875 939', 'Husband', 'Rozelle McCullouch'),
('85-0601601', 'Dotti Busek', '32564 Veith Circle', 12043.56, '1984-06-06', 'xc467370v', '74-0303597', 1, '07503 037 843', 'Husband', 'Adam Roderighi'),
('85-3334513', 'Benita Taffarello', '89784 Hollow Ridge Avenue', 58884.21, '1991-11-24', 'op270447a', '06-2857563', 2, '07385 290 163', 'Mother', 'Bron Danby'),
('85-4557957', 'Barr Eefting', '234 Susan Lane', 44265.6, '1976-11-12', 'ju063558q', '83-4865660', 3, '07512 743 229', 'Boyfriend', 'Charla Crickmore'),
('85-5431069', 'Marney Kolak', '5 Merrick Road', 97251.7, '1978-10-15', 'xb125807v', '82-6558984', 1, '07932 036 011', 'Husband', 'Murielle Suett'),
('85-7355238', 'Kial Labden', '55507 Bultman Circle', 39885.17, '1998-03-07', 'ux496294h', '93-5661312', 3, '07362 630 943', 'Father', 'Jennee Costock'),
('85-7718619', 'Rhody Yaxley', '90344 Merrick Crossing', 98055.42, '1983-01-24', 'of102924m', '87-8002965', 1, '07915 649 295', 'Girlfriend', 'Margot Santos'),
('86-1870935', 'Gwynne Garrow', '2648 Old Gate Circle', 66379.47, '2000-03-21', 'ds178316s', '29-2364794', 2, '07838 716 945', 'Father', 'Philis Gulleford'),
('86-2503827', 'Nikola Henbury', '8116 Erie Junction', 95300.54, '1968-03-28', 'cz046288u', '74-0303597', 2, '07761 255 990', 'Mother', 'Jone Tatersale'),
('86-5274202', 'Holden Artharg', '61 Vera Crossing', 55750.53, '1971-08-11', 'cw848240k', '83-4865660', 3, '07927 318 789', 'Girlfriend', 'George Barczynski'),
('87-1470903', 'Stafani Clampe', '8 Bultman Avenue', 28092.26, '1954-05-05', 'vu807135v', '74-0303597', 3, '07866 974 051', 'Boyfriend', 'Toma Van\'t Hoff'),
('87-1949652', 'Malcolm Louys', '2 Ronald Regan Pass', 72398.03, '1996-02-13', 'wu157014q', '54-9522118', 2, '07865 407 286', 'Mother', 'Lelia Heppenspall'),
('87-3376412', 'Michaela Shrieve', '78 Raven Road', 70070.27, '1958-10-13', 'jn422060l', '74-0303597', 2, '07427 564 348', 'Civil Partner', 'Valaree Treadgold'),
('87-4453963', 'Sibeal Fullard', '6296 Pleasure Road', 46783.79, '1978-12-16', 'er088315j', '87-8002965', 2, '07316 951 272', 'Girlfriend', 'Nonie Ledgard'),
('87-6633787', 'Vivie Jagels', '77 Dovetail Drive', 41830.5, '1964-12-06', 'sm423704x', '87-8002965', 4, '07220 743 776', 'Mother', 'Cassandra Merle'),
('87-7188668', 'Salli Oulner', '26 Pepper Wood Parkway', 90004.65, '1957-10-24', 'kt389837b', '74-0303597', 1, '07453 022 869', 'Husband', 'Kane Piers'),
('87-8002965', 'Fredericka Mathivat', '370 Mendota Court', 68554.76, '1989-04-17', 'rp358778t', '76-2985832', 4, '07726 563 483', 'Mother', 'Reeba Lamartine'),
('87-8745898', 'Harwell Lain', '11 Bartelt Terrace', 60453.87, '1978-01-31', 'yz604658j', '87-6633787', 3, '07930 606 296', 'Girlfriend', 'Elston Loins'),
('87-8762204', 'Patric Izsak', '02 Comanche Place', 65976.34, '1959-09-10', 'lb704495e', '82-6558984', 3, '07352 836 056', 'Girlfriend', 'Alikee O\'Malley'),
('88-4435308', 'Cedric Chazotte', '77 Ilene Parkway', 84591.95, '1965-07-07', 'ji880896f', '74-0303597', 3, '07787 734 288', 'Father', 'Friedrich Howsego'),
('89-0022888', 'Nelli Esche', '78814 Summer Ridge Court', 15353.78, '1994-01-04', 'nr398078m', '66-0739491', 3, '07629 867 802', 'Husband', 'Essa Sor'),
('89-1889473', 'Alysa Marley', '0906 Duke Point', 79091.5, '1988-05-14', 'ap444024o', '87-8002965', 3, '07158 470 617', 'Girlfriend', 'Pattie Bohl'),
('89-4176534', 'Conni Orhrt', '92 Moose Park', 14137.68, '2000-05-09', 'ui092814r', '54-9522118', 2, '07613 479 105', 'Father', 'Zaneta Shrubb'),
('89-4884561', 'Wynn Winterscale', '931 Warbler Road', 76837.12, '1989-12-12', 'us493269a', '65-1738561', 1, '07174 233 681', 'Mother', 'Welbie Hearon'),
('89-5714177', 'Bobbye Pottinger', '4633 Scott Street', 99191.41, '1953-12-04', 'vy437276r', '83-4865660', 3, '07569 513 210', 'Girlfriend', 'Budd Follacaro'),
('89-6058656', 'Yorgos Philippard', '8976 Dakota Terrace', 60909.78, '1968-07-13', 'bu861195y', '87-8002965', 2, '07346 373 537', 'Wife', 'Violet Doutch'),
('90-0686303', 'Ludovika Blucher', '0141 Forest Alley', 59728.01, '1956-01-13', 'sk016695u', '65-1738561', 3, '07473 391 474', 'Civil Partner', 'Wain Savine'),
('90-1403954', 'Jeffy Camel', '067 Columbus Street', 78815.19, '1987-11-19', 'ql321121l', '76-2985832', 3, '07792 234 252', 'Father', 'Vinnie Parr'),
('90-3945672', 'Lianna Seden', '655 Superior Alley', 37009.12, '1964-07-19', 'jt347163f', '65-1738561', 2, '07903 181 488', 'Boyfriend', 'Jacenta Slimme'),
('90-5035577', 'Isacco Chaperling', '71120 West Crossing', 81126.94, '1975-11-03', 'sn878406k', '74-0303597', 1, '07583 588 628', 'Husband', 'Cindelyn Gallant'),
('90-6409982', 'Irv Tomsen', '0 Harper Way', 66852.98, '1995-08-05', 'ms059474n', '87-6633787', 2, '07448 190 979', 'Mother', 'Krissy Clayworth'),
('90-9258513', 'Yank Mullan', '94728 5th Center', 82932.31, '1986-01-25', 'is015669m', '33-1897506', 3, '07878 023 821', 'Girlfriend', 'Cornie Moodie'),
('92-9480837', 'Phyllis Lalevee', '77169 Sullivan Crossing', 38220.79, '1962-03-06', 'wh734079v', '82-6558984', 2, '07493 025 274', 'Father', 'Tallie Huggon'),
('92-9623071', 'Wait Prate', '0367 Moose Hill', 95732.18, '2000-08-24', 'bn415170d', '47-3147567', 2, '07291 039 769', 'Boyfriend', 'Umberto Mulrooney'),
('92-9715314', 'Larissa Holtham', '8751 Hoepker Circle', 97254.38, '1969-01-15', 'bt371843i', '87-8002965', 2, '07484 895 380', 'Mother', 'Frasquito Legerwood'),
('93-0686984', 'Dirk Perrott', '679 Summer Ridge Road', 82551.62, '1995-10-17', 'jc445141x', '66-0739491', 2, '07946 591 368', 'Mother', 'Sansone Harragin'),
('93-5661312', 'Gordie Gaynesford', '4 Fordem Circle', 67381.57, '1986-10-24', 'hm085014v', '66-0739491', 4, '07058 101 214', 'Husband', 'Granville Hacket'),
('93-5928498', 'Sukey Roddan', '5 Gulseth Center', 18304.57, '1979-04-06', 'ik578743b', '93-5661312', 3, '07415 773 406', 'Boyfriend', 'Wanids Dunckley'),
('93-8667645', 'Marna Abramski', '6 Scoville Pass', 13595.15, '1985-10-15', 'gj588599m', '47-3147567', 1, '07345 068 432', 'Civil Partner', 'Carling Jell'),
('94-4705277', 'Orton Willmore', '4 Pine View Street', 14870.36, '1985-01-31', 'xh603239m', '73-2251057', 2, '07149 504 735', 'Civil Partner', 'Timothy Reck'),
('94-6907133', 'Alica Barthel', '80231 Twin Pines Center', 82703, '1987-09-02', 'mw080326p', '83-4865660', 2, '07620 698 046', 'Civil Partner', 'Torrence Fowells'),
('95-1174328', 'Heath Manvell', '77 Westridge Road', 29749.03, '1970-02-28', 'ub404168r', '93-5661312', 2, '07513 042 679', 'Father', 'Ham Snalum'),
('95-1790755', 'Staford Klarzynski', '02676 Mesta Junction', 62596.85, '1951-03-09', 'lw151180l', '73-2251057', 2, '07320 940 413', 'Girlfriend', 'Sayre Faint'),
('95-3517999', 'Garald Greenrde', '15302 Independence Drive', 56092.8, '1975-09-04', 'hp673805w', '06-2857563', 3, '07142 015 007', 'Girlfriend', 'Caryl Coyle'),
('95-7092127', 'Dulciana Duxfield', '44249 Westridge Drive', 62408.05, '1964-10-18', 'do305555k', '93-5661312', 3, '07001 392 333', 'Mother', 'Lee Burt'),
('96-0987852', 'Nataline Roycroft', '52339 Eastlawn Crossing', 81005.05, '1967-06-04', 'rc734008g', '76-2985832', 3, '07194 408 632', 'Father', 'Danny Heinsen'),
('96-1648398', 'Hugues Tavner', '78 Parkside Point', 37393.68, '1980-12-03', 'va219127u', '29-2364794', 2, '07936 699 391', 'Boyfriend', 'Tobe Vazquez'),
('97-0147786', 'Haze Rosenbush', '0 Kropf Alley', 89561.58, '1995-11-10', 'wx774255i', '82-6558984', 1, '07244 882 292', 'Husband', 'Joanie Scholtz'),
('97-0913105', 'Kelly Farragher', '6 Meadow Vale Trail', 52644.35, '1980-10-20', 'ob677832o', '54-9522118', 1, '07473 173 088', 'Boyfriend', 'Zaria Tallet'),
('97-3138911', 'Alvina Paterno', '09 Golf Drive', 23002.76, '1986-06-21', 'ao592540g', '87-8002965', 2, '07113 310 488', 'Wife', 'Sal Bruckstein'),
('97-3703178', 'Thatch Kinvig', '9 Fuller Street', 31866.49, '1983-03-16', 'gm065123w', '35-7212754', 1, '07100 728 296', 'Girlfriend', 'Mike Tiron'),
('97-4110845', 'Judah Groomebridge', '1714 Clyde Gallagher Point', 52171.58, '1959-10-25', 'kc825703y', '83-4865660', 1, '07460 150 758', 'Civil Partner', 'Asher Ferrarotti'),
('97-5558458', 'Sarina Kalb', '565 Annamark Alley', 45859.99, '1950-11-14', 'qu905290s', '29-2364794', 3, '07455 033 890', 'Girlfriend', 'Perla Sokill'),
('97-5683996', 'Cornie Hub', '564 Muir Alley', 13017.59, '1999-04-01', 'vs049545n', '87-8002965', 2, '07035 959 026', 'Civil Partner', 'Darci Milbourne'),
('97-6528129', 'Darn O\'Lunny', '228 Porter Street', 23811.76, '1962-06-23', 'ai316031z', '66-0739491', 2, '07190 067 060', 'Husband', 'Eilis Decent'),
('97-9018441', 'Morganica Dracksford', '867 Pierstorff Hill', 91483.69, '1986-08-03', 'po115732f', '73-2251057', 2, '07675 154 777', 'Civil Partner', 'Rorie Silverton'),
('98-1678319', 'Lamar Chesters', '2234 Heffernan Place', 97090.47, '1952-02-01', 'wh660279o', '82-6558984', 2, '07007 723 133', 'Wife', 'Maryjo Elgie'),
('98-3556505', 'Douglas MacArdle', '14 Laurel Court', 92356.56, '1991-07-15', 'wk661827y', '65-1738561', 2, '07652 112 844', 'Wife', 'Lynsey Moraleda'),
('98-4762907', 'Nari Crawshaw', '40 Debra Center', 91733.92, '1992-03-21', 'kd444344u', '06-2857563', 2, '07888 475 034', 'Civil Partner', 'Ewart Benton'),
('98-9650752', 'Alene Amiss', '07913 Jenna Trail', 94129.62, '1977-08-25', 'hm391563j', '74-0303597', 3, '07854 566 028', 'Civil Partner', 'Cristina Ervine'),
('99-0222188', 'Lonnie Niessen', '754 Lien Road', 95600.64, '1977-04-12', 'gb123108s', '87-8002965', 3, '07512 219 266', 'Wife', 'Ashley Jeenes'),
('99-1372878', 'Annnora Leabeater', '931 Waxwing Pass', 84021.43, '1962-07-22', 'zy295345w', '65-1738561', 1, '07049 508 215', 'Father', 'Leena Gorry'),
('99-4615801', 'Meggi Abbado', '3078 Hoffman Junction', 50699.73, '1966-02-17', 'kv498760u', '35-7212754', 2, '07326 764 405', 'Boyfriend', 'Mikey Vedeniktov'),
('99-4988360', 'Carlie Braganza', '806 Sachs Parkway', 31442.08, '1964-05-16', 'ev422969a', '65-1738561', 3, '07302 069 966', 'Civil Partner', 'Hadleigh Twining'),
('99-6209168', 'Renaud Skpsey', '4430 Fieldstone Alley', 44136.49, '2002-01-26', 'tm559297a', '87-6633787', 1, '07754 815 231', 'Girlfriend', 'Clotilda Blues');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `insert_termination_audit` BEFORE DELETE ON `employee` FOR EACH ROW INSERT INTO terminationaudit(dateTerminated, timeTerminated, terminatedEmpNumber, terminatingEmpNumber)
    VALUES(CURRENT_DATE, CURRENT_TIME, OLD.Number, OLD.ManagerEmpNumber)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `new_manager` AFTER INSERT ON `employee` FOR EACH ROW IF NEW.departmentNumber = 4 THEN
        INSERT INTO manager
        VALUES(NEW.Number, NEW.Name);
    END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `EmployeeNumber` int NOT NULL,
  `WeekStartDate` date NOT NULL,
  `HoursWorked` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hrspecialist`
--

CREATE TABLE `hrspecialist` (
  `EmployeeNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `EmployeeNumber` varchar(20) NOT NULL,
  `Name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`EmployeeNumber`, `Name`) VALUES
('06-2857563', 'Osgood Sutherby'),
('29-2364794', 'Guido Hoopper'),
('33-1897506', 'Verla Seacroft'),
('35-7212754', 'Dorian Claringbold'),
('47-3147567', 'Britta Northin'),
('54-9522118', 'Nari Chowne'),
('65-1738561', 'Say Lodwig'),
('66-0739491', 'Latashia McGaugan'),
('73-2251057', 'Lodovico Ashborne'),
('74-0303597', 'Bria Thomkins'),
('76-2985832', 'Desirae Gooch'),
('82-6558984', 'Hebert Zaniolini'),
('83-4865660', 'Jase Fulk'),
('87-6633787', 'Vivie Jagels'),
('87-8002965', 'Fredericka Mathivat'),
('93-5661312', 'Gordie Gaynesford');

-- --------------------------------------------------------

--
-- Table structure for table `orderproducts`
--

CREATE TABLE `orderproducts` (
  `ProductId` int NOT NULL,
  `OrderId` int NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderr`
--

CREATE TABLE `orderr` (
  `Id` int NOT NULL,
  `Date` date NOT NULL,
  `CustomerId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `Name` varchar(200) NOT NULL,
  `StartingLocationAddress` varchar(1000) NOT NULL,
  `EndLocationAddress` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routestop`
--

CREATE TABLE `routestop` (
  `StopDateTime` timestamp NOT NULL,
  `RouteName` varchar(200) NOT NULL,
  `Address` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terminationaudit`
--

CREATE TABLE `terminationaudit` (
  `terminatedEmpNumber` varchar(20) NOT NULL,
  `terminatingEmpNumber` varchar(20) DEFAULT NULL,
  `dateTerminated` date NOT NULL,
  `timeTerminated` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `terminationaudit`
--

INSERT INTO `terminationaudit` (`terminatedEmpNumber`, `terminatingEmpNumber`, `dateTerminated`, `timeTerminated`) VALUES
('01-6146269', '33-1897506', '2022-11-24', '17:47:40'),
('55-3623151', '76-2985832', '2022-11-24', '17:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Id` int NOT NULL,
  `Area` varchar(200) NOT NULL,
  `Name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Id` int NOT NULL,
  `Size` bigint NOT NULL,
  `Purpose` enum('General') NOT NULL,
  `BuildingId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `HandlerEmployeeNumber` (`HandlerEmployeeNumber`);

--
-- Indexes for table `complaintreason`
--
ALTER TABLE `complaintreason`
  ADD PRIMARY KEY (`ComplaintNumber`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentNumber`),
  ADD KEY `ManagerEmployeeNumber` (`ManagerEmployeeNumber`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`EmployeeNumber`);

--
-- Indexes for table `driverassignment`
--
ALTER TABLE `driverassignment`
  ADD PRIMARY KEY (`VehicleId`,`Date`),
  ADD KEY `DriverEmployeeNumber` (`DriverEmployeeNumber`),
  ADD KEY `RouteName` (`RouteName`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `ManagerEmpNumber` (`ManagerEmpNumber`),
  ADD KEY `DepartmentNumber` (`DepartmentNumber`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD PRIMARY KEY (`EmployeeNumber`,`WeekStartDate`);

--
-- Indexes for table `hrspecialist`
--
ALTER TABLE `hrspecialist`
  ADD PRIMARY KEY (`EmployeeNumber`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`EmployeeNumber`);

--
-- Indexes for table `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD PRIMARY KEY (`ProductId`,`OrderId`),
  ADD KEY `OrderId` (`OrderId`);

--
-- Indexes for table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `CustomerId` (`CustomerId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `routestop`
--
ALTER TABLE `routestop`
  ADD KEY `RouteName` (`RouteName`);

--
-- Indexes for table `terminationaudit`
--
ALTER TABLE `terminationaudit`
  ADD PRIMARY KEY (`terminatedEmpNumber`,`dateTerminated`,`timeTerminated`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BuildingId` (`BuildingId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderr`
--
ALTER TABLE `orderr`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaint`
--
ALTER TABLE `complaint`
  ADD CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`HandlerEmployeeNumber`) REFERENCES `hrspecialist` (`EmployeeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `complaintreason`
--
ALTER TABLE `complaintreason`
  ADD CONSTRAINT `complaintreason_ibfk_1` FOREIGN KEY (`ComplaintNumber`) REFERENCES `complaint` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`ManagerEmployeeNumber`) REFERENCES `manager` (`EmployeeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `driverassignment`
--
ALTER TABLE `driverassignment`
  ADD CONSTRAINT `driverassignment_ibfk_1` FOREIGN KEY (`DriverEmployeeNumber`) REFERENCES `driver` (`EmployeeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `driverassignment_ibfk_2` FOREIGN KEY (`RouteName`) REFERENCES `route` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ManagerEmpNumber`) REFERENCES `manager` (`EmployeeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`DepartmentNumber`) REFERENCES `department` (`DepartmentNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `hours_ibfk_1` FOREIGN KEY (`EmployeeNumber`) REFERENCES `driver` (`EmployeeNumber`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD CONSTRAINT `orderproducts_ibfk_1` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `orderproducts_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `orderr` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderr`
--
ALTER TABLE `orderr`
  ADD CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `routestop`
--
ALTER TABLE `routestop`
  ADD CONSTRAINT `routestop_ibfk_1` FOREIGN KEY (`RouteName`) REFERENCES `route` (`Name`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`BuildingId`) REFERENCES `building` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
