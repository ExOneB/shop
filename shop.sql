-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 06 2019 г., 16:35
-- Версия сервера: 10.1.37-MariaDB
-- Версия PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `id_shop`, `img`) VALUES
(1, 52, 'http://shop/app/img/1557151774.jpg'),
(2, 38, 'http://shop/app/img/1557151851.jpg'),
(3, 38, 'http://shop/app/img/1557151855.jpg'),
(4, 38, 'http://shop/app/img/1557151859.jpg'),
(5, 39, 'http://shop/app/img/1557151865.jpg'),
(6, 39, 'http://shop/app/img/1557151868.jpg'),
(7, 39, 'http://shop/app/img/1557151872.jpg'),
(8, 52, 'http://shop/app/img/1557151879.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `phone`
--

INSERT INTO `phone` (`id`, `phone`, `id_shop`) VALUES
(13, '+79997915848', 38),
(14, '+79212336977', 38),
(15, '+791231123', 39),
(16, '+312231231323', 39),
(21, '89212336977', 52),
(22, '8999791584', 52),
(23, '+79212334579', 52),
(24, '+79321234523', 52);

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop`
--

INSERT INTO `shop` (`id`, `adres`, `email`, `img`) VALUES
(38, 'Окружное шоссе 26', 'ex1bka@gmail.com', 'http://shop/app/img/1557151872.jpg'),
(39, 'Зосимовская', 'mail.ru', 'http://shop/app/img/1557151859.jpg'),
(52, 'Городской вал 26', 'okkeq@gmail.com', 'http://shop/app/img/1557149032.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `time`
--

CREATE TABLE `time` (
  `id` int(11) NOT NULL,
  `id_shop` int(11) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `time`
--

INSERT INTO `time` (`id`, `id_shop`, `time`) VALUES
(1, 38, 'пн-пт: 08:00 - 20:00'),
(2, 38, 'сб-вс: 08:00 - 17:00'),
(3, 39, '12-23'),
(4, 39, '23-45'),
(9, 52, 'Ежедневно: 08:00 - 23:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `type`) VALUES
(1, 'admin', '$2y$10$cUWK5SBzFxjdu3gm4iepEuoDETwdohfJoQxT14P2FzLWIteVDxGwK', 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `webauth`
--

CREATE TABLE `webauth` (
  `id` int(11) NOT NULL COMMENT 'ID записи',
  `user_id` int(11) NOT NULL COMMENT 'id пользователя',
  `code` varchar(255) NOT NULL COMMENT 'token доступа',
  `expires_in` int(11) NOT NULL DEFAULT '0' COMMENT 'Дата конца жизни токена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `webauth`
--

INSERT INTO `webauth` (`id`, `user_id`, `code`, `expires_in`) VALUES
(15, 1, 'ilwQbPSmFYapYYR0xw1jGJ0v9EqGVMMd8j3j8WGOURdTQ5ToBVHiFHNOmeuh1huaAxtJtaxo1LiRQbfr6XJLFxA1M4iNmMXWkrFOCdcEYvwOGMgNJ0zoxapkeH7Au5xOxdDaqPOolld27uQRupf2zFmOnupSAXG8ajiA97ZvtcxAHnrbNHennBbK5BCGyjOID7jNfiiI', 0),
(16, 1, 'vPicdKo0sDnPezzkbc0JvPs9WLWc4fUz5dMiXbipOGe2fOnq0oawdDFapCmtRh3XuPfs0xRPe6StVfUWD5sRI817LoBDFEA9uPBuntkCAc5vr0r56UWO3XWPmxs1c3bGTNbhgvTRHYm9ZOe6JaUN8RCvp5wB9Ih2vsjMYcDFb0PbP3hyecmn3ZSt5p4e7lgCOzpML2sX', 0),
(17, 1, 'jBrqdeJXuDA7Gxh2p7O4doKerTMq2YomzQMN5vLz8lGOSYRi6Gmj46xwZkX2imoScaGhGrRONyDFxvXDbkXgquNqPKs86Q0j1HBH9swW19ByFzbRT87kDVKtGcBN3C64jILsaiocs0K7zWYt46NI1xbHJMuMpBRIjDauVzGozrv9nuDsAqaCXmkH9PuyqmhKZsfV1VjB', 0),
(18, 1, 'Y3Qh563mYizZO7iaqt68On1bRD90ZC5XFVfL2i80BHZpOiAfLHoA4pLW3UW3x21dXhYZz6ZbNZBChbS2SgCXGnTKiQOQSP3Q61PG8PRWOsy5Dr8wIKtp8n9reXh7MlXTmNzvCrrrU0xyrF4apyzyVIZaGhhtCfmZ2WvFoW7iWEQojVzJt8hoRhzxzQ0c5nc8jHOHDV0A', 0),
(19, 1, 'a0dNjmkhETdiKquxfqzWurTJTCPcWsw6sJUM6f3K8h3SHypXYZUsqOckq2xmu3tXNoJUDNEM4IFMg4Ke4EHvtTPTVmgqqKnd877MUMyZveLLiw0naHSEAHxw4OWuykIHrQumC3l8h7TADTXOAPsbx0HCPE6nYO5pFzMiD7qUfjuTdsIOiaZPbHs0lyojnuJ24vlHDLBS', 0),
(20, 1, 'ydcUpSFS2D56lDivmwHiwk49282wzmp7zC1ZvGRxkXDGAWbWsTfZdk8gsbM2xc97Oa6jRYRbVvSwr3sUWITa21rvdexLqGSfRZzJYqVUWNqnQThNBbYEdp9qDHb4o4kg4TZ3kUXgHnEygWmS7kwkKGLonXtL1N26H192W6jEuYcKUzC2U9nEP83d6xY8k0e22o5YuoCZ', 0),
(21, 1, '0LFOQO9CEiPxSKMIKSuveaJmUVi1K8ZKTEzKsJm72bFUWrDGj8cyjVUdRceBkemeSWYlGltIx8DtzhaTpmsIimVazaLTo88h57CLs5t0e7tOoEHN19vjwqt5BfZZo7gteTeHZIHdPb1dPJ1RTwapXEvyUvyiCOMRI0zHJgVzsWNiFO9zlkZjZuRTZqbCfXuXY3FIkAhM', 0),
(22, 1, 'XRawW97JX0GSAjnDKOzzs7eiclymw71uZc1Vl9Fi9lbKFynqnXZP4e7hzGD5OFAORBJdKowUJHEpg2PDZOs32AkChYI5EiTwUDJE2fyMXdbdf0QePiiSTDuaCcggvaNpNw3PMCBKQNX5NNkD6CvZfZ9Rcp8HzV7nsbdfOOZECWJpK32RGyQVy0NKqVs0RAojLByzqyd2', 0),
(23, 1, 'uXsf1v6H3XDBYqmomPpdpNxao5KPEXR9VjoWOvDSshtqHPP4Feh42OeqUZfyW7HRr6OfBs74JBurrkv6yNaACp1woh5lpNdQU15vtdAcP5Egp9mYWxzyWA5lSbGhYT7SVdoprYCg4gxtqTrnq1VnB1JudpLbjT4f7tEysgPwwm0WgsjHtf44hNzudlGxeLMmeqVHGKed', 0),
(24, 1, '7e9nGt49J9e0XNub8bInWvJaVFSCp6Qxk0U0tZac9od7bHikT1IPws0s7S5xYV4jVZkoZuB8TOg5wyqpA8e7AfzI7Ef6zjqvjKTifvq8jGdQfDgQMvXnKw5RblYLEogX8afoGGw0nKQDo6taBqylXDd9YbVDzcBImR63yD3VoUyM12XDswZq9cz8ouMXGoG3gN6Oq9KP', 0),
(25, 1, '4iC5lzIN6HdgTNohibfYAW2QJ9EajoZnHBs2baQhR4xLSW2a8i9IfbyZkc9DB90jLsmWDceugMf9IijQBszQD7PYkZBW8CfT5BQIO4c5RsezKxqmZ0cD72Bs1doaQE3VfUE3ZR9Qjnq4UQqTQDxYG9rHmPRduV9KPNOOEXEYk43eVu8M7FLNPcvb2npwiyh8l5W02BYm', 0),
(26, 1, 'G1BCvJpDparenXqqkQXCoeKJjHJljII0JjCf32TtdkIAh81BYYendZ6xHQT1yB1iVEyYGrrUMav4iwGhvVFIULfCC8DbKFuFj2E0u6UggplzW1QrWvaRhqtUz75jMzZ6CD76J2nZsIyoKpQGV0ydq27Z9cjWMi3oVbvEdSEFBc4mCU3xUBKlDSlN5FKRXNgTZLycEcSg', 0),
(27, 1, 'pWC1RFyMhj8VbtIg8s86goZfaxsPKk59hIa9oJVG23BexjvGMEM32MidjK3359dnRnxg6sW9wxo3RTJEywHBiZOCKRGQ0TeSgL8ne5xKDVNvPx9n3QYlQNYBFEsGxHyOsHcHNJrqFfVvM5TQVScMFanlPQ1mxzb0hnH468uMnqhava1r3ddIoB3dr5AYFLYW8F0fOv1c', 0),
(28, 1, 'WjnruoTxC6g1Ike9pP84A70JN1YCw0OtjcUNANkdUAeCUtMkiVoS2pBQqAsXAhqTtlH382h3DvGyZsShnhaqGLg6mI3WZuQsPywYAO1ekHMjaFAxWKXDwdJSWNPWhFp7dW5OK724PPnZuXxrIu4fIO7FBWBTC01PW6EHeGL3v8206zrP4v4NjcsV84PK4QA1XeIbVueq', 0),
(29, 1, 'DhqJRSzWnDJHPcCYgsJliknfy5quAFUdXlXOdwLBavjZHVYXoIjG2GWBMn5m30z0mxPA3Abd5udNqbLOT4vWLrxxPCUSDuSZ1Hz4iLiofvbGHWvA00xLs4jhHd9kH2kJKTN2E5qUBBBix6Ty7qkzvDRcR1xy3RiNL6QqcgkNSV5q2ZZ9qjIVXA7OBFnExFsiLiIXz3Ls', 0),
(30, 1, '3VuYqSWoZPGRIf72Y3khF3Po54QP5VS9Rm7hf4FeUm6CBeFAiZRY2Hm8McYS8Q10d9hsdXH7jOKV2pvkonir5FARSzJ0pK0CUi57fNfzBZuDpZYOnhgsWQjOp3PPOQsI8xPol5YW4sAusziPQyhMpBBPEqEsh7apE0O05MXafxEH7XxXwPKWqmL5Nqx4xItcJicP49Zj', 0),
(31, 1, 'jBWBFiIWTUiaZnCQRHg1f2lXYTx3i8iBKedpwVmqQFBP3dGUUWWaYi7XbF0uOj6zyjY5flv506V3kBYeyVoxdwuocvT1PZAniysyUYDU5zXpbWEJR3g4zLtMhmN7lnuEWXcQWQL1qJqBF4lw8BBIn4uFrhMNFgrCeEsavecVXCwCHR9PtKxRP2wgki3ZzvCNa5YFjaAg', 0),
(32, 1, 'jEN3LPnHpboaBUg2G4yoR6Fa4Z61N4E6Js9uhxcHIARkv8mccVB42gf6gl83qMa9fkExRQeAr6UXeh9qcKve1Kli6tmwgwGvQl3HchhDncABtK2FvxUwigOoKaV0HBwxXzf9RxNeJnQc8TSDrNaJ4Z8Oa3PRFloCVEMNbz2VXS85M0JdOTXST5G39wUPRjsNYeA9OC4L', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `webauth`
--
ALTER TABLE `webauth`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `time`
--
ALTER TABLE `time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `webauth`
--
ALTER TABLE `webauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID записи', AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
