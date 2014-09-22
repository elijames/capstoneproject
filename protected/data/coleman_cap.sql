SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema coleman_cap
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coleman_cap` DEFAULT CHARACTER SET utf8 ;
USE `coleman_cap` ;

-- -----------------------------------------------------
-- Table `coleman_cap`.`usertype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`usertype` (
  `idUserType` INT(11) NOT NULL,
  `UserType` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idUserType`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`user` (
  `idUser` INT(11) NOT NULL,
  `idUserType` INT(11) NULL DEFAULT NULL,
  `LastName` VARCHAR(20) NULL DEFAULT NULL,
  `FirstName` VARCHAR(15) NULL DEFAULT NULL,
  `Password` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(5) NULL DEFAULT NULL,
  `Phone` INT(11) NULL DEFAULT NULL,
  `idStatus` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `idUser` (`idUser` ASC),
  INDEX `idUserType_idx` (`idUserType` ASC),
  CONSTRAINT `idUserType`
    FOREIGN KEY (`idUserType`)
    REFERENCES `coleman_cap`.`usertype` (`idUserType`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`analysis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`analysis` (
  `idAnalysis` INT(11) NOT NULL,
  `idCustomer` INT(11) NOT NULL,
  `idUser` INT(11) NOT NULL,
  `Comments` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idAnalysis`),
  INDEX `idAnalysis` (`idAnalysis` ASC),
  INDEX `idUser_idx` (`idUser` ASC),
  CONSTRAINT `idUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `coleman_cap`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`analysisstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`analysisstatus` (
  `id` INT(11) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`category` (
  `idCategory` INT(11) NOT NULL,
  `Category` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`customer` (
  `idCustomer` INT(11) NOT NULL,
  `Company` VARCHAR(20) NULL DEFAULT NULL,
  `ContactLast` VARCHAR(20) NULL DEFAULT NULL,
  `ContactFirst` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` INT(11) NULL DEFAULT NULL,
  `Contacttitle` VARCHAR(20) NULL DEFAULT NULL,
  `BusinessAddress` VARCHAR(30) NULL DEFAULT NULL,
  `idStatus` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`proposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`proposal` (
  `idProposal` INT(11) NOT NULL,
  `idAnalysis` INT(11) NULL DEFAULT NULL,
  `TimeStamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProposal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`question` (
  `idQuestion` INT(11) NOT NULL,
  `Question` VARCHAR(45) NULL DEFAULT NULL,
  `OptA` VARCHAR(1) NULL DEFAULT NULL,
  `OptB` VARCHAR(1) NULL DEFAULT NULL,
  `OptC` VARCHAR(1) NULL DEFAULT NULL,
  `OptD` VARCHAR(1) NULL DEFAULT NULL,
  `idCategory` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idQuestion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`status` (
  `idStatus` INT(11) NOT NULL,
  `Status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `coleman_cap`.`survey`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coleman_cap`.`survey` (
  `idSurvey` INT(11) NOT NULL,
  `Answer` CHAR(1) NULL DEFAULT NULL,
  `idQuestion` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idSurvey`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
