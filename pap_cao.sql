-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Maio-2025 às 10:34
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pap_cao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `NomeAnimal` varchar(100) NOT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `aniversario` date DEFAULT NULL,
  `observacoes` varchar(110) NOT NULL,
  `ativo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `animal`
--

INSERT INTO `animal` (`idAnimal`, `idCliente`, `NomeAnimal`, `raca`, `aniversario`, `observacoes`, `ativo`) VALUES
(35, 18, 'Bolt', 'cao', '2025-03-26', '', 1),
(36, 18, 'aaa', 'A', '2025-04-02', '', 1),
(37, 20, 'Elsa', 'Toda Boa', '2025-04-23', 'Rabudinha', 1),
(38, 20, 'sfdsf', 'sds', '2025-04-23', '', 1),
(39, 18, 'Cao1', 'Cao', '2025-04-30', '', 1),
(40, 19, 'Cao2', 'Caocao', '2025-04-30', '', 1),
(41, 20, 'Cao3', 'Caocao', '2025-05-01', '', 1),
(42, 18, 'Pedropedro', 'a', '2025-05-06', '', 1),
(43, 23, 'alfredo', 'cao', '2025-05-07', 'raivoso\r\n', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(200) DEFAULT NULL,
  `nif` varchar(15) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `morada`, `nif`, `telefone`, `email`) VALUES
(18, 'Joao', 'AA', '123456789', '999999999', 'aaa@gmail.com'),
(19, 'Afonso', 'AA', '543215432', '913567234', 'bernardo@gmail.com'),
(20, 'Rodrigo Romao', 'Rua do intermache', '555444333', '943675223', 'rodrigo.romao@gmail.com'),
(21, 'a', 'a', '111111111', '111111111', '@'),
(22, 'teste1', 'assad', '222222222', '222222222', '@'),
(23, 'Afonos Onça', 'Rua Jose Luis RIbeiro', '999880991', '922322322', 'afonso.onca10@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemvenda`
--

CREATE TABLE `itemvenda` (
  `idItemVenda` int(11) NOT NULL,
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `precoUnitario` decimal(10,2) NOT NULL,
  `quantidadeEmStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `nome`, `descricao`, `precoUnitario`, `quantidadeEmStock`) VALUES
(7, 'pao', 'Descrição', 15.00, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `registoservicos`
--

CREATE TABLE `registoservicos` (
  `idRegistro` int(11) NOT NULL,
  `idAnimal` int(11) NOT NULL,
  `idServico` int(11) NOT NULL,
  `data` date NOT NULL,
  `observacoes` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `registoservicos`
--

INSERT INTO `registoservicos` (`idRegistro`, `idAnimal`, `idServico`, `data`, `observacoes`, `preco`) VALUES
(51, 35, 13, '2025-03-26', '', 12.00),
(54, 37, 14, '2025-04-23', 'lavadinho', 13.00),
(55, 35, 11, '2025-04-30', '', 12.00),
(56, 43, 15, '2025-05-07', '', 16.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `idServico` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`idServico`, `descricao`) VALUES
(11, 'Tosquias'),
(12, 'Escovagem'),
(13, 'Corte de Unhas'),
(14, 'Stripping'),
(15, 'Cortes de Raça'),
(19, 'Banhos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendaproduto`
--

CREATE TABLE `vendaproduto` (
  `idVenda` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `precoUnitario` decimal(10,2) NOT NULL,
  `dataVenda` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `vendaproduto`
--

INSERT INTO `vendaproduto` (`idVenda`, `idCliente`, `idProduto`, `quantidade`, `precoUnitario`, `dataVenda`, `total`) VALUES
(2, 18, 7, 2, 14.00, '2025-03-29', 28.00),
(3, 18, 7, 1, 14.00, '2025-03-29', 14.00),
(4, 19, 7, 1, 14.00, '2025-04-02', 14.00),
(5, 20, 7, 1, 14.00, '2025-05-01', 14.00),
(6, 19, 7, 1, 14.00, '2025-05-01', 14.00),
(7, 19, 7, 2, 14.00, '2025-05-01', 28.00),
(8, 19, 7, 2, 14.00, '2025-05-06', 28.00),
(9, 23, 7, 2, 14.00, '2025-05-07', 28.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idAnimal`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`idItemVenda`),
  ADD KEY `idVenda` (`idVenda`),
  ADD KEY `idProduto` (`idProduto`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `registoservicos`
--
ALTER TABLE `registoservicos`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `idAnimal` (`idAnimal`),
  ADD KEY `idServico` (`idServico`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`idServico`),
  ADD UNIQUE KEY `DataServico` (`idServico`);

--
-- Índices para tabela `vendaproduto`
--
ALTER TABLE `vendaproduto`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idProduto` (`idProduto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `idAnimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  MODIFY `idItemVenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `registoservicos`
--
ALTER TABLE `registoservicos`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `idServico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `vendaproduto`
--
ALTER TABLE `vendaproduto`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `itemvenda_ibfk_1` FOREIGN KEY (`idVenda`) REFERENCES `vendaproduto` (`idVenda`) ON DELETE CASCADE,
  ADD CONSTRAINT `itemvenda_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `registoservicos`
--
ALTER TABLE `registoservicos`
  ADD CONSTRAINT `registoservicos_ibfk_1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`) ON DELETE CASCADE,
  ADD CONSTRAINT `registoservicos_ibfk_2` FOREIGN KEY (`idServico`) REFERENCES `servico` (`idServico`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `vendaproduto`
--
ALTER TABLE `vendaproduto`
  ADD CONSTRAINT `vendaproduto_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendaproduto_ibfk_2` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
