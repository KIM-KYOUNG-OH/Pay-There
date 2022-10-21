# Pay-There
고객의 소비내역을 기록하는 가계부 애플리케이션입니다.

# 기술 Stack  
- Java 11.0
- Spring Boot 2.7
- MySQL 5.7
- myBatis 3.5
- Docker 20.10

# ERD
<img width="857" alt="스크린샷 2022-10-21 오후 2 45 01" src="https://user-images.githubusercontent.com/66231761/197121642-792932a0-78cd-430f-8fe4-1cbcf6138174.png">

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
  PRIMARY KEY (`ID`))


-- -----------------------------------------------------
-- Table `payThere`.`DIGITAL_WALLET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payThere`.`DIGITAL_WALLET` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AMOUNT` BIGINT NOT NULL,
  `CREATED_AT` TIMESTAMP NULL,
  `UPDATED_AT` TIMESTAMP NULL,
  `CUSTOMER_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_DIGITAL_WALLET_CUSTOMER`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `payThere`.`CUSTOMER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)


-- -----------------------------------------------------
-- Table `payThere`.`TRANSACTION_HISTORY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payThere`.`TRANSACTION_HISTORY` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `AMOUNT` INT NOT NULL,
  `TYPE` INT NOT NULL COMMENT '0: 지출\n1: 수입',
  `MEMO` VARCHAR(300) NULL,
  `IS_DELETED` VARCHAR(45) NOT NULL,
  `CREATED_AT` TIMESTAMP NULL,
  `UPDATED_AT` TIMESTAMP NULL,
  `DIGITAL_WALLET_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_PAYMENT_HISTORY_DIGITAL_WALLET1`
    FOREIGN KEY (`DIGITAL_WALLET_ID`)
    REFERENCES `payThere`.`DIGITAL_WALLET` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
```
