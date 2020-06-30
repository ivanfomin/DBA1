#	1. Создайте в товарах поле типа jsonb для хранения различных характеристик товара. 
#	Например цвет (color), размер (size), вес (weight) и так далее, что вам придет в голову.
# 	Заполните это поле различными характеристиками в виде json.

ALTER TABLE products
    add properties jsonb;

UPDATE products SET properties = '{"color": "black", "weight": "200", "size": "small"}' WHERE id = 12;
UPDATE products SET properties = '{"color": "black", "weight": "300", "size": "small"}' WHERE id = 13;
UPDATE products SET properties = '{"color": "black", "weight": "400"}' WHERE id = 14;
UPDATE products SET properties = '{"color": "yellow", "weight": "500"}' WHERE id = 15;
UPDATE products SET properties = '{"color": "blue", "weight": "700", "size": "middle"}' WHERE id = 16;
UPDATE products SET properties = '{"color": "red", "weight": "800", "size": "middle"}' WHERE id = 17;
UPDATE products SET properties = '{"color": "white", "weight": "900"}' WHERE id = 18;
UPDATE products SET properties = '{"color": "red", "weight": "1000"}' WHERE id = 19;
UPDATE products SET properties = '{"color": "red", "weight": "1100", "size": "large"}' WHERE id = 20;
UPDATE products SET properties = '{"color": "red", "weight": "1200", "size": "large"}' WHERE id = 21;
UPDATE products SET properties = '{"color": "white", "weight": "13000"}' WHERE id = 22;


# 2.Найдите товары:

# 	У которых есть характеристика цвет, но нет размера
# 	У которых вес не более килограмма
# 	Красного цвета и размера XXL

SELECT title FROM products WHERE products.properties ? 'color' AND NOT products.properties ? 'size';

SELECT title, products.properties->'weight' FROM products WHERE (products.properties->>'weight')::int < 1000;

SELECT title, products.properties->'color', products.properties->'size' FROM products WHERE products.properties->>'color' = 'red' AND products.properties->>'size' = 'large';

# 3. Создайте материализированное представление, которое поля jsonb превратит в столбцы (color, size, weight)

CREATE MATERIALIZED VIEW "ProductsProperties" AS SELECT p.properties->>'color' AS "COLOR", p.properties->>'weight' AS "WEIGHT", p.properties->>'size' AS "SIZE" FROM products p;

SELECT * FROM "ProductsProperties";

# 4. Используя оконные функции напишите запрос, который вернет все товары и для каждого - его долю в процентах в общей стоимости товаров такого же цвета (разумеется, речь про цену * количество). 

SELECT title, price, properties->>'color', round(price / SUM(p.price) OVER(PARTITION BY properties->>'color') * 100, 2) AS Percent FROM products p;
