-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 12, 2019 at 09:48 AM
-- Server version: 10.1.38-MariaDB-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adityaek_impal`
--

-- --------------------------------------------------------

--
-- Table structure for table `jual_kayu`
--

CREATE TABLE `jual_kayu` (
  `id_jual_kayu` int(6) NOT NULL,
  `id_kayu` int(6) DEFAULT NULL,
  `id_mebel` int(6) DEFAULT NULL,
  `id_supplier` int(6) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jual_kayu`
--

INSERT INTO `jual_kayu` (`id_jual_kayu`, `id_kayu`, `id_mebel`, `id_supplier`, `jumlah`, `tanggal`) VALUES
(500006, 200000, 400020, 100003, 10, '2018-11-15 13:36:09'),
(500007, 200000, 400021, 100003, 20, '2018-11-14 13:49:46'),
(500008, 200001, 400022, 100003, 5, '2018-11-16 13:52:03'),
(500009, 200021, 400023, 100003, 20, '2018-11-15 18:58:52'),
(500010, 200017, 400024, 100003, 30, '2018-11-18 22:00:28');

--
-- Triggers `jual_kayu`
--
DELIMITER $$
CREATE TRIGGER `jual_kayu_trigger` AFTER INSERT ON `jual_kayu` FOR EACH ROW BEGIN
	UPDATE kayu SET stok_kayu = stok_kayu - NEW.jumlah 
    WHERE id_kayu = NEW.id_kayu;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jual_mebel`
--

CREATE TABLE `jual_mebel` (
  `id_jual_mebel` int(6) NOT NULL,
  `id_mebel` int(6) DEFAULT NULL,
  `id_reseller` int(6) DEFAULT NULL,
  `id_toko` int(6) DEFAULT NULL,
  `jumlah_mebel` int(11) DEFAULT NULL,
  `tanggal_jual_mebel` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jual_mebel`
--

INSERT INTO `jual_mebel` (`id_jual_mebel`, `id_mebel`, `id_reseller`, `id_toko`, `jumlah_mebel`, `tanggal_jual_mebel`) VALUES
(700000, 400020, 600001, 300001, 5, '2018-11-17 20:41:46'),
(700001, 400021, 600001, 300001, 10, '2018-11-18 20:48:52'),
(700002, 400024, 600001, 300001, 10, '2018-12-13 01:26:13'),
(700003, 400020, 600001, 300001, 1, '2019-02-28 10:04:10'),
(700004, 400020, 600001, 300001, 2, '2019-04-02 02:47:44'),
(700005, 400020, 600001, 300001, 2, '2019-04-03 08:20:08'),
(700006, 400021, 600001, 300001, 2, '2019-04-03 08:20:21'),
(700007, 400024, 600001, 300001, 1, '2019-04-08 10:03:03'),
(700008, 400020, 600001, 300001, 3, '2019-04-12 08:36:30');

--
-- Triggers `jual_mebel`
--
DELIMITER $$
CREATE TRIGGER `jual_mebel_trigger` AFTER INSERT ON `jual_mebel` FOR EACH ROW BEGIN
	UPDATE mebel SET stok_mebel = stok_mebel - NEW.jumlah_mebel 
    WHERE id_mebel = NEW.id_mebel;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kayu`
--

CREATE TABLE `kayu` (
  `id_kayu` int(6) NOT NULL,
  `id_supplier` int(6) DEFAULT NULL,
  `nama_kayu` varchar(50) DEFAULT NULL,
  `ukuran_kayu` int(11) DEFAULT NULL,
  `deskripsi_kayu` text,
  `stok_kayu` int(11) DEFAULT NULL,
  `harga_kayu` int(11) DEFAULT NULL,
  `slug_kayu` varchar(150) DEFAULT NULL,
  `image_kayu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kayu`
--

INSERT INTO `kayu` (`id_kayu`, `id_supplier`, `nama_kayu`, `ukuran_kayu`, `deskripsi_kayu`, `stok_kayu`, `harga_kayu`, `slug_kayu`, `image_kayu`) VALUES
(200000, 100003, 'Jati', 5, 'Kayu tahan lama!', 70, 500000, 'kayu-kuat', 'jati.jpg'),
(200001, 100003, 'Pinus', 10, 'Kayu mantap!', 10, 400000, 'kayu-mantap', 'pinus.jpg'),
(200017, 100003, 'Glugu', 10, 'Bagus kayunya gan!', 15, 50000, 'glugu', 'glugu14.jpg'),
(200021, 100003, 'Merbau', 31, 'Kayu merbau asli!!!', 6, 200000, 'merbau', 'mebau.jpg'),
(200024, 100003, 'Gaharu', 8, 'Kayu kuat!', 129, 50000, 'gaharu', 'gaharu2.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mebel`
--

CREATE TABLE `mebel` (
  `id_mebel` int(6) NOT NULL,
  `nama_mebel` varchar(50) DEFAULT NULL,
  `ukuran_mebel` int(11) DEFAULT NULL,
  `deskripsi_mebel` text,
  `stok_mebel` int(11) DEFAULT NULL,
  `harga_mebel` int(11) DEFAULT NULL,
  `slug_mebel` varchar(150) DEFAULT NULL,
  `image_mebel` varchar(50) DEFAULT NULL,
  `id_toko` int(6) DEFAULT NULL,
  `id_kayu` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mebel`
--

INSERT INTO `mebel` (`id_mebel`, `nama_mebel`, `ukuran_mebel`, `deskripsi_mebel`, `stok_mebel`, `harga_mebel`, `slug_mebel`, `image_mebel`, `id_toko`, `id_kayu`) VALUES
(400020, 'Kursi Jati', 10, 'Desainnya mantap!', 7, 900000, 'kursi-jati', 'kursi_jati4.jpg', 300001, 200000),
(400021, 'Meja Jati', 15, 'Meja bagus!', 8, 400000, 'meja-jati', 'meja_jati2.jpg', 300001, 200000),
(400022, 'Meja Pinus', 5, 'Meja simpel dan sederhana!', 5, 200000, 'meja-pinus', 'meja_pinus.jpg', 300001, 200001),
(400023, 'Pintu Merbau', 10, 'Pintu anti maling!', 20, 2000000, 'pintu-merbau', 'pintu_merbau2.jpg', 300001, 200021),
(400024, 'Lemari Glugu', 10, 'Gulululugululguluglulglulu', 19, 1000000, 'lemari-glugu', 'lemari_glugu.jpg', 300001, 200017);

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
--

CREATE TABLE `reseller` (
  `id_reseller` int(6) NOT NULL,
  `user_reseller` varchar(30) DEFAULT NULL,
  `pass_reseller` varchar(30) DEFAULT NULL,
  `nama_reseller` varchar(50) DEFAULT NULL,
  `namabelakang_reseller` varchar(50) DEFAULT NULL,
  `email_reseller` varchar(50) DEFAULT NULL,
  `foto_reseller` varchar(20) DEFAULT NULL,
  `tentang_reseller` text,
  `kota_reseller` varchar(50) DEFAULT NULL,
  `negara_reseller` varchar(50) DEFAULT NULL,
  `kodepos_reseller` varchar(50) DEFAULT NULL,
  `kecamatan_reseller` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reseller`
--

INSERT INTO `reseller` (`id_reseller`, `user_reseller`, `pass_reseller`, `nama_reseller`, `namabelakang_reseller`, `email_reseller`, `foto_reseller`, `tentang_reseller`, `kota_reseller`, `negara_reseller`, `kodepos_reseller`, `kecamatan_reseller`) VALUES
(600001, 'user', 'user', 'yafie', 'sempol', 'johan@gmail.com', 'johan.jpg', 'Saya ganteng!', 'Pagar Alam', 'Indonesia', '66412', 'Fergusoaa');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(6) NOT NULL,
  `user_supplier` varchar(30) DEFAULT NULL,
  `pass_supplier` varchar(30) DEFAULT NULL,
  `nama_supplier` varchar(50) DEFAULT NULL,
  `namabelakang_supplier` varchar(50) DEFAULT NULL,
  `email_supplier` varchar(50) DEFAULT NULL,
  `foto_supplier` varchar(20) DEFAULT NULL,
  `tentang_supplier` text,
  `kota_supplier` varchar(50) DEFAULT NULL,
  `negara_supplier` varchar(50) DEFAULT NULL,
  `kodepos_supplier` varchar(50) DEFAULT NULL,
  `kecamatan_supplier` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `user_supplier`, `pass_supplier`, `nama_supplier`, `namabelakang_supplier`, `email_supplier`, `foto_supplier`, `tentang_supplier`, `kota_supplier`, `negara_supplier`, `kodepos_supplier`, `kecamatan_supplier`) VALUES
(100003, 'user', 'user', 'Aditya Eka', 'Bagaskara', 'aditya@bagas31.com', 'adit.jpg', 'pengen makan', 'Barcelona', 'Catalunya', '101010', 'Barcelona');

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(6) NOT NULL,
  `user_toko` varchar(30) DEFAULT NULL,
  `pass_toko` varchar(30) DEFAULT NULL,
  `nama_toko` varchar(50) DEFAULT NULL,
  `namabelakang_toko` varchar(50) DEFAULT NULL,
  `email_toko` varchar(50) DEFAULT NULL,
  `foto_toko` varchar(20) DEFAULT NULL,
  `tentang_toko` text,
  `kota_toko` varchar(50) DEFAULT NULL,
  `negara_toko` varchar(50) DEFAULT NULL,
  `kodepos_toko` varchar(50) DEFAULT NULL,
  `kecamatan_toko` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`id_toko`, `user_toko`, `pass_toko`, `nama_toko`, `namabelakang_toko`, `email_toko`, `foto_toko`, `tentang_toko`, `kota_toko`, `negara_toko`, `kodepos_toko`, `kecamatan_toko`) VALUES
(300001, 'user', 'user', 'Ahmad Rizky', 'Prayogi', 'ahmad@adityaeka.com', 'ahmad.jpg', 'Ngoppps kuy!', 'Cianjur', 'Indonesia', '66912', 'Alguero');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jual_kayu`
--
ALTER TABLE `jual_kayu`
  ADD PRIMARY KEY (`id_jual_kayu`),
  ADD KEY `id_kayu` (`id_kayu`),
  ADD KEY `id_mebel` (`id_mebel`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `jual_mebel`
--
ALTER TABLE `jual_mebel`
  ADD PRIMARY KEY (`id_jual_mebel`),
  ADD KEY `id_mebel` (`id_mebel`),
  ADD KEY `id_reseller` (`id_reseller`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indexes for table `kayu`
--
ALTER TABLE `kayu`
  ADD PRIMARY KEY (`id_kayu`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `mebel`
--
ALTER TABLE `mebel`
  ADD PRIMARY KEY (`id_mebel`),
  ADD KEY `id_toko` (`id_toko`),
  ADD KEY `id_kayu` (`id_kayu`);

--
-- Indexes for table `reseller`
--
ALTER TABLE `reseller`
  ADD PRIMARY KEY (`id_reseller`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jual_kayu`
--
ALTER TABLE `jual_kayu`
  MODIFY `id_jual_kayu` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500011;

--
-- AUTO_INCREMENT for table `jual_mebel`
--
ALTER TABLE `jual_mebel`
  MODIFY `id_jual_mebel` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700009;

--
-- AUTO_INCREMENT for table `kayu`
--
ALTER TABLE `kayu`
  MODIFY `id_kayu` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200025;

--
-- AUTO_INCREMENT for table `mebel`
--
ALTER TABLE `mebel`
  MODIFY `id_mebel` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400025;

--
-- AUTO_INCREMENT for table `reseller`
--
ALTER TABLE `reseller`
  MODIFY `id_reseller` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600002;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100004;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300002;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jual_kayu`
--
ALTER TABLE `jual_kayu`
  ADD CONSTRAINT `jual_kayu_ibfk_1` FOREIGN KEY (`id_kayu`) REFERENCES `kayu` (`id_kayu`),
  ADD CONSTRAINT `jual_kayu_ibfk_2` FOREIGN KEY (`id_mebel`) REFERENCES `mebel` (`id_mebel`),
  ADD CONSTRAINT `jual_kayu_ibfk_3` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `jual_mebel`
--
ALTER TABLE `jual_mebel`
  ADD CONSTRAINT `jual_mebel_ibfk_1` FOREIGN KEY (`id_mebel`) REFERENCES `mebel` (`id_mebel`),
  ADD CONSTRAINT `jual_mebel_ibfk_2` FOREIGN KEY (`id_reseller`) REFERENCES `reseller` (`id_reseller`),
  ADD CONSTRAINT `jual_mebel_ibfk_3` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Constraints for table `kayu`
--
ALTER TABLE `kayu`
  ADD CONSTRAINT `kayu_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

--
-- Constraints for table `mebel`
--
ALTER TABLE `mebel`
  ADD CONSTRAINT `mebel_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`),
  ADD CONSTRAINT `mebel_ibfk_2` FOREIGN KEY (`id_kayu`) REFERENCES `kayu` (`id_kayu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
