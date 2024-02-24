-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2024 at 11:37 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_galeri_haura`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_album`
--

CREATE TABLE `tb_album` (
  `Album_id` int(11) NOT NULL,
  `Nama_album` varchar(255) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Tanggal_dibuat` date NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_foto`
--

CREATE TABLE `tb_foto` (
  `Foto_id` int(11) NOT NULL,
  `Judul_foto` varchar(255) NOT NULL,
  `Deskripsi_foto` text NOT NULL,
  `Tanggal_unggah` date NOT NULL,
  `Lokasi_file` varchar(255) NOT NULL,
  `Album_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_komentarfoto`
--

CREATE TABLE `tb_komentarfoto` (
  `Komentar_id` int(11) NOT NULL,
  `Foto_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Isi_komentar` text NOT NULL,
  `Tanggal_komrntar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_likefoto`
--

CREATE TABLE `tb_likefoto` (
  `Like_id` int(11) NOT NULL,
  `Foto_id` int(11) NOT NULL,
  `User_id` int(11) NOT NULL,
  `Tanggal_like` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb _user`
--

CREATE TABLE `tb _user` (
  `User_id` int(11) NOT NULL,
  `Username_id` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Nama_lengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD PRIMARY KEY (`Album_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `User_id_2` (`User_id`),
  ADD KEY `User_id_3` (`User_id`);

--
-- Indexes for table `tb_foto`
--
ALTER TABLE `tb_foto`
  ADD PRIMARY KEY (`Foto_id`),
  ADD KEY `Album_id` (`Album_id`),
  ADD KEY `Foto_id` (`Foto_id`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `tb_komentarfoto`
--
ALTER TABLE `tb_komentarfoto`
  ADD PRIMARY KEY (`Komentar_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Foto_id` (`Foto_id`);

--
-- Indexes for table `tb_likefoto`
--
ALTER TABLE `tb_likefoto`
  ADD PRIMARY KEY (`Like_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `User_id_2` (`User_id`),
  ADD KEY `Foto_id` (`Foto_id`);

--
-- Indexes for table `tb _user`
--
ALTER TABLE `tb _user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `User_id` (`User_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_album`
--
ALTER TABLE `tb_album`
  MODIFY `Album_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_foto`
--
ALTER TABLE `tb_foto`
  MODIFY `Foto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_komentarfoto`
--
ALTER TABLE `tb_komentarfoto`
  MODIFY `Komentar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_likefoto`
--
ALTER TABLE `tb_likefoto`
  MODIFY `Like_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb _user`
--
ALTER TABLE `tb _user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_album`
--
ALTER TABLE `tb_album`
  ADD CONSTRAINT `tb_album_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `tb _user` (`User_id`);

--
-- Constraints for table `tb_foto`
--
ALTER TABLE `tb_foto`
  ADD CONSTRAINT `tb_foto_ibfk_1` FOREIGN KEY (`Album_id`) REFERENCES `tb_album` (`Album_id`),
  ADD CONSTRAINT `tb_foto_ibfk_2` FOREIGN KEY (`Foto_id`) REFERENCES `tb_komentarfoto` (`Foto_id`);

--
-- Constraints for table `tb_komentarfoto`
--
ALTER TABLE `tb_komentarfoto`
  ADD CONSTRAINT `tb_komentarfoto_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `tb_foto` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_likefoto`
--
ALTER TABLE `tb_likefoto`
  ADD CONSTRAINT `tb_likefoto_ibfk_2` FOREIGN KEY (`User_id`) REFERENCES `tb _user` (`User_id`),
  ADD CONSTRAINT `tb_likefoto_ibfk_3` FOREIGN KEY (`Foto_id`) REFERENCES `tb_foto` (`Foto_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb _user`
--
ALTER TABLE `tb _user`
  ADD CONSTRAINT `tb _user_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `tb_komentarfoto` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
