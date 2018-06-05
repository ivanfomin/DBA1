CREATE TABLE `testDB`.`history`
( `id` SERIAL NOT NULL ,
`product_id` BIGINT UNSIGNED NOT NULL,
`event` ENUM('create','changePrice','delete') NULL DEFAULT NULL ,
`oldPrice` INT NULL DEFAULT NULL , `currentPrice` INT NOT NULL ,
`timeAndDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
PRIMARY KEY (`id`)) ENGINE = InnoDB;

#---------------------------------------------------------------

CREATE VIEW newProducts
  AS SELECT p.title FROM products p
  INNER JOIN history h
  ON p.id = h.product_id AND h.event = 1;

SELECT * FROM newProducts;