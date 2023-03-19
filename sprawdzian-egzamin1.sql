-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Mar 2023, 18:47
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `egzamin`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kadra`
--

CREATE TABLE `kadra` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `stanowisko` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `kadra`
--

INSERT INTO `kadra` (`id`, `imie`, `nazwisko`, `stanowisko`) VALUES
(1, 'Anna', 'Kowalska', 'dietetyk'),
(2, 'Jolanta', 'Szczesny', 'kosmetolog'),
(3, 'Aleksandra', 'Wilk', 'stylista'),
(4, 'Katarzyna', 'Nowak', 'fryzjer'),
(5, 'Piotr', 'Bartczak', 'fizjoterapeuta');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kwiaciarnie`
--

CREATE TABLE `kwiaciarnie` (
  `id_kwiaciarni` int(10) UNSIGNED NOT NULL,
  `nazwa` varchar(20) DEFAULT NULL,
  `miasto` varchar(20) DEFAULT NULL,
  `ulica` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kwiaciarnie`
--

INSERT INTO `kwiaciarnie` (`id_kwiaciarni`, `nazwa`, `miasto`, `ulica`) VALUES
(1, 'Astra', 'Warszawa', 'Sobieskiego'),
(2, 'Melisa', 'Malbork', 'Konopnickiej');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `matematycy`
--

CREATE TABLE `matematycy` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `rok_urodzenia` int(10) DEFAULT NULL,
  `liczba_publikacji` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `matematycy`
--

INSERT INTO `matematycy` (`id`, `imie`, `nazwisko`, `rok_urodzenia`, `liczba_publikacji`) VALUES
(1, 'Stefan', 'Banach', 1892, 20),
(2, 'Leonardo', 'Fibonacci', 1175, 15),
(3, 'Augustin', 'Cauchy', 1789, 10),
(4, 'Leonard', 'Euler', 1707, 30),
(5, 'Gotfried', 'Leibniz', 1646, 40);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `typy`
--

CREATE TABLE `typy` (
  `id` int(10) UNSIGNED NOT NULL,
  `kategoria` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `typy`
--

INSERT INTO `typy` (`id`, `kategoria`) VALUES
(1, 'Procesor'),
(2, 'RAM'),
(5, 'karta graficzna'),
(6, 'HDD');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uslugi`
--

CREATE TABLE `uslugi` (
  `id` int(10) UNSIGNED NOT NULL,
  `kadra_id` int(10) UNSIGNED NOT NULL,
  `rodzaj` int(10) UNSIGNED DEFAULT NULL,
  `nazwa` text DEFAULT NULL,
  `cena` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uslugi`
--

INSERT INTO `uslugi` (`id`, `kadra_id`, `rodzaj`, `nazwa`, `cena`) VALUES
(1, 2, 1, 'Piling enzymatyczny', 45),
(2, 5, 3, 'Masaz twarzy', 20),
(3, 2, 1, 'Maska', 30),
(4, 2, 1, 'Regulacja brwi', 5),
(5, 4, 2, 'Farbowanie', 50),
(6, 4, 2, 'Strzyzenie', 40),
(7, 1, 3, 'Ustalenie diety', 70),
(8, 2, 1, 'Henna', 10),
(9, 2, 1, 'Paznokcie', 90),
(10, 4, 2, 'Czesanie', 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id` int(10) UNSIGNED NOT NULL,
  `imie` text DEFAULT NULL,
  `nazwisko` text DEFAULT NULL,
  `telefon` text DEFAULT NULL,
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `uzytkownik`
--

INSERT INTO `uzytkownik` (`id`, `imie`, `nazwisko`, `telefon`, `email`) VALUES
(1, 'Anna', 'Kowalska', '601601601', 'anna@poczta.pl'),
(2, 'Jan', 'Nowak', '608608608', 'jan@poczta.pl'),
(3, 'Jolanta', 'Jasny', '606606606', 'jolanta@poczta.pl'),
(4, 'qqq', 'www', '345', 'dsfsdklfs@daskl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wycieczki`
--

CREATE TABLE `wycieczki` (
  `id` int(10) UNSIGNED NOT NULL,
  `zdjecia_id` int(10) UNSIGNED NOT NULL,
  `dataWyjazdu` date DEFAULT NULL,
  `cel` text DEFAULT NULL,
  `cena` double DEFAULT NULL,
  `dostepna` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wycieczki`
--

INSERT INTO `wycieczki` (`id`, `zdjecia_id`, `dataWyjazdu`, `cel`, `cena`, `dostepna`) VALUES
(1, 2, '2019-09-08', 'Wlochy, Wenecja', 1200, 1),
(2, 2, '2019-09-14', 'Wlochy, Wenecja', 1200, 1),
(3, 4, '2019-08-14', 'Polska, Warszawa', 640, 1),
(4, 6, '2019-08-14', 'Francja, Paryz', 1300, 1),
(5, 6, '2019-07-14', 'Francja, Paryz', 1350, 0),
(6, 6, '2019-09-14', 'Francja, Paryz', 1200, 1),
(7, 8, '2019-07-14', 'Hiszpania, Barcelona', 1500, 0),
(8, 8, '2019-08-14', 'Hiszpania, Barcelona', 1500, 0),
(9, 8, '2019-09-14', 'Hiszpania, Barcelona', 1400, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wyniki`
--

CREATE TABLE `wyniki` (
  `id` int(10) UNSIGNED NOT NULL,
  `dyscyplina_id` int(10) UNSIGNED NOT NULL,
  `sportowiec_id` int(10) UNSIGNED NOT NULL,
  `wynik` decimal(5,2) DEFAULT NULL,
  `dataUstanowienia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wyniki`
--

INSERT INTO `wyniki` (`id`, `dyscyplina_id`, `sportowiec_id`, `wynik`, `dataUstanowienia`) VALUES
(1, 1, 1, '12.40', '2015-10-14'),
(2, 1, 1, '12.00', '2015-10-06'),
(3, 1, 2, '11.80', '2015-10-14'),
(4, 1, 2, '11.90', '2015-10-06'),
(5, 1, 3, '11.50', '2015-10-14'),
(6, 1, 3, '11.56', '2015-10-06'),
(7, 1, 4, '11.70', '2015-10-14'),
(8, 1, 4, '11.67', '2015-10-06'),
(9, 1, 5, '11.30', '2015-10-14'),
(10, 1, 5, '11.52', '2015-10-06'),
(11, 1, 6, '12.10', '2015-10-14'),
(12, 1, 6, '12.00', '2015-10-06'),
(13, 3, 1, '63.00', '2015-11-11'),
(14, 3, 1, '63.60', '2015-10-13'),
(15, 3, 2, '64.00', '2015-11-11'),
(16, 3, 2, '63.60', '2015-10-13'),
(17, 3, 3, '60.00', '2015-11-11'),
(18, 3, 3, '61.60', '2015-10-13'),
(19, 3, 4, '63.50', '2015-11-11'),
(20, 3, 4, '63.60', '2015-10-13'),
(21, 3, 5, '70.00', '2015-10-07'),
(22, 3, 6, '68.00', '2015-10-07');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zadania`
--

CREATE TABLE `zadania` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataZadania` date DEFAULT NULL,
  `wpis` text DEFAULT NULL,
  `miesiac` text DEFAULT NULL,
  `rok` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zadania`
--

INSERT INTO `zadania` (`id`, `dataZadania`, `wpis`, `miesiac`, `rok`) VALUES
(1, '2020-07-01', 'Projekt z programowania', 'lipiec', 2020),
(2, '2020-07-02', 'Projekt z programowania', 'lipiec', 2020),
(3, '2020-07-03', '', 'lipiec', 2020),
(4, '2020-07-04', '', 'lipiec', 2020),
(5, '2020-07-05', '', 'lipiec', 2020),
(6, '2020-07-06', '', 'lipiec', 2020),
(7, '2020-07-07', 'Weterynarz - Brutus', 'lipiec', 2020),
(8, '2020-07-08', '', 'lipiec', 2020),
(9, '2020-07-09', '', 'lipiec', 2020),
(10, '2020-07-10', 'Szczepienie', 'lipiec', 2020),
(11, '2020-07-11', '', 'lipiec', 2020),
(12, '2020-07-12', '', 'lipiec', 2020),
(13, '2020-07-13', '', 'lipiec', 2020),
(14, '2020-07-14', '', 'lipiec', 2020),
(15, '2020-07-15', '', 'lipiec', 2020),
(16, '2020-07-16', '', 'lipiec', 2020),
(17, '2020-07-17', '', 'lipiec', 2020),
(18, '2020-07-18', 'Wyjazd na wakacje!', 'lipiec', 2020),
(19, '2020-07-19', 'Mielno', 'lipiec', 2020),
(20, '2020-07-20', 'Mielno', 'lipiec', 2020),
(21, '2020-07-21', 'Mielno', 'lipiec', 2020),
(22, '2020-07-22', 'Mielno', 'lipiec', 2020),
(23, '2020-07-23', 'Mielno', 'lipiec', 2020),
(24, '2020-07-24', 'Mielno', 'lipiec', 2020),
(25, '2020-07-25', '', 'lipiec', 2020),
(26, '2020-07-26', '', 'lipiec', 2020),
(27, '2020-07-27', '', 'lipiec', 2020),
(28, '2020-07-28', '', 'lipiec', 2020),
(29, '2020-07-29', 'Weterynarz - Brutus', 'lipiec', 2020),
(30, '2020-07-30', 'Warszawa', 'lipiec', 2020),
(31, '2020-07-31', 'Warszawa', 'lipiec', 2020),
(32, '2020-08-01', 'Remont', 'sierpien', 2020),
(33, '2020-08-02', 'Remont', 'sierpien', 2020),
(34, '2020-08-03', 'Remont', 'sierpien', 2020),
(35, '2020-08-04', 'Remont', 'sierpien', 2020),
(36, '2020-08-05', '', 'sierpien', 2020),
(37, '2020-08-06', '', 'sierpien', 2020),
(38, '2020-08-07', 'Rower', 'sierpien', 2020),
(39, '2020-08-08', 'Rower', 'sierpien', 2020),
(40, '2020-08-09', '', 'sierpien', 2020),
(41, '2020-08-10', '', 'sierpien', 2020),
(42, '2020-08-11', 'Weterynarz - Dika', 'sierpien', 2020),
(43, '2020-08-12', '', 'sierpien', 2020),
(44, '2020-08-13', 'Sopot', 'sierpien', 2020),
(45, '2020-08-14', 'Sopot', 'sierpien', 2020),
(46, '2020-08-15', '', 'sierpien', 2020),
(47, '2020-08-16', '', 'sierpien', 2020),
(48, '2020-08-17', 'Wyjazd na wakacje!', 'sierpien', 2020),
(49, '2020-08-18', 'Tatry', 'sierpien', 2020),
(50, '2020-08-19', 'Tatry', 'sierpien', 2020),
(51, '2020-08-20', 'Tatry', 'sierpien', 2020),
(52, '2020-08-21', 'Tatry', 'sierpien', 2020),
(53, '2020-08-22', 'Tatry', 'sierpien', 2020),
(54, '2020-08-23', 'Tatry', 'sierpien', 2020),
(55, '2020-08-24', 'Tatry', 'sierpien', 2020),
(56, '2020-08-25', '', 'sierpien', 2020),
(57, '2020-08-26', '', 'sierpien', 2020),
(58, '2020-08-27', '', 'sierpien', 2020),
(59, '2020-08-28', '', 'sierpien', 2020),
(60, '2020-08-29', 'Weterynarz - Dika', 'sierpien', 2020),
(61, '2020-08-30', '', 'sierpien', 2020),
(62, '2020-08-31', '', 'sierpien', 2020),
(63, '2020-11-01', NULL, 'listopad', 2020);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zam` int(10) UNSIGNED NOT NULL,
  `id_kwiaciarni` int(20) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `kwiaty` text DEFAULT NULL,
  `cena` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zam`, `id_kwiaciarni`, `data`, `kwiaty`, `cena`) VALUES
(1, 1, '2017-01-16', 'róża', 250),
(2, 1, '2017-01-10', 'gerbera', 120),
(3, 2, '2017-01-06', 'róża', 200),
(4, 2, '2017-01-09', 'gozdzik', 170),
(5, 1, '2017-01-07', 'róża', 125),
(6, 1, '2017-01-11', 'róża', 75);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecia`
--

CREATE TABLE `zdjecia` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazwaPliku` text DEFAULT NULL,
  `podpis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `zdjecia`
--

INSERT INTO `zdjecia` (`id`, `nazwaPliku`, `podpis`) VALUES
(1, '1.jpg', 'Londyn'),
(2, '2.jpg', 'Wenecja'),
(3, '3.jpg', 'Berlin'),
(4, '4.jpg', 'Warszawa'),
(5, '5.jpg', 'Budapeszt'),
(6, '6.jpg', 'Paryz'),
(7, '7.jpg', 'Nowy Jork'),
(8, '8.jpg', 'Barcelona'),
(9, '9.jpg', 'Moskwa');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kadra`
--
ALTER TABLE `kadra`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `kwiaciarnie`
--
ALTER TABLE `kwiaciarnie`
  ADD PRIMARY KEY (`id_kwiaciarni`);

--
-- Indeksy dla tabeli `matematycy`
--
ALTER TABLE `matematycy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `uslugi`
--
ALTER TABLE `uslugi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uslugi_FKIndex1` (`kadra_id`);

--
-- Indeksy dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zadania`
--
ALTER TABLE `zadania`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zam`);

--
-- Indeksy dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kadra`
--
ALTER TABLE `kadra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `kwiaciarnie`
--
ALTER TABLE `kwiaciarnie`
  MODIFY `id_kwiaciarni` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `matematycy`
--
ALTER TABLE `matematycy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `uslugi`
--
ALTER TABLE `uslugi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT dla tabeli `zadania`
--
ALTER TABLE `zadania`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
