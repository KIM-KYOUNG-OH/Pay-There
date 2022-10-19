# Pay-There
고객의 소비내역을 기록하는 가계부 애플리케이션입니다.

# 기술 Stack  
- Java 11.0
- Spring Boot 2.7
- MySQL 5.7
- myBatis 3.5
- Docker 20.10

# ERD
![스크린샷 2022-10-19 오후 7 44 10](https://user-images.githubusercontent.com/66231761/196670109-7c0b30af-a2c3-456e-b0c4-f6f4010a1bdc.png)

# DDL
```sql
-- -----------------------------------------------------
-- Table `payThere`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payThere`.`CUSTOMER` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `EMAIL` VARCHAR(100) NOT NULL,
  `PASSWORD` VARCHAR(300) NOT NULL,
  `CREATED_AT` TIMESTAMP NULL,
  `UPDATED_AT` TIMESTAMP NULL,
  PRIMARY KEY (`ID`));
  

-- -----------------------------------------------------
-- Table `payThere`.`DIGITAL_WALLET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payThere`.`DIGITAL_WALLET` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AMOUNT` VARCHAR(45) NOT NULL,
  `CREATED_AT` VARCHAR(45) NULL,
  `UPDATED_AT` VARCHAR(45) NULL,
  `CUSTOMER_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_DIGITAL_WALLET_CUSTOMER`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `payThere`.`CUSTOMER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `payThere`.`PAYMENT_HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payThere`.`PAYMENT_HISTORY` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AMOUNT` VARCHAR(45) NOT NULL,
  `IS_MINUS` VARCHAR(45) NOT NULL,
  `MEMO` VARCHAR(45) NULL,
  `IS_DELETED` VARCHAR(45) NOT NULL,
  `CREATED_AT` VARCHAR(45) NULL,
  `UPDATED_AT` VARCHAR(45) NULL,
  `DIGITAL_WALLET_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_PAYMENT_HISTORY_DIGITAL_WALLET1`
    FOREIGN KEY (`DIGITAL_WALLET_ID`)
    REFERENCES `payThere`.`DIGITAL_WALLET` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
```
