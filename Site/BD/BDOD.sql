-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Maio-2021 às 01:21
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `test`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_metrica`
--

CREATE TABLE `tbl_metrica` (
  `id_metrica` int(11) NOT NULL,
  `numero_fase` int(11) NOT NULL,
  `tempo_gasto` int(11) NOT NULL,
  `pontos` int(11) NOT NULL,
  `quantidade_vidas` int(11) NOT NULL,
  `inimigos_matados` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_metrica`
--

INSERT INTO `tbl_metrica` (`id_metrica`, `numero_fase`, `tempo_gasto`, `pontos`, `quantidade_vidas`, `inimigos_matados`, `data`, `id_usuario`) VALUES
(1, 1, 100, 1000, 1, 3, '2021-05-15 00:00:00', 1),
(2, 1, 110, 1000, 0, 4, '2021-05-15 00:00:00', 2),
(3, 2, 115, 1000, 1, 5, '2021-05-15 00:00:00', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pontos_maximos`
--

CREATE TABLE `tbl_pontos_maximos` (
  `id_pontos_maximos` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `pontos_maximos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(125) NOT NULL,
  `email` varchar(125) NOT NULL,
  `senha` varchar(125) NOT NULL,
  `fase_atual` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `criado_em` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nome`, `email`, `senha`, `fase_atual`, `status`, `criado_em`) VALUES
(1, 'Arthur', 'arthur@email.com', '123', 1, 1, '2021-05-15'),
(2, 'Bruce', 'bruce@email.com', '456', 1, 1, '2021-05-15'),
(3, 'Luiz', 'luiz@email.com', '789', 1, 1, '2021-05-15');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_metrica`
--
ALTER TABLE `tbl_metrica`
  ADD PRIMARY KEY (`id_metrica`);

--
-- Índices para tabela `tbl_pontos_maximos`
--
ALTER TABLE `tbl_pontos_maximos`
  ADD PRIMARY KEY (`id_pontos_maximos`);

--
-- Índices para tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_metrica`
--
ALTER TABLE `tbl_metrica`
  MODIFY `id_metrica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbl_pontos_maximos`
--
ALTER TABLE `tbl_pontos_maximos`
  MODIFY `id_pontos_maximos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
