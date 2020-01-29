-- MySQL Workbench Synchronization
-- Generated: 2020-01-29 12:46
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: formacio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `glasses`.`glasseBrand` 
DROP FOREIGN KEY `fk_glasseBrand_supplier`;

ALTER TABLE `glasses`.`glasse` 
DROP FOREIGN KEY `fk_glasse_glasseBrand1`;

ALTER TABLE `glasses`.`glasseBrand` 
ADD CONSTRAINT `fk_glasseBrand_supplier`
  FOREIGN KEY (`nifSupplier`)
  REFERENCES `glasses`.`supplier` (`nifSupplier`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `glasses`.`glasse` 
ADD CONSTRAINT `fk_glasse_glasseBrand1`
  FOREIGN KEY (`idGlasseBrand`)
  REFERENCES `glasses`.`glasseBrand` (`idGlasseBrand`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
