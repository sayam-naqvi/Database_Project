-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `contact` INT NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `LittleLemonDB`.`menu` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`customer_id`)
    REFERENCES `LittleLemonDB`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Order delivery status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Order delivery status` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `Order_delivery_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `order id_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `order id`
    FOREIGN KEY (`order_id`)
    REFERENCES `LittleLemonDB`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `contact` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
