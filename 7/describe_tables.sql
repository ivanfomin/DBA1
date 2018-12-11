CREATE TABLE history (
  id           bigint UNSIGNED AUTO_INCREMENT,
  event        enum ('create', 'price', 'delete')  NULL,
  oldPrice     int                                 NULL,
  currentPrice int                                 NULL,
  timeAndDate  timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  CONSTRAINT id
    UNIQUE (id)
);

ALTER TABLE history
  ADD PRIMARY KEY (id);

#-----------------------------------------------------------------

CREATE TABLE orders (
  id          bigint UNSIGNED AUTO_INCREMENT,
  timeAndDate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  product_id  bigint UNSIGNED                     NOT NULL,
  CONSTRAINT id
    UNIQUE (id),
  CONSTRAINT orders_ibfk_1
    FOREIGN KEY (product_id) REFERENCES products (id)
      ON UPDATE CASCADE
);

CREATE INDEX product_id
  ON orders (product_id);

ALTER TABLE orders
  ADD PRIMARY KEY (id);
#-------------------------------------------------------------------

CREATE TABLE products (
  id         bigint UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  title      varchar(127)                        NOT NULL,
  vendor     varchar(255)                        NOT NULL,
  img        varchar(1023)                       NOT NULL,
  price      decimal(10, 2)                      NOT NULL,
  oldPrice   decimal(10, 2)                      NULL,
  bringing   timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  count      int UNSIGNED                        NULL,
  categor_id bigint UNSIGNED                     NOT NULL,
  brand_id   bigint UNSIGNED                     NOT NULL,
  CONSTRAINT title
    UNIQUE (title),
  CONSTRAINT products_ibfk_1
    FOREIGN KEY (categor_id) REFERENCES categories (id)
      ON UPDATE CASCADE,
  CONSTRAINT products_ibfk_2
    FOREIGN KEY (brand_id) REFERENCES brands (id)
      ON UPDATE CASCADE
);

CREATE INDEX brand_id
  ON products (brand_id);

CREATE INDEX categor_id
  ON products (categor_id);

CREATE INDEX products_price_index
  ON products (price);

#------------------------------------------------------------------
CREATE TABLE categories (
  id   bigint UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  name varchar(255) NOT NULL,
  CONSTRAINT name
    UNIQUE (name),
  CONSTRAINT name_2
    UNIQUE (name)
);

#-----------------------------------------------------------------------

-- auto-generated definition
CREATE TABLE brands (
  id    bigint UNSIGNED AUTO_INCREMENT
    PRIMARY KEY,
  name  varchar(255) NOT NULL,
  class varchar(100) NULL,
  CONSTRAINT name
    UNIQUE (name),
  CONSTRAINT name_2
    UNIQUE (name)
);


