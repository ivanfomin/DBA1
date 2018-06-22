ALTER TABLE products ADD CHECK (price > 1);

ALTER TABLE products ADD CHECK (length(products.vendor) > 3 AND  length(products.vendor) < 10);

ALTER TABLE brands ADD CHECK (LENGTH(brands.name) > 1);

ALTER TABLE categories ADD CHECK (LENGTH(categories.name) > 4);

ALTER TABLE products DROP COLUMN categors_id;

ALTER TABLE products ADD COLUMN categories BIGINT[];

SELECT p.title,c.name FROM products p
INNER JOIN categories c ON c.id = ANY(p.categories) AND c.name='computers';

SELECT c.name,  COUNT(p.categories) as amount
FROM categories c  INNER JOIN products p
ON c.id = ANY(p.categories) GROUP BY c.id;

INSERT INTO categories (name) VALUES ('Secondhand');

UPDATE products SET categories = (array_append(categories, CAST (4 AS BIGINT)))  WHERE id = 18;