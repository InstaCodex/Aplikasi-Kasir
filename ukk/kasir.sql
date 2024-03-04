-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2024 at 03:07 AM
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
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idlaporan` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idtransaksi` int(11) NOT NULL,
  `kode_produk` varchar(255) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `pembayaran` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `waktu_transaksi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`idlaporan`, `iduser`, `idtransaksi`, `kode_produk`, `nama_produk`, `nama_pelanggan`, `harga`, `qty`, `pembayaran`, `kembalian`, `subtotal`, `waktu_transaksi`) VALUES
(24, 3, 0, '43536HG', 'Kopi ABC', 'Fikar', 15000, 1, 30000, 15000, 15000, '2024-02-28 13:51:02'),
(25, 3, 0, '43536HG', 'Kopi ABC', 'Faiz', 15000, 1, 50000, 35000, 15000, '2024-02-28 14:03:24'),
(26, 6, 0, '23323P', 'Ale Ale', 'Abdul', 5000, 2, 15000, 5000, 10000, '2024-02-28 14:05:59'),
(27, 7, 0, '563217KJ', 'Ale Ale Kopi', 'Galang', 10000, 2, 50000, 30000, 20000, '2024-02-28 14:07:02'),
(28, 3, 0, '43536HG', 'Kopi ABC', 'Hendra', 15000, 1, 20000, 5000, 15000, '2024-02-28 14:39:49'),
(29, 3, 0, '563217KJ', 'Ale Ale Kopi', 'Desta', 10000, 2, 30000, 10000, 20000, '2024-02-29 00:40:35'),
(30, 3, 0, '43536HG', 'Kopi ABC', 'Testing Eko', 15000, 2, 45000, 15000, 30000, '2024-02-29 03:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `iduser` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`iduser`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'admin pml', '$2y$10$5vqt43Z2cT8kBM2vjFIB4O9xCnYAxeV6RZE1PzDmBisbcvGPX3EVS', 'admin'),
(3, 'kasir tegal', '$2y$10$kUW1n4SKC7nvVa4tWEciQOWcVfrS/0x2LwlrqpUmauBMRMKnWL5ji', 'kasir'),
(6, 'kasir kramat', '$2y$10$z7hOKwxaqANCE8wBy3DViuRBswvGy79DbI0PdGBD5GkSMV5Y6rQQm', 'kasir'),
(7, 'kasir sirau', '$2y$10$hpBueCvRuMbhUHOMb4F7YeiETC9oAtiiQ5LvT3Dsdp/CnKt0972SG', 'kasir'),
(8, 'kasir eka', '$2y$10$jAZzxHB8oyXzFYgv1gUDAO2hE2hNk3Mcwt56alEgeiIOmFI0iSDJe', 'kasir');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_modal` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`idproduk`, `kode_produk`, `nama_produk`, `harga_modal`, `harga_jual`, `tgl_input`) VALUES
(24, '23323P', 'Ale Ale', 2000, 5000, '2024-02-21 17:00:00'),
(25, '563217KJ', 'Ale Ale Kopi', 5000, 10000, '2024-02-28 13:20:37'),
(27, '43536HG', 'Kopi ABC', 5000, 15000, '2024-02-28 13:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `kode_produk` varchar(255) DEFAULT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idlaporan`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`iduser`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `laporan`
--
ALTER TABLE `laporan`
  MODIFY `idlaporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
