-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2024 pada 13.58
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_akademik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `NIP` varchar(18) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id_guru`, `NIP`, `Nama`, `id_user`) VALUES
(1, '123', 'abc', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_mapel`
--

CREATE TABLE `jadwal_mapel` (
  `Id_Jadwal` int(11) NOT NULL,
  `Kd_Mapel` int(10) DEFAULT NULL,
  `Id_Kelas` int(3) DEFAULT NULL,
  `Hari` enum('Senin','Selasa','Rabu','Kamis','Jumat') DEFAULT NULL,
  `id_guru` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_mapel`
--

INSERT INTO `jadwal_mapel` (`Id_Jadwal`, `Kd_Mapel`, `Id_Kelas`, `Hari`, `id_guru`) VALUES
(1, 1, 1, 'Senin', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `Id_Kelas` int(3) NOT NULL,
  `Kelas` varchar(5) DEFAULT NULL,
  `Tingkatan` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`Id_Kelas`, `Kelas`, `Tingkatan`) VALUES
(1, 'a', 7),
(2, 'b', 7),
(3, 'c', 7),
(4, 'a', 8),
(5, 'b', 8),
(6, 'c', 8),
(7, 'a', 9),
(8, 'b', 9),
(9, 'c', 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapel`
--

CREATE TABLE `mapel` (
  `Kd_Mapel` int(10) NOT NULL,
  `Mapel` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mapel`
--

INSERT INTO `mapel` (`Kd_Mapel`, `Mapel`) VALUES
(1, 'Mtk'),
(2, 'Bahasa inggris'),
(3, 'Bahasa Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `Kd_Mapel` int(10) NOT NULL,
  `Absen` tinyint(4) DEFAULT NULL,
  `Tugas` tinyint(4) DEFAULT NULL,
  `UTS` tinyint(4) DEFAULT NULL,
  `UAS` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `Kd_Mapel`, `Absen`, `Tugas`, `UTS`, `UAS`) VALUES
(1, 1, 1, 100, 100, 100, 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `NISN` int(10) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Id_Kelas` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `NISN`, `Nama`, `Id_Kelas`) VALUES
(1, 321, 'cba', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('siswa','guru','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'abc123', 'abc123', 'guru');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  ADD PRIMARY KEY (`Id_Jadwal`),
  ADD KEY `Kd_Mapel` (`Kd_Mapel`),
  ADD KEY `Id_Kelas` (`Id_Kelas`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`Id_Kelas`);

--
-- Indeks untuk tabel `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`Kd_Mapel`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `Kd_Mapel` (`Kd_Mapel`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `Id_Kelas` (`Id_Kelas`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  MODIFY `Id_Jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `jadwal_mapel`
--
ALTER TABLE `jadwal_mapel`
  ADD CONSTRAINT `jadwal_mapel_ibfk_1` FOREIGN KEY (`Kd_Mapel`) REFERENCES `mapel` (`Kd_Mapel`),
  ADD CONSTRAINT `jadwal_mapel_ibfk_3` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`),
  ADD CONSTRAINT `jadwal_mapel_ibfk_4` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`);

--
-- Ketidakleluasaan untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kd_Mapel`) REFERENCES `mapel` (`Kd_Mapel`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`Id_Kelas`) REFERENCES `kelas` (`Id_Kelas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
