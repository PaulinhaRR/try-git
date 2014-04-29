-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 29-Abr-2014 às 18:07
-- Versão do servidor: 5.6.12-log
-- versão do PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `try_git`
--
CREATE DATABASE IF NOT EXISTS `try_git` DEFAULT CHARACTER SET latin1 COLLATE latin1_german1_ci;
USE `try_git`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `tel` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `pizza_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `endEntrega` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id_idx` (`id`),
  KEY `pizza_id_idx` (`id`),
  KEY `usuario_id_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pizza`
--

CREATE TABLE IF NOT EXISTS `pizza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  `ingrediente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `pizza`
--

INSERT INTO `pizza` (`id`, `nome`, `preco`, `ingrediente`) VALUES
(1, 'Calabresa', 15, 'linguiça seca e cebola'),
(2, 'Mussarela', 15, 'Queijo mussarela e tomate');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `usuario_id` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cliente_id` FOREIGN KEY (`id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pizza_id` FOREIGN KEY (`id`) REFERENCES `pizza` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
