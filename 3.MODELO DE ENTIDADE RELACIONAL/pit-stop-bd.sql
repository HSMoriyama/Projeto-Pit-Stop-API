-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Nov-2022 às 22:35
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pit-stop-bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento_servico`
--

CREATE TABLE `agendamento_servico` (
  `id_servico` int(11) NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `nome_oficina` varchar(100) DEFAULT NULL,
  `data` varchar(15) DEFAULT NULL,
  `horario` varchar(15) DEFAULT NULL,
  `descricao_servico` varchar(255) DEFAULT NULL,
  `cliente_id_cliente` int(11) DEFAULT NULL,
  `oficina_id_oficina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agendamento_servico`
--

INSERT INTO `agendamento_servico` (`id_servico`, `nome_cliente`, `nome_oficina`, `data`, `horario`, `descricao_servico`, `cliente_id_cliente`, `oficina_id_oficina`) VALUES
(1, 'Monteiro Lobato', NULL, '21/12/2022', '16:30', 'Fixar parachoque e retrovisor.', NULL, NULL),
(4, 'Higor Daniel de Oliveira Moriyama Souza', 'Wagner Auto-center', '21/12/2022', '16:30', 'Fixar a repimboca da parafuseta.', NULL, NULL),
(5, 'James Bond', 'Sahib Auto Center', '29/12/2022', '10:00', 'Retifica do motor do FIAT 147.', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` bigint(15) DEFAULT NULL,
  `rg` bigint(15) DEFAULT NULL,
  `telefone` bigint(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `oficina_id_oficina` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `cpf`, `rg`, `telefone`, `email`, `endereco`, `oficina_id_oficina`) VALUES
(2, 'Monteiro Lobato', 75667587690, 4878998789, 998266286, 'lobato@email.com', 'B.Itapeva 3, Rua 9, n 512', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `oficina`
--

CREATE TABLE `oficina` (
  `id_oficina` int(11) NOT NULL,
  `razao_social` varchar(100) DEFAULT NULL,
  `cnpj` bigint(255) DEFAULT NULL,
  `telefone` bigint(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `oficina`
--

INSERT INTO `oficina` (`id_oficina`, `razao_social`, `cnpj`, `telefone`, `email`, `endereco`, `status`) VALUES
(1, 'Jr Paralamas', 22222222222222, 35212795, 'jr@email.com', 'B.Itapeva 3, Rua 4, n 798', 'LIVRE');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_user` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_user`, `nome`, `senha`) VALUES
(2, 'Daniel Silva', '007'),
(4, 'Jaiminho Bonder', '0074'),
(5, 'Jaiminho Bonder', '0074'),
(6, 'Perceu de Odin2', '0074');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD PRIMARY KEY (`id_servico`),
  ADD KEY `FKqadloufw92f1eel4nle511sef` (`cliente_id_cliente`),
  ADD KEY `FK69at814x0hkdcfkwoh764fs4g` (`oficina_id_oficina`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `FK34s9ww91kdaselmrdpovnmtp0` (`oficina_id_oficina`);

--
-- Índices para tabela `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`id_oficina`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  MODIFY `id_servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `oficina`
--
ALTER TABLE `oficina`
  MODIFY `id_oficina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD CONSTRAINT `FK69at814x0hkdcfkwoh764fs4g` FOREIGN KEY (`oficina_id_oficina`) REFERENCES `oficina` (`id_oficina`),
  ADD CONSTRAINT `FKqadloufw92f1eel4nle511sef` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK34s9ww91kdaselmrdpovnmtp0` FOREIGN KEY (`oficina_id_oficina`) REFERENCES `oficina` (`id_oficina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
