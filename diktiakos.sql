-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 24 Σεπ 2018 στις 20:15:20
-- Έκδοση διακομιστή: 10.1.35-MariaDB
-- Έκδοση PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `diktiakos`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `admin_center`
--

CREATE TABLE `admin_center` (
  `id_user` int(5) NOT NULL,
  `id_center` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `admin_center`
--

INSERT INTO `admin_center` (`id_user`, `id_center`) VALUES
(8, 1),
(4, 1),
(9, 1),
(11, 1),
(13, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `questions`
--

CREATE TABLE `questions` (
  `id` int(5) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `questions`
--

INSERT INTO `questions` (`id`, `question`, `answer`) VALUES
(9, 'Java is a tool for a manager.', 'False'),
(12, 'Computer is a game', 'False'),
(13, 'C++ is easy', 'False'),
(14, 'AMD hardware is expensive', 'False'),
(15, 'Smartphones have no gps function', 'False'),
(16, 'Laravel is a php framework', 'True'),
(17, 'Monitors and TV monitors are the same thing', 'False'),
(18, 'Mysql is a database language', 'True'),
(19, 'Nvidia is a company that makes GPUs', 'True'),
(20, 'BGP is a inter AS protocol.', 'False'),
(21, 'OSPF protocol uses the Dijkstra algorithm', 'True'),
(22, 'Alan Turing is primitive figure in IT', 'True'),
(23, 'HTML is not a programming language', 'True');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `quest_ans`
--

CREATE TABLE `quest_ans` (
  `id` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `id_q` int(5) NOT NULL,
  `answer` varchar(10) NOT NULL,
  `trueanswer` varchar(10) NOT NULL,
  `time` varchar(7) NOT NULL,
  `exam_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `quest_ans`
--

INSERT INTO `quest_ans` (`id`, `username`, `id_q`, `answer`, `trueanswer`, `time`, `exam_id`) VALUES
(6, 'fragos', 22, 'True', 'True', '', 3),
(7, 'fragos', 13, 'True', 'False', '01:00', 3),
(8, 'fragos', 20, 'True', 'False', '00:59', 3),
(9, 'fragos', 17, 'True', 'False', '00:58', 3),
(10, 'fragos', 21, 'True', 'True', '00:57', 3),
(11, 'kwstas', 23, 'False', 'True', '00:58', 4),
(12, 'kwstas', 12, 'True', 'False', '00:57', 4),
(13, 'kwstas', 15, 'True', 'False', '00:56', 4),
(14, 'kwstas', 19, 'True', 'True', '00:55', 4),
(15, 'kwstas', 21, 'True', 'True', '00:54', 4),
(16, 'fragos', 18, 'False', 'True', '00:58', 3),
(17, 'fragos', 21, 'True', 'True', '00:57', 3),
(18, 'fragos', 15, 'True', 'False', '00:57', 3),
(19, 'fragos', 20, 'True', 'False', '00:56', 3),
(20, 'fragos', 22, 'True', 'True', '00:55', 3);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `test`
--

CREATE TABLE `test` (
  `id` int(5) NOT NULL,
  `date` varchar(60) NOT NULL,
  `test_c_id` int(5) NOT NULL,
  `flag` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `test`
--

INSERT INTO `test` (`id`, `date`, `test_c_id`, `flag`) VALUES
(3, '2018-09-12T14:00', 1, 1),
(4, '2018-09-13T16:05', 1, 1),
(5, '2018-09-14T02:03', 2, 0),
(6, '2018-10-20T19:00', 1, 1);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `test_center`
--

CREATE TABLE `test_center` (
  `id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `test_center`
--

INSERT INTO `test_center` (`id`, `name`, `address`) VALUES
(1, 'TEI Athens', 'Street 100'),
(2, 'Hilton Hotel', 'Address 200'),
(3, 'PDA', 'PDA 100');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `admin_system` tinyint(1) NOT NULL DEFAULT '0',
  `admin_center` tinyint(1) NOT NULL DEFAULT '0',
  `eksetasi_id` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `admin_system`, `admin_center`, `eksetasi_id`) VALUES
(1, 'lefos', 'lefos13', 1, 0, 4),
(2, 'kwstas', 'kwstas', 0, 0, -1),
(3, 'petros', 'petros', 0, 1, 0),
(6, 'fragos', 'fragos', 0, 0, -1),
(8, 'lola', 'lola', 0, 1, 0),
(11, 'marios', 'marios', 0, 1, 3),
(12, 'pavlos', 'pavlos', 0, 0, 0),
(13, 'kuriakos', 'kuriakos', 0, 1, 0);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `quest_ans`
--
ALTER TABLE `quest_ans`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `test_center`
--
ALTER TABLE `test_center`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT για πίνακα `quest_ans`
--
ALTER TABLE `quest_ans`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT για πίνακα `test`
--
ALTER TABLE `test`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT για πίνακα `test_center`
--
ALTER TABLE `test_center`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT για πίνακα `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
