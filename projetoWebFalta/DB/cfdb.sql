-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04-Dez-2020 às 04:03
-- Versão do servidor: 10.1.36-MariaDB
-- versão do PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cfdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `codAgend` int(11) NOT NULL,
  `descAgend` mediumtext,
  `idUsuarioFk` int(11) NOT NULL,
  `dataAgend` datetime DEFAULT CURRENT_TIMESTAMP,
  `dataTreino` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

CREATE TABLE `blog` (
  `codTexto` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `texto` text,
  `idUsuarioFk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `blog`
--

INSERT INTO `blog` (`codTexto`, `titulo`, `texto`, `idUsuarioFk`) VALUES
(1, 'titulo qualquer', 'testeeeaasdas', 2),
(2, 'titulo qualquer', 'aaasadas', 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dadosusuario`
--

CREATE TABLE `dadosusuario` (
  `codDadosU` int(11) NOT NULL,
  `idUsuarioFk` int(11) NOT NULL,
  `cpfUsuario` int(11) NOT NULL,
  `rgUsuario` int(9) NOT NULL,
  `endUsuario` text NOT NULL,
  `nascUsuario` date DEFAULT NULL,
  `cepUsuario` int(12) NOT NULL,
  `naciUsuario` text,
  `dataAlt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `dadosusuario`
--

INSERT INTO `dadosusuario` (`codDadosU`, `idUsuarioFk`, `cpfUsuario`, `rgUsuario`, `endUsuario`, `nascUsuario`, `cepUsuario`, `naciUsuario`, `dataAlt`) VALUES
(1, 2, 0, 0, 'Rua das Candangas, 123', '1998-12-16', 12345678, 'Brasil', '2020-12-01 20:37:21'),
(2, 8, 1234, 1234, 'aasdsfsadfasdg', '1998-12-16', 12345678, 'BRASIL', '2020-12-02 03:58:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dataagend`
--

CREATE TABLE `dataagend` (
  `codData` int(11) NOT NULL,
  `dataDispo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(100) NOT NULL,
  `nickUsuario` varchar(40) NOT NULL,
  `emailUsuario` varchar(150) NOT NULL,
  `senhaUsuario` varchar(32) NOT NULL,
  `dataCad` datetime DEFAULT CURRENT_TIMESTAMP,
  `dataAlt` datetime DEFAULT CURRENT_TIMESTAMP,
  `rank` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nomeUsuario`, `nickUsuario`, `emailUsuario`, `senhaUsuario`, `dataCad`, `dataAlt`, `rank`) VALUES
(2, 'Professor', 'admin', 'admin@teste.com', '81dc9bdb52d04dc20036dbd8313ed055', '2020-12-01 06:27:51', '2020-12-01 06:27:51', 9),
(8, 'Yan', 'yaan', 'yangoular@teste.com', '81dc9bdb52d04dc20036dbd8313ed055', '2020-12-02 02:40:30', '2020-12-02 02:40:30', 9),
(42, 'Gabriel', 'gabriel', 'gabriel@g.com', '81dc9bdb52d04dc20036dbd8313ed055', '2020-12-03 22:57:23', '2020-12-03 22:57:23', 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`codAgend`),
  ADD KEY `idUsuarioFk` (`idUsuarioFk`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`codTexto`),
  ADD KEY `idUsuarioFk` (`idUsuarioFk`);

--
-- Indexes for table `dadosusuario`
--
ALTER TABLE `dadosusuario`
  ADD PRIMARY KEY (`codDadosU`),
  ADD UNIQUE KEY `idUsuarioFk` (`idUsuarioFk`),
  ADD UNIQUE KEY `cpfUsuario` (`cpfUsuario`),
  ADD UNIQUE KEY `rgUsuario` (`rgUsuario`);

--
-- Indexes for table `dataagend`
--
ALTER TABLE `dataagend`
  ADD PRIMARY KEY (`codData`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nickUsuario` (`nickUsuario`),
  ADD UNIQUE KEY `emailUsuario` (`emailUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `codAgend` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `codTexto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dadosusuario`
--
ALTER TABLE `dadosusuario`
  MODIFY `codDadosU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dataagend`
--
ALTER TABLE `dataagend`
  MODIFY `codData` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`idUsuarioFk`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`idUsuarioFk`) REFERENCES `usuario` (`idUsuario`);

--
-- Limitadores para a tabela `dadosusuario`
--
ALTER TABLE `dadosusuario`
  ADD CONSTRAINT `dadosusuario_ibfk_1` FOREIGN KEY (`idUsuarioFk`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
