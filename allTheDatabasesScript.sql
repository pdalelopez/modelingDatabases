-- MySQL Workbench Synchronization
-- Generated: 2020-01-29 12:30
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: formacio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `socialNetwork` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `socialNetwork`.`upload` (
  `idUpload` INT(11) NOT NULL AUTO_INCREMENT,
  `idUser` INT(11) NOT NULL,
  `addresse_addresse_id` INT(11) NOT NULL,
  `url` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idUpload`),
  UNIQUE INDEX `idUpload_UNIQUE` (`idUpload` ASC) VISIBLE,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE,
  UNIQUE INDEX `idUsusary_UNIQUE` (`idUser` ASC) VISIBLE,
  INDEX `fk_upload_addresse1_idx` (`addresse_addresse_id` ASC) VISIBLE,
  CONSTRAINT `fk_upload_user1`
    FOREIGN KEY (`idUser`)
    REFERENCES `socialNetwork`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_upload_addresse1`
    FOREIGN KEY (`addresse_addresse_id`)
    REFERENCES `socialNetwork`.`addresse` (`addresse_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `socialNetwork`.`friendship` (
  `idUser1` INT(11) NOT NULL,
  `idUser2` INT(11) NOT NULL,
  `howTheyMet` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser1`, `idUser2`),
  CONSTRAINT `fk_friendship_user`
    FOREIGN KEY (`idUser1`)
    REFERENCES `socialNetwork`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_friendship`
    FOREIGN KEY (`idUser2`)
    REFERENCES `socialNetwork`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `socialNetwork`.`user` (
  `usuaryName` VARCHAR(45) NOT NULL,
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuaryName`),
  UNIQUE INDEX `idUsuary_UNIQUE` (`usuaryName` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `socialNetwork`.`addresse` (
  `addresse_id` INT(11) NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `cip` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`addresse_id`),
  UNIQUE INDEX `iaddresse_id_UNIQUE` (`addresse_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE SCHEMA IF NOT EXISTS `amazon` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `amazon`.`author` (
  `idAuthor` INT(11) NOT NULL AUTO_INCREMENT,
  `authorAddresses` VARCHAR(200) NOT NULL,
  `quantityBook` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idAuthor`),
  UNIQUE INDEX `idAuthor_UNIQUE` (`idAuthor` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `amazon`.`book` (
  `idBook` INT(11) NOT NULL AUTO_INCREMENT,
  `bookname` VARCHAR(45) NOT NULL,
  `quantityStore` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  `author_idAuthor` INT(11) NOT NULL,
  PRIMARY KEY (`idBook`),
  UNIQUE INDEX `idBook_UNIQUE` (`idBook` ASC) VISIBLE,
  INDEX `fk_book_author1_idx` (`author_idAuthor` ASC) VISIBLE,
  CONSTRAINT `fk_book_author1`
    FOREIGN KEY (`author_idAuthor`)
    REFERENCES `amazon`.`author` (`idAuthor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `amazon`.`invoice` (
  `idInvoice` INT(11) NOT NULL AUTO_INCREMENT,
  `user_usuaryName` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `idinvoice_UNIQUE` (`idInvoice` ASC) VISIBLE,
  PRIMARY KEY (`idInvoice`),
  INDEX `fk_invoice_user1_idx` (`user_usuaryName` ASC) VISIBLE,
  CONSTRAINT `fk_invoice_user1`
    FOREIGN KEY (`user_usuaryName`)
    REFERENCES `amazon`.`user` (`usuaryName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `amazon`.`items` (
  `quantitySold` INT(11) NOT NULL,
  `book_idBook` INT(11) NOT NULL,
  `invoice_idInvoice` INT(11) NOT NULL,
  PRIMARY KEY (`book_idBook`, `invoice_idInvoice`),
  INDEX `fk_items_book1_idx` (`book_idBook` ASC) VISIBLE,
  INDEX `fk_items_invoice1_idx` (`invoice_idInvoice` ASC) VISIBLE,
  UNIQUE INDEX `book_idBook_UNIQUE` (`book_idBook` ASC) VISIBLE,
  UNIQUE INDEX `invoice_idInvoice_UNIQUE` (`invoice_idInvoice` ASC) VISIBLE,
  CONSTRAINT `fk_items_book1`
    FOREIGN KEY (`book_idBook`)
    REFERENCES `amazon`.`book` (`idBook`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_items_invoice1`
    FOREIGN KEY (`invoice_idInvoice`)
    REFERENCES `amazon`.`invoice` (`idInvoice`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `amazon`.`user` (
  `usuaryName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`usuaryName`),
  UNIQUE INDEX `idUsuary_UNIQUE` (`usuaryName` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE SCHEMA IF NOT EXISTS `StubeDatabase` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `StubeDatabase`.`user` (
  `idUsuary` VARCHAR(50) NOT NULL,
  `usuaryEmail` VARCHAR(200) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuary`),
  UNIQUE INDEX `idUsuary_UNIQUE` (`idUsuary` ASC) VISIBLE,
  UNIQUE INDEX `usuaryEmail_UNIQUE` (`usuaryEmail` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `StubeDatabase`.`videoList` (
  `idVideo` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuary` VARCHAR(50) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `url` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idVideo`),
  UNIQUE INDEX `idVideo_UNIQUE` (`idVideo` ASC) VISIBLE,
  UNIQUE INDEX `idUsuary_UNIQUE` (`idUsuary` ASC) VISIBLE,
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE,
  CONSTRAINT `idUsuary`
    FOREIGN KEY (`idUsuary`)
    REFERENCES `StubeDatabase`.`user` (`idUsuary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `StubeDatabase`.`addresse` (
  `addresse_id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`addresse_id`),
  UNIQUE INDEX `addresse_id_UNIQUE` (`addresse_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE SCHEMA IF NOT EXISTS `painting` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `painting`.`painting` (
  `idPainting` INT(11) NOT NULL AUTO_INCREMENT,
  `pricePicture` INT(11) NOT NULL,
  `idAuthor` INT(11) NULL DEFAULT NULL,
  UNIQUE INDEX `idpicture_UNIQUE` (`idPainting` ASC) VISIBLE,
  PRIMARY KEY (`idPainting`),
  INDEX `idAuthor_idx` (`idAuthor` ASC) VISIBLE,
  CONSTRAINT `idPicture`
    FOREIGN KEY (`idPainting`)
    REFERENCES `painting`.`sellRecord` (`idPainting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idAuthor`
    FOREIGN KEY (`idAuthor`)
    REFERENCES `painting`.`author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `painting`.`author` (
  `idAuthor` INT(11) NOT NULL AUTO_INCREMENT,
  `authorName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAuthor`),
  UNIQUE INDEX `idauthor_UNIQUE` (`idAuthor` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `painting`.`sellRecord` (
  `dniBuyer` VARCHAR(45) NOT NULL,
  `buyerName` VARCHAR(45) NOT NULL,
  `idPainting` INT(11) NOT NULL,
  PRIMARY KEY (`dniBuyer`),
  UNIQUE INDEX `idBuyerName_UNIQUE` (`dniBuyer` ASC) VISIBLE,
  UNIQUE INDEX `idPicture_UNIQUE` (`idPainting` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE SCHEMA IF NOT EXISTS `vuelingDatabase` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `vuelingDatabase`.`Plane` (
  `idPlane` INT(11) NOT NULL AUTO_INCREMENT,
  `capacity` INT(11) NOT NULL,
  `idModel` INT(11) NOT NULL,
  PRIMARY KEY (`idPlane`),
  UNIQUE INDEX `idPlane_UNIQUE` (`idPlane` ASC) VISIBLE,
  INDEX `fk_Plane_Model1_idx` (`idModel` ASC) VISIBLE,
  CONSTRAINT `idModel`
    FOREIGN KEY (`idModel`)
    REFERENCES `vuelingDatabase`.`Model` (`idModel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vuelingDatabase`.`Seat` (
  `idSeat` INT(11) NOT NULL,
  `idPlane` INT(11) NOT NULL,
  PRIMARY KEY (`idSeat`),
  UNIQUE INDEX `idSeat_UNIQUE` (`idSeat` ASC) VISIBLE,
  INDEX `fk_Seat_Plane_idx` (`idPlane` ASC) VISIBLE,
  CONSTRAINT `idPlane`
    FOREIGN KEY (`idPlane`)
    REFERENCES `vuelingDatabase`.`Plane` (`idPlane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vuelingDatabase`.`Model` (
  `idModel` INT(11) NOT NULL,
  `modelName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idModel`),
  UNIQUE INDEX `idModel_UNIQUE` (`idModel` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
