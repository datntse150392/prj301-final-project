-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 04, 2023 lúc 04:36 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `katplanet`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address`
--

INSERT INTO `address` (`address_id`, `address`) VALUES
(1, 'Đồng Tháp'),
(2, 'Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_account`
--

CREATE TABLE `admin_account` (
  `adminid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `displayname` varchar(100) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_account`
--

INSERT INTO `admin_account` (`adminid`, `username`, `password`, `displayname`, `address_id`) VALUES
(1, 'dat', '123456', 'Nguyễn Thành Đạt', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `img`
--

CREATE TABLE `img` (
  `imgid` int(11) NOT NULL,
  `address_link` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `img`
--

INSERT INTO `img` (`imgid`, `address_link`, `name`, `lid`) VALUES
(1, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1),
(2, 'https://cf.shopee.vn/file/e609a83f8a5289bc924965d38e30420c', 'Cát đậu nành cho mèo MIMI 6L, Cát vệ sinh hữu cơ chiết xuất từ mầm đậu nành nguyên cám', 1),
(3, 'https://cf.shopee.vn/file/a7aecb0488cab4299481ab8fb4dc643b', '[100 Miếng] Tã lót chuồng vệ sinh cho chó mèo DONO siêu thấm hút - Miếng lót vệ sinh khoá nước cấp tốc', 2),
(4, 'https://cf.shopee.vn/file/6643ffbaec4622e2c5809ffa23ce9c1b', 'Túi rác dọn phân chó mèo, Túi rác mini hốt phân thú cưng - Kat Planet', 2),
(5, 'https://cf.shopee.vn/file/93aad8a9a679b20bd8c3b93ee5384653', 'Khay vệ sinh cho mèo hình tròn, Nhà vệ sinh chống văng cho mèo - Kat Planet Petshop', 2),
(6, 'https://cf.shopee.vn/file/sg-11134201-22110-4j5hnfzoy3jvfb', 'Bộ chổi dọn cát vệ sinh, hạt rơi vãi cho chó mèo tiện lợi, Dụng cụ quét dọn đa năng cho thú cưng - Kat Planet Petshop', 2),
(7, 'https://cf.shopee.vn/file/551864382ed7f0ef12f67b69055c2c50', 'Thảm hứng cát mèo, Thảm lót chống văng cát, hứng cát vệ sinh cho mèo', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `listproduct`
--

CREATE TABLE `listproduct` (
  `lid` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `listproduct`
--

INSERT INTO `listproduct` (`lid`, `name`) VALUES
(1, 'CÁT VỆ SINH'),
(2, 'DỤNG CỤ VỆ SINH');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `count` int(11) NOT NULL,
  `imgid` int(11) DEFAULT 1,
  `lid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `name`, `price`, `count`, `imgid`, `lid`) VALUES
(12, 'Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 190000, 0, 1, 1),
(13, 'Cát vệ sinh hữu cơ chiết xuất từ mầm đậu nành nguyên cám', 125000, 4, 2, 1),
(14, '[100 Miếng] Tã lót chuồng vệ sinh cho chó mèo DONO siêu thấm hút', 180000, 14, 3, 2),
(15, 'Túi rác dọn phân chó mèo, Túi rác mini hốt phân thú cưng', 7000, 11, 4, 2),
(16, 'Khay vệ sinh cho mèo hình tròn, Nhà vệ sinh chống văng cho mèo', 145000, 5, 5, 2),
(18, 'Bộ chổi dọn cát vệ sinh, hạt rơi vãi cho chó mèo tiện lợi', 25000, 19, 6, 2),
(20, 'Thảm hứng cát mèo, Thảm lót chống văng cát, hứng cát vệ sinh cho mèo', 155000, 20, 7, 2),
(21, '[Mẫu mới] Nhà vệ sinh có nắp cho mèo cỡ lớn', 280000, 10, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_history`
--

CREATE TABLE `purchase_history` (
  `purchase_history_id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `count` int(11) NOT NULL,
  `price` float NOT NULL,
  `address_link` varchar(300) NOT NULL,
  `userid` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `purchase_history`
--

INSERT INTO `purchase_history` (`purchase_history_id`, `name`, `count`, `price`, `address_link`, `userid`, `pid`) VALUES
(20, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(21, 'Bộ chổi dọn cát vệ sinh, hạt rơi vãi cho chó mèo tiện lợi, Dụng cụ quét dọn đa năng cho thú cưng - Kat Planet Petshop', 1, 25000, 'https://cf.shopee.vn/file/sg-11134201-22110-4j5hnfzoy3jvfb', 1, 18),
(22, 'Cát đậu nành cho mèo MIMI 6L, Cát vệ sinh hữu cơ chiết xuất từ mầm đậu nành nguyên cám', 2, 125000, 'https://cf.shopee.vn/file/e609a83f8a5289bc924965d38e30420c', 1, 13),
(23, 'Túi rác dọn phân chó mèo, Túi rác mini hốt phân thú cưng - Kat Planet', 1, 7000, 'https://cf.shopee.vn/file/6643ffbaec4622e2c5809ffa23ce9c1b', 1, 15),
(24, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(25, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 210000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(26, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 210000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(27, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 0, 210000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(28, '[100 Miếng] Tã lót chuồng vệ sinh cho chó mèo DONO siêu thấm hút - Miếng lót vệ sinh khoá nước cấp tốc', 2, 180000, 'https://cf.shopee.vn/file/a7aecb0488cab4299481ab8fb4dc643b', 1, 14),
(29, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(30, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(31, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(32, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(33, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', -1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(34, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(35, 'Cát đậu nành cho mèo MIMI 6L, Cát vệ sinh hữu cơ chiết xuất từ mầm đậu nành nguyên cám', 1, 125000, 'https://cf.shopee.vn/file/e609a83f8a5289bc924965d38e30420c', 1, 13),
(36, '[100 Miếng] Tã lót chuồng vệ sinh cho chó mèo DONO siêu thấm hút - Miếng lót vệ sinh khoá nước cấp tốc', 1, 180000, 'https://cf.shopee.vn/file/a7aecb0488cab4299481ab8fb4dc643b', 1, 14),
(37, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 6, 12),
(38, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 2, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 1, 12),
(39, 'Túi rác dọn phân chó mèo, Túi rác mini hốt phân thú cưng - Kat Planet', 1, 7000, 'https://cf.shopee.vn/file/6643ffbaec4622e2c5809ffa23ce9c1b', 1, 15),
(40, '[100 Miếng] Tã lót chuồng vệ sinh cho chó mèo DONO siêu thấm hút - Miếng lót vệ sinh khoá nước cấp tốc', 2, 180000, 'https://cf.shopee.vn/file/a7aecb0488cab4299481ab8fb4dc643b', 7, 14),
(41, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 1, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 7, 12),
(42, '[Mẫu mới] Cát đậu nành CATURE cho mèo mùi sữa, Cát vệ sinh cho mèo CATURE TOFU 7L', 3, 190000, 'https://cf.shopee.vn/file/ccdf44080f8ef0bed919c05c482c4a24', 7, 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_account`
--

CREATE TABLE `user_account` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_account`
--

INSERT INTO `user_account` (`userid`, `username`, `password`, `displayname`, `address_id`) VALUES
(1, 'dat1', '123456', 'Thành Đạt', 1),
(3, 'nguyenvana', '123456', 'Nguyễn Văn A', 2),
(5, 'lnhao123', '123456', 'Lê Nhật Hào', 1),
(6, 'nguyenvanb', '123456', 'Nguyễn Văn B', 2),
(7, 'RankillerDY', '846130225', 'Dinh Gia Bao', 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Chỉ mục cho bảng `admin_account`
--
ALTER TABLE `admin_account`
  ADD PRIMARY KEY (`adminid`),
  ADD KEY `address_id` (`address_id`);

--
-- Chỉ mục cho bảng `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`imgid`),
  ADD KEY `lid` (`lid`);

--
-- Chỉ mục cho bảng `listproduct`
--
ALTER TABLE `listproduct`
  ADD PRIMARY KEY (`lid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `lid` (`lid`),
  ADD KEY `imgid` (`imgid`);

--
-- Chỉ mục cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`purchase_history_id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `userid` (`userid`);

--
-- Chỉ mục cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `address_id` (`address_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `admin_account`
--
ALTER TABLE `admin_account`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `img`
--
ALTER TABLE `img`
  MODIFY `imgid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `listproduct`
--
ALTER TABLE `listproduct`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `purchase_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `user_account`
--
ALTER TABLE `user_account`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `admin_account`
--
ALTER TABLE `admin_account`
  ADD CONSTRAINT `admin_account_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);

--
-- Các ràng buộc cho bảng `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `img_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `listproduct` (`lid`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`lid`) REFERENCES `listproduct` (`lid`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`imgid`) REFERENCES `img` (`imgid`);

--
-- Các ràng buộc cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  ADD CONSTRAINT `purchase_history_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `user_account` (`userid`);

--
-- Các ràng buộc cho bảng `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
