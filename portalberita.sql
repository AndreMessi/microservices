-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2019 at 06:06 AM
-- Server version: 10.3.17-MariaDB-1
-- PHP Version: 7.2.9-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portalberita`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(25) NOT NULL,
  `isi_berita` varchar(255) NOT NULL,
  `id_detailBerita` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `title`, `author`, `isi_berita`, `id_detailBerita`, `id_category`) VALUES
(1, 'Persaingan Juara Liga Inggris Memang Sengit, tapi Takkan Ada Keajaiban', 'andre putra', 'Manchester City dan Liverpool masih bersaing sengit di Liga Inggris musim ini. Kendati demikian, takkan ada keajaiban di pekan pamungkas Premier League.', NULL, NULL),
(2, 'Bank Mandiri menyiapkan dana tunai sebesar Rp 54,9 triliun untuk idul fitri', 'adi priyanto', 'Bank Mandiri menyiapkan dana tunai sebesar Rp 54,9 triliun. Dana ini dipersiapkan selama bulan Ramadan dan menjelang Idul Fitri', NULL, NULL),
(3, 'index demokrasi naik derastis', 'rocky', ' BPS menggunakan empat sumber data dalam mengukur IDI, yaitu review surat kabar lokal, review dokumen seperti Peraturan Daerah dan Peraturan Gubernur, hasil Focus Group Discussion (FGD) dengan pihak terkait, serta wawancara mendalam.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_category`, `category`) VALUES
(1, 'Olahraga'),
(2, 'Finance'),
(3, 'Travell'),
(4, 'Politik'),
(5, 'Food'),
(6, 'Sosial');

-- --------------------------------------------------------

--
-- Table structure for table `detailBerita`
--

CREATE TABLE `detailBerita` (
  `id_detailBerita` int(11) NOT NULL,
  `detailBerita` varchar(1000) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailBerita`
--

INSERT INTO `detailBerita` (`id_detailBerita`, `detailBerita`, `id_category`) VALUES
(1, 'Manchester City dan Liverpool masih bersaing sengit di Liga Inggris musim ini. Kendati demikian, takkan ada keajaiban di pekan pamungkas Premier League. City saat ini masih memuncaki klasemen Liga Inggris dengan raihan 95 poin. The Citizens unggul satu poin dari Liverpool di posisi kedua. Menjelang laga pamungkas Liga Inggris 2018/2019, Liverpool dan Tottenham Hotspur melakukan comeback sensasional di Liga Champions. Si Merah menyingkirkan Barcelona, sedangkan Spurs menyingkirkan Ajax Amsterdam.', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_detailBerita` (`id_detailBerita`),
  ADD KEY `category` (`id_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `detailBerita`
--
ALTER TABLE `detailBerita`
  ADD PRIMARY KEY (`id_detailBerita`),
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `detailBerita`
--
ALTER TABLE `detailBerita`
  MODIFY `id_detailBerita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`id_detailBerita`) REFERENCES `detailBerita` (`id_detailBerita`),
  ADD CONSTRAINT `berita_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Constraints for table `detailBerita`
--
ALTER TABLE `detailBerita`
  ADD CONSTRAINT `detailBerita_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
