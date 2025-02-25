-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Feb 2025 pada 18.01
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tpm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(1, 'fiuw', 'fiuw@gmail.com', '$2y$10$iGXh6prtlm91bJftU//lHutNESKIE7GpgU6x3Fok3A4EO2eB9UB1G', '2025-02-24 12:09:09'),
(4, 'rara', 'rara@gmail.com', '$2y$10$SvkkKEZ8.FXSztG1TJhWp.nKAKKG4JiLGetUqEK39R6GRXnWoiMRW', '2025-02-24 12:21:51'),
(6, 'naufal', 'naufal@gmail.com', '$2y$10$z9JHm7aYSJk6Q8O3Q4bnWOt7FRjQy7RD8EUJ6P8y.NpvZ5UWWqi7.', '2025-02-25 13:30:26'),
(7, 'dea', 'dea@gmail.com', '$2y$10$.s42nCmv7FpkeT8f2.i0geafJWWMEDMjyFdOxoX3XaticYylnL8bG', '2025-02-25 15:59:56'),
(8, 'y', 'y@gmail.com', '$2y$10$rt5a9k.LqU1LJbBAil9gPeUssAaamc3QawuvhbkRUZYdJIQI0z2pO', '2025-02-25 16:20:49');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
