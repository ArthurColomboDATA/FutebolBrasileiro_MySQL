-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FutebolBrasileiro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FutebolBrasileiro
-- -----------------------------------------------------

DROP SCHEMA `FutebolBrasileiro`;

CREATE SCHEMA IF NOT EXISTS `FutebolBrasileiro` DEFAULT CHARACTER SET utf8 ;
USE `FutebolBrasileiro` ;

-- -----------------------------------------------------
-- Table `FutebolBrasileiro`.`dCalendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FutebolBrasileiro`.`dCalendario` (
  `Data` DATE NOT NULL,
  `DiaSemana` VARCHAR(45) NOT NULL,
  `Mes` VARCHAR(45) NOT NULL,
  `NMes` INT NOT NULL,
  `SemanaMes` INT NOT NULL,
  `Semestre` INT NOT NULL,
  `Trimestre` INT NOT NULL,
  `Ano` INT NOT NULL,
  PRIMARY KEY (`Data`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FutebolBrasileiro`.`CampeonatoBrasileiro`
-- -----------------------------------------------------
DROP TABLE `CampeonatoBrasileiro`;

CREATE TABLE IF NOT EXISTS `FutebolBrasileiro`.`CampeonatoBrasileiro` (
  `ID` INT AUTO_INCREMENT PRIMARY KEY COMMENT 'ID da partida',
  `Data` DATE NOT NULL,
  `Rodada` INT NOT NULL COMMENT 'Rodada do Brasileirão',
  `Horário` TIME NOT NULL COMMENT 'Horário da Partida',
  `Mandante` VARCHAR(150) NOT NULL COMMENT 'Clube Mandante',
  `Visitante` VARCHAR(150) NOT NULL,
  `FormaçãoMandante` VARCHAR(15) NOT NULL,
  `FormaçãoVisitante` VARCHAR(15) NOT NULL,
  `TecnicoMandante` VARCHAR(45) NOT NULL,
  `TecnicoVisitante` VARCHAR(45) NOT NULL,
  `Vencedor` VARCHAR(150) NOT NULL,
  `Arena` VARCHAR(125) NOT NULL,
  `MandantePlacar` INT NOT NULL DEFAULT 0,
  `VisitantePlacar` INT NOT NULL DEFAULT 0,
  `MandanteEstado` CHAR(2) NOT NULL COMMENT 'UF do time',
  `VisitanteEstado` CHAR(2) NOT NULL COMMENT 'UF do time'
);

-- -----------------------------------------------------
-- Table `FutebolBrasileiro`.`Estatísticas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FutebolBrasileiro`.`Estatísticas` (
  `IdPartida` INT NOT NULL,
  `Clube` VARCHAR(125) NOT NULL,
  `Rodada` INT NOT NULL,
  `Chutes` INT NOT NULL,
  `ChutesAGol` INT NOT NULL,
  `PosseDeBola` DECIMAL(5,2),
  `Passes` INT NOT NULL,
  `PrecisaoPasses` DECIMAL(5,2),
  `Faltas` INT NOT NULL DEFAULT 0,
  `CartoesAmarelos` INT NOT NULL DEFAULT 0,
  `CartoesVermelhos` INT NOT NULL DEFAULT 0,
  `Impedimentos` INT NOT NULL DEFAULT 0,
  `Escanteios` INT NOT NULL DEFAULT 0,
  INDEX `fk_Estatisticas_CampeonatoBrasileiro_idx` (`IdPartida` ASC) VISIBLE,
  CONSTRAINT `fk_Estatisticas_CampeonatoBrasileiro`
    FOREIGN KEY (`IdPartida`)
    REFERENCES `FutebolBrasileiro`.`CampeonatoBrasileiro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FutebolBrasileiro`.`Gols`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `Gols`;

CREATE TABLE IF NOT EXISTS `FutebolBrasileiro`.`Gols` (
  `IdPartida` INT NOT NULL,
  `Rodada` INT NOT NULL,
  `Clube` VARCHAR(125) NOT NULL,
  `Atleta` VARCHAR(45) NOT NULL,
  `Minuto` INT NOT NULL COMMENT 'INT pois irá marcar o minuto do gol, dentro dos 90 minutos da partida. Considerando Limite 90',
  `TipoDeGol` VARCHAR(25),
  INDEX `fk_Gols_CampeonatoBrasileiro1_idx` (`IdPartida` ASC) VISIBLE,
  CONSTRAINT `fk_Gols_CampeonatoBrasileiro1`
    FOREIGN KEY (`IdPartida`)
    REFERENCES `FutebolBrasileiro`.`CampeonatoBrasileiro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `FutebolBrasileiro`.`Cartoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FutebolBrasileiro`.`Cartoes` (
  `IdPartida` INT NOT NULL,
  `Rodada` INT NOT NULL,
  `Clube` VARCHAR(45) NOT NULL,
  `Cartao` VARCHAR(10) NOT NULL DEFAULT '-',
  `Atleta` VARCHAR(45) NOT NULL,
  `NumCamisa` INT NOT NULL,
  `Posicao` CHAR(2) NOT NULL COMMENT 'Ataque - AT\nMeio Campista - MC\nDefensor - DF\nGoleiro - GL',
  `Minuto`INT,
  INDEX `fk_Cartoes_CampeonatoBrasileiro1_idx` (`IdPartida` ASC) VISIBLE,
  CONSTRAINT `fk_Cartoes_CampeonatoBrasileiro1`
    FOREIGN KEY (`IdPartida`)
    REFERENCES `FutebolBrasileiro`.`CampeonatoBrasileiro` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

show tables;
-- Consultas

SELECT *
FROM campeonatobrasileiro;

SELECT *
FROM cartoes;

SELECT *
FROM estatísticas;

SELECT *
FROM gols;

-- Views

CREATE VIEW quantidade_penalty AS
SELECT 
    TipoDeGol, 
    COUNT(*) AS quantidade_penaltis
FROM Gols g
INNER JOIN CampeonatoBrasileiro cb ON g.IdPartida = cb.ID
WHERE TipoDeGol = 'Penalty'
  AND YEAR(cb.Data) = YEAR(NOW())
GROUP BY TipoDeGol;

CREATE VIEW cartoes_clube_posicoes AS 
SELECT
	e.Clube,
    c.Posicao,
    SUM(e.CartoesAmarelos) as qntd_cartoes_amarelos,
    SUM(e.CartoesVermelhos) as qntd_cartoes_vermelhos
FROM Cartoes as c
INNER JOIN CampeonatoBrasileiro cb ON c.IdPartida = cb.ID
INNER JOIN  Estatísticas e ON e.IdPartida = cb.ID
WHERE YEAR(cb.Data) >= YEAR(now()) - 5
GROUP BY e.Clube, c.Posicao ;

select * from cartoes_clube_posicoes;

select * from quantidade_penalty;


-- Funções

DELIMITER $$

CREATE FUNCTION ano_partida(ID INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE ano INT;
    
    SELECT YEAR(cb.Data) INTO ano FROM CampeonatoBrasileiro cb WHERE cb.ID = ID;
    
    RETURN ano;
END$$

DELIMITER ;

SELECT ano_partida(8027);

DELIMITER $$

CREATE FUNCTION saldo_cartoes(amarelos INT, vermelhos INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN amarelos + (2 * vermelhos);
END$$

DELIMITER ;

SELECT saldo_cartoes(2, 5);

-- Procedures

DELIMITER //

CREATE PROCEDURE status_partidas_ano (
    IN p_clube VARCHAR(100),
    IN p_ano INT,
    OUT total_partidas INT,
    OUT tt_vitorias INT,
    OUT tt_derrotas INT,
    OUT tt_empates INT
)
BEGIN
    SELECT COUNT(ID) 
    INTO total_partidas 
    FROM CampeonatoBrasileiro 
    WHERE (Mandante = p_clube OR Visitante = p_clube)
      AND YEAR(Data) = p_ano;

    SELECT COUNT(ID) 
    INTO tt_vitorias 
    FROM CampeonatoBrasileiro 
    WHERE Vencedor = p_clube 
      AND YEAR(Data) = p_ano;

    SELECT COUNT(ID) 
    INTO tt_empates 
    FROM CampeonatoBrasileiro 
    WHERE (Mandante = p_clube OR Visitante = p_clube) 
      AND Vencedor = '-' 
      AND YEAR(Data) = p_ano;

    SELECT COUNT(ID) 
    INTO tt_derrotas 
    FROM CampeonatoBrasileiro 
    WHERE (Mandante = p_clube OR Visitante = p_clube) 
      AND Vencedor <> p_clube 
      AND Vencedor <> '-' 
      AND YEAR(Data) = p_ano;
END //

DELIMITER ;


SET @total = 0;
SET @vitorias = 0;
SET @derrotas = 0;
SET @empates = 0;

CALL status_partidas_ano('Corinthians', 2023, @total, @vitorias, @derrotas, @empates);

SELECT @total AS total_partidas, @vitorias AS vitorias, @derrotas AS derrotas, @empates AS empates;

SELECT *
From campeonatobrasileiro
Where Mandante = 'Corinthians' OR Visitante = 'Corinthians';
