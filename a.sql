-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para agro
CREATE DATABASE IF NOT EXISTS `agro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `agro`;

-- Copiando estrutura para tabela agro.colheita
CREATE TABLE IF NOT EXISTS `colheita` (
  `ID_Colheita` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Plantio` int(11) NOT NULL,
  `Data_Colheita` date NOT NULL,
  `Quantidade_Colhida` int(11) NOT NULL,
  `Qualidade` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Colheita`),
  KEY `ID_Plantio` (`ID_Plantio`),
  CONSTRAINT `colheita_ibfk_1` FOREIGN KEY (`ID_Plantio`) REFERENCES `plantio` (`ID_Plantio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela agro.colheita: ~1 rows (aproximadamente)
INSERT INTO `colheita` (`ID_Colheita`, `ID_Plantio`, `Data_Colheita`, `Quantidade_Colhida`, `Qualidade`) VALUES
	(1, 1, '2024-05-07', 80, 'Classe A');

-- Copiando estrutura para tabela agro.irrigacao
CREATE TABLE IF NOT EXISTS `irrigacao` (
  `IID_Irrigacao` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Plantio` int(11) NOT NULL,
  `Horario_Inicial` time NOT NULL,
  `Horario_Final` time NOT NULL,
  PRIMARY KEY (`IID_Irrigacao`),
  KEY `ID_Plantio` (`ID_Plantio`),
  CONSTRAINT `irrigacao_ibfk_1` FOREIGN KEY (`ID_Plantio`) REFERENCES `plantio` (`ID_Plantio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela agro.irrigacao: ~1 rows (aproximadamente)
INSERT INTO `irrigacao` (`IID_Irrigacao`, `ID_Plantio`, `Horario_Inicial`, `Horario_Final`) VALUES
	(1, 1, '08:00:00', '10:00:00');

-- Copiando estrutura para tabela agro.plantio
CREATE TABLE IF NOT EXISTS `plantio` (
  `ID_Plantio` int(11) NOT NULL AUTO_INCREMENT,
  `Variedade` varchar(50) NOT NULL,
  `Data_Plantio` date NOT NULL,
  `Quantidade_Plantada` int(11) NOT NULL,
  `Localizacao` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Plantio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela agro.plantio: ~1 rows (aproximadamente)
INSERT INTO `plantio` (`ID_Plantio`, `Variedade`, `Data_Plantio`, `Quantidade_Plantada`, `Localizacao`) VALUES
	(1, 'Valência', '2024-03-15', 100, 'Bloco A');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
