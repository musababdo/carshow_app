-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 22, 2023 at 04:51 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carshow`
--

-- --------------------------------------------------------

--
-- Table structure for table `body_condition`
--

CREATE TABLE `body_condition` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `body_condition`
--

INSERT INTO `body_condition` (`id`, `name_ar`, `name_en`) VALUES
(2, 'جيده', 'Perfect');

-- --------------------------------------------------------

--
-- Table structure for table `body_type`
--

CREATE TABLE `body_type` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `body_type`
--

INSERT INTO `body_type` (`id`, `name_ar`, `name_en`) VALUES
(2, 'كوبي', 'Coupe');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `make` varchar(15) NOT NULL,
  `model` varchar(15) NOT NULL,
  `trim` varchar(15) NOT NULL,
  `regional_specs_ar` varchar(50) NOT NULL,
  `regional_specs_en` varchar(50) NOT NULL,
  `year` varchar(10) NOT NULL,
  `kilometers` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `fuel_type_ar` varchar(50) NOT NULL,
  `fuel_type_en` varchar(50) NOT NULL,
  `body_condition_ar` varchar(100) NOT NULL,
  `body_condition_en` varchar(100) NOT NULL,
  `mech_condition_ar` varchar(100) NOT NULL,
  `mech_condition_en` varchar(100) NOT NULL,
  `exterior_color_ar` varchar(20) NOT NULL,
  `exterior_color_en` varchar(20) NOT NULL,
  `interior_color_ar` varchar(20) NOT NULL,
  `interior_color_en` varchar(20) NOT NULL,
  `doors_ar` varchar(50) NOT NULL,
  `doors_en` varchar(50) NOT NULL,
  `no_of_cylinder_ar` varchar(15) NOT NULL,
  `no_of_cylinder_en` varchar(15) NOT NULL,
  `transmission_type_ar` varchar(100) NOT NULL,
  `transmission_type_en` varchar(100) NOT NULL,
  `body_type_ar` varchar(100) NOT NULL,
  `body_type_en` varchar(100) NOT NULL,
  `horsepower_ar` varchar(50) NOT NULL,
  `horsepower_en` varchar(50) NOT NULL,
  `steering_side_ar` varchar(50) NOT NULL,
  `steering_side_en` varchar(50) NOT NULL,
  `extras_ar` text DEFAULT NULL,
  `extras_en` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `isfavorite` int(11) NOT NULL DEFAULT 0,
  `date` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `a_id`, `make`, `model`, `trim`, `regional_specs_ar`, `regional_specs_en`, `year`, `kilometers`, `price`, `number`, `fuel_type_ar`, `fuel_type_en`, `body_condition_ar`, `body_condition_en`, `mech_condition_ar`, `mech_condition_en`, `exterior_color_ar`, `exterior_color_en`, `interior_color_ar`, `interior_color_en`, `doors_ar`, `doors_en`, `no_of_cylinder_ar`, `no_of_cylinder_en`, `transmission_type_ar`, `transmission_type_en`, `body_type_ar`, `body_type_en`, `horsepower_ar`, `horsepower_en`, `steering_side_ar`, `steering_side_en`, `extras_ar`, `extras_en`, `image`, `isfavorite`, `date`) VALUES
(30, 2, 'Acura', 'NSX', 'Other', 'المواصلات الامريكيه', 'American Specs', '2020', '2000', '20000', '20020202', 'بنزين', 'Petrol', 'جيده', 'Perfect', 'جيده', 'Perfect', 'الاسود', 'Black', 'احمر', 'Red', 'بابين', '2 Doors', '1', '1', 'يدوي', 'Manual', 'كوبي', 'Coupe', '100 - 200 HP', '100 - 200 HP', 'باليمين', 'Right', '', '', '[\"http://10.0.2.2/carshow/images/646b3e59ca59f.jpeg\",\"http://10.0.2.2/carshow/images/646b3e59ca9bf.jpeg\"]', 1, '22-05-2023 12:40:24 PM'),
(31, 2, 'Acura', 'NSX', 'Other', 'المواصلات الامريكيه', 'American Specs', '2002', '2000', '20000', '4884848', 'بنزين', 'Petrol', 'جيده', 'Perfect', 'جيده', 'Perfect', 'الاسود', 'Black', 'احمر', 'Red', 'بابين', '2 Doors', '1', '1', 'يدوي', 'Manual', 'كوبي', 'Coupe', '100 - 200 HP', '100 - 200 HP', 'باليمين', 'Right', 'arabic', 'english', '[\"http://10.0.2.2/carshow/images/646b80ab72da1.jpeg\"]', 0, '22-05-2023 05:15:17 PM');

-- --------------------------------------------------------

--
-- Table structure for table `doors`
--

CREATE TABLE `doors` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `doors`
--

INSERT INTO `doors` (`id`, `name_ar`, `name_en`) VALUES
(2, 'بابين', '2 Doors');

-- --------------------------------------------------------

--
-- Table structure for table `exterior_color`
--

CREATE TABLE `exterior_color` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `exterior_color`
--

INSERT INTO `exterior_color` (`id`, `name_ar`, `name_en`) VALUES
(2, 'الاسود', 'Black');

-- --------------------------------------------------------

--
-- Table structure for table `fuel_type`
--

CREATE TABLE `fuel_type` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fuel_type`
--

INSERT INTO `fuel_type` (`id`, `name_ar`, `name_en`) VALUES
(1, 'بنزين', 'Petrol');

-- --------------------------------------------------------

--
-- Table structure for table `horsepower`
--

CREATE TABLE `horsepower` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `horsepower`
--

INSERT INTO `horsepower` (`id`, `name_ar`, `name_en`) VALUES
(2, '100 - 200 HP', '100 - 200 HP');

-- --------------------------------------------------------

--
-- Table structure for table `interior_color`
--

CREATE TABLE `interior_color` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `interior_color`
--

INSERT INTO `interior_color` (`id`, `name_ar`, `name_en`) VALUES
(2, 'احمر', 'Red');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `block` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `type`, `block`) VALUES
(1, 'admin', '123', '', NULL),
(2, 'ali', '1234', 'Admin', 'غير محظور');

-- --------------------------------------------------------

--
-- Table structure for table `make`
--

CREATE TABLE `make` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `make`
--

INSERT INTO `make` (`id`, `name`) VALUES
(3, 'Acura'),
(4, 'BMW');

-- --------------------------------------------------------

--
-- Table structure for table `mechanical_condition`
--

CREATE TABLE `mechanical_condition` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mechanical_condition`
--

INSERT INTO `mechanical_condition` (`id`, `name_ar`, `name_en`) VALUES
(1, 'جيده', 'Perfect');

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

CREATE TABLE `model` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `make_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `name`, `make_id`) VALUES
(1, 'ILX', 3),
(2, 'NSX', 3),
(3, '1-Series', 4);

-- --------------------------------------------------------

--
-- Table structure for table `myimg`
--

CREATE TABLE `myimg` (
  `id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `myimg`
--

INSERT INTO `myimg` (`id`, `name`, `image`) VALUES
(90, NULL, '[\"http://10.0.2.2/carshow/images/646b316512be3.jpeg\",\"http://10.0.2.2/carshow/images/646b316512f34.jpeg\",\"http://10.0.2.2/carshow/images/646b316513004.jpeg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `no_of_cylinders`
--

CREATE TABLE `no_of_cylinders` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `no_of_cylinders`
--

INSERT INTO `no_of_cylinders` (`id`, `name_ar`, `name_en`) VALUES
(2, '1', '1'),
(3, '2', '2');

-- --------------------------------------------------------

--
-- Table structure for table `regional_spec`
--

CREATE TABLE `regional_spec` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `regional_spec`
--

INSERT INTO `regional_spec` (`id`, `name_ar`, `name_en`) VALUES
(3, 'المواصلات الامريكيه', 'American Specs');

-- --------------------------------------------------------

--
-- Table structure for table `steering_side`
--

CREATE TABLE `steering_side` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `steering_side`
--

INSERT INTO `steering_side` (`id`, `name_ar`, `name_en`) VALUES
(2, 'باليمين', 'Right');

-- --------------------------------------------------------

--
-- Table structure for table `transmission_type`
--

CREATE TABLE `transmission_type` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `transmission_type`
--

INSERT INTO `transmission_type` (`id`, `name_ar`, `name_en`) VALUES
(2, 'يدوي', 'Manual');

-- --------------------------------------------------------

--
-- Table structure for table `trim`
--

CREATE TABLE `trim` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `make_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `trim`
--

INSERT INTO `trim` (`id`, `name`, `make_id`, `model_id`) VALUES
(4, 'Other', 3, 2),
(5, '120i', 4, 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vcars`
-- (See below for the actual view)
--
CREATE TABLE `vcars` (
`id` int(11)
,`admin_name` varchar(50)
,`make` varchar(15)
,`model` varchar(15)
,`trim` varchar(15)
,`regional_specs_ar` varchar(50)
,`regional_specs_en` varchar(50)
,`year` varchar(10)
,`kilometers` varchar(50)
,`price` varchar(50)
,`number` varchar(20)
,`fuel_type_ar` varchar(50)
,`fuel_type_en` varchar(50)
,`body_condition_ar` varchar(100)
,`body_condition_en` varchar(100)
,`mech_condition_ar` varchar(100)
,`mech_condition_en` varchar(100)
,`exterior_color_ar` varchar(20)
,`exterior_color_en` varchar(20)
,`interior_color_ar` varchar(20)
,`interior_color_en` varchar(20)
,`doors_ar` varchar(50)
,`doors_en` varchar(50)
,`no_of_cylinder_ar` varchar(15)
,`no_of_cylinder_en` varchar(15)
,`transmission_type_ar` varchar(100)
,`transmission_type_en` varchar(100)
,`body_type_ar` varchar(100)
,`body_type_en` varchar(100)
,`horsepower_ar` varchar(50)
,`horsepower_en` varchar(50)
,`steering_side_ar` varchar(50)
,`steering_side_en` varchar(50)
,`extras_ar` text
,`extras_en` text
,`image` text
,`date` varchar(80)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vmodel`
-- (See below for the actual view)
--
CREATE TABLE `vmodel` (
`id` int(11)
,`name` varchar(10)
,`makename` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vtrim`
-- (See below for the actual view)
--
CREATE TABLE `vtrim` (
`id` int(11)
,`name` varchar(10)
,`makename` varchar(10)
,`modelname` varchar(10)
);

-- --------------------------------------------------------

--
-- Structure for view `vcars`
--
DROP TABLE IF EXISTS `vcars`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vcars`  AS SELECT `cars`.`id` AS `id`, `login`.`username` AS `admin_name`, `cars`.`make` AS `make`, `cars`.`model` AS `model`, `cars`.`trim` AS `trim`, `cars`.`regional_specs_ar` AS `regional_specs_ar`, `cars`.`regional_specs_en` AS `regional_specs_en`, `cars`.`year` AS `year`, `cars`.`kilometers` AS `kilometers`, `cars`.`price` AS `price`, `cars`.`number` AS `number`, `cars`.`fuel_type_ar` AS `fuel_type_ar`, `cars`.`fuel_type_en` AS `fuel_type_en`, `cars`.`body_condition_ar` AS `body_condition_ar`, `cars`.`body_condition_en` AS `body_condition_en`, `cars`.`mech_condition_ar` AS `mech_condition_ar`, `cars`.`mech_condition_en` AS `mech_condition_en`, `cars`.`exterior_color_ar` AS `exterior_color_ar`, `cars`.`exterior_color_en` AS `exterior_color_en`, `cars`.`interior_color_ar` AS `interior_color_ar`, `cars`.`interior_color_en` AS `interior_color_en`, `cars`.`doors_ar` AS `doors_ar`, `cars`.`doors_en` AS `doors_en`, `cars`.`no_of_cylinder_ar` AS `no_of_cylinder_ar`, `cars`.`no_of_cylinder_en` AS `no_of_cylinder_en`, `cars`.`transmission_type_ar` AS `transmission_type_ar`, `cars`.`transmission_type_en` AS `transmission_type_en`, `cars`.`body_type_ar` AS `body_type_ar`, `cars`.`body_type_en` AS `body_type_en`, `cars`.`horsepower_ar` AS `horsepower_ar`, `cars`.`horsepower_en` AS `horsepower_en`, `cars`.`steering_side_ar` AS `steering_side_ar`, `cars`.`steering_side_en` AS `steering_side_en`, `cars`.`extras_ar` AS `extras_ar`, `cars`.`extras_en` AS `extras_en`, `cars`.`image` AS `image`, `cars`.`date` AS `date` FROM (`cars` join `login` on(`cars`.`a_id` = `login`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vmodel`
--
DROP TABLE IF EXISTS `vmodel`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vmodel`  AS SELECT `model`.`id` AS `id`, `model`.`name` AS `name`, `make`.`name` AS `makename` FROM (`model` join `make` on(`model`.`make_id` = `make`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vtrim`
--
DROP TABLE IF EXISTS `vtrim`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vtrim`  AS SELECT `trim`.`id` AS `id`, `trim`.`name` AS `name`, `make`.`name` AS `makename`, `model`.`name` AS `modelname` FROM ((`trim` join `make` on(`trim`.`make_id` = `make`.`id`)) join `model` on(`trim`.`model_id` = `model`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `body_condition`
--
ALTER TABLE `body_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `body_type`
--
ALTER TABLE `body_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a_id` (`a_id`);

--
-- Indexes for table `doors`
--
ALTER TABLE `doors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exterior_color`
--
ALTER TABLE `exterior_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuel_type`
--
ALTER TABLE `fuel_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `horsepower`
--
ALTER TABLE `horsepower`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interior_color`
--
ALTER TABLE `interior_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mechanical_condition`
--
ALTER TABLE `mechanical_condition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `make_id` (`make_id`);

--
-- Indexes for table `myimg`
--
ALTER TABLE `myimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `no_of_cylinders`
--
ALTER TABLE `no_of_cylinders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regional_spec`
--
ALTER TABLE `regional_spec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `steering_side`
--
ALTER TABLE `steering_side`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmission_type`
--
ALTER TABLE `transmission_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trim`
--
ALTER TABLE `trim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `make_id` (`make_id`),
  ADD KEY `model_id` (`model_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `body_condition`
--
ALTER TABLE `body_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `body_type`
--
ALTER TABLE `body_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `doors`
--
ALTER TABLE `doors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exterior_color`
--
ALTER TABLE `exterior_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fuel_type`
--
ALTER TABLE `fuel_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `horsepower`
--
ALTER TABLE `horsepower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `interior_color`
--
ALTER TABLE `interior_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `make`
--
ALTER TABLE `make`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mechanical_condition`
--
ALTER TABLE `mechanical_condition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `model`
--
ALTER TABLE `model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myimg`
--
ALTER TABLE `myimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `no_of_cylinders`
--
ALTER TABLE `no_of_cylinders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regional_spec`
--
ALTER TABLE `regional_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `steering_side`
--
ALTER TABLE `steering_side`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transmission_type`
--
ALTER TABLE `transmission_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trim`
--
ALTER TABLE `trim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `login` (`id`);

--
-- Constraints for table `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `model_ibfk_1` FOREIGN KEY (`make_id`) REFERENCES `make` (`id`);

--
-- Constraints for table `trim`
--
ALTER TABLE `trim`
  ADD CONSTRAINT `trim_ibfk_1` FOREIGN KEY (`make_id`) REFERENCES `make` (`id`),
  ADD CONSTRAINT `trim_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
