CREATE TABLE `dba`.`history`
(
    `product_id`   BIGINT UNSIGNED  NOT NULL,
    `event`        ENUM ('create','price','delete') NULL     DEFAULT NULL,
    `oldPrice`     INT NULL     DEFAULT NULL,
    `currentPrice` INT NOT NULL,
    `timeAndDate`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`product_id`)
) ENGINE = InnoDB;

ALTER TABLE history
ADD FOREIGN KEY (product_id)
REFERENCES products (id)
ON DELETE RESTRICT
ON UPDATE CASCADE ;

#---------------------------------------------------------------

CREATE VIEW new_product AS
    SELECT p.* FROM products p INNER JOIN history h ON p.id = h.product_id
    WHERE h.event = 1;
    
CREATE VIEW changed_products AS
    SELECT p.title FROM products p
    WHERE p.id IN (SELECT h.product_id FROM history h WHERE h.event = 2);

SELECT * FROM new_product;

SELECT * FROM changed_products;



//Альберт, уж простите если отвлек. Решил тут на досуге обновить знания )
