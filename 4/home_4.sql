CREATE TABLE brands
(
  id SERIAL  PRIMARY KEY,
  name  VARCHAR(255) NOT NULL UNIQUE ,
  UNIQUE (name)
);

CREATE TABLE categories
(
  id SERIAL  PRIMARY KEY,
  name  VARCHAR(255) NOT NULL UNIQUE ,
  UNIQUE (name)
);

ALTER TABLE  products ADD  categor_id BIGINT UNSIGNED NOT NULL ;
ALTER TABLE  products ADD  brand_id BIGINT UNSIGNED NOT NULL ;

INSERT INTO categories (name) VALUES ('computers');
INSERT INTO categories (name) VALUES ('monitors');
INSERT INTO categories (name) VALUES ('keyboards');

INSERT INTO brands (name) VALUES ('Dell');
INSERT INTO brands (name) VALUES ('Hp');
INSERT INTO brands (name) VALUES ('Dexp');
INSERT INTO brands (name) VALUES ('Asus');

ALTER TABLE products
ADD FOREIGN KEY  (categor_id)
REFERENCES categories (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE products
ADD FOREIGN KEY ( brand_id )
REFERENCES brands( id )
ON DELETE RESTRICT
ON UPDATE CASCADE;

#success query
INSERT INTO products(title, vendor, img, price, oldPrice, bringing, count, categor_id, brand_id)
VALUES ('MyTitle', 'MyVendor', 'http://test.png',2000, 1600, '2018-04-04', 12, 1, 2);

#success query
INSERT INTO products(title, vendor, img, price, oldPrice, bringing, count, categor_id, brand_id)
VALUES ('MyTitle1', 'MyVendor1', 'http://test.png',2200, 2600, '2018-04-04', 12, 1, 4);

#unsuccess query
# Cannot add or update a child row: a foreign key constraint fails
INSERT INTO products(title, vendor, img, price, oldPrice, bringing, count, categor_id, brand_id)
VALUES ('MyTitle2', 'MyVendor2', 'http://test.png',2700, 2900, '2018-04-04', 12, 5, 4);

#-------------------------------------------

SELECT p.title AS TITLE, c.name AS CATEGORY, b.name AS BRAND
FROM products p INNER JOIN categories c ON p.categor_id = c.id
INNER JOIN brands b ON p.brand_id = b.id;

#--------------------------------------------

SELECT p.title AS TITLE, b.name AS BRAND FROM products p
INNER JOIN brands b ON p.brand_id = b.id
WHERE b.name LIKE  'A%';

#----------------------------------------------

SELECT categories.name,
(SELECT COUNT( * )FROM products
WHERE categories.id = products.categor_id) AS AMOUNT
FROM categories ORDER BY categories.name;

#-----------------------------------------------
#*

# SELECT DISTINCT c.name, b.name
# FROM categories c INNER JOIN brands b INNER JOIN products p
# ON c.id=p.categor_id AND b.id=p.brand_id;

#Без GROUP BY не получается

SELECT c.name , COUNT( p.id ), b.name  FROM brands b
INNER JOIN products p ON p.brand_id=b.id
INNER JOIN categories c ON c.id=p.categor_id
GROUP BY c.name, b.name;
