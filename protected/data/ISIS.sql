SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Proposal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Proposal` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Proposal` (
  `ProposalID` INT NOT NULL AUTO_INCREMENT,
  `AnalysisID` INT NULL,
  `TimeStamp` DATETIME NOT NULL,
  PRIMARY KEY (`ProposalID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Status` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`UserType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserType` (
  `idUserType` INT NOT NULL AUTO_INCREMENT,
  `UserType` VARCHAR(45) NULL,
  PRIMARY KEY (`idUserType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`User` ;

CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `UserTypeID` INT NULL,
  `LastName` TEXT NULL,
  `FirstName` TEXT NULL,
  `Password` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Phone` INT(11) NULL,
  `StatusID` INT NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Status1_idx` (`StatusID` ASC),
  INDEX `fk_User_UserType1_idx` (`UserTypeID` ASC),
  CONSTRAINT `fk_User_Status1`
    FOREIGN KEY (`StatusID`)
    REFERENCES `mydb`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_UserType1`
    FOREIGN KEY (`UserTypeID`)
    REFERENCES `mydb`.`UserType` (`idUserType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Analysis`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Analysis` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Analysis` (
  `idAnalysis` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` INT NOT NULL,
  `UserID` INT NOT NULL,
  `Comments` BLOB NULL,
  PRIMARY KEY (`idAnalysis`),
  INDEX `fk_Analysis_User1_idx` (`UserID` ASC),
  CONSTRAINT `fk_Analysis_Proposal1`
    FOREIGN KEY (`idAnalysis`)
    REFERENCES `mydb`.`Proposal` (`AnalysisID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Analysis_User1`
    FOREIGN KEY (`UserID`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AnalysisStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`AnalysisStatus` ;

CREATE TABLE IF NOT EXISTS `mydb`.`AnalysisStatus` (
  `ID` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_AnalysisStatus_Analysis1`
    FOREIGN KEY (`ID`)
    REFERENCES `mydb`.`Analysis` (`idAnalysis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Survey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Survey` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Survey` (
  `idSurvey` INT NOT NULL AUTO_INCREMENT,
  `Answer` CHAR NULL,
  `idAnalysis` INT NULL,
  PRIMARY KEY (`idSurvey`),
  INDEX `fk_Survey_Analysis1_idx` (`idAnalysis` ASC),
  CONSTRAINT `fk_Survey_Analysis1`
    FOREIGN KEY (`idAnalysis`)
    REFERENCES `mydb`.`Analysis` (`idAnalysis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Question`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Question` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Question` (
  `idQuestion` INT NOT NULL AUTO_INCREMENT,
  `Question` TEXT NULL,
  `OptA` TEXT NULL,
  `OptB` TEXT NULL,
  `OptC` TEXT NULL,
  `OptD` TEXT NULL,
  `CategoryID` INT NULL,
  PRIMARY KEY (`idQuestion`),
  INDEX `fk_Question_Category1_idx` (`CategoryID` ASC),
  CONSTRAINT `fk_Question_Survey1`
    FOREIGN KEY (`idQuestion`)
    REFERENCES `mydb`.`Survey` (`idAnalysis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_Category1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `Company` TEXT NULL,
  `ContactLast` TEXT NULL,
  `ContactFirst` TEXT NULL,
  `E-Mail` VARCHAR(45) NULL,
  `Phone` INT(11) NULL,
  `ContactTitle` TEXT NULL,
  `BusinessAddress` TEXT NULL,
  `StatusID` INT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Customer_Status1_idx` (`StatusID` ASC),
  CONSTRAINT `fk_Customer_Analysis1`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `mydb`.`Analysis` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Status1`
    FOREIGN KEY (`StatusID`)
    REFERENCES `mydb`.`Status` (`idStatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
