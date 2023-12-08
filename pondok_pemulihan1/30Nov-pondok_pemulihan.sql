-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 05:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pondok_pemulihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `catatankonflik`
--

CREATE TABLE `catatankonflik` (
  `idKonflik` int(6) NOT NULL,
  `idKlien` int(6) NOT NULL,
  `idJadwal` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dataklien`
--

CREATE TABLE `dataklien` (
  `idKlien` varchar(6) NOT NULL,
  `noRM` int(6) NOT NULL,
  `noKTP` varchar(16) DEFAULT NULL,
  `namaKlien` varchar(255) NOT NULL,
  `jkKlien` enum('Laki-laki','Perempuan') NOT NULL,
  `tempatLahirKlien` varchar(20) NOT NULL,
  `tglLahirKlien` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `status` enum('Aktif','Non Aktif') NOT NULL,
  `tglMasuk` date NOT NULL,
  `kondisiAwl` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataklien`
--

INSERT INTO `dataklien` (`idKlien`, `noRM`, `noKTP`, `namaKlien`, `jkKlien`, `tempatLahirKlien`, `tglLahirKlien`, `alamat`, `status`, `tglMasuk`, `kondisiAwl`) VALUES
('K01', 1, '6201056101950001', 'Ariska Lola Priadi', 'Perempuan', 'Palangkaraya, Kalima', '1995-12-01', 'Pangkalan Bun Palangkaraya, Kalimantan Tengah', 'Aktif', '2023-06-01', '-'),
('K02', 2, '6201056101950002', 'Shalommita P.', 'Perempuan', 'Sleman, Yogyakarta', '2001-10-21', 'Jl. Sendang jatiningsih', 'Aktif', '2023-06-01', 'Kadang tidak terkontrol');

-- --------------------------------------------------------

--
-- Table structure for table `datapemantau`
--

CREATE TABLE `datapemantau` (
  `idPemantau` varchar(6) NOT NULL,
  `namaPemantau` varchar(50) DEFAULT NULL,
  `jkPemantau` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `tempatPemantau` varchar(20) DEFAULT NULL,
  `tglPemantau` date DEFAULT NULL,
  `peran` enum('Pembina','Psikolog Klinis','Psikososial','Asisten Medis') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `datapemantau`
--

INSERT INTO `datapemantau` (`idPemantau`, `namaPemantau`, `jkPemantau`, `tempatPemantau`, `tglPemantau`, `peran`) VALUES
('PE001', 'Ngizthy R.W. Nalle', 'Perempuan', 'Soe', '1975-05-30', 'Psikososial'),
('PE002', 'Kak Esa', 'Laki-laki', 'Sulawesi', '1995-11-01', 'Pembina');

-- --------------------------------------------------------

--
-- Table structure for table `evalemosional`
--

CREATE TABLE `evalemosional` (
  `idEmosi` varchar(6) NOT NULL,
  `idKlien` varchar(6) DEFAULT NULL,
  `idJadwal` varchar(6) DEFAULT NULL,
  `idPemantau` varchar(6) DEFAULT NULL,
  `catatanEval` varchar(255) DEFAULT NULL,
  `kategori` enum('Salomo','Victory','Istimewa') DEFAULT NULL,
  `skor` int(3) DEFAULT NULL,
  `waktuCatat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evalemosional`
--

INSERT INTO `evalemosional` (`idEmosi`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `kategori`, `skor`, `waktuCatat`) VALUES
('EM001', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 70, '2023-11-01 01:19:26'),
('EM002', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 85, '2023-11-02 01:19:26'),
('EM003', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 30, '2023-11-05 16:06:22'),
('EM004', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 20, '2023-11-07 15:51:26'),
('EM005', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 70, '2023-11-09 15:51:32'),
('EM006', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-06 01:19:26'),
('EM007', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 90, '2023-11-14 15:51:42'),
('EM008', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-08 01:19:26'),
('EM009', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 65, '2023-11-11 15:51:36'),
('EM010', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-10 01:19:26'),
('EM011', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 45, '2023-11-18 15:51:47'),
('EM012', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-12 01:19:26'),
('EM013', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-13 01:19:26'),
('EM014', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 75, '2023-11-17 15:51:53'),
('EM015', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-15 01:19:26'),
('EM016', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-16 01:19:26'),
('EM017', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 55, '2023-11-21 15:51:57'),
('EM018', 'K01', 'JA001', 'PE001', 'Tau kalau sudah mau marah jadi langsung ke bilik/ruangan meditasi', 'Salomo', 60, '2023-11-04 15:32:22'),
('EM019', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-19 01:19:26'),
('EM020', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-20 01:19:26'),
('EM021', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 35, '2023-11-23 15:52:03'),
('EM022', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-22 01:19:26'),
('EM023', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 60, '2023-11-25 15:52:06'),
('EM024', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-24 01:19:26'),
('EM025', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 50, '2023-11-28 15:52:12'),
('EM026', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-26 01:19:26'),
('EM027', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-27 01:19:26'),
('EM028', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-11-03 01:19:26'),
('EM029', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-10-28 01:19:26'),
('EM030', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-10-29 01:19:26'),
('EM031', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-10-30 01:19:26'),
('EM032', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 40, '2023-10-31 01:19:26'),
('EM201', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 20, '2023-11-01 15:38:38'),
('EM202', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 70, '2023-11-02 15:38:38'),
('EM203', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 40, '2023-11-03 15:38:38'),
('EM204', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 60, '2023-11-04 15:38:38'),
('EM205', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-05 15:38:38'),
('EM206', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 45, '2023-11-06 15:38:38'),
('EM207', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 80, '2023-11-07 15:38:38'),
('EM208', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 80, '2023-11-08 15:38:38'),
('EM209', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 90, '2023-11-09 15:38:38'),
('EM210', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-10 15:38:38'),
('EM211', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-11 15:38:38'),
('EM212', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 55, '2023-11-12 15:38:38'),
('EM213', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 55, '2023-11-13 15:38:38'),
('EM214', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 20, '2023-11-14 15:38:38'),
('EM215', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 80, '2023-11-15 15:38:38'),
('EM216', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 40, '2023-11-16 15:38:38'),
('EM217', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 90, '2023-11-17 15:38:38'),
('EM218', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 30, '2023-11-18 15:38:38'),
('EM219', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 80, '2023-11-19 15:38:38'),
('EM220', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 65, '2023-11-20 15:38:38'),
('EM221', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-21 15:38:38'),
('EM222', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 95, '2023-11-22 15:38:38'),
('EM223', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 60, '2023-11-23 15:38:38'),
('EM224', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-24 15:38:38'),
('EM225', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-25 15:38:38'),
('EM226', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 90, '2023-11-26 15:38:38'),
('EM227', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 60, '2023-11-27 15:38:38'),
('EM228', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 50, '2023-11-28 15:38:38'),
('EM229', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 90, '2023-10-29 15:38:38'),
('EM230', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 20, '2023-10-30 15:38:38'),
('EM231', 'K02', 'JA002', 'PE001', 'berbuat baik', 'Victory', 80, '2023-10-31 15:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `evalkognitif`
--

CREATE TABLE `evalkognitif` (
  `idKognitif` varchar(6) NOT NULL,
  `idKlien` varchar(6) DEFAULT NULL,
  `idJadwal` varchar(6) DEFAULT NULL,
  `idPemantau` varchar(6) DEFAULT NULL,
  `catatanEval` varchar(255) DEFAULT NULL,
  `kategori` enum('Salomo','Victory','Istimewa') DEFAULT NULL,
  `skor` int(3) DEFAULT NULL,
  `waktuCatat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evalkognitif`
--

INSERT INTO `evalkognitif` (`idKognitif`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `kategori`, `skor`, `waktuCatat`) VALUES
('KO002', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-02 15:38:38'),
('KO003', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 40, '2023-11-03 15:38:38'),
('KO004', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 30, '2023-11-04 15:38:38'),
('KO005', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 70, '2023-11-05 15:38:38'),
('KO006', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 65, '2023-11-06 15:38:38'),
('KO007', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 80, '2023-11-07 15:38:38'),
('KO008', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-08 15:38:38'),
('KO009', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-09 15:38:38'),
('KO010', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 30, '2023-11-10 15:38:38'),
('KO011', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 20, '2023-11-11 15:38:38'),
('KO012', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-12 15:38:38'),
('KO013', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 10, '2023-11-13 15:38:38'),
('KO014', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-14 15:38:38'),
('KO015', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 90, '2023-11-15 15:38:38'),
('KO016', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-16 15:38:38'),
('KO017', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 70, '2023-11-17 15:38:38'),
('KO018', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 50, '2023-11-18 15:38:38'),
('KO019', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 90, '2023-11-19 15:38:38'),
('KO020', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 95, '2023-11-20 15:38:38'),
('KO021', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-21 15:38:38'),
('KO022', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 65, '2023-11-22 15:38:38'),
('KO023', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-23 15:38:38'),
('KO024', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 20, '2023-11-24 15:38:38'),
('KO025', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 80, '2023-11-25 15:38:38'),
('KO026', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 90, '2023-11-26 15:38:38'),
('KO027', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 30, '2023-11-27 15:38:38'),
('KO028', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-11-28 15:38:38'),
('KO029', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 80, '2023-10-29 15:38:38'),
('KO030', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 60, '2023-10-30 15:38:38'),
('KO031', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 40, '2023-10-31 15:38:38'),
('KO201', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-01 15:38:38'),
('KO202', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 30, '2023-11-02 15:38:38'),
('KO203', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 70, '2023-11-03 15:38:38'),
('KO204', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-04 15:38:38'),
('KO205', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 50, '2023-11-05 15:38:38'),
('KO206', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 45, '2023-11-06 15:38:38'),
('KO207', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-07 15:38:38'),
('KO208', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 80, '2023-11-08 15:38:38'),
('KO209', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-09 15:38:38'),
('KO210', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 50, '2023-11-10 15:38:38'),
('KO211', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 40, '2023-11-11 15:38:38'),
('KO212', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 85, '2023-11-12 15:38:38'),
('KO213', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 55, '2023-11-13 15:38:38'),
('KO214', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 80, '2023-11-14 15:38:38'),
('KO215', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 50, '2023-11-15 15:38:38'),
('KO216', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 40, '2023-11-16 15:38:38'),
('KO217', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 70, '2023-11-17 15:38:38'),
('KO218', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 30, '2023-11-18 15:38:38'),
('KO219', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 70, '2023-11-19 15:38:38'),
('KO220', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 65, '2023-11-20 15:38:38'),
('KO221', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 40, '2023-11-21 15:38:38'),
('KO222', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 35, '2023-11-22 15:38:38'),
('KO223', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-23 15:38:38'),
('KO224', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 90, '2023-11-24 15:38:38'),
('KO225', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 50, '2023-11-25 15:38:38'),
('KO226', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 60, '2023-11-26 15:38:38'),
('KO227', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 40, '2023-11-27 15:38:38'),
('KO228', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 50, '2023-11-28 15:38:38'),
('KO229', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 90, '2023-10-29 15:38:38'),
('KO230', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 70, '2023-10-30 15:38:38'),
('KO231', 'K02', 'JA002', 'PE001', 'masih harus menata ucapan', 'Victory', 80, '2023-10-31 15:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `evalmedis`
--

CREATE TABLE `evalmedis` (
  `idMedis` varchar(6) NOT NULL,
  `idKlien` varchar(6) DEFAULT NULL,
  `idJadwal` varchar(6) DEFAULT NULL,
  `idPemantau` varchar(6) DEFAULT NULL,
  `catatanEval` varchar(255) DEFAULT NULL,
  `obatDiminum` varchar(100) DEFAULT NULL,
  `dosisObat` int(11) DEFAULT NULL,
  `kategori` enum('Salomo','Victory','Istimewa') DEFAULT NULL,
  `skor` int(3) DEFAULT NULL,
  `waktuCatat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evalmedis`
--

INSERT INTO `evalmedis` (`idMedis`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `obatDiminum`, `dosisObat`, `kategori`, `skor`, `waktuCatat`) VALUES
('ME001', 'K01', 'JA001', 'PE001', 'Bagus', 'Mayan', 20, 'Salomo', 50, '2023-10-31 17:18:01'),
('ME002', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 80, '2023-11-02 15:38:38'),
('ME003', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 30, '2023-11-03 15:38:38'),
('ME004', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 30, '2023-11-04 15:38:38'),
('ME005', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 50, '2023-11-05 15:38:38'),
('ME006', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 75, '2023-11-06 15:38:38'),
('ME007', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 90, '2023-11-07 15:38:38'),
('ME008', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 70, '2023-11-08 15:38:38'),
('ME009', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 20, '2023-11-09 15:38:38'),
('ME010', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 40, '2023-11-10 15:38:38'),
('ME011', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-11 15:38:38'),
('ME012', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-12 15:38:38'),
('ME013', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 10, '2023-11-13 15:38:38'),
('ME014', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-14 15:38:38'),
('ME015', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 80, '2023-11-15 15:38:38'),
('ME016', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-16 15:38:38'),
('ME017', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 70, '2023-11-17 15:38:38'),
('ME018', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 40, '2023-11-18 15:38:38'),
('ME019', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 90, '2023-11-19 15:38:38'),
('ME020', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 90, '2023-11-20 15:38:38'),
('ME021', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-21 15:38:38'),
('ME022', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 50, '2023-11-22 15:38:38'),
('ME023', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-11-23 15:38:38'),
('ME024', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 30, '2023-11-24 15:38:38'),
('ME025', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 80, '2023-11-25 15:38:38'),
('ME026', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 70, '2023-11-26 15:38:38'),
('ME027', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 10, '2023-11-27 15:38:38'),
('ME028', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 20, '2023-11-28 15:38:38'),
('ME029', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 80, '2023-10-29 15:38:38'),
('ME030', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 60, '2023-10-30 15:38:38'),
('ME031', 'K01', 'JA001', 'PE001', 'bagus', 'mayan', 20, 'Salomo', 40, '2023-10-31 15:38:38'),
('ME201', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 60, '2023-11-01 15:38:38'),
('ME202', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 80, '2023-11-02 15:38:38'),
('ME203', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 20, '2023-11-03 15:38:38'),
('ME204', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-11-04 15:38:38'),
('ME205', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 70, '2023-11-05 15:38:38'),
('ME206', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 55, '2023-11-06 15:38:38'),
('ME207', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 70, '2023-11-07 15:38:38'),
('ME208', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-11-08 15:38:38'),
('ME209', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 30, '2023-11-09 15:38:38'),
('ME210', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 70, '2023-11-10 15:38:38'),
('ME211', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 30, '2023-11-11 15:38:38'),
('ME212', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 80, '2023-11-12 15:38:38'),
('ME213', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 70, '2023-11-13 15:38:38'),
('ME214', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-14 15:38:38'),
('ME215', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-11-15 15:38:38'),
('ME216', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-16 15:38:38'),
('ME217', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 60, '2023-11-17 15:38:38'),
('ME218', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-11-18 15:38:38'),
('ME219', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-19 15:38:38'),
('ME220', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 80, '2023-11-20 15:38:38'),
('ME221', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-21 15:38:38'),
('ME222', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 60, '2023-11-22 15:38:38'),
('ME223', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 80, '2023-11-23 15:38:38'),
('ME224', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-24 15:38:38'),
('ME225', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 60, '2023-11-25 15:38:38'),
('ME226', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 80, '2023-11-26 15:38:38'),
('ME227', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 30, '2023-11-27 15:38:38'),
('ME228', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-11-28 15:38:38'),
('ME229', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-10-29 15:38:38'),
('ME230', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 50, '2023-10-30 15:38:38'),
('ME231', 'K02', 'JA002', 'PE002', 'bagus', 'luarbiasa', 40, 'Victory', 90, '2023-10-31 15:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `evalperilaku`
--

CREATE TABLE `evalperilaku` (
  `idPerilaku` varchar(6) NOT NULL,
  `idKlien` varchar(6) DEFAULT NULL,
  `idJadwal` varchar(6) DEFAULT NULL,
  `idPemantau` varchar(6) DEFAULT NULL,
  `catatanEval` varchar(255) DEFAULT NULL,
  `kategori` enum('Salomo','Victory','Istimewa') DEFAULT NULL,
  `skor` int(3) DEFAULT NULL,
  `waktuCatat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `evalperilaku`
--

INSERT INTO `evalperilaku` (`idPerilaku`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `kategori`, `skor`, `waktuCatat`) VALUES
('PE001', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 90, '2023-11-01 15:38:38'),
('PE002', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 10, '2023-11-02 15:38:38'),
('PE003', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-11-03 15:38:38'),
('PE004', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-11-04 15:38:38'),
('PE005', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-05 15:38:38'),
('PE006', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 65, '2023-11-06 15:38:38'),
('PE007', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 90, '2023-11-07 15:38:38'),
('PE008', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-08 15:38:38'),
('PE009', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 70, '2023-11-09 15:38:38'),
('PE010', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-11-10 15:38:38'),
('PE011', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 80, '2023-11-11 15:38:38'),
('PE012', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-12 15:38:38'),
('PE013', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-13 15:38:38'),
('PE014', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-11-14 15:38:38'),
('PE015', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 40, '2023-11-15 15:38:38'),
('PE016', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-16 15:38:38'),
('PE017', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 70, '2023-11-17 15:38:38'),
('PE018', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 70, '2023-11-18 15:38:38'),
('PE019', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 90, '2023-11-19 15:38:38'),
('PE020', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 65, '2023-11-20 15:38:38'),
('PE021', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-11-21 15:38:38'),
('PE022', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 55, '2023-11-22 15:38:38'),
('PE023', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 80, '2023-11-23 15:38:38'),
('PE024', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 10, '2023-11-24 15:38:38'),
('PE025', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 50, '2023-11-25 15:38:38'),
('PE026', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 70, '2023-11-26 15:38:38'),
('PE027', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-11-27 15:38:38'),
('PE028', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 80, '2023-11-28 15:38:38'),
('PE029', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 30, '2023-10-29 15:38:38'),
('PE030', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 60, '2023-10-30 15:38:38'),
('PE031', 'K01', 'JA001', 'PE001', 'berbuat baik', 'Salomo', 10, '2023-10-31 15:38:38'),
('PE201', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-11-01 15:38:38'),
('PE202', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 50, '2023-11-02 15:38:38'),
('PE203', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 40, '2023-11-03 15:38:38'),
('PE204', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-11-04 15:38:38'),
('PE205', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 60, '2023-11-05 15:38:38'),
('PE206', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 55, '2023-11-06 15:38:38'),
('PE207', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 60, '2023-11-07 15:38:38'),
('PE208', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 70, '2023-11-08 15:38:38'),
('PE209', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-11-09 15:38:38'),
('PE210', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 30, '2023-11-10 15:38:38'),
('PE211', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-11-11 15:38:38'),
('PE212', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 35, '2023-11-12 15:38:38'),
('PE213', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 55, '2023-11-13 15:38:38'),
('PE214', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 70, '2023-11-14 15:38:38'),
('PE215', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 80, '2023-11-15 15:38:38'),
('PE216', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 60, '2023-11-16 15:38:38'),
('PE217', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 30, '2023-11-17 15:38:38'),
('PE218', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 20, '2023-11-18 15:38:38'),
('PE219', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 70, '2023-11-19 15:38:38'),
('PE220', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 65, '2023-11-20 15:38:38'),
('PE221', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 40, '2023-11-21 15:38:38'),
('PE222', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 95, '2023-11-22 15:38:38'),
('PE223', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 70, '2023-11-23 15:38:38'),
('PE224', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 60, '2023-11-24 15:38:38'),
('PE225', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 50, '2023-11-25 15:38:38'),
('PE226', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-11-26 15:38:38'),
('PE227', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 50, '2023-11-27 15:38:38'),
('PE228', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 30, '2023-11-28 15:38:38'),
('PE229', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 60, '2023-10-29 15:38:38'),
('PE230', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 90, '2023-10-30 15:38:38'),
('PE231', 'K02', 'JA002', 'PE001', 'masih sulit ngatur', 'Victory', 50, '2023-10-31 15:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `jadwalharian`
--

CREATE TABLE `jadwalharian` (
  `idJadwal` varchar(6) NOT NULL,
  `idPemantau` varchar(6) DEFAULT NULL,
  `hariTgl` datetime NOT NULL,
  `kegiatan` varchar(255) NOT NULL,
  `koordHarian` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwalharian`
--

INSERT INTO `jadwalharian` (`idJadwal`, `idPemantau`, `hariTgl`, `kegiatan`, `koordHarian`) VALUES
('', 'PE002', '2023-11-09 00:00:00', 'Terapi Perillaku', 'Kak Alfred'),
('JA001', 'PE001', '2023-11-01 10:36:45', 'Terapi doa pagi', 'Kak Ngizthy'),
('JA002', 'PE002', '2023-11-09 07:10:56', 'Terapi Sosial dengan teman-teman psikologi UKSW', 'Kak Esa');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(8) NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUser`, `email`, `password`, `username`) VALUES
(2, 'admin1@gmail.com', 'admin121', 'Syellom'),
(4, 'administrator@pemulihansahabat.org', 'coba123', 'Administra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatankonflik`
--
ALTER TABLE `catatankonflik`
  ADD PRIMARY KEY (`idKonflik`);

--
-- Indexes for table `dataklien`
--
ALTER TABLE `dataklien`
  ADD PRIMARY KEY (`idKlien`);

--
-- Indexes for table `datapemantau`
--
ALTER TABLE `datapemantau`
  ADD PRIMARY KEY (`idPemantau`);

--
-- Indexes for table `evalemosional`
--
ALTER TABLE `evalemosional`
  ADD PRIMARY KEY (`idEmosi`),
  ADD KEY `fk_evalEmosional_dataklien` (`idKlien`),
  ADD KEY `fk_jadwal_dataklien` (`idJadwal`),
  ADD KEY `fk_pemantauemosi_dataklien` (`idPemantau`);

--
-- Indexes for table `evalkognitif`
--
ALTER TABLE `evalkognitif`
  ADD PRIMARY KEY (`idKognitif`),
  ADD KEY `fk_evalKognitif_dataklien` (`idKlien`),
  ADD KEY `fk_jadwalKogni_dataklien` (`idJadwal`),
  ADD KEY `fk_pemantaukogni_dataklien` (`idPemantau`);

--
-- Indexes for table `evalmedis`
--
ALTER TABLE `evalmedis`
  ADD PRIMARY KEY (`idMedis`),
  ADD KEY `fk_evalMedis_dataklien` (`idKlien`),
  ADD KEY `fk_jadwalMedis_dataklien` (`idJadwal`),
  ADD KEY `fk_pemantaumedis_dataklien` (`idPemantau`);

--
-- Indexes for table `evalperilaku`
--
ALTER TABLE `evalperilaku`
  ADD PRIMARY KEY (`idPerilaku`),
  ADD KEY `fk_evalPerilaku_dataklien` (`idKlien`),
  ADD KEY `fk_jadwalPerilaku_dataklien` (`idJadwal`),
  ADD KEY `fk_pemantauperilaku_dataklien` (`idPemantau`);

--
-- Indexes for table `jadwalharian`
--
ALTER TABLE `jadwalharian`
  ADD PRIMARY KEY (`idJadwal`),
  ADD KEY `idPemantau` (`idPemantau`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatankonflik`
--
ALTER TABLE `catatankonflik`
  MODIFY `idKonflik` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evalemosional`
--
ALTER TABLE `evalemosional`
  ADD CONSTRAINT `fk_evalEmosional_dataklien` FOREIGN KEY (`idKlien`) REFERENCES `dataklien` (`idKlien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwal_dataklien` FOREIGN KEY (`idJadwal`) REFERENCES `jadwalharian` (`idJadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pemantauemosi_dataklien` FOREIGN KEY (`idPemantau`) REFERENCES `datapemantau` (`idPemantau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evalkognitif`
--
ALTER TABLE `evalkognitif`
  ADD CONSTRAINT `fk_evalKognitif_dataklien` FOREIGN KEY (`idKlien`) REFERENCES `dataklien` (`idKlien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwalKogni_dataklien` FOREIGN KEY (`idJadwal`) REFERENCES `jadwalharian` (`idJadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pemantaukogni_dataklien` FOREIGN KEY (`idPemantau`) REFERENCES `datapemantau` (`idPemantau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evalmedis`
--
ALTER TABLE `evalmedis`
  ADD CONSTRAINT `fk_evalMedis_dataklien` FOREIGN KEY (`idKlien`) REFERENCES `dataklien` (`idKlien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwalMedis_dataklien` FOREIGN KEY (`idJadwal`) REFERENCES `jadwalharian` (`idJadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pemantaumedis_dataklien` FOREIGN KEY (`idPemantau`) REFERENCES `datapemantau` (`idPemantau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `evalperilaku`
--
ALTER TABLE `evalperilaku`
  ADD CONSTRAINT `fk_evalPerilaku_dataklien` FOREIGN KEY (`idKlien`) REFERENCES `dataklien` (`idKlien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jadwalPerilaku_dataklien` FOREIGN KEY (`idJadwal`) REFERENCES `jadwalharian` (`idJadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pemantauperilaku_dataklien` FOREIGN KEY (`idPemantau`) REFERENCES `datapemantau` (`idPemantau`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwalharian`
--
ALTER TABLE `jadwalharian`
  ADD CONSTRAINT `jadwalharian_ibfk_1` FOREIGN KEY (`idPemantau`) REFERENCES `datapemantau` (`idPemantau`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
