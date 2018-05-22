#MySQL

CREATE TABLE products (
  `id`       SERIAL        NOT NULL PRIMARY KEY,
  `title`    VARCHAR(127)  NOT NULL UNIQUE,
  `vendor`   VARCHAR(255)  NOT NULL,
  `img`      VARCHAR(1023) NOT NULL,
  `price`    DECIMAL(10,2) NOT NULL,
  `oldPrice` DECIMAL(10,2) NULL,
  `bringing` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count`    INT UNSIGNED  NULL
);

CREATE INDEX products_price_index
  ON products (price);

#PostgreSQL

CREATE TABLE products (
  "id"       SERIAL  NOT NULL PRIMARY KEY,
  "title"    VARCHAR(127)  NOT NULL UNIQUE,
  "vendor"   VARCHAR(255)  NOT NULL,
  "img"      VARCHAR(1023) NOT NULL,
  "price"    NUMERIC(10,2) NOT NULL,
  "oldPrice" NUMERIC(10,2) NULL,
  "bringing" TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "count"    INT  NULL
);

CREATE INDEX products_price_index
 ON products (price);

#-----------------------------------------

SELECT * FROM products ORDER BY bringing DESC LIMIT 10;

SELECT * FROM products ORDER BY price LIMIT 10;

SELECT title, (price - oldPrice) as diffirence FROM products ORDER BY diffirence DESC LIMIT 10;

SELECT title FROM products WHERE vendor LIKE 'Test%';
