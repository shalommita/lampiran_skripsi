-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 08:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mita`
--

-- --------------------------------------------------------

--
-- Table structure for table `catatankonflik`
--

CREATE TABLE `catatankonflik` (
  `idKonflik` int(6) NOT NULL,
  `idKlien` int(6) NOT NULL,
  `idJadwal` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evalemosional`
--

INSERT INTO `evalemosional` (`idEmosi`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `kategori`, `skor`, `waktuCatat`) VALUES
('EM001', 'K01', 'JA001', 'PE001', 'Bisa mengatur emosi dengan cukup baik.', 'Salomo', 70, '2023-11-02 01:19:26'),
('EM002', 'K02', 'JA002', 'PE001', 'Kurang bisa mengelola emosi', 'Victory', 60, '2023-11-09 09:03:21'),
('EM003', 'K01', 'JA001', 'PE001', 'Tau kalau sudah mau marah jadi langsung ke bilik / ruangan meditasi', 'Salomo', 60, '2023-11-09 09:03:21');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evalkognitif`
--

INSERT INTO `evalkognitif` (`idKognitif`, `idKlien`, `idJadwal`, `idPemantau`, `catatanEval`, `kategori`, `skor`, `waktuCatat`) VALUES
('KO001', 'K01', 'JA001', 'PE001', 'Cukup bisa berpikir kritis walaupun masih harus menata ucapan', 'Salomo', 50, '2023-11-01 15:38:38');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
