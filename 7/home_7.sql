#Создайте триггеры на таблицу товаров, которые будут при создании товара,
# изменении его цены или удалении заполнять таблицу из пункта 2.

DELIMITER $$
CREATE TRIGGER `createProduct`
  AFTER INSERT
  ON `products`
  FOR EACH ROW
BEGIN
  INSERT INTO history
  (history.id, history.event, history.oldPrice, history.currentPrice, history.timeAndDate)
  VALUES (NULL, NEW.id, 'create', NEW.oldPrice, NEW.price, NOW());
END;
$$
DELIMITER ;

#--------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER `changeProduct`
  AFTER UPDATE
  ON `products`
  FOR EACH ROW
BEGIN
  UPDATE history
  SET history.oldPrice     = OLD.price,
      history.currentPrice = NEW.price,
      history.event        = 2,
      history.timeAndDate  = NOW()
  WHERE history.id = NEW.id;
END;
$$
DELIMITER ;
#---------------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER `changeProduct_2`
  BEFORE UPDATE
  ON `products`
  FOR EACH ROW
BEGIN
  SET NEW.oldPrice = OLD.price;
END;
$$
DELIMITER ;

#----------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER `deleteProduct`
  AFTER DELETE
  ON `products`
  FOR EACH ROW
BEGIN
  UPDATE history
  SET history.event       = 3,
      history.timeAndDate = NOW()
  WHERE history.id = OLD.id;
END;
$$
DELIMITER ;

#-------------------------------------------------------------------------------------

# Создайте функцию "размер скидки", которая по ID товара будет вычислять -
# сколько составило последнее изменение цены на него в процентах, используя запрос к таблице из пункта 2.
# Примените эту функцию в запросе на выборку товаров.

DELIMITER $$
CREATE FUNCTION discount(num BIGINT)
  RETURNS TEXT
BEGIN
  DECLARE disc DECIMAL;
  DECLARE old_price DECIMAL;
  DECLARE current_price DECIMAL;
  SELECT oldPrice INTO old_price FROM history WHERE num=history.id;
  SELECT currentPrice INTO current_price FROM history WHERE num=history.id;
  SET disc = (current_price - old_price) / old_price * 100;
  RETURN CONCAT(disc, '%');
END;
$$
DELIMITER ;

SELECT products.title, products.vendor, products.price, discount(products.id) AS DISCOUNT FROM products;