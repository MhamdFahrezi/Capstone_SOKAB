-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2025 at 05:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE `inventaris` (
  `id` int(11) NOT NULL,
  `nama_aset` varchar(255) NOT NULL,
  `masa_perolehan` int(11) DEFAULT NULL,
  `nilai_perolehan` decimal(15,2) DEFAULT NULL,
  `sisa_manfaat_tahun` int(11) DEFAULT 0,
  `sisa_manfaat_bulan` int(11) DEFAULT 0,
  `akumulasi_penyusutan_awal` decimal(15,2) DEFAULT 0.00 COMMENT 'AKUMULASI PENYUSUTAN 1 JANUARI 2024',
  `penyusutan_semester1` decimal(15,2) DEFAULT 0.00 COMMENT 'PENYUSUTAN SEMESTER 1',
  `penyusutan_semester2` decimal(15,2) DEFAULT 0.00 COMMENT 'PENYUSUTAN SEMESTER 2',
  `akumulasi_penyusutan_akhir` decimal(15,2) DEFAULT 0.00 COMMENT 'AKUMULASI PENYUSUTAN 31 DESEMBER 2024',
  `nilai_buku` decimal(15,2) DEFAULT 0.00 COMMENT 'NILAI BUKU',
  `usia_aset` varchar(50) DEFAULT '' COMMENT 'USIA ASET',
  `terhitung` varchar(50) DEFAULT '' COMMENT 'TERHITUNG',
  `hasil_akhir_penyusutan` varchar(50) DEFAULT '' COMMENT 'HASIL AKHIR PENYUSUTAN',
  `ada_penyusutan_s1` tinyint(1) DEFAULT 0 COMMENT 'Ada_Penyusutan_S1',
  `ada_penyusutan_s2` tinyint(1) DEFAULT 0 COMMENT 'Ada_Penyusutan_S2',
  `usia_aset_mapped` int(11) DEFAULT 0 COMMENT 'USIA ASET_MAPPED',
  `semester_depreciation_change_mapped` int(11) DEFAULT 0 COMMENT 'SEMESTER_DEPRECIATION_CHANGE_MAPPED',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id`, `nama_aset`, `masa_perolehan`, `nilai_perolehan`, `sisa_manfaat_tahun`, `sisa_manfaat_bulan`, `akumulasi_penyusutan_awal`, `penyusutan_semester1`, `penyusutan_semester2`, `akumulasi_penyusutan_akhir`, `nilai_buku`, `usia_aset`, `terhitung`, `hasil_akhir_penyusutan`, `ada_penyusutan_s1`, `ada_penyusutan_s2`, `usia_aset_mapped`, `semester_depreciation_change_mapped`, `created_at`, `updated_at`) VALUES
(1, 'Sepeda Motor', 2006, 3853000.00, 0, 0, 3853000.00, 0.00, 0.00, 3853000.00, 0.00, 'Lama', 'Murah', 'Menurun', 0, 0, 1, 0, '2025-05-16 10:26:18', '2025-05-16 10:26:18'),
(2, 'Komputer', 2020, 8750000.00, 2, 6, 5250000.00, 875000.00, 875000.00, 7000000.00, 1750000.00, 'Sedang', 'Sedang', 'Stabil', 1, 1, 2, 1, '2025-05-16 10:26:18', '2025-05-16 10:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','staff') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `can_create` tinyint(1) DEFAULT 0,
  `can_read` tinyint(1) DEFAULT 1,
  `can_update` tinyint(1) DEFAULT 0,
  `can_delete` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`, `can_create`, `can_read`, `can_update`, `can_delete`) VALUES
(1, 'admin', 'admin123', 'admin', '2025-05-12 15:44:27', 0, 1, 0, 0),
(2, 'jekyganteng', 'jekyganteng0821', 'staff', '2025-05-12 16:02:56', 1, 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inventaris`
--
ALTER TABLE `inventaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
