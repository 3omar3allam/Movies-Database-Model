-- MySQL Script generated by MySQL Workbench
-- Wed 05 Dec 2018 12:48:34 AM EET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Movies` ;
USE `Movies` ;

-- -----------------------------------------------------
-- Table `Movies`.`award`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`award` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `year` YEAR(4) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `award_idx` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`claims`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`claims` (
  `person_id` INT(11) NULL,
  `award_id` INT(11) NOT NULL,
  `movie_id` INT(11) NOT NULL,
  PRIMARY KEY (`award_id`),
  INDEX `award_idx` (`award_id` ASC),
  INDEX `person_idx` (`person_id` ASC),
  INDEX `movie_idx` (`movie_id` ASC),
  CONSTRAINT `winner_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `Movies`.`person` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `claimed_award`
    FOREIGN KEY (`award_id`)
    REFERENCES `Movies`.`award` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `winner_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies`.`movie` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`genre` (
  `name` ENUM('action', 'adventure', 'comedy', 'drama', 'historical', 'horror', 'musicals/dance', 'romance', 'rom-com', 'sci-fi', 'war', 'westerns') NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`movie` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(256) CHARACTER SET 'cp1256' NOT NULL,
  `year` YEAR(4) NOT NULL,
  `director_id` INT(11) NOT NULL,
  `rating` ENUM('G', 'PG', 'PG-13', 'R', 'NC-17') NULL DEFAULT NULL,
  `writer_id` INT(11) NOT NULL,
  `producer_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `writer_id`, `producer_id`, `director_id`),
  UNIQUE INDEX `movie_idx` (`id` ASC),
  INDEX `director_idx` (`director_id` ASC),
  INDEX `prducer_idx` (`producer_id` ASC),
  INDEX `writer_idx` (`writer_id` ASC),
  CONSTRAINT `director`
    FOREIGN KEY (`director_id`)
    REFERENCES `Movies`.`person` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `production_company`
    FOREIGN KEY (`producer_id`)
    REFERENCES `Movies`.`producer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `writer`
    FOREIGN KEY (`writer_id`)
    REFERENCES `Movies`.`person` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`movie_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`movie_genre` (
  `movie_id` INT(11) NOT NULL,
  `genre_name` ENUM('action', 'adventure', 'comedy', 'drama', 'historical', 'horror', 'musicals/dance', 'romance', 'rom-com', 'sci-fi', 'war', 'westerns') NOT NULL,
  PRIMARY KEY (`movie_id`, `genre_name`),
  INDEX `genre_idx` (`genre_name` ASC),
  INDEX `movie_idx` (`movie_id` ASC),
  CONSTRAINT `movie_of_this_genre`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies`.`movie` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `genre`
    FOREIGN KEY (`genre_name`)
    REFERENCES `Movies`.`genre` (`name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`movie_staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`movie_staff` (
  `actor_id` INT(11) NOT NULL,
  `movie_id` INT(11) NOT NULL,
  `salary` INT UNSIGNED NULL,
  PRIMARY KEY (`movie_id`, `actor_id`),
  INDEX `acts_in_idx` (`movie_id` ASC),
  INDEX `acted_by_idx` (`actor_id` ASC),
  CONSTRAINT `working_actor`
    FOREIGN KEY (`actor_id`)
    REFERENCES `Movies`.`person` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `movie_acting_on`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Movies`.`movie` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`person` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `doB` DATE NULL DEFAULT NULL,
  `poB` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `person_idx` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`producer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`producer` (
  `id` INT NOT NULL,
  `manager_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `manager_id`),
  INDEX `manager_idx` (`manager_id` ASC),
  CONSTRAINT `manager`
    FOREIGN KEY (`manager_id`)
    REFERENCES `Movies`.`person` (`id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;