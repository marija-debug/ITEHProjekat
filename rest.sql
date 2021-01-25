-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 10:06 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest`
--
CREATE DATABASE IF NOT EXISTS `rest` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `rest`;

-- --------------------------------------------------------

--
-- Table structure for table `izvodjenja`
--

CREATE TABLE `izvodjenja` (
  `id` int(11) NOT NULL,
  `salaId` int(11) NOT NULL,
  `predstavaId` int(11) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `izvodjenja`
--

INSERT INTO `izvodjenja` (`id`, `salaId`, `predstavaId`, `datum`) VALUES
(1, 1, 47, '2021-02-15'),
(2, 1, 46, '2021-02-13'),
(3, 2, 50, '2021-02-19'),
(4, 2, 56, '2021-02-25'),
(5, 1, 55, '2021-02-22'),
(6, 2, 56, '2021-01-23'),
(7, 2, 47, '2021-03-01'),
(8, 1, 55, '2021-03-04'),
(9, 2, 56, '2021-03-11'),
(10, 2, 56, '2021-02-06'),
(11, 1, 56, '2021-02-03'),
(12, 2, 68, '2021-02-24'),
(13, 1, 72, '2021-02-24');

-- --------------------------------------------------------

--
-- Table structure for table `kategorije`
--

CREATE TABLE `kategorije` (
  `id` int(11) NOT NULL,
  `kategorija` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategorije`
--

INSERT INTO `kategorije` (`id`, `kategorija`) VALUES
(1, 'IT'),
(2, 'Automobili'),
(3, 'Zabava'),
(4, 'Nova kategorija');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `korisnikId` int(9) NOT NULL,
  `username` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `imePrezime` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnikId`, `username`, `password`, `imePrezime`, `status`, `email`) VALUES
(1, 'marija', '015ef7cb46d3c512fd27798011b106ec8a3574fd95877a65025cbe836eed75d5', 'Marija Marinković', 'admin', 'marija@gmail.com'),
(15, 'mmarinci', '84d89877f0d4041efb6bf91a16f0248f2fd573e6af05c19f96bedb9f882f7882', 'Marina Lazovic', 'user', 'marina@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `novosti`
--

CREATE TABLE `novosti` (
  `id` int(11) NOT NULL,
  `naslov` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tekst` text COLLATE utf8_unicode_ci NOT NULL,
  `datumvreme` datetime NOT NULL,
  `kategorija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `novosti`
--

INSERT INTO `novosti` (`id`, `naslov`, `tekst`, `datumvreme`, `kategorija_id`) VALUES
(1, 'Facebook uveo dislike za Messenger', 'Like dugme postalo je ikona socijalnih mreža, i očigledno, Facebooka. Međutim, postoje trenuci kada je potrebno i dislike dugme, ali ono nije postojalao, do sada.', '2013-12-18 00:55:38', 1),
(2, 'Amazonov telefon stiže 2014?', 'Glasine u vezi sa mogućim smartfonom kompanije Amazon postoje već neko vreme, ali čini se da se polako bližimo datumu predstavljanja.', '2013-12-18 00:56:21', 1),
(3, 'Godišnji e-otpad kao 11 Keopsovih piramida', 'Jedan od vodećih globalnih ekoloških problema je električni i elektronski otpad (e-otpad), koji nastaje brzim zastarevanjem elektronskih uređaja.', '2013-12-18 00:57:20', 1),
(4, 'Kako je živeti prema Frenklinovom rasporedu?', 'Mnogo pre nego što su nastale prve aplikacije za pravljenje rasporeda dnevnih obaveza, Bendžamin Frenklin je sa velikim uspehom planirao svoje zadatke.', '2013-07-15 12:15:28', 3),
(5, 'Kriza - a prodaja automobila u porastu', 'Prodaja novih automobila porasla je u novembru u nekoliko zemalja Evropske unije koje su ozbiljno uzdrmane krizom.', '2013-11-03 22:27:32', 2);

-- --------------------------------------------------------

--
-- Table structure for table `predstava`
--

CREATE TABLE `predstava` (
  `id` int(9) NOT NULL,
  `naziv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zanr` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trajanje` double NOT NULL,
  `opis` text COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Nije odgledan',
  `cena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `predstava`
--

INSERT INTO `predstava` (`id`, `naziv`, `zanr`, `trajanje`, `opis`, `cena`) VALUES
(46, 'Brodvejske Vragolije', 'Mjuzikl, romansa', 120, 'Kad Čovek iz muzičke komedije Brodvejske vragolije poziva da se maštom vratimo u 1928. godinu, on razotkriva i mehanizme ovog žanra poredeći ga sa pornografijom: „Pornografija se ne gleda zbog priče. Baš kao i mjuzikl. Na kraju krajeva, ono što nam je u mjuziklu stvarno uzbudljivo jesu talentovani ljudi koji daju sve od sebe da nama u publici bude zabavno.“', 1200),
(47, 'Antigona', 'Drama', 105, 'Mit koji je Sofokle dramatizovao u Antigoni pripada krugu tebanskih legendi i ne može se naći u Homerovim epovima; možda ga je Sofokle preuzeo iz nekog epa za koji mi ne znamo.', 900),
(50, 'Dama s kamelijama', 'Drama,romansa', 114, 'Tragedija propale devojke, žalosna istorija nesrećne ljubavi ove, već se skoro kroz pedeset godina na svršetku petoga čina jednodušno oplakuje, oplakuje suzama najrazličitijih jezika svetskih, oplakuje suzama iz očiju bez razlike pola i starosti, oplakuje na pozornici, jer se u životu Margaritama za pravo ne daje. Moglo bi se slobodno reći, da je ovo najoplakivanija drama devetnaestoga stoleća.', 1200),
(55, 'Kum nije dugme', 'Tragikomična komedija', 120, 'Predstava Kum nije dugme je tragikomična priča o kumovima, o onom kumovskom odnosu što se kod nas prožima vekovima. Priča je smeštena u današnje vreme i samim tim mnogi će se prepoznati u situacijama i odnosu glavnih junaka. A postavlja pitanje šta je preče kumstvo ili…', 1100),
(56, 'Čikago', 'Mjuzikl', 115, 'Čikago je jedan od najpopularnijih brodvejskih mjuzikala u kome se prepliću strast, požuda, spletke, ubistva, šou bizsnis i potkupljive sudije i advokati. Ovaj visokokvalitetni brodvejski hit kroz mnoštvo muzičkih hitova poput “Sav taj džez”, i niza ekspresivnih i visokokvalitetnih koreografskih numera, na satiričan način govori o Americi iz vremena burnih dvadesetih godina prošlog veka. ', 1500),
(68, 'Ružna i opasna', 'Drama', 113, 'U svakom pozorištu negde je sakriven sat koji ume da otkuca sve drame na svetu. Dobri glumci uvek znaju koliko je sati na tom satu, oni malo bolji – i koliko je minuta. A oni najbolji, oni to tačno vreme umeju da saopšte i publici. Kako im uspeva da taj veličanstveni trenutak u kojem se drama odigrava prebace iz sebe u gledaoca – najveća je pozorišna tajna. I nama, neglumcima, nije dato da je znamo.', 850),
(72, 'Fantom iz opere', 'Mjuzikl, drama', 108, '„Fantom iz Opere” je roman francuskog pisca Gastona Lerua iz 1910. godine koji je svoju najveću popularnost doživeo kroz brojne pozorišne i filmske adaptacije od kojih su najpoznatiji istoimeni nemi horor film iz 1925. godine i mjuzikl Endrju Lojd Vebera 1986. godine.', 2300),
(75, 'Mamma mia!', 'Mjuzikl, romansa, komedija', 128, 'Nije potrebna naročita domišljatost niti veliko umeće da se muzičko pozorište odluči za igranje mjuzikla „Mamma Mia!“. Reč je o jednom od najuspešnijih savremenh mjuzikala na svetu koji je osvojio Brodvej i na desetine pozorinica širom sveta. Stoga se kao najlogičnije nameće pitanje: u čemu se sastoji tajna ogromnog uspeha mjuzikla „Mamma Mia!“?', 1950),
(76, 'Test', 'test', 123, 'Testni opis', 300);

-- --------------------------------------------------------

--
-- Table structure for table `rezervacije`
--

CREATE TABLE `rezervacije` (
  `id` int(11) NOT NULL,
  `salaId` int(11) NOT NULL,
  `sediste` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `datum` date NOT NULL,
  `predstavaId` int(11) NOT NULL,
  `korisnikId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rezervacije`
--

INSERT INTO `rezervacije` (`id`, `salaId`, `sediste`, `datum`, `predstavaId`, `korisnikId`) VALUES
(1, 2, 'A1', '2021-02-25', 56, 1),
(2, 2, 'A5', '2021-03-01', 47, 1),
(3, 1, 'a1', '2021-02-13', 46, 1),
(4, 2, 'A2', '2021-02-25', 56, 1),
(5, 2, 'B2', '2021-02-25', 56, 1),
(6, 2, 'B3', '2021-03-01', 47, 1),
(8, 2, 'B4', '2021-03-01', 47, 1),
(31, 2, 'A4', '2021-02-25', 56, 15);

-- --------------------------------------------------------

--
-- Table structure for table `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `nazivSale` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sala`
--

INSERT INTO `sala` (`id`, `nazivSale`) VALUES
(1, 'Velika sala'),
(2, 'Mala sala');

-- --------------------------------------------------------

--
-- Table structure for table `sedista`
--

CREATE TABLE `sedista` (
  `id` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `salaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sedista`
--

INSERT INTO `sedista` (`id`, `salaId`) VALUES
('a1', 1),
('A1', 2),
('a2', 1),
('A2', 2),
('a3', 1),
('A3', 2),
('a4', 1),
('A4', 2),
('a5', 1),
('A5', 2),
('b1', 1),
('B1', 2),
('b2', 1),
('B2', 2),
('b3', 1),
('B3', 2),
('b4', 1),
('B4', 2),
('b5', 1),
('B5', 2),
('c1', 1),
('c2', 1),
('c3', 1),
('c4', 1),
('c5', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `izvodjenja`
--
ALTER TABLE `izvodjenja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `predstavaId` (`predstavaId`),
  ADD KEY `salaId` (`salaId`);

--
-- Indexes for table `kategorije`
--
ALTER TABLE `kategorije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`korisnikId`);

--
-- Indexes for table `novosti`
--
ALTER TABLE `novosti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `predstava`
--
ALTER TABLE `predstava`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD PRIMARY KEY (`id`),
  ADD KEY `korisnikId` (`korisnikId`),
  ADD KEY `sediste` (`sediste`),
  ADD KEY `predstavaId` (`predstavaId`),
  ADD KEY `salaId` (`salaId`);

--
-- Indexes for table `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `sedista`
--
ALTER TABLE `sedista`
  ADD PRIMARY KEY (`id`,`salaId`) USING BTREE,
  ADD KEY `salaId` (`salaId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `izvodjenja`
--
ALTER TABLE `izvodjenja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategorije`
--
ALTER TABLE `kategorije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `korisnikId` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `novosti`
--
ALTER TABLE `novosti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `predstava`
--
ALTER TABLE `predstava`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `rezervacije`
--
ALTER TABLE `rezervacije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `izvodjenja`
--
ALTER TABLE `izvodjenja`
  ADD CONSTRAINT `izvodjenja_ibfk_1` FOREIGN KEY (`predstavaId`) REFERENCES `predstava` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `izvodjenja_ibfk_2` FOREIGN KEY (`salaId`) REFERENCES `sala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD CONSTRAINT `rezervacije_ibfk_1` FOREIGN KEY (`korisnikId`) REFERENCES `korisnik` (`korisnikId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_4` FOREIGN KEY (`sediste`) REFERENCES `sedista` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_5` FOREIGN KEY (`predstavaId`) REFERENCES `izvodjenja` (`predstavaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacije_ibfk_6` FOREIGN KEY (`salaId`) REFERENCES `izvodjenja` (`salaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sedista`
--
ALTER TABLE `sedista`
  ADD CONSTRAINT `sedista_ibfk_1` FOREIGN KEY (`salaId`) REFERENCES `sala` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
