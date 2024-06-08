SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";


DROP DATABASE IF EXISTS GoDelivery;

CREATE DATABASE GoDelivery;

USE GoDelivery;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 04, 2024 lúc 03:23 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `godelivery`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerCode` varchar(8) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerCode`, `Name`) VALUES
(1, 'DTGO', 'GoDelivery'),
(2, 'P3LBD', 'Lẩu bò đùm'),
(3, 'P3OD', 'Ơ Duyên'),
(4, 'P3CD', 'Cô Duyên'),
(5, 'P1NG1', 'Ngô Gia 1'),
(6, 'P2NG2', 'Ngô Gia 2'),
(7, 'P3NG3', 'Ngô Gia 3'),
(8, 'P29S', '9 Sạch'),
(9, 'P4HSQN', 'Hải sản Quang Nguyễn'),
(10, 'P3', 'Hải sản Thiên Phúc'),
(11, 'P8HS141', 'Hải sản 141'),
(12, 'HSNN', 'Hải sản Ngọc Ngân'),
(13, 'SD', 'Sóc điệu'),
(14, 'DS', 'Dimsum'),
(15, 'KH1', 'Hiểu Thanh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `OrderCode` varchar(8) DEFAULT NULL,
  `CustomerID` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderCode`, `CustomerID`, `StoreID`, `OrderDate`, `Total`, `Note`) VALUES
(1, '', 1, 7, '2024-06-03 08:13:11', 0.00, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductCode` varchar(8) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(18,2) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipments`
--

CREATE TABLE `shipments` (
  `ShipmentID` int(11) NOT NULL,
  `ShipmentCode` varchar(8) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ShipperID` int(11) NOT NULL,
  `ShipmentDate` datetime NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipments`
--

INSERT INTO `shipments` (`ShipmentID`, `ShipmentCode`, `OrderID`, `ShipperID`, `ShipmentDate`, `Total`, `Note`) VALUES
(1, '', 1, 5, '2024-06-04 03:18:40', 15000.00, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippers`
--

CREATE TABLE `shippers` (
  `ShipperID` int(11) NOT NULL,
  `ShipperCode` varchar(8) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shippers`
--

INSERT INTO `shippers` (`ShipperID`, `ShipperCode`, `Name`, `Address`, `Phone`, `Note`) VALUES
(1, 'SP1', 'Nghĩa', '', '', NULL),
(2, 'SP2', 'Thành', '', '', NULL),
(3, 'SP3', 'Ken', '', '', NULL),
(4, 'SP4', 'Nhựt', '', '', NULL),
(5, 'SP6', 'Vũ', '', '', NULL),
(6, 'SP5', 'Khang', '', '', NULL),
(7, 'SP7', 'Tân', '', '', NULL),
(8, 'SP8', 'Huy', '', '', NULL),
(9, 'SP9', 'Thọ', '', '', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

CREATE TABLE `stores` (
  `StoreID` int(11) NOT NULL,
  `StoreCode` varchar(8) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Address_google` text NOT NULL,
  `Location_NONE` tinyint(1) DEFAULT NULL,
  `Address_google_NONE` text NOT NULL,
  `Phone` varchar(255) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`StoreID`, `StoreCode`, `Name`, `Address`, `Address_google`, `Location_NONE`, `Address_google_NONE`, `Phone`, `Note`) VALUES
(1, 'GO', 'GoDelivery', 'Phường 3', '', NULL, '', '', NULL),
(2, 'P3LBD', 'Lẩu bò đùm', 'Phường 3', '', NULL, '', '', NULL),
(3, 'P3OD', 'Ơ Duyên', 'Phường 3', '', NULL, '', '', 'Cùng quán tên \'Cô Duyên\', sau này sử dụng tên \'Cô Duyên\''),
(4, 'P3CD', 'Cô Duyên', 'Phường 4', '', NULL, '', '', NULL),
(5, 'P1NG1', 'Ngô Gia 1', 'Phường 1', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia/@10.2539329,105.9737373,816m/data=!3m1!1e3!4m16!1m9!3m8!1s0x310a9d2f7fc5026b:0x93368e526b826cca!2zSOG7k25nIFRyw6AgTmfDtCBHaWE!8m2!3d10.2539276!4d105.9763122!9m1!1b1!16s%2Fg%2F11kj42nbgt!3m5!1s0x310a9d2f7fc5026b:0x93368e526b826cca!8m2!3d10.2539276!4d105.9763122!16s%2Fg%2F11kj42nbgt?entry=ttu', NULL, '', '', NULL),
(6, 'P2NG2', 'Ngô Gia 2', 'Phường 2', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia+Nguy%E1%BB%85n+Hu%E1%BB%87+-+H174/@10.2535502,105.9624629,144m/data=!3m1!1e3!4m6!3m5!1s0x310a839c6f1894d7:0x830c98d966cd144d!8m2!3d10.2536918!4d105.9628987!16s%2Fg%2F11kpn1f9r1?entry=ttu', NULL, '', '', NULL),
(7, 'P3NG3', 'Ngô Gia 3', 'Phường 3', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia+H270/@10.2358841,105.9632853,204m/data=!3m1!1e3!4m6!3m5!1s0x310a83001a672985:0x6332a8b519c18e00!8m2!3d10.2358842!4d105.9640142!16s%2Fg%2F11vr9fjxzh?entry=ttu', NULL, '', '', NULL),
(8, 'P29S', '9 Sạch', 'Phường 2', '', 1, 'https://www.google.com/maps/place/10%C2%B015\'16.3%22N+105%C2%B057\'57.3%22E/@10.2545333,105.9652693,204m/data=!3m2!1e3!4b1!4m4!3m3!8m2!3d10.254532!4d105.965913?entry=ttu', '', 'Cầu cái cá, hướng về phường 1, nhìn tay phải, kế bên '),
(9, 'P4HSQN', 'Hải sản Quang Nguyễn', 'Phường 4', 'https://www.google.com/maps/place/H%E1%BA%A3i+s%E1%BA%A3n+Quang+Nguy%E1%BB%85n/@10.2346518,105.9879986,243m/data=!3m1!1e3!4m6!3m5!1s0x310a9d891007edc3:0x4efeb5f31365cda0!8m2!3d10.2346145!4d105.98936!16s%2Fg%2F11plj67wy3?entry=ttu', NULL, '', '', NULL),
(10, 'P3', 'Hải sản Thiên Phúc', 'Phường 4', '', 1, 'https://www.google.com/maps/place/10%C2%B014\'08.7%22N+105%C2%B059\'24.8%22E/@10.2357152,105.9900183,61m/data=!3m1!1e3!4m4!3m3!8m2!3d10.235749!4d105.990234?entry=ttu', '', 'Gần cầu Chợ Cua'),
(11, 'P8HS141', 'Hải sản 141', 'Phường 8', 'https://www.google.com/maps/place/H%E1%BA%A3i+S%E1%BA%A3n+T%C6%B0%C6%A1i+S%E1%BB%91ng+141/@10.2303889,105.9517823,102m/data=!3m1!1e3!4m6!3m5!1s0x310a82bcab2ee2af:0x5415e0b6b7389ad8!8m2!3d10.2303815!4d105.9521472!16s%2Fg%2F11vzrw1p6m?entry=ttu', NULL, '', '', NULL),
(12, 'HSNN', 'Hải sản Ngọc Ngân', 'Phường 3', 'https://www.google.com/maps/place/Qu%C3%A1n+H%E1%BA%A3i+S%E1%BA%A3n+Ng%E1%BB%8Dc+Ng%C3%A2n/@10.2425647,105.9739874,17z/data=!3m1!4b1!4m6!3m5!1s0x310a9dc5601ec70d:0xb3edfe0db14e1a95!8m2!3d10.2425647!4d105.9739874!16s%2Fg%2F11t9ls7q34?entry=ttu', NULL, '', '', NULL),
(13, 'SD', 'Sóc điệu', '', '', NULL, '', '', NULL),
(14, 'DS', 'Dimsum', '', '', NULL, '', '', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`),
  ADD UNIQUE KEY `U_Customer` (`CustomerCode`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `FK_OrderDetail_Order` (`OrderID`),
  ADD KEY `FK_OrderDetail_Product` (`ProductID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD UNIQUE KEY `U_Order` (`OrderCode`),
  ADD KEY `FK_Order_Customer` (`CustomerID`),
  ADD KEY `FK_Order_Store` (`StoreID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD UNIQUE KEY `U_Product` (`ProductCode`);

--
-- Chỉ mục cho bảng `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`ShipmentID`),
  ADD UNIQUE KEY `U_Shipment` (`ShipmentCode`),
  ADD KEY `FK_Shipment_Order` (`OrderID`),
  ADD KEY `FK_Shipment_Shipper` (`ShipperID`);

--
-- Chỉ mục cho bảng `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`ShipperID`),
  ADD UNIQUE KEY `U_Shipper` (`ShipperCode`);

--
-- Chỉ mục cho bảng `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`StoreID`),
  ADD UNIQUE KEY `U_Store` (`StoreCode`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `shipments`
--
ALTER TABLE `shipments`
  MODIFY `ShipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippers`
--
ALTER TABLE `shippers`
  MODIFY `ShipperID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `stores`
--
ALTER TABLE `stores`
  MODIFY `StoreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK_OrderDetail_Order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `FK_OrderDetail_Product` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Order_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  ADD CONSTRAINT `FK_Order_Store` FOREIGN KEY (`StoreID`) REFERENCES `stores` (`StoreID`);

--
-- Các ràng buộc cho bảng `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `FK_Shipment_Order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `FK_Shipment_Shipper` FOREIGN KEY (`ShipperID`) REFERENCES `shippers` (`ShipperID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
