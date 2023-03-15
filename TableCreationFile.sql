-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema msds
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema msds
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `msds` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `msds` ;

-- -----------------------------------------------------
-- Table `msds`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msds`.`courses` (
  `courseID` VARCHAR(45) NOT NULL,
  `name` TEXT NOT NULL,
  `description_short` TEXT NOT NULL,
  `active` BIGINT NOT NULL,
  `learning_objectives_idlearning_objectives` VARCHAR(45) NOT NULL,
  `curriculum_idcurriculum` INT NOT NULL,
  PRIMARY KEY (`courseID`, `learning_objectives_idlearning_objectives`, `curriculum_idcurriculum`),
  INDEX `courseID` (`courseID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `msds`.`terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msds`.`terms` (
  `term_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `msds`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msds`.`faculty` (
  `name` VARCHAR(45) NOT NULL DEFAULT NULL,
  `active` TINYINT NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `msds`.`curriculum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msds`.`curriculum` (
  `idcurriculum` INT NOT NULL,
  `termid` VARCHAR(45) NULL DEFAULT NULL,
  `course_id` VARCHAR(45) NULL DEFAULT NULL,
  `instructor_id` VARCHAR(45) CHARACTER SET 'armscii8' NULL DEFAULT NULL,
  `faculty_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcurriculum`),
  INDEX `instructor_idx` (`instructor_id` ASC) VISIBLE,
  INDEX `term_idx` (`termid` ASC) VISIBLE,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_curriculum_faculty1_idx` (`faculty_name` ASC) VISIBLE,
  CONSTRAINT `term`
    FOREIGN KEY (`termid`)
    REFERENCES `msds`.`terms` (`term_id`),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `msds`.`courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_curriculum_faculty1`
    FOREIGN KEY (`faculty_name`)
    REFERENCES `msds`.`faculty` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `msds`.`learning_objectives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `msds`.`learning_objectives` (
  `idlearning_objectives` VARCHAR(45) NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `active` TINYINT NOT NULL DEFAULT '1',
  `courses_courseID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlearning_objectives`),
  UNIQUE INDEX `idx_learning_objectives_idlearning_objectives` (`idlearning_objectives` ASC) VISIBLE,
  INDEX `course_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_learning_objectives_courses1_idx` (`courses_courseID` ASC) VISIBLE,
  CONSTRAINT `fk_learning_objectives_courses1`
    FOREIGN KEY (`courses_courseID`)
    REFERENCES `msds`.`courses` (`courseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
