-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/10/2025 às 02:25
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `avaliabd`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aprovacao`
--

CREATE TABLE `aprovacao` (
  `idAprovacao` int(11) NOT NULL,
  `idProva` int(11) NOT NULL,
  `justificativaCoord` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aprovacao`
--

INSERT INTO `aprovacao` (`idAprovacao`, `idProva`, `justificativaCoord`, `status`) VALUES
(1, 1, 'Fantau algo', 'Reprovado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenador`
--

CREATE TABLE `coordenador` (
  `idCoordenador` int(11) NOT NULL,
  `nomeCoordenador` varchar(255) NOT NULL,
  `matriCoordenador` varchar(255) NOT NULL,
  `emailCoordenador` varchar(255) NOT NULL,
  `senhaCoordenador` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `coordenador`
--

INSERT INTO `coordenador` (`idCoordenador`, `nomeCoordenador`, `matriCoordenador`, `emailCoordenador`, `senhaCoordenador`) VALUES
(1, 'Julio Cezar', '1235', 'julio@gmail.com', 'juli123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina`
--

CREATE TABLE `disciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nomeDisciplina` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `disciplina`
--

INSERT INTO `disciplina` (`idDisciplina`, `nomeDisciplina`) VALUES
(1, 'Redes'),
(2, 'Projetos de Redes'),
(3, 'Sistemas Operacionais');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `idProfessor` int(11) NOT NULL,
  `nomeProfessor` varchar(255) NOT NULL,
  `matriProfessor` varchar(255) NOT NULL,
  `emailProfessor` varchar(255) NOT NULL,
  `senhaProfessor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`idProfessor`, `nomeProfessor`, `matriProfessor`, `emailProfessor`, `senhaProfessor`) VALUES
(1, 'Carlos', '1254', 'carlos@gmail.com', 'bernardo123'),
(2, 'Jadir', '14254', 'Jadir@gmail.com', 'jadir123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `professordisciplina`
--

CREATE TABLE `professordisciplina` (
  `idProfessorDisciplina` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professordisciplina`
--

INSERT INTO `professordisciplina` (`idProfessorDisciplina`, `idProfessor`, `idDisciplina`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `prova`
--

CREATE TABLE `prova` (
  `idProva` int(11) NOT NULL,
  `idProfessor` int(11) NOT NULL,
  `idQuestao` int(11) NOT NULL,
  `idDisciplina` int(11) NOT NULL,
  `cabecalho` varchar(255) NOT NULL,
  `dataCriacao` varchar(255) NOT NULL,
  `statusDev` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `prova`
--

INSERT INTO `prova` (`idProva`, `idProfessor`, `idQuestao`, `idDisciplina`, `cabecalho`, `dataCriacao`, `statusDev`) VALUES
(1, 1, 1, 1, 'Aqui fica o cabe?alho padr?o da prova', '16/10/2025', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `questao`
--

CREATE TABLE `questao` (
  `idQuestao` int(11) NOT NULL,
  `textQuestao` varchar(255) NOT NULL,
  `alterA` varchar(255) NOT NULL,
  `alterB` varchar(255) NOT NULL,
  `alterC` varchar(255) NOT NULL,
  `alterD` varchar(255) NOT NULL,
  `alterE` varchar(255) NOT NULL,
  `resposta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `questao`
--

INSERT INTO `questao` (`idQuestao`, `textQuestao`, `alterA`, `alterB`, `alterC`, `alterD`, `alterE`, `resposta`) VALUES
(1, 'Qual a cor do c?u?', 'Azul', 'Preto', 'Rosa', 'Laranja', 'Cinza', 'Azul: Letra A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aprovacao`
--
ALTER TABLE `aprovacao`
  ADD PRIMARY KEY (`idAprovacao`),
  ADD KEY `fk_idProva` (`idProva`);

--
-- Índices de tabela `coordenador`
--
ALTER TABLE `coordenador`
  ADD PRIMARY KEY (`idCoordenador`);

--
-- Índices de tabela `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`idDisciplina`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idProfessor`);

--
-- Índices de tabela `professordisciplina`
--
ALTER TABLE `professordisciplina`
  ADD PRIMARY KEY (`idProfessorDisciplina`),
  ADD KEY `idProfessor` (`idProfessor`),
  ADD KEY `idDisciplina` (`idDisciplina`);

--
-- Índices de tabela `prova`
--
ALTER TABLE `prova`
  ADD PRIMARY KEY (`idProva`),
  ADD KEY `fk_idProfessor` (`idProfessor`),
  ADD KEY `fk_idDisciplina` (`idDisciplina`),
  ADD KEY `fk_idQuestao` (`idQuestao`);

--
-- Índices de tabela `questao`
--
ALTER TABLE `questao`
  ADD PRIMARY KEY (`idQuestao`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aprovacao`
--
ALTER TABLE `aprovacao`
  MODIFY `idAprovacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `coordenador`
--
ALTER TABLE `coordenador`
  MODIFY `idCoordenador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idProfessor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `professordisciplina`
--
ALTER TABLE `professordisciplina`
  MODIFY `idProfessorDisciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `prova`
--
ALTER TABLE `prova`
  MODIFY `idProva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `questao`
--
ALTER TABLE `questao`
  MODIFY `idQuestao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aprovacao`
--
ALTER TABLE `aprovacao`
  ADD CONSTRAINT `fk_idProva` FOREIGN KEY (`idProva`) REFERENCES `prova` (`idProva`);

--
-- Restrições para tabelas `professordisciplina`
--
ALTER TABLE `professordisciplina`
  ADD CONSTRAINT `professordisciplina_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idProfessor`),
  ADD CONSTRAINT `professordisciplina_ibfk_2` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`);

--
-- Restrições para tabelas `prova`
--
ALTER TABLE `prova`
  ADD CONSTRAINT `fk_idDisciplina` FOREIGN KEY (`idDisciplina`) REFERENCES `disciplina` (`idDisciplina`),
  ADD CONSTRAINT `fk_idProfessor` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idProfessor`),
  ADD CONSTRAINT `fk_idQuestao` FOREIGN KEY (`idQuestao`) REFERENCES `questao` (`idQuestao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
