SELECT c.name AS NAME, AVG(p.price) AS PRICE
FROM products p INNER JOIN categories c ON p.categor_id = c.id
GROUP BY c.name  HAVING AVG(p.price)<1000;

#------------------------------------------------

SELECT c.name AS NAME, AVG(p.price) AS PRICE
FROM products p INNER JOIN categories c ON p.categor_id = c.id
  WHERE p.count>0
GROUP BY c.name  HAVING AVG(p.price)<1000;

#---------------------------------------------------

ALTER TABLE brands ADD class VARCHAR(100);

UPDATE brands SET class='A' WHERE id=1;
UPDATE brands SET class='B' WHERE id=2;
UPDATE brands SET class='A' WHERE id=3;
UPDATE brands SET class='B' WHERE id=4;

SELECT c.name AS NAME, AVG(p.price) AS PRICE
FROM products p INNER JOIN categories c ON p.categor_id = c.id
INNER JOIN brands b ON p.brand_id=b.id AND b.class = 'B'
GROUP BY c.name;

#-----------------------------------------------------

CREATE TABLE `testDB`.`orders` ( `id` SERIAL NOT NULL ,
`timeAndDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 product_id BIGINT(10) UNSIGNED NOT NULL ,
 PRIMARY KEY (`id`));


ALTER TABLE orders
ADD FOREIGN KEY(product_id)
REFERENCES products(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;


#-------------------------------------------------------

SELECT cast(orders.timeAndDate as date) AS DATE,
COUNT(*),SUM(products.price) AS SUM FROM `orders`,products
WHERE orders.product_id = products.id GROUP BY DATE;

