-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 20 2018 г., 21:50
-- Версия сервера: 5.7.22-0ubuntu0.16.04.1
-- Версия PHP: 7.2.5-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `testDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(127) DEFAULT NULL,
  `created_at` year(4) DEFAULT NULL,
  `author` varchar(127) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `created_at`, `author`, `price`) VALUES
(1, 'Вишневый сад', 2015, 'Чехов', 400),
(2, 'Доктор Живаго', 2016, 'Пастернак', 700),
(3, 'Ася', 2017, 'Тургенев', 500),
(4, 'Дядя Ваня', 1999, 'Чехов', 600),
(5, 'Три Сестры', 1990, 'Чехов', 500);

-- --------------------------------------------------------

--
-- Структура таблицы `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(4, 'Asus'),
(1, 'Dell'),
(3, 'Dexp'),
(2, 'Hp');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'computers'),
(3, 'keyboards'),
(2, 'monitors');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(127) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `img` varchar(1023) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `oldPrice` decimal(10,2) DEFAULT NULL,
  `bringing` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` int(10) UNSIGNED DEFAULT NULL,
  `categor_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `vendor`, `img`, `price`, `oldPrice`, `bringing`, `count`, `categor_id`, `brand_id`) VALUES
(2185, 'Product0', 'Test0', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1434.00', '1127.00', '2018-05-23 21:00:00', 3, 2, 4),
(2186, 'Product1', 'Example1', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1600.00', '1407.00', '2018-03-19 21:00:00', 16, 1, 4),
(2187, 'Product2', 'Test2', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4608.00', '4136.00', '2018-01-11 21:00:00', 35, 1, 1),
(2188, 'Product3', 'Example3', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1352.00', '937.00', '2018-04-10 21:00:00', 53, 1, 2),
(2189, 'Product4', 'Test4', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4373.00', '4075.00', '2018-01-27 21:00:00', 70, 2, 3),
(2190, 'Product5', 'Example5', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1300.00', '807.00', '2018-03-22 21:00:00', 11, 3, 1),
(2191, 'Product6', 'Test6', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1480.00', '1157.00', '2018-04-06 21:00:00', 8, 3, 1),
(2192, 'Product7', 'Example7', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3134.00', '2763.00', '2018-01-18 21:00:00', 27, 2, 3),
(2193, 'Product8', 'Test8', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4033.00', '3594.00', '2018-04-24 21:00:00', 51, 1, 4),
(2194, 'Product9', 'Example9', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1825.00', '1469.00', '2018-04-11 21:00:00', 66, 3, 2),
(2195, 'Product10', 'Test10', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1798.00', '1681.00', '2018-04-07 21:00:00', 36, 1, 3),
(2196, 'Product11', 'Example11', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3446.00', '3310.00', '2018-02-13 21:00:00', 84, 3, 2),
(2197, 'Product12', 'Test12', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2796.00', '2515.00', '2018-01-13 21:00:00', 58, 2, 3),
(2198, 'Product13', 'Example13', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3051.00', '2741.00', '2018-02-19 21:00:00', 9, 3, 1),
(2199, 'Product14', 'Test14', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3653.00', '3449.00', '2018-01-20 21:00:00', 38, 2, 4),
(2200, 'Product15', 'Example15', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1754.00', '1439.00', '2018-04-22 21:00:00', 87, 1, 4),
(2201, 'Product16', 'Test16', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4277.00', '4103.00', '2018-01-17 21:00:00', 3, 3, 1),
(2202, 'Product17', 'Example17', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4307.00', '3959.00', '2018-01-12 21:00:00', 68, 3, 1),
(2203, 'Product18', 'Test18', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2698.00', '2280.00', '2018-02-20 21:00:00', 12, 2, 4),
(2204, 'Product19', 'Example19', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4952.00', '4704.00', '2018-01-20 21:00:00', 98, 3, 2),
(2205, 'Product20', 'Test20', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4532.00', '4077.00', '2018-02-11 21:00:00', 67, 3, 2),
(2206, 'Product21', 'Example21', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2096.00', '1798.00', '2018-02-15 21:00:00', 12, 3, 3),
(2207, 'Product22', 'Test22', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3082.00', '2587.00', '2018-04-23 21:00:00', 65, 3, 3),
(2208, 'Product23', 'Example23', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4979.00', '4527.00', '2018-05-09 21:00:00', 96, 3, 1),
(2209, 'Product24', 'Test24', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3357.00', '3045.00', '2018-04-23 21:00:00', 36, 2, 4),
(2210, 'Product25', 'Example25', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4880.00', '4506.00', '2018-02-08 21:00:00', 94, 3, 2),
(2211, 'Product26', 'Test26', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2501.00', '2399.00', '2018-05-05 21:00:00', 61, 2, 2),
(2212, 'Product27', 'Example27', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2011.00', '1513.00', '2018-01-18 21:00:00', 47, 1, 2),
(2213, 'Product28', 'Test28', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1715.00', '1302.00', '2018-03-15 21:00:00', 48, 2, 1),
(2214, 'Product29', 'Example29', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1459.00', '1216.00', '2018-02-15 21:00:00', 17, 3, 1),
(2215, 'Product30', 'Test30', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4777.00', '4510.00', '2018-03-18 21:00:00', 82, 3, 2),
(2216, 'Product31', 'Example31', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1857.00', '1536.00', '2018-04-24 21:00:00', 22, 2, 4),
(2217, 'Product32', 'Test32', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2248.00', '2050.00', '2018-03-01 21:00:00', 44, 1, 2),
(2218, 'Product33', 'Example33', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4604.00', '4167.00', '2018-04-15 21:00:00', 49, 3, 4),
(2219, 'Product34', 'Test34', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3747.00', '3630.00', '2018-03-02 21:00:00', 12, 2, 4),
(2220, 'Product35', 'Example35', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2791.00', '2296.00', '2018-02-09 21:00:00', 43, 3, 3),
(2221, 'Product36', 'Test36', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3263.00', '3065.00', '2018-04-25 21:00:00', 4, 3, 4),
(2222, 'Product37', 'Example37', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1649.00', '1194.00', '2018-05-02 21:00:00', 15, 2, 1),
(2223, 'Product38', 'Test38', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2674.00', '2458.00', '2018-03-27 21:00:00', 98, 2, 4),
(2224, 'Product39', 'Example39', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1716.00', '1438.00', '2018-03-14 21:00:00', 2, 2, 3),
(2225, 'Product40', 'Test40', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2124.00', '1691.00', '2018-04-01 21:00:00', 83, 3, 4),
(2226, 'Product41', 'Example41', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4255.00', '3824.00', '2018-05-22 21:00:00', 97, 3, 4),
(2227, 'Product42', 'Test42', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3400.00', '3178.00', '2018-05-23 21:00:00', 14, 2, 1),
(2228, 'Product43', 'Example43', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4721.00', '4370.00', '2018-02-27 21:00:00', 53, 1, 1),
(2229, 'Product44', 'Test44', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4814.00', '4336.00', '2018-04-03 21:00:00', 82, 3, 4),
(2230, 'Product45', 'Example45', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3528.00', '3289.00', '2018-04-26 21:00:00', 61, 1, 1),
(2231, 'Product46', 'Test46', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4243.00', '3937.00', '2018-02-12 21:00:00', 78, 3, 3),
(2232, 'Product47', 'Example47', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1446.00', '1268.00', '2018-03-23 21:00:00', 54, 2, 4),
(2233, 'Product48', 'Test48', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1754.00', '1466.00', '2018-03-08 21:00:00', 23, 3, 1),
(2234, 'Product49', 'Example49', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4845.00', '4397.00', '2018-04-01 21:00:00', 16, 1, 1),
(2235, 'Product50', 'Test50', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4691.00', '4449.00', '2018-03-17 21:00:00', 1, 2, 3),
(2236, 'Product51', 'Example51', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2694.00', '2420.00', '2018-01-31 21:00:00', 32, 1, 4),
(2237, 'Product52', 'Test52', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3634.00', '3443.00', '2018-04-19 21:00:00', 7, 1, 2),
(2238, 'Product53', 'Example53', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4563.00', '4185.00', '2018-04-05 21:00:00', 32, 1, 2),
(2239, 'Product54', 'Test54', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4172.00', '3966.00', '2018-04-06 21:00:00', 52, 1, 3),
(2240, 'Product55', 'Example55', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3359.00', '3105.00', '2018-05-05 21:00:00', 49, 2, 3),
(2241, 'Product56', 'Test56', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4563.00', '4301.00', '2018-01-19 21:00:00', 14, 1, 3),
(2242, 'Product57', 'Example57', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3465.00', '3196.00', '2018-01-22 21:00:00', 87, 3, 3),
(2243, 'Product58', 'Test58', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2470.00', '2302.00', '2018-03-24 21:00:00', 78, 1, 3),
(2244, 'Product59', 'Example59', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3725.00', '3494.00', '2018-02-12 21:00:00', 67, 3, 2),
(2245, 'Product60', 'Test60', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3728.00', '3308.00', '2018-05-14 21:00:00', 24, 3, 2),
(2246, 'Product61', 'Example61', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2829.00', '2366.00', '2018-01-17 21:00:00', 6, 3, 2),
(2247, 'Product62', 'Test62', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4551.00', '4102.00', '2018-01-01 21:00:00', 84, 3, 2),
(2248, 'Product63', 'Example63', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2867.00', '2386.00', '2018-05-26 21:00:00', 24, 3, 1),
(2249, 'Product64', 'Test64', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2407.00', '2102.00', '2018-01-31 21:00:00', 33, 1, 4),
(2250, 'Product65', 'Example65', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1334.00', '1041.00', '2018-03-11 21:00:00', 6, 1, 3),
(2251, 'Product66', 'Test66', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2265.00', '1950.00', '2018-04-12 21:00:00', 95, 1, 2),
(2252, 'Product67', 'Example67', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4694.00', '4530.00', '2018-01-18 21:00:00', 92, 1, 4),
(2253, 'Product68', 'Test68', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4325.00', '4006.00', '2018-01-22 21:00:00', 12, 3, 3),
(2254, 'Product69', 'Example69', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1643.00', '1325.00', '2018-05-16 21:00:00', 44, 3, 4),
(2255, 'Product70', 'Test70', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3114.00', '2937.00', '2018-03-20 21:00:00', 87, 3, 3),
(2256, 'Product71', 'Example71', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3460.00', '3276.00', '2018-03-23 21:00:00', 24, 2, 2),
(2257, 'Product72', 'Test72', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2295.00', '1820.00', '2018-03-02 21:00:00', 19, 1, 1),
(2258, 'Product73', 'Example73', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2602.00', '2174.00', '2018-03-15 21:00:00', 7, 3, 2),
(2259, 'Product74', 'Test74', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2885.00', '2545.00', '2018-03-31 21:00:00', 45, 1, 4),
(2260, 'Product75', 'Example75', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4384.00', '4051.00', '2018-04-12 21:00:00', 37, 1, 2),
(2261, 'Product76', 'Test76', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2789.00', '2368.00', '2018-05-10 21:00:00', 89, 3, 2),
(2262, 'Product77', 'Example77', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2150.00', '1804.00', '2018-04-13 21:00:00', 8, 2, 2),
(2263, 'Product78', 'Test78', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2710.00', '2360.00', '2018-01-16 21:00:00', 18, 2, 1),
(2264, 'Product79', 'Example79', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1119.00', '881.00', '2018-05-16 21:00:00', 32, 2, 2),
(2265, 'Product80', 'Test80', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1272.00', '789.00', '2018-01-27 21:00:00', 37, 3, 2),
(2266, 'Product81', 'Example81', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2802.00', '2576.00', '2018-02-12 21:00:00', 63, 3, 2),
(2267, 'Product82', 'Test82', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3095.00', '2744.00', '2017-12-31 21:00:00', 96, 3, 4),
(2268, 'Product83', 'Example83', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3700.00', '3322.00', '2018-01-25 21:00:00', 30, 1, 4),
(2269, 'Product84', 'Test84', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4197.00', '3801.00', '2018-03-20 21:00:00', 6, 2, 4),
(2270, 'Product85', 'Example85', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2667.00', '2208.00', '2018-05-24 21:00:00', 96, 3, 2),
(2271, 'Product86', 'Test86', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1298.00', '1001.00', '2018-03-25 21:00:00', 28, 3, 3),
(2272, 'Product87', 'Example87', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1642.00', '1207.00', '2018-03-01 21:00:00', 67, 3, 2),
(2273, 'Product88', 'Test88', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1149.00', '977.00', '2018-03-08 21:00:00', 99, 1, 2),
(2274, 'Product89', 'Example89', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2380.00', '2072.00', '2018-02-04 21:00:00', 74, 3, 2),
(2275, 'Product90', 'Test90', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3834.00', '3405.00', '2018-05-23 21:00:00', 50, 1, 1),
(2276, 'Product91', 'Example91', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1603.00', '1472.00', '2018-05-01 21:00:00', 58, 3, 4),
(2277, 'Product92', 'Test92', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4091.00', '3855.00', '2018-04-23 21:00:00', 96, 3, 3),
(2278, 'Product93', 'Example93', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3730.00', '3440.00', '2018-01-06 21:00:00', 84, 3, 3),
(2279, 'Product94', 'Test94', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4744.00', '4503.00', '2018-03-23 21:00:00', 74, 2, 4),
(2280, 'Product95', 'Example95', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '3693.00', '3225.00', '2018-04-20 21:00:00', 93, 3, 2),
(2281, 'Product96', 'Test96', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1316.00', '1146.00', '2018-03-31 21:00:00', 78, 2, 1),
(2282, 'Product97', 'Example97', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '1314.00', '965.00', '2018-02-11 21:00:00', 9, 2, 2),
(2283, 'Product98', 'Test98', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '4984.00', '4818.00', '2018-05-01 21:00:00', 17, 1, 1),
(2284, 'Product99', 'Example99', 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700', '2302.00', '2073.00', '2018-03-19 21:00:00', 59, 3, 3),
(2285, 'MyTitle', 'MyVendor', 'http://test.png', '2000.00', '1600.00', '2018-04-03 21:00:00', 12, 1, 2),
(2286, 'MyTitle1', 'MyVendor1', 'http://test.png', '2200.00', '2600.00', '2018-04-03 21:00:00', 12, 1, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `publisher`
--

CREATE TABLE `publisher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(127) DEFAULT NULL,
  `director` varchar(127) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `director`) VALUES
(1, 'АБВ', 'Петров'),
(2, 'Новый Век', 'Иванова');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `vendor` (`vendor`),
  ADD KEY `products_price_index` (`price`),
  ADD KEY `categor_id` (`categor_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Индексы таблицы `publisher`
--
ALTER TABLE `publisher`
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2287;
--
-- AUTO_INCREMENT для таблицы `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categor_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
