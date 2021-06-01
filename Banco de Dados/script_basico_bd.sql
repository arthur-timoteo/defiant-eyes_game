-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 01-Jun-2021 às 15:26
-- Versão do servidor: 10.3.22-MariaDB-log
-- versão do PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `269117`
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
(1, 1, 83, 1858, 3, 18, '2021-06-01 15:16:53', 1),
(2, 2, 108, 2136, 2, 18, '2021-06-01 15:18:49', 1),
(3, 3, 122, 1662, 4, 13, '2021-06-01 15:21:30', 1),
(4, 1, 58, 1726, 3, 17, '2021-06-01 15:23:11', 2),
(5, 2, 65, 1946, 3, 19, '2021-06-01 15:24:24', 2),
(6, 1, 54, 1420, 3, 14, '2021-06-01 15:25:50', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_pontos_maximos`
--

CREATE TABLE `tbl_pontos_maximos` (
  `id_pontos_maximos` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `pontos_maximos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tbl_pontos_maximos`
--

INSERT INTO `tbl_pontos_maximos` (`id_pontos_maximos`, `id_usuario`, `pontos_maximos`) VALUES
(1, 1, 5656),
(2, 2, 3672),
(3, 3, 1420),
(4, 4, 0);

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
(1, 'Arthur', 'arthur@email.com', '123', 3, 1, '2021-06-01'),
(2, 'Bruce', 'bruce@email.com', '456', 2, 1, '2021-06-01'),
(3, 'Henrique', 'henrique@email.com', '789', 1, 1, '2021-06-01'),
(4, 'Luiz', 'luiz@email.com', '147', 1, 1, '2021-06-01');

--
-- Acionadores `tbl_usuario`
--
DELIMITER $$
CREATE TRIGGER `trgr_cadastra_usuario_tbl_pontos_maximos` AFTER INSERT ON `tbl_usuario` FOR EACH ROW BEGIN
	INSERT INTO tbl_pontos_maximos (id_usuario,pontos_maximos) VALUES (NEW.id_usuario,0);
END
$$
DELIMITER ;

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
  MODIFY `id_metrica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tbl_pontos_maximos`
--
ALTER TABLE `tbl_pontos_maximos`
  MODIFY `id_pontos_maximos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
