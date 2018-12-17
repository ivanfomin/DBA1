#Создайте триггеры на таблицу товаров, которые будут при создании товара,
# изменении его цены или удалении заполнять таблицу из пункта 2.

DELIMITER $$
CREATE TRIGGER `createProduct`
  AFTER INSERT
  ON `products`
  FOR EACH ROW
BEGIN
  INSERT INTO history
  (history.id, history.event, history.currentPrice, history.timeAndDate)
  VALUES ( NEW.id, 'create', NEW.price, NOW());
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
      history.event        = 'price',
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
# При удаление строки из таблицы products соответствующей строке в таблице history,
# в поле event заполняется значением delete
# Новая строка в таблице history создается только при создании нового товара
# на событие create
# строки из истории не удаляются, только обновляются при изменении цены и удалении
# products.id = history.id

DELIMITER $$
CREATE TRIGGER `deleteProduct`
  AFTER DELETE
  ON `products`
  FOR EACH ROW
BEGIN
  UPDATE history
  SET history.event       = 'delete',
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
  SET disc = 100 - (current_price*100/old_price);
  RETURN CONCAT(disc, '%');
END;
$$
DELIMITER ;

SELECT products.title, products.vendor, products.price, discount(products.id) AS DISCOUNT FROM products;
