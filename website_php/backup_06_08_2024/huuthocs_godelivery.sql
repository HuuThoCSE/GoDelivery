-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 08, 2024 lúc 08:32 AM
-- Phiên bản máy phục vụ: 10.3.39-MariaDB-cll-lve
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `huuthocs_godelivery`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerCode` varchar(12) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`CustomerID`, `CustomerCode`, `Name`, `Address`, `Phone`, `Note`) VALUES
(1, 'DTGO', 'GoDelivery', '', '', NULL),
(2, 'DT2LBD', 'Lẩu bò đùm', '', '', NULL),
(3, 'DT3OD', 'Ơ Duyên', '', '', NULL),
(4, 'DT4CD', 'Cô Duyên', '', '', NULL),
(5, 'DT5NG1', 'Ngô Gia 1', '', '', NULL),
(6, 'DT6NG2', 'Ngô Gia 2', '', '', NULL),
(7, 'DT7NG3', 'Ngô Gia 3', '', '', NULL),
(8, 'DT89S', '9 Sạch', '', '', NULL),
(9, 'DT9HSQN', 'Hải sản Quang Nguyễn', '', '', NULL),
(10, 'DT10HSTP', 'Hải sản Thiên Phúc', '', '', NULL),
(11, 'DT11HS141', 'Hải sản 141', '', '', NULL),
(12, 'DT12HSNN', 'Hải sản Ngọc Ngân', '', '', NULL),
(13, 'DT13SD', 'Sóc điệu', '', '', NULL),
(14, 'DT14DS', 'Dimsum', '', '', NULL),
(15, 'KH1', 'Hiểu Thanh', '', '', NULL),
(16, 'KH2', '', '', '0904559964', 'Trường THPT nguyễn Thông '),
(17, 'DT17HDB', 'Hương đồng biển', '', '', NULL),
(18, '', '', '', '02702477222', NULL),
(55, NULL, NULL, NULL, '0354122490', NULL),
(56, NULL, NULL, NULL, '0906188391', NULL),
(57, NULL, NULL, NULL, '0933891237', NULL),
(58, NULL, NULL, NULL, '0879214098', NULL),
(59, NULL, NULL, NULL, '0988155487', NULL),
(60, NULL, NULL, NULL, '0979535091', NULL),
(61, NULL, NULL, NULL, '0849191977', NULL),
(62, NULL, NULL, NULL, '0918637996', NULL),
(65, NULL, NULL, NULL, '0975533878', NULL),
(66, NULL, NULL, NULL, '0939418062', NULL),
(67, NULL, NULL, NULL, '0395148976', NULL),
(68, NULL, NULL, NULL, '0938779927', NULL),
(70, NULL, '', NULL, '', ''),
(71, NULL, 'Nguyễn Hữu Thọ', NULL, '0355733881', 'Thử nghiệm');

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
  `CustomerID` int(11) DEFAULT NULL,
  `StoreID` int(11) DEFAULT NULL,
  `ServiceID` int(11) NOT NULL DEFAULT 1,
  `OrderDate` datetime DEFAULT current_timestamp(),
  `Total` decimal(18,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`OrderID`, `OrderCode`, `CustomerID`, `StoreID`, `ServiceID`, `OrderDate`, `Total`, `status`, `Notes`) VALUES
(1, 'OD1', 1, 7, 1, '2024-06-03 08:13:11', '0.00', 1, NULL),
(2, 'OD2', 8, 8, 1, '2024-06-03 09:15:43', NULL, 1, 'Qua chành xe cô duyên chở hộ về 9sach'),
(3, 'OD3', 1, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'qua phongf số 8 rc khách'),
(4, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Mua hộ, 20k xăng qua táo mẻ nha'),
(5, NULL, NULL, 11, 1, '2024-06-03 09:15:43', NULL, 1, ' 9h25  hs 141'),
(6, NULL, 16, 7, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All ngo gia p3 \r\n\r\nSdt 0904559964 - dc: trường THPT nguyễn Thông \r\nĐơn 207k ship quán trả'),
(7, NULL, NULL, 3, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Od p3 \r\n\r\n1con gà chặt sẵn \r\nĐường 72 đường 30/4\r\nLấy ship 10k \r\nTcong thu shiper 300k\r\nCòn nhiêu tiền ship mình bù cho shiper'),
(8, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Rc khách ở thập nhất phong ( vòng xoay cầu đôi )\r\n'),
(9, NULL, 3, 3, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Od p3 \r\n\r\ndạ cho 1 shipper ra vtsg lấy đồ đem dô p3 '),
(10, NULL, NULL, 16, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Baba thịt'),
(11, NULL, NULL, 10, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Hs thiên phúc'),
(12, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Qua má số 8 đổi đồ hộ'),
(13, NULL, NULL, 8, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All 9 sạch \r\n\r\n15p nữa cho anh ship qua lấy bánh giao lại chành Phú Vĩnh Long p8 dùm anh ( không trả phí xe chỉ giao bánh qa đó , shop trả ship )'),
(14, NULL, NULL, 2, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Lẩu bò đùm p3 \r\n\r\n0270 2477222. Lâu bò va phân luc lac 1kg banh phở cua c tc. 380k. '),
(15, NULL, NULL, 3, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ od p3 \r\n\r\n- 1 sườn không\r\n- 1 sườn bì trứng \r\n\r\nCơm 86'),
(16, NULL, NULL, 4, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All ( 3h55 ) Od p4 '),
(17, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- 1 phần bún nem nướng đặc biệt \r\n( đối diện hủ tiếu 113 ) \r\n\r\nGiao xún nhà anh Thương Hồ ( chủ lany )'),
(18, NULL, NULL, 5, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Ngô gia p1 , ship c tới 62 nguyễn thị minh khai p1\n 0354122490\n132k ship quán trả\n\nKhánh Phương'),
(19, NULL, NULL, 4, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All odp4 , anh ơi cho shipper lại bún đậu mẹt p4 mua dùm 2p bún đậu thịt cốm đem lại p4 nha\r\n'),
(20, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n@GOSP5 - Nguyễn Phát Khang '),
(21, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ'),
(22, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- 090 6188391 liên hệ mợ của tui nhờ mua đồ'),
(23, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ tài xeko \r\n\r\n- 1 ly trà đào ở rio \r\n- 1 ổ bánh mỳ quang râu ( nhỏ ) \r\n( không dưa chua , để dưa leo và ớt )'),
(24, NULL, NULL, 4, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Odp4'),
(25, '', NULL, 17, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Thực Phẩm lê duyên ( đối diện vườn ổi ) \n\nGấp'),
(26, NULL, NULL, 19, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Be xíu p1'),
(27, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- 2 má heo nướng không da \r\n- 1 phần cháo không đủ 3 người ăn'),
(28, NULL, NULL, 2, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Lẩu bò đùm p3 \r\n\r\n093 3891237. Cua c 200k giao câu ong me'),
(29, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ 0879214098\r\n- 1 bún mắm cô ba\r\n(K rau muống k thịt rau trụng) \r\n\r\nGiao ở yumi xong lấy đồ đem đi cho khách tiếp'),
(30, NULL, NULL, 16, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Baba thịt'),
(31, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Lấy hộ táo mẻ \r\n\r\nQua trực lấy cây 12promax qua táo mẻ nha'),
(32, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ Cô Nhi \r\n\r\n- 1 mỳ ý , 1 gà , 1 khoai tây kh lắc , 1 pepsi ( jolibe ) \r\n\r\nGiao ở p5 0988155487'),
(33, NULL, NULL, 9, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Hs quang nguyễn\r\n'),
(34, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Rc khách ở ngọc vân\r\n'),
(35, NULL, NULL, 5, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Ngô gia p1 \r\n\r\n1 ship lấy hàng f3 qua f1'),
(36, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- lại con cưng xong liên hệ khách hỏi khách mua gì \r\n\r\n097 9535091'),
(37, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ ( jolibe ) \r\n\r\n- 2 hambergo bò , 2 miếng gà , 1 khoai tây , 1 phomai que chiên , 2 pepsi\r\n\r\n- Giao ngay vật liệu xây dựng cầu ông me lớn ( 084 9191977 )'),
(38, NULL, NULL, 1, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- 200k phá lấu khathy \r\n\r\nGiao p4 '),
(39, NULL, NULL, 20, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Ly store'),
(40, NULL, NULL, 7, 1, '2024-06-03 09:15:43', NULL, 1, 'Đơn @All Ngô gia p3 '),
(41, NULL, NULL, 3, 1, '2024-06-03 09:15:40', NULL, 1, 'Đơn @All Od p3 \r\n\r\n1/2con gà \r\nGiao p1\r\n091 8637996'),
(42, NULL, NULL, 5, 1, '2024-06-03 09:15:38', NULL, 1, 'Đơn @All Ngô gia p1 \r\n\r\nCho bên e một anh qua ngô gia p3 chở trà về p1'),
(43, NULL, NULL, 2, 1, '2024-06-03 09:15:35', NULL, 1, 'Đơn @All Lẩu bò đùm p3 \r\n\r\n097 5533878. Giao lomg hô giup c. Cua c 650k. '),
(44, NULL, NULL, 14, 1, '2024-06-03 09:15:32', NULL, 1, 'Đơn @All dimsum '),
(45, NULL, NULL, 1, 1, '2024-06-03 09:15:30', NULL, 1, 'Đơn @All Rc khách + đưa xe '),
(46, NULL, NULL, 1, 1, '2024-06-03 09:15:27', NULL, 1, 'Đơn @All Mua hộ '),
(47, NULL, NULL, 1, 1, '2024-06-03 09:15:25', NULL, 1, 'Đơn @All 22h15 rước Nhi Lâm \r\n\r\n@GOSP4 - Nhuwtj khách yêu cầu'),
(48, NULL, NULL, 1, 1, '2024-06-03 09:15:21', NULL, 1, 'Đơn @All Rc khách ( hdb 2 ) công trc\r\n'),
(49, NULL, 17, 15, 1, '2024-06-04 09:04:09', NULL, 1, 'Đơn @All lại Hdb \r\n\r\nXong điện số trên'),
(50, NULL, 13, 13, 1, '2024-06-04 09:10:56', NULL, 1, 'Đơn @All Mua hộ sóc địu \r\n\r\nMua dùm 2 hop cơm sườn bì cô tuyet nhe em'),
(51, NULL, NULL, 1, 1, '2024-06-04 09:53:07', NULL, 1, 'Đơn @All Mua hộ má \r\n\r\n- 30k tôm thẻ \r\n- 1 củ khoai mỡ \r\n- 1 bịch phở tái gân'),
(52, NULL, NULL, 4, 1, '2024-06-04 10:05:34', NULL, 1, 'Đơn @All Od p4\r\n\r\nGiao khách brownie p1\r\n1combo 2 mon đổi tré thành trộn\r\n093 9418062\r\nP4 nhận đi e'),
(53, NULL, NULL, 2, 1, '2024-06-04 10:25:10', NULL, 1, 'Đơn  ưu tiên @All lẩu bò đùm , Đc số nhà 403 đường số 4 khu nhà ở hoàn hảo. 0395148976.  Cua c 180k .'),
(54, NULL, NULL, 1, 1, '2024-06-04 10:28:47', NULL, 1, 'Đơn @All Lấy đồ hộ \n\n- Vào thập nhất phong ( trong vòng xoay cầu đôi )\n\nĐt số này khách chỉ láy đồ 0938779927'),
(55, NULL, NULL, 16, 1, '2024-06-04 10:45:06', NULL, 1, 'Đơn @All Baba thịt \r\n\r\n- Giao xéo nhà tan lễ ( cảnh sát 1 ) \r\n\r\n0768818684'),
(56, NULL, NULL, 1, 1, '2024-06-04 10:45:57', NULL, 1, 'Đơn @All rước khách ở tỉnh ủy'),
(57, NULL, NULL, 3, 1, '2024-06-04 11:17:10', NULL, 1, 'Đơn @All OD p3 , 0936434952'),
(58, NULL, NULL, 1, 1, '2024-06-04 11:47:53', NULL, 1, 'Đơn @All Mua hộ hs ngọc ngân \r\n\r\n- 1kg chả cá thác lát ( dưới đường chợ cua ) \r\n- 1kg ốc hương ( tiên cua )'),
(59, NULL, NULL, 21, 1, '2024-06-04 11:47:59', NULL, 1, 'Đơn @All Trà sen '),
(60, NULL, NULL, 8, 1, '2024-06-04 11:51:32', NULL, 1, 'Đơn @All 9 sạch'),
(61, NULL, NULL, 4, 1, '2024-06-04 12:06:48', NULL, 1, 'Đơn @All Od p4 \r\n\r\n1/2 con gà \r\n176 p2 đối diện nhà thờ chánh toà\r\n078 8759984'),
(62, NULL, NULL, 1, 1, '2024-06-04 12:06:55', NULL, 1, 'Đơn @All Mua hộ chị Hân \r\n- 2 bịch dừa nước \r\n\r\n( nếu có bán trái dừa thì mua dùm chị 2 3 trái luôn ) '),
(63, NULL, NULL, 1, 1, '2024-06-04 03:03:03', NULL, 1, 'Đơn @All Chị Hân\r\n\r\nAlo ola . E chạy zô chị lấy bánh đem ra ngoài chỗ má chị bán dùm chị nhe \r\n'),
(64, NULL, NULL, 1, 1, '2024-06-04 03:09:17', NULL, 1, 'Đơn @All Ngô gia p3 \r\nCho em một ship quA p1 lấy hàng ship qua p3 ạ\r\nShip trà \r\nNên mấy anh chuẩn bị dây gàng nha\r\nEm cảm ơn\r\nBên em có công sẵn'),
(65, NULL, NULL, 3, 3, '2024-06-04 03:25:27', NULL, 1, 'Hình thức: Giao hàng\r\nChọn quán: Ơ Duyên\r\nĐịa chỉ giao: Phường 4\r\nGhi chú: Đơn @All Od p4 <br />\r\n<br />\r\nBv xuyên á <br />\r\n1/4 gà <br />\r\n1sthai nhỏ <br />\r\n1chân ủ muối nhỏ <br />\r\n1tré lớn <br />\r\n0395147432<br />\r\n<br />\r\nLấy khách ship 15k <br />\r\nCòn lại bù cho shiper'),
(66, NULL, NULL, 3, 3, '2024-06-04 03:26:13', NULL, 1, 'Hình thức: Giao hàng\r\nChọn quán: Ơ Duyên\r\nĐịa chỉ giao: Phường 3\r\nGhi chú: Đơn @All Od p3 lấy hộ\r\n<br />\r\nCho shiper ra kim mã lấy 5th nhỏ nhe. Vè cho c ở p3'),
(67, NULL, NULL, 6, 3, '2024-06-04 04:08:47', NULL, 1, 'Địa chỉ giao:\r\nGhi chú: Đơn @All Ngô gia p2'),
(68, NULL, NULL, 6, 3, '2024-06-04 04:09:08', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Ngô gia p2 lấy hộ <br />\r\n<br />\r\nE kêu 1 bạn qua p1 lấy trà dùm c nha'),
(69, NULL, NULL, 1, 1, '2024-06-04 04:45:45', NULL, 1, 'Địa chỉ giao: \nGhi chú: @All mua hộ<br />\r\nThảo mèo<br />\r\n1 bánh tráng cuốn <br />\r\n1 bánh tráng trộn<br />\r\nGiao nhà a Thương lany'),
(70, NULL, NULL, 2, 1, '2024-06-04 05:41:42', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: @All Đơn lẩu bò đùm 4h15 \r\nO898320549 chieu 4h20 lai lay ship dum c. Cua c. 480k. '),
(71, NULL, NULL, 3, 3, '2024-06-04 05:42:39', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Od p3\r\n<br />\r\n1tcam nhỏ <br />\r\nBrownie nguyễn thị minh khai <br />\r\n0764095985'),
(72, NULL, NULL, 2, 1, '2024-06-04 05:43:03', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Lẩu bò đùm p3 4h55 </br>\r\nMuội Huynh 0367909991 cầu vàm p8. Mai giao dum c 1kg long da. Qua p3 lay dum c. Cua c 80k'),
(73, NULL, NULL, 2, 1, '2024-06-04 05:48:48', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lẩu bò đùm p3 <br />\r\n090 7894134. Cho di lien dum c nhe. Cua c 200l'),
(74, NULL, NULL, 1, 1, '2024-06-04 06:06:48', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ '),
(75, NULL, NULL, 10, 3, '2024-06-04 06:08:07', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(76, NULL, NULL, 1, 3, '2024-06-04 06:08:49', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lên vòng xoay cầu đôi lấy thùng hàng về hs 141 '),
(77, NULL, NULL, 11, 1, '2024-06-04 07:18:06', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs 141 <br />\r\nGiao khải hoàn thu 750k <br />\r\n0986138531'),
(78, NULL, NULL, 2, 1, '2024-06-04 07:18:38', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3 <br />\r\n'),
(79, NULL, NULL, 2, 1, '2024-06-04 07:18:53', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Bò đùm p3<br />\r\n<br />\r\n0919475252 phong. Hoa Phu cua 200k e tru mây bill ck dum c luon mhe'),
(80, NULL, NULL, 1, 1, '2024-06-04 07:26:43', NULL, 1, 'Địa chỉ giao: Phường 4\nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\n- 2 phần bún đậu mẹt ( p4 ) <br />\r\n<br />\r\nGiao trên gần cầu ngã cạy đường võ văn kiệt <br />\r\n<br />\r\n0777724444'),
(81, NULL, NULL, 1, 1, '2024-06-04 07:46:17', NULL, 1, 'Địa chỉ giao: Phường 4\nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\nPhí 12k ( vincom )'),
(82, NULL, NULL, 1, 2, '2024-06-04 07:58:57', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Rc khách ở Ốc nguyễn'),
(83, NULL, NULL, 1, 1, '2024-06-04 09:06:25', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1<br />\r\n<br />\r\n0395994367<br />\r\n93 đường Trần Phú P4 Vĩnh Long <br />\r\nKhách ck'),
(84, NULL, NULL, 5, 1, '2024-06-04 09:08:29', NULL, 1, 'Địa chỉ giao: Phường 4\nGhi chú: 0395994367<br />\r\n93 đường Trần Phú P4 Vĩnh Long <br />\r\nKhách ck'),
(85, NULL, NULL, 2, 3, '2024-06-04 10:13:22', NULL, 1, 'Địa chỉ giao: Phường 8\nGhi chú: Đơn ưu tiên @All Lẩu bò đùm p3 <br />\r\n<br />\r\n0941770139. Di gâp dum c bill nay nhe e<br />\r\n<br />\r\nGấp'),
(86, NULL, NULL, 4, 1, '2024-06-04 10:13:55', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Odp4<br />\r\n<br />\r\n1sthai lớn <br />\r\n1tré nhỏ <br />\r\nGiao trường an <br />\r\nGửi kèm túi ớt <br />\r\n070 4473054'),
(87, NULL, NULL, 5, 1, '2024-06-04 23:22:10', NULL, 1, 'Địa chỉ giao: Phường 8\nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\nEm đặt ship tới trường Nguyễn Thông 0787837953<br />\r\n395k ship quán trả'),
(88, NULL, NULL, 7, 1, '2024-06-04 23:24:32', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p3'),
(89, NULL, NULL, 4, 1, '2024-06-04 23:25:46', NULL, 1, 'Địa chỉ giao: Phường 8\r\nGhi chú: Đơn @All Od p4<br />\r\n<br />\r\n1sthai lớn <br />\r\nGiao p8 vĩnh long <br />\r\n0911657116'),
(90, NULL, NULL, 1, 1, '2024-06-04 23:26:01', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Mua hộ cho má <br />\r\n<br />\r\n@Trương Thành  má kêu'),
(91, NULL, NULL, 2, 3, '2024-06-04 23:26:17', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lẩu bò đùm '),
(92, NULL, NULL, 7, 3, '2024-06-04 23:26:37', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p3 '),
(93, NULL, NULL, 7, 1, '2024-06-05 23:27:09', NULL, 1, 'Địa chỉ giao: Phường 2\r\nGhi chú: Đơn @All Ngô gia p3<br />\r\n<br />\r\n0787837953 ( nguyễn thông, phường 2) <br />\r\n<br />\r\nLấy ship khach 10k ( ra thu lại tui 2k ) '),
(94, NULL, NULL, 1, 1, '2024-06-05 23:27:24', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ sóc điệu <br />\r\n<br />\r\n- 1 tô bún bò '),
(95, NULL, NULL, 10, 1, '2024-06-05 23:27:55', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(96, NULL, NULL, 7, 1, '2024-06-05 23:45:09', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p3 lấy hộ <br />\r\n<br />\r\nqua p1 lấy đồ'),
(97, NULL, NULL, 3, 1, '2024-06-05 23:45:24', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p3 lấy hộ ra p4 '),
(98, NULL, NULL, 1, 3, '2024-06-05 23:45:41', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Lấy hộ bánh kem giao cho khách <br />\r\n<br />\r\n( Lấy ở bánh kem quỳnh hương p1 )'),
(99, NULL, NULL, 1, 1, '2024-06-05 02:49:17', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ khánh duy <br />\r\n<br />\r\n@GOSP5 - Nguyễn Phát Khang khách yêu cầu'),
(100, NULL, NULL, 1, 1, '2024-06-05 02:49:34', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All mua hộ Đạt ngô gia '),
(101, NULL, NULL, 16, 3, '2024-06-05 02:49:56', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Baba thịt'),
(102, NULL, NULL, 1, 1, '2024-06-05 02:50:10', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Đạt ngô gia <br />\r\n<br />\r\n@Trương Thành '),
(103, NULL, NULL, 1, 1, '2024-06-05 02:50:53', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All súp trần gia ( gấp nhe ) <br />\r\n<br />\r\n11h50 giao tới việt tiến (Ngay gần trà sen )'),
(104, NULL, NULL, 1, 1, '2024-06-05 02:51:12', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ chị khách trong khu nhà 63<br />\r\n<br />\r\n- 1 mỳ cay hải sản 2 độ nấu sẵn ( seoul )<br />\r\n- 1 trà sữa full topping ( Tapi ) '),
(105, NULL, NULL, 1, 3, '2024-06-05 02:51:24', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Bò đùm p5<br />\r\n<br />\r\n0908438119. OK ship 1379 đường 18 khu dân cư hoàng hảo. Cua c 115k. E qua p5 lay dum c nhe<br />\r\n<br />\r\nShip 20k '),
(106, NULL, NULL, 1, 1, '2024-06-05 02:51:38', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ'),
(107, NULL, NULL, 5, 3, '2024-06-05 02:53:39', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1 ( 1h lấy ) <br />\r\n<br />\r\n0374512598 xổ số vĩnh long<br />\r\n1h15 giao nha<br />\r\n269k ship quán trả'),
(108, NULL, NULL, 3, 1, '2024-06-05 02:53:50', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ odp3<br />\r\n<br />\r\n- 3 hộp cơm sườn không '),
(109, NULL, NULL, 20, 1, '2024-06-05 02:54:08', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All ly store'),
(110, NULL, NULL, 17, 1, '2024-06-05 02:54:42', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Thực phẩm lê duyên'),
(111, NULL, NULL, 1, 1, '2024-06-05 02:54:48', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua 2 gói jet đem dô cô ba yến '),
(112, NULL, NULL, 3, 1, '2024-06-05 02:54:58', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lấy hộ odp3<br />\r\n<br />\r\nAnh ơi cho shipper qua vtsg lấy 2 thùng hàng về p3 nha anh'),
(113, NULL, NULL, 1, 1, '2024-06-05 02:55:04', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ<br />\r\n<br />\r\n@Trương Thành '),
(114, NULL, NULL, 1, 3, '2024-06-05 02:55:30', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All 9 sạch <br />\r\n<br />\r\n0392828741 <br />\r\nĐền thờ phạm hùng <br />\r\nThu 189k shop trả ship'),
(115, NULL, NULL, 5, 1, '2024-06-05 02:55:59', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1 ( 16h nhận )<br />\r\n<br />\r\n0989508651<br />\r\nLeader hoà phú <br />\r\n677k ship quán trả<br />\r\n16h30!đến tay khách'),
(116, NULL, NULL, 8, 1, '2024-06-05 02:56:22', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All 9 sạch ( 4h35 ) <br />\r\n<br />\r\n4:45 khách nhận cty may việt tiến nha em <br />\r\n0326472467<br />\r\nKh thu shop trả ship'),
(117, NULL, NULL, 16, 1, '2024-06-05 02:56:55', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Baba thịt gấp'),
(118, NULL, NULL, 5, 1, '2024-06-05 02:57:10', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\n- Áo cưới vân trang ngang phở việt<br />\r\n43k ship khách trả<br />\r\n- 0939891612'),
(119, NULL, NULL, 3, 1, '2024-06-05 03:13:51', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p3 <br />\r\n<br />\r\nNhien doan page phụ <br />\r\n0939773035<br />\r\nGiao p8<br />\r\n<br />\r\n1kg bánh tráng phơi sương 118k<br />\r\n1 hủ muối nguyễn 30k<br />\r\n2 hủ ruốc hành phi 500g 230k<br />\r\nNửa kg bánh rìa 45k'),
(120, NULL, NULL, 1, 3, '2024-06-05 03:14:02', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Giao hộ mang thít '),
(121, NULL, NULL, 3, 1, '2024-06-05 03:22:11', NULL, 1, 'Địa chỉ giao: Phường 4\nGhi chú: Đơn @All Od p3 <br />\r\n<br />\r\n0932971214<br />\r\n1sthai lớn <br />\r\nGần bv vinh long<br />\r\n'),
(122, NULL, NULL, 10, 3, '2024-06-05 04:26:41', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(123, NULL, NULL, 12, 1, '2024-06-05 04:53:40', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs ngọc ngân'),
(124, NULL, NULL, 5, 1, '2024-06-05 04:54:14', NULL, 1, 'Địa chỉ giao: Phường 1\nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\n0776541148<br />\r\n56 Trưng Nữ Vương, phường 1<br />\r\n39k ship khách trả'),
(125, NULL, NULL, 4, 1, '2024-06-05 04:54:28', NULL, 1, 'Địa chỉ giao: Phường 1\nGhi chú: Đơn @All Od p4<br />\r\n<br />\r\n 1trộn nhỏ ko rau răm <br />\r\n1sthai lớn bình thường <br />\r\nGiao 66/68 nguyen thi út p1 <br />\r\n0939245462'),
(126, NULL, NULL, 3, 1, '2024-06-05 05:06:56', NULL, 1, 'Địa chỉ giao: Phường 4\nGhi chú: Đơn @All Odp3 đem đồ ra odp4'),
(127, NULL, NULL, 3, 1, '2024-06-05 06:02:24', NULL, 1, 'Địa chỉ giao: Phường 4\r\nGhi chú: Đơn @All Hs ngọc ngân'),
(128, NULL, NULL, 12, 1, '2024-06-05 06:09:01', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs ngọc ngân'),
(129, NULL, NULL, 5, 1, '2024-06-05 06:09:20', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\n0762829704 <br />\r\nMassage tây đô đường phạm thái bường phường 4<br />\r\n113k ship khách trả'),
(130, NULL, NULL, 1, 1, '2024-06-05 06:10:57', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Shop phạm thư '),
(131, NULL, NULL, 2, 1, '2024-06-05 06:15:56', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All lẩu bò đùm p3 <br />\r\n<br />\r\n0832468768. 1cai lâu dum gan bo. Cua c 180k'),
(132, NULL, NULL, 2, 1, '2024-06-05 21:38:33', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3'),
(133, NULL, NULL, 1, 1, '2024-06-05 21:39:59', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p4 <br />\r\n<br />\r\n1/4 gà ủ muối 80k<br />\r\n1 chân gà sốt thái lớn 89k<br />\r\n1 tré trộn lớn 85k<br />\r\n1 combo chân gà vs tré trộn 95k<br />\r\n<br />\r\nnhà thuốc ngọc lan f4 ngang bênh viện đa khoa<br />\r\n<br />\r\n0707564394<br />\r\n'),
(134, NULL, NULL, 1, 2, '2024-06-05 21:40:10', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Đón khách vào nhà chị Thư <br />\r\n<br />\r\n039 9189245'),
(135, NULL, NULL, 2, 1, '2024-06-05 21:40:37', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3 <br />\r\n<br />\r\nc giao lai cty may vĩnh tiến p1 a. 0365616043. 1kg dum chinh cua c 120k. '),
(136, NULL, NULL, 1, 1, '2024-06-05 21:42:34', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Shop phạm thư'),
(137, NULL, NULL, 4, 1, '2024-06-05 21:42:40', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p4 lấy hộ<br />\r\n<br />\r\nCho shipper ra tiệm giặt ngang hương đồng biển'),
(138, NULL, NULL, 1, 2, '2024-06-05 21:42:53', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Rước khách ở 8 ri ( cây xăng 13 ) <br />\r\n<br />\r\nVề Đền thờ phạm hùng ( 70k ) '),
(139, NULL, NULL, 1, 2, '2024-06-05 21:42:59', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Rc khách ở 8 ri ( cây xăng 13 ) <br />\r\n<br />\r\nVề gần trường nguyễn trãi cũ ( 55k ) '),
(140, NULL, NULL, 10, 3, '2024-06-05 21:43:10', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(141, NULL, NULL, 2, 1, '2024-06-05 21:43:19', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lẩu bò đùm p3<br />\r\n<br />\r\n093 4567345. Tuy chien trung cua c 200k giao khu pho hoa lan. '),
(142, NULL, NULL, 1, 1, '2024-06-05 21:43:32', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ anh Khang <br />\r\n<br />\r\n- 3 hộp cơm gà phạm thái bường'),
(143, NULL, NULL, 5, 1, '2024-06-05 21:43:41', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p1 <br />\r\n<br />\r\n0907571234<br />\r\n85/1 đường 8/3 phường 5 TP Vĩnh Long <br />\r\n64k ship khách trả<br />\r\n<br />\r\nGấp'),
(144, NULL, NULL, 10, 1, '2024-06-05 21:43:48', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc '),
(145, NULL, NULL, 4, 1, '2024-06-05 21:44:01', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Odp4 gấp <br />\r\n<br />\r\nĐương tran dại nghia <br />\r\n1tré lớn ít hành phi<br />\r\n1sthai nhỏ <br />\r\n 0865731417'),
(146, NULL, NULL, 4, 1, '2024-06-05 21:44:12', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p4 <br />\r\n<br />\r\n1sthai lớn <br />\r\nGiao hẻm thắng què 2 <br />\r\n0772165136<br />\r\n<br />\r\n@Nhật Tân '),
(147, NULL, NULL, 4, 1, '2024-06-05 21:44:19', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p4 <br />\r\n<br />\r\nGiao p4 trần phú đại phát <br />\r\n1sthai nhỏ <br />\r\n1trộn nhỏ <br />\r\n1/4 gà <br />\r\n0948087869'),
(148, NULL, NULL, 1, 1, '2024-06-05 21:44:25', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\nMua cho e 2 hộp cơm thịt chien xả ở cầu phạm thái bường nha'),
(149, NULL, NULL, 1, 1, '2024-06-05 21:44:31', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ đạt ngô gia <br />\r\n<br />\r\nGiao ở nhà '),
(150, NULL, NULL, 2, 1, '2024-06-05 21:45:05', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Lẩu bò đùm p3 <br />\r\n0846647547. Cua c 200k cái lẩu me<br />\r\n<br />\r\nGiao p5 gan sạp của c ak'),
(151, NULL, NULL, 1, 2, '2024-06-05 21:45:11', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Rc anh sóc điệu'),
(152, NULL, NULL, 1, 1, '2024-06-05 21:45:18', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ Đồ nhựa mai nhứt <br />\r\n<br />\r\nMua dùm Dì 3<br />\r\n1 hộp cơm chay (để đầy đủ) - mua thêm 1 bịch canh chua <br />\r\n1 ly sinh tố mãng cầu (cổng Lưu Văn Liệt) <br />\r\nMang về Cửa hàng dùm Dì nha '),
(153, NULL, NULL, 10, 1, '2024-06-05 21:45:33', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(154, NULL, NULL, 3, 1, '2024-06-05 21:46:05', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Odp3<br />\r\n<br />\r\n1sthai cay thiệt cay lớn <br />\r\nGiao p2 cây xăng ngã 3 cần thơ <br />\r\n0907840847'),
(155, NULL, NULL, 1, 1, '2024-06-06 21:46:49', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Lấy đồ hộ ( đem theo dây gàn )<br />\r\n<br />\r\n- Chạy lên ngã tư tình'),
(156, NULL, NULL, 3, 1, '2024-06-06 21:52:11', NULL, 1, 'Địa chỉ giao: \nGhi chú: Nguyễn Lan Châu page<br />\r\n<br />\r\n0907738282 - Câu xăng mỹ lộ trường càng long (gửi xe 2 bus về càng long)<br />\r\n<br />\r\n2kg bánh trán phơi sương 190k<br />\r\n1kg sốt bò 135k<br />\r\n1kg khô đỏ 200k<br />\r\n1kg khô mực 220k<br />\r\n1kg tóp mỡ 305k<br />\r\nship 50k<br />\r\nTc: 1tr250k (đã ck đủ)<br />\r\n<br />\r\n0913959519 xíu 8h35 qua p3 lấy đơn này ra đối diện khoa mắt bv gửi như bữa nhé'),
(157, NULL, NULL, 1, 2, '2024-06-06 21:53:57', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Rc khách <br />\r\n<br />\r\nBãi xe phương bình ( cầu lộ 2 )'),
(158, NULL, NULL, 1, 1, '2024-06-06 21:54:09', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn ưu tiên @All Mua hộ chị Diêng<br />\r\n<br />\r\nNói shiper mua dum c 1tô bánh canh ko rau. Đem lại p4 liền nhe e<br />\r\n<br />\r\nGấp'),
(159, NULL, NULL, 10, 1, '2024-06-06 21:54:17', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc '),
(160, NULL, NULL, 25, 1, '2024-06-06 23:34:54', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Súp trần gia <br />\r\n<br />\r\nGiao chợ cua ( 23k ) '),
(161, NULL, NULL, 10, 3, '2024-06-06 23:40:06', NULL, 1, 'Địa chỉ giao: \nGhi chú: - 4 đơn <br />\r\n<br />\r\n( 2 shipper giao ) , mỗi shipper 2 đơn'),
(162, NULL, NULL, 1, 3, '2024-06-06 00:30:58', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Lộc phát 68 kế bên chị Muội <br />\r\n<br />\r\nGiao đồ'),
(163, NULL, NULL, 6, 3, '2024-06-06 00:39:12', NULL, 1, 'Địa chỉ giao: khác\r\nGhi chú: Đơn @All Ngô gia p2 \r\n\r\n- Dạ em ở Công ty Nông sản Thực Phẩm Tiền Giang á chị\r\n- 0384376769\r\nShip 38k\r\n'),
(164, NULL, NULL, 1, 3, '2024-06-06 00:39:13', NULL, 1, 'Địa chỉ giao: khác\r\nGhi chú: - Dạ em ở Công ty Nông sản Thực Phẩm Tiền Giang á chị<br />\r\n- 0384376769'),
(165, NULL, NULL, 7, 0, '2024-06-06 01:46:48', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: @All Ngô gia p3'),
(166, NULL, NULL, 5, 0, '2024-06-06 01:47:38', NULL, 1, 'Địa chỉ giao: \r\n\r\nGhi chú: Đơn @All Ngô gia p1 \r\n\r\n0373717778\r\nCầu bùng binh\r\n54k ship khách trả'),
(167, NULL, NULL, 1, 1, '2024-06-06 13:36:01', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\nAnh ơi mua dùm em nước ép Su Su đối diện trường khuyết tật nhaaa<br />\r\n1 ép dưa hấu lớn<br />\r\n1 ép xoài lớn<br />\r\n1 ép dưa lưới lớn<br />\r\n1 ép nho lớn ngọt<br />\r\n1 ép nho lớn ít đường '),
(168, NULL, NULL, 10, 3, '2024-06-06 13:36:17', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(169, NULL, NULL, 3, 1, '2024-06-06 13:37:28', NULL, 1, 'Địa chỉ giao: \nGhi chú:  cho shipper ra chợ mua dùm em 10k đậu bắp với nửa bó đậu đũa nha'),
(170, NULL, NULL, 4, 1, '2024-06-06 15:07:42', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p4<br />\r\n<br />\r\n1sthai nhỏ <br />\r\n1tré nhỏ <br />\r\n1trộn nhỏ <br />\r\nGiao bv vĩnh long <br />\r\n1tra sua nhỏ <br />\r\n093 8710498'),
(171, NULL, NULL, 1, 1, '2024-06-06 15:07:54', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\n- 1 trà sữa tapi ( full topping ) <br />\r\n- 1 nước cam '),
(172, NULL, NULL, 3, 1, '2024-06-06 15:08:04', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ odp3 <br />\r\n<br />\r\nMua dùm c 2họp cơm sườn nhe e<br />\r\n'),
(173, NULL, NULL, 3, 1, '2024-06-06 15:08:14', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p3'),
(174, NULL, NULL, 10, 1, '2024-06-06 15:08:24', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc '),
(175, NULL, NULL, 8, 1, '2024-06-06 15:08:40', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All 9 sạch <br />\r\n<br />\r\n093 9074647<br />\r\nThu 171 shop trả ship<br />\r\n<br />\r\nPhí 26k '),
(176, NULL, NULL, 1, 1, '2024-06-06 15:09:03', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\n087 8020404 gọi hỏi khách'),
(177, NULL, NULL, 1, 1, '2024-06-06 15:09:11', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\nmua hộ 0584153020'),
(178, NULL, NULL, 13, 1, '2024-06-06 15:09:23', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Mua hộ sóc địu \r\n2 bịt bún riêu\r\nAnh đào\r\nF2 ship vô nhà giùm'),
(179, NULL, NULL, 4, 1, '2024-06-06 15:11:40', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Od p4<br />\r\n<br />\r\n2p thập cẩm 3 món nhỏ 170k (đổi tré thành cuộn)<br />\r\n2 ly đào lớn 50k<br />\r\n1p bánh tráng chấm nhỏ 25k<br />\r\nTc: 245k +ship<br />\r\n<br />\r\nGiao  p2 gần cầu tân hữu cũ<br />\r\nNgay thạch cao miền tây<br />\r\n0907957867'),
(180, NULL, NULL, 1, 5, '2024-06-06 16:14:40', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Giao hộ <br />\r\n<br />\r\nBến xe p8 ( gấp )'),
(181, NULL, NULL, 6, 5, '2024-06-06 16:14:58', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Ngô gia p2 '),
(182, NULL, NULL, 10, 5, '2024-06-06 16:16:04', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Hs thiên phúc'),
(183, NULL, NULL, 3, 5, '2024-06-06 16:16:24', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All Od p3 mua <br />\r\n<br />\r\n- 1kg ổi hồng ( ở chợ )'),
(184, NULL, NULL, 12, 5, '2024-06-06 16:16:47', NULL, 1, 'Địa chỉ giao: \nGhi chú: Đơn @All 10ph nữa ( Hs ngọc ngân )'),
(185, NULL, NULL, 3, 5, '2024-06-06 16:17:04', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Od p3 <br />\r\n<br />\r\n1/2 con gà <br />\r\n093 9383246<br />\r\nGiao cầu cái sơn bé '),
(186, NULL, NULL, NULL, 1, '2024-06-06 11:00:00', NULL, 1, 'Đơn @All Hs 141'),
(187, NULL, NULL, NULL, 1, '2024-06-06 15:00:00', NULL, 1, 'Đơn @All Ngô gia p3 \r\n\r\n0775651359\r\nĐịa chỉ ở gần vòng xoay cầu đôi kế bên đồ gỗ Phi Hùng có đường quẹo vô kho Thiên Phú Hưng ạ\r\nShip quán trả ạ'),
(188, NULL, NULL, NULL, 1, '2024-06-06 13:00:00', NULL, 1, 'Đơn @All Odp3 '),
(189, NULL, NULL, NULL, 1, '2024-06-06 16:00:00', NULL, 1, 'Đơn @All Od p3 \r\n\r\nChi cục hải quan, gần đhxdmt (chỗ hủ tíu gõ)\r\n0707155255\r\n\r\n1 con gà ủ muối chặt chia làm 2 hộp nửa con 290k\r\n1 chân gà ủ muối nhỏ 90k'),
(190, NULL, NULL, NULL, 1, '2024-06-06 15:00:00', NULL, 1, 'Đơn @All Od p3 \r\n\r\nBv xuyên á \r\n1tré nhỏ \r\n1sthai nhỏ \r\n1sthai lớn \r\n1ly ổi nhỏ \r\n1tsua nhỏ \r\n090 7496391'),
(191, NULL, NULL, 10, 1, '2024-06-06 19:00:00', NULL, 1, 'Đơn @All Hs thiên phúc gấp'),
(192, NULL, NULL, 2, 1, '2024-06-06 19:00:00', NULL, 1, 'Đơn ưu tiên @All Lẩu bò đùm p3 \r\n\r\n034 5356821. Cai lau 200k mâu thân 1'),
(193, NULL, NULL, NULL, 1, '2024-06-06 19:00:00', NULL, 1, 'Đơn @All Odp3\r\n\r\n1sthai lớn \r\nCv đat khánh tây\r\n093 6777464'),
(194, NULL, NULL, NULL, 1, '2024-06-06 17:00:00', NULL, 1, 'Đơn @All Ly store '),
(195, NULL, NULL, NULL, 1, '2024-06-06 20:00:00', NULL, 1, 'Đơn @All Hs thiên phúc'),
(196, NULL, NULL, 10, 1, '2024-06-06 18:00:00', NULL, 1, 'Đơn @All Hs thiên phúc'),
(197, NULL, NULL, NULL, 1, '2024-06-06 17:00:00', NULL, 1, 'Đơn @All Hs 141 '),
(198, NULL, NULL, NULL, 1, '2024-06-06 17:00:00', NULL, 1, 'Hủ tiếu mì khô Nhi\r\nKhông trụng hủ tiếu\r\nMì sợi lớn\r\nLấy sate\r\nXương mỡ'),
(199, NULL, NULL, NULL, 1, '2024-06-06 19:00:00', NULL, 1, 'Đơn @All Ngô gia p1 \r\n\r\n85/1 đường 8-3 F.5\r\n0909571234\r\n64k ship khách trả'),
(200, NULL, NULL, NULL, 1, '2024-06-06 18:00:00', NULL, 1, 'Đơn @All Mua hộ Đạt ngô gia \r\n\r\n- Khách yêu cầu @Trương Thành '),
(201, NULL, NULL, NULL, 1, '2024-06-06 18:00:00', NULL, 1, 'Đơn @All Od p3\r\n\r\n089 8122694\r\n1 con gà chặt \r\nGiao p9 đường d8 \r\n\r\nPhí 22k '),
(202, NULL, NULL, NULL, 1, '2024-06-06 17:00:00', NULL, 1, 'Đơn @All Od p3\r\n\r\n 1 tré 85k \r\nPhở sài gòn. \r\n038 2456447'),
(203, NULL, NULL, 2, 1, '2024-06-06 18:00:00', NULL, 1, 'Đơn ưu tiên @All Lẩu bò đùm p3\r\n\r\n097 9989164. Phan long đen 150k cua c. Giao len câu kho vong xoay câu đôi'),
(204, NULL, NULL, NULL, 1, '2024-06-06 20:00:00', NULL, 1, 'Đơn @All Mua hộ \r\n\r\n- Cường lực \r\n• 12promax\r\n• 13promax \r\n• 15plus\r\n\r\n( ở đèn xanh đỏ tượng đài mậu thân )\r\n\r\nGiao qua hdb2 ( phòng vip 17 )'),
(205, NULL, NULL, 7, 1, '2024-06-06 18:00:00', NULL, 1, 'Đơn @All Ngô gia p3 '),
(206, NULL, NULL, 1, 1, '2024-06-07 06:15:00', NULL, 1, 'Đơn @All Sáng mai 6h15 , Rước nhi lâm trong hẻm 6 dân'),
(207, NULL, NULL, 11, 1, '2024-06-06 22:26:06', NULL, 1, 'Đơn @All Hs 141\r\n\r\n8h40'),
(208, NULL, NULL, 1, 1, '2024-06-07 09:40:23', NULL, 1, 'Địa chỉ giao: \r\nGhi chú: Đơn @All Mua hộ chị Diêng <br />\r\n<br />\r\n- 3 ổ bánh mỳ ở highland ( 3 ổ gì cũng được )'),
(209, NULL, NULL, 5, 1, '2024-06-07 09:42:43', NULL, 1, 'Hình thức:Mua hộ\r\nGhi chú: Đơn @All NG p1<br />\r\n<br />\r\nHướng đường của cf Paris 1987 as<br />\r\n 0774078464<br />\r\nShip quán trả'),
(210, NULL, NULL, 1, 2, '2024-06-07 10:13:28', NULL, 1, 'Hình thức:Mua hộ\nGhi chú: Đơn @All Mua hộ má <br />\r\n<br />\r\n- 1 bịch phở tái gân ( mua chỗ nào vừa tiền thui nha )'),
(211, NULL, NULL, 25, 2, '2024-06-07 10:50:33', NULL, 1, 'Hình thức:Mua hộ\nGhi chú: Đơn @All Súp trần gia <br />\r\n<br />\r\nGiao bệnh viện ( 21k )'),
(212, NULL, NULL, 1, 6, '2024-06-07 11:33:20', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: p3 -&gt; p4'),
(213, NULL, NULL, 1, 3, '2024-06-07 11:35:11', NULL, 1, 'Hình thức: Rước khách\nGhi chú: Đơn @All Rc khách ở pibo kế bên con cưng <br />\r\n<br />\r\nChỗ bán sữa'),
(214, NULL, NULL, 7, 2, '2024-06-07 13:38:31', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Ngô gia p3 '),
(215, NULL, NULL, 1, 2, '2024-06-07 13:38:46', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\nKhách yêu cầu ( thành trương ) '),
(216, NULL, NULL, 2, 4, '2024-06-07 13:39:34', NULL, 1, 'Hình thức: Giao Hàng\nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3 <br />\r\n<br />\r\n0971737939. Trong chợ vượt lũ A12. Cua c 180k. '),
(217, NULL, NULL, 1, 2, '2024-06-07 13:40:16', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Mua hộ khánh duy <br />\r\n<br />\r\n@Trương Thành  khách yêu cầu'),
(218, NULL, NULL, 7, 4, '2024-06-07 13:45:32', NULL, 1, 'Hình thức: Giao Hàng\nGhi chú: Đơn @All Ngô gia p3 '),
(219, NULL, NULL, 2, 6, '2024-06-07 13:46:53', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3 <br />\r\n<br />\r\n0971737939. Trong chợ vượt lũ A12. Cua c 180k. '),
(220, NULL, NULL, 2, 6, '2024-06-07 13:46:53', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn ưu tiên @All lẩu bò đùm p3 <br />\r\n<br />\r\n0971737939. Trong chợ vượt lũ A12. Cua c 180k. '),
(221, NULL, NULL, 5, 6, '2024-06-07 13:51:55', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Ngô gia p1<br />\r\n<br />\r\n0961377493<br />\r\ntiên cua 3 p3<br />\r\n95k ship quán trả'),
(222, NULL, NULL, 1, 6, '2024-06-07 14:19:08', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Qua tài xeko giao hộ'),
(223, NULL, NULL, 6, 0, '2024-06-07 14:22:46', NULL, 1, 'Hình thức: \nGhi chú: Đơn @All Ngô gia p2'),
(224, NULL, NULL, 1, 6, '2024-06-07 14:23:04', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Giao hộ meo meo <br />\r\n<br />\r\nE chạy wa chợ p8 gặp chi8  bán cá lấy 1 con ca chẽm, với 1ky cá lồng tông đem xuống nhà trọ Tuấn Nga p1 đối diện trường khuyết tật hẻm 15 chay vô ngã 4 vẹo phải chạy cuối đường nhìn bên tay phải thấy ah nhà cửa vàng '),
(225, NULL, NULL, 10, 6, '2024-06-07 14:25:14', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Hs thiên phúc'),
(226, NULL, NULL, 1, 2, '2024-06-07 14:45:10', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Mua hộ<br />\r\n<br />\r\n@GOSP4 - Nhuwtj '),
(227, NULL, NULL, 1, 2, '2024-06-07 14:56:29', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Mua hộ <br />\r\n<br />\r\n- 3 phần hủ tiếu mực <br />\r\n<br />\r\n( 3 phần đều kh chụng hủ tiếu , 1 phần để mực không )<br />\r\n<br />\r\nGiao thế giới di động p8 <br />\r\n<br />\r\n093 8307355'),
(228, NULL, NULL, 1, 6, '2024-06-07 15:27:26', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Shop phạm thư <br />\r\n<br />\r\n- lấy đồ ở shop đem về nhà cho chị thư <br />\r\n<br />\r\n( lấy ship với nói cho em thu 12k còn thiếu ) '),
(229, NULL, NULL, 4, 6, '2024-06-07 15:28:16', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn @All Odp4 <br />\r\n<br />\r\n094 7763456<br />\r\n1/4 gà <br />\r\nGiao hẻm ông phu <br />\r\nP4 nhận '),
(230, NULL, NULL, 1, 2, '2024-06-07 15:28:46', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn @All Mua hộ cho má <br />\r\n<br />\r\n@Trương Thành '),
(231, NULL, NULL, 6, 4, '2024-06-07 15:34:07', NULL, 1, 'Hình thức: Giao Hàng\nGhi chú: Đơn @All Ngô gia p2 <br />\n<br />\nE qua p1 chở 2bao trà qua p2 dùm c'),
(232, NULL, NULL, 2, 2, '2024-06-07 13:08:03', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All lẩu bò đùm p3<br />\r\n<br />\r\nEm ở công viên p9 á. Hẻm đổi diện. Dạ c giao lên p9 giùm em nha. Địa chỉ 259/96 Phạm Hùng. Hẻm nhà trọ 79 đối diện công viên p9 á c. Em chỉ đường luôn nè. Tại em hông có nhà. Chạy hông đc thì gọi em. Sdt em 0945689489.<br />\r\n<br />\r\nKhách ck tính ship với chị Muội'),
(233, NULL, NULL, 1, 2, '2024-06-07 13:08:44', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\r\n<br />\r\ncho em ord 1 pizza xúc xích <br />\r\n1 bánh gấu dấu<br />\r\n1 mousse bắp<br />\r\n1 bánh phô mai hoàng kim mua bên gia hỷ ah<br />\r\n48a đường trần văn ơn p1 <br />\r\nxéo cơm chay âu lạc<br />\r\n0931105598'),
(234, NULL, NULL, 1, 6, '2024-06-07 13:09:39', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn All Giao hộ <br />\r\n<br />\r\nqua cháo cá miền tây bên đường phó cơ điều lấy đồ đem qua hđb 2'),
(235, NULL, NULL, 2, 0, '2024-06-07 13:09:55', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Lẩu bò đùm p3<br />\r\n<br />\r\nGiao dùm e tmv Aura. Khu vincom xéo đài trường hinh. 0938318116. Cua c 300k'),
(236, NULL, NULL, 2, 0, '2024-06-07 13:10:09', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Lẩu bò đùm p3<br />\r\n<br />\r\n0856363393. Cua c 360k'),
(237, NULL, NULL, 3, 0, '2024-06-07 13:10:20', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Od p3<br />\r\n<br />\r\n1combo 2món <br />\r\n0764834838<br />\r\nP1<br />\r\n'),
(238, NULL, NULL, 5, 0, '2024-06-07 13:10:30', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p1<br />\r\n<br />\r\nSdt : 0853810538<br />\r\nĐịa chỉ: Cửa hàng Tosiko số 68/1, Phạm Thái Bường , phường 4 , Thành Phố Vĩnh Long<br />\r\nShip quán trả'),
(239, NULL, NULL, 1, 2, '2024-06-07 13:10:44', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ ( 18h40 ) <br />\r\n<br />\r\n- 4 phần má heo nướng ( đối diện trường xây dựng miền tây ) <br />\r\n<br />\r\nGiao lại đối diện sân banh trọng hiệp ( chỗ có 2 pháo đài ) '),
(240, NULL, NULL, 1, 2, '2024-06-07 13:10:54', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\r\n<br />\r\n- 200k ( phá lấu xá xíu ở cơm giàu ) <br />\r\n- 5 ổ bánh mỳ đắc khánh tây<br />\r\n- 10 chiếc bì ở tấn phát đối diện vinaphone'),
(241, NULL, NULL, 1, 2, '2024-06-07 13:11:01', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\r\n<br />\r\n- Ếch chiên nước mắm sò huyết rang muối 10 Tiger ( quán cồn chim ) <br />\r\n'),
(242, NULL, NULL, 25, 0, '2024-06-07 13:11:13', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Súp trần gia <br />\r\n<br />\r\nGiao xuống ẩm thực phố <br />\r\n<br />\r\n( phí 18k ) '),
(243, NULL, NULL, 1, 2, '2024-06-07 13:11:22', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\r\n<br />\r\n- 2 trứng vịt lộn , 1 ly trà sữa truyền thống ( kh để trân châu đen )<br />\r\n<br />\r\n( giao hdb2 )'),
(244, NULL, NULL, 8, 0, '2024-06-07 13:11:34', NULL, 1, 'Hình thức: \nGhi chú: Đơn All 9 sạch <br />\r\n<br />\r\n0796977773<br />\r\n15p nữa khách nhận <br />\r\nthu 240 shop trả ship<br />\r\n<br />\r\nĐơn gấp'),
(245, NULL, NULL, 1, 1, '2024-06-07 13:11:51', NULL, 1, 'Hình thức: Chưa xếp loại\nGhi chú: Đơn All Lấy hộ đồ cho má'),
(246, NULL, NULL, 2, 0, '2024-06-07 13:12:00', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Lẩu bò đùm <br />\r\n<br />\r\nCuối hẻm 184 ngang CTY dược p5. 0798013633. Cua c 80k'),
(247, NULL, NULL, 5, 0, '2024-06-07 13:12:32', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p1 lấy hộ <br />\r\n<br />\r\nCho bên e một anh qua ngô gia p3 chở trà về p1'),
(248, NULL, NULL, 5, 0, '2024-06-07 13:12:41', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p1<br />\r\n<br />\r\n091 3520364<br />\r\nHẻm144 đường 14/9 p5<br />\r\n52k ship khách trả'),
(249, NULL, NULL, 1, 3, '2024-06-07 13:12:50', NULL, 1, 'Hình thức: Rước khách\nGhi chú: Đơn All Rc Nhi lâm ( ở nhà )'),
(250, NULL, NULL, 13, 0, '2024-06-07 13:13:08', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Sóc địu'),
(251, NULL, NULL, 1, 2, '2024-06-07 13:13:15', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\r\n<br />\r\n- 100k đồ chiên ( đâu cũng đc , ngon là đc )'),
(252, NULL, NULL, 1, 2, '2024-06-07 13:13:25', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ sóc điệu '),
(253, NULL, NULL, 3, 0, '2024-06-07 13:13:40', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Odp3<br />\r\n<br />\r\n093 9084587 <br />\r\n1 sthai nhỏ <br />\r\n1 ủ sương 35k '),
(254, NULL, NULL, 7, 0, '2024-06-07 13:13:50', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p3<br />\r\n<br />\r\n0706567708<br />\r\nGiao tại quán nhậu chèo bẻo phong 1<br />\r\n<br />\r\nShip khách trả'),
(255, NULL, NULL, 4, 0, '2024-06-07 13:14:06', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Od p4<br />\r\n<br />\r\n1sthai lớn <br />\r\nGiao tran dai nghĩa <br />\r\n079 8268468'),
(256, NULL, NULL, 1, 3, '2024-06-07 00:00:00', NULL, 1, 'Hình thức: Rước khách\nGhi chú: Đơn All Rc khách + đưa xe khách về <br />\r\n<br />\r\nĐơn cuối'),
(257, NULL, NULL, 1, 1, '2024-06-07 13:14:33', NULL, 1, 'Hình thức: Chưa xếp loại\nGhi chú: Quán ngọc ngân ( 091 8237977 )'),
(258, NULL, NULL, 1, 2, '2024-06-08 13:14:46', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ <br />\n<br />\n- GOSP4 - Nhuwtj '),
(259, NULL, NULL, 2, 0, '2024-06-08 13:15:03', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Lẩu bò đùm p3<br />\r\n<br />\r\n035 8709812. Qua p3 lay dum c. 300k '),
(260, NULL, NULL, 1, 6, '2024-06-08 13:15:14', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn All Giao hộ meo meo <br />\r\n<br />\r\n- lên chợ p8 <br />\r\n( gặp chị thu bán chả cá nói lấy đồ giao) <br />\r\n'),
(261, NULL, NULL, 6, 0, '2024-06-08 13:15:21', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p2'),
(262, NULL, NULL, 1, 2, '2024-06-08 13:15:33', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ má<br />\r\n<br />\r\n- 1 ổ bánh mỳ quang râu ( ổ nhỏ 15k )<br />\r\n<br />\r\nGiao tiệm nail xuân thuỳ , kế đức phát'),
(263, NULL, NULL, 1, 2, '2024-06-08 13:15:41', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ chị Diêng <br />\r\n<br />\r\n- 1 tô bánh canh , 1 tô hủ tiếu mang về<br />\r\n<br />\r\nGiao odp3 '),
(264, NULL, NULL, 1, 6, '2024-06-08 13:15:56', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn All Giao hộ cô Nhi '),
(265, NULL, NULL, 4, 0, '2024-06-08 13:16:24', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Od p4<br />\r\n<br />\r\n086 6492939<br />\r\n1sthai lơn <br />\r\nBv tỉnh'),
(266, NULL, NULL, 10, 0, '2024-06-08 13:16:40', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Hs thiên phúc'),
(267, NULL, NULL, 10, 0, '2024-06-08 13:16:54', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Hs thiên phúc'),
(268, NULL, NULL, 3, 0, '2024-06-08 13:17:05', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Odp3 ( mua hộ ) <br />\r\n<br />\r\n- 2 ly caffe sữa ở Chú Long , ly lớn'),
(269, NULL, NULL, 5, 0, '2024-06-08 13:17:15', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p1<br />\r\n<br />\r\n0772101003<br />\r\n117k ship khách trra'),
(270, NULL, NULL, 6, 0, '2024-06-08 13:17:27', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p2<br />\r\n<br />\r\nPhí ship 10k'),
(271, NULL, NULL, 3, 0, '2024-06-08 13:17:34', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Mua hộ odp3'),
(272, NULL, NULL, 1, 0, '2024-06-08 13:17:46', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Xuống nhà thuốc Khải hoàn gặp chị Diêng'),
(273, NULL, NULL, 1, 2, '2024-06-08 13:17:52', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ<br />\r\n<br />\r\nAnh ơi mua dùm em ở nước ép Bé Xíu<br />\r\n4 ly mía lau lớn<br />\r\n2 ly trà tắc thái xanh lớn'),
(274, NULL, NULL, 8, 0, '2024-06-08 13:18:03', NULL, 1, 'Hình thức: \nGhi chú: Đơn All 9 sạch '),
(275, NULL, NULL, 1, 2, '2024-06-08 13:18:14', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ cô ba yến<br />\r\n<br />\r\n- 1 hộp dâu xoay sinh tố '),
(276, NULL, NULL, 3, 0, '2024-06-08 13:18:22', NULL, 1, 'Hình thức: \nGhi chú: Đơn All 2 bạn qua đi qua bên odp3 <br />\r\n<br />\r\nĐem xe đạp điện đi sửa :)))'),
(277, NULL, NULL, 8, 0, '2024-06-08 13:18:52', NULL, 1, 'Hình thức: \nGhi chú: Đơn All 9 sạch'),
(278, NULL, NULL, 3, 0, '2024-06-08 13:19:05', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Od p3 <br />\r\n<br />\r\n1 chai sốt thái nhỏ 75k<br />\r\nTặng 1 bịt muối trộn<br />\r\n<br />\r\n43/12h đường bờ kinh phuong 3 thanh pho vinh long tinh vl<br />\r\n0337778896'),
(279, NULL, NULL, 1, 2, '2024-06-08 14:24:39', NULL, 1, 'Hình thức: Mua hộ\nGhi chú: Đơn All Mua hộ 9 sạch <br />\r\n<br />\r\n2h mua bún bì thịt nướng chỗ kế cửa hàng xe thành đạt p2 dùm anh nha ( 2 hộp ) '),
(280, NULL, NULL, 1, 6, '2024-06-08 14:36:08', NULL, 1, 'Hình thức: Giao Hộ\nGhi chú: Đơn All Giao bánh cuốn của chin Hân '),
(281, NULL, NULL, 5, 0, '2024-06-08 14:48:58', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Ngô gia p1<br />\r\n<br />\r\n94/7, quốc lộ 57, Thanh đức, long hồ, vĩnh long<br />\r\n170k ship quán trả<br />\r\n0963290977'),
(282, NULL, NULL, 4, 0, '2024-06-08 14:49:12', NULL, 1, 'Hình thức: \nGhi chú: Đơn All Od p4 <br />\r\n<br />\r\n1combo 2 món <br />\r\n1trộn nhỏ <br />\r\n3thái xanh nhỏ đá chung <br />\r\nCầu cái cam 2<br />\r\n0363732299<br />\r\nChị lý <br />\r\n<br />\r\n'),
(283, NULL, NULL, 8, 1, '2024-06-08 15:16:48', NULL, 1, 'Hình thức: Chưa xếp loại\nGhi chú: Đơn All 9 sạch ');

--
-- Bẫy `orders`
--
DELIMITER $$
CREATE TRIGGER `after_order_insert` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    -- Giả sử rằng `ShipmentCode` có thể được sinh tự động hoặc đặt một giá trị mặc định
    -- và `ShipperID` có thể là NULL hoặc một giá trị cụ thể nào đó
    INSERT INTO shipments (
        ShipmentCode, 
        OrderID, 
        ShipperID, 
        ShipmentDate, 
        Total, 
        Note
    ) VALUES (
        NEW.OrderCode, -- Giả sử ShipmentCode và OrderCode là tương tự nhau
        NEW.OrderID, 
        NULL, -- Hoặc bạn có thể thay đổi giá trị này tùy vào logic nghiệp vụ của bạn
        NULL, -- Ngày gửi hàng có thể được đặt sau
        NEW.Total, 
        'Được tạo tự động từ trigger'
    );
END
$$
DELIMITER ;

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
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`ServiceID`, `ServiceName`) VALUES
(1, 'Chưa xếp loại'),
(2, 'Mua hộ'),
(3, 'Rước khách'),
(4, 'Giao Hàng'),
(5, 'Nhận hộ'),
(6, 'Giao Hộ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipments`
--

CREATE TABLE `shipments` (
  `ShipmentID` int(11) NOT NULL,
  `ShipmentCode` varchar(8) DEFAULT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ShipperID` int(11) DEFAULT NULL,
  `ShipmentDate` datetime DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shipments`
--

INSERT INTO `shipments` (`ShipmentID`, `ShipmentCode`, `OrderID`, `ShipperID`, `ShipmentDate`, `Total`, `Note`) VALUES
(1, 'CS1', 1, 5, '2024-06-04 03:18:40', '15000.00', NULL),
(2, 'SC2', 2, 4, '2024-06-04 03:34:01', '0.00', NULL),
(44, NULL, 279, 9, NULL, NULL, 'Được tạo tự động từ trigger'),
(45, NULL, 280, 9, NULL, NULL, 'Được tạo tự động từ trigger'),
(46, NULL, 281, 9, NULL, NULL, 'Được tạo tự động từ trigger'),
(47, NULL, 282, 9, NULL, NULL, 'Được tạo tự động từ trigger'),
(48, NULL, 283, 1, NULL, NULL, 'Được tạo tự động từ trigger');

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
  `shipper_pwd` varchar(20) NOT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shippers`
--

INSERT INTO `shippers` (`ShipperID`, `ShipperCode`, `Name`, `Address`, `Phone`, `shipper_pwd`, `Note`) VALUES
(1, 'SP1', 'Trung Nghĩa', '', '0706337701', '123456', NULL),
(2, 'SP2', 'Thành', '', '', '0', NULL),
(3, 'SP3', 'Ken', '', '', '0', NULL),
(4, 'SP4', 'Nhựt', '', '', '0', NULL),
(5, 'SP5', 'Vũ', '', '', '0', NULL),
(6, 'SP6', 'Khang', '', '', '0', NULL),
(7, 'SP7', 'Tân', '', '', '0', NULL),
(8, 'SP8', 'Huy', '', '', '0', NULL),
(9, 'SP9', 'Nguyễn Hữu Thọ', '', '0355733881', '123456', NULL),
(10, 'SP10', 'Hồ Minh Trí', '', '', '0', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `stores`
--

CREATE TABLE `stores` (
  `StoreID` int(11) NOT NULL,
  `ServiceID` int(11) DEFAULT NULL,
  `StoreCode` varchar(255) DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Address_google` text DEFAULT NULL,
  `Location_NONE` tinyint(1) DEFAULT NULL,
  `Address_google_NONE` text DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `status_active` tinyint(1) DEFAULT NULL,
  `date_active` date DEFAULT NULL,
  `Note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `stores`
--

INSERT INTO `stores` (`StoreID`, `ServiceID`, `StoreCode`, `Name`, `Address`, `Address_google`, `Location_NONE`, `Address_google_NONE`, `Phone`, `status_active`, `date_active`, `Note`) VALUES
(1, NULL, 'GO', 'GoDelivery', 'Phường 3', '', NULL, '', '', NULL, NULL, NULL),
(2, NULL, 'LẨU BÒ DÙM', 'Lẩu bò đùm', 'Phường 3', 'https://www.google.com/maps/place/L%E1%BA%A9u+b%C3%B2+%C4%91%C3%B9m+Hu%E1%BB%B3nh+Mu%E1%BB%99i,+241t+Nguy%E1%BB%85n+V%C4%83n+Thi%E1%BB%87t,+Khom+2,+V%C4%A9nh+Long/@0,0,22z/data=!4m2!3m1!1s0x310a9d0070820c55:0x94a766d7655baf96', NULL, '', '', NULL, NULL, NULL),
(3, NULL, 'ODUYEN', 'Cô Diêng - P3', 'Phường 3', 'https://www.google.com/maps/place/%C4%82n+v%E1%BA%B7t+%C6%A0+Duy%C3%AAn+Store,+133+Tr%E1%BA%A7n+Ph%C3%BA,+Ph%C6%B0%E1%BB%9Dng+4,+V%C4%A9nh+Long,+Vi%E1%BB%87t+Nam/@10.2368132,105.9772556,16z/data=!4m6!3m5!1s0x310a9de1acb1a985:0x1512ecc31a4d4c4e!8m2!3d10.2368132!4d105.9772556!16s%2Fg%2F11kj0z2vb4', NULL, '', '', NULL, NULL, 'Cùng quán tên \'Cô Duyên\', sau này sử dụng tên \'Cô Duyên\''),
(4, NULL, 'CODUYEN', 'Cô Diêng - P4', 'Phường 4', 'https://www.google.com/maps/place/%C4%82n+v%E1%BA%B7t+C%C3%B4+Duy%C3%AAn/@10.2418708,105.9773009,816m/data=!3m2!1e3!4b1!4m12!1m5!8m4!1e2!2s103974374818445536893!3m1!1e1!3m5!1s0x310a9d0007b7c38f:0xdaf6a0ef9484b4f1!8m2!3d10.2418655!4d105.9798758!16s%2Fg%2F11w3c547rw?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(5, NULL, 'NGOGIA1', 'Ngô Gia - P1', 'Phường 1', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia/@10.2539329,105.9737373,816m/data=!3m1!1e3!4m16!1m9!3m8!1s0x310a9d2f7fc5026b:0x93368e526b826cca!2zSOG7k25nIFRyw6AgTmfDtCBHaWE!8m2!3d10.2539276!4d105.9763122!9m1!1b1!16s%2Fg%2F11kj42nbgt!3m5!1s0x310a9d2f7fc5026b:0x93368e526b826cca!8m2!3d10.2539276!4d105.9763122!16s%2Fg%2F11kj42nbgt?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(6, NULL, 'NGOGIA2', 'Ngô Gia - P2', 'Phường 2', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia+Nguy%E1%BB%85n+Hu%E1%BB%87+-+H174/@10.2535502,105.9624629,144m/data=!3m1!1e3!4m6!3m5!1s0x310a839c6f1894d7:0x830c98d966cd144d!8m2!3d10.2536918!4d105.9628987!16s%2Fg%2F11kpn1f9r1?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(7, NULL, 'NGOGIA3', 'Ngô Gia - P3', 'Phường 3', 'https://www.google.com/maps/place/H%E1%BB%93ng+Tr%C3%A0+Ng%C3%B4+Gia+H270/@10.2358841,105.9632853,204m/data=!3m1!1e3!4m6!3m5!1s0x310a83001a672985:0x6332a8b519c18e00!8m2!3d10.2358842!4d105.9640142!16s%2Fg%2F11vr9fjxzh?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(8, NULL, '9SACH', '9 Sạch', 'Phường 2', 'https://www.google.com/maps/place/10%C2%B015\'16.2%22N+105%C2%B057\'57.2%22E/@10.2544107,105.965714,51m/data=!3m1!1e3!4m10!1m5!8m4!1e2!2s103974374818445536893!3m1!1e1!3m3!8m2!3d10.254494!4d105.965886?entry=ttu', 1, 'https://www.google.com/maps/place/10%C2%B015\'16.3%22N+105%C2%B057\'57.3%22E/@10.2545333,105.9652693,204m/data=!3m2!1e3!4b1!4m4!3m3!8m2!3d10.254532!4d105.965913?entry=ttu', '', NULL, NULL, 'Cầu cái cá, hướng về phường 1, nhìn tay phải, kế bên '),
(9, NULL, 'HSQUANGNGUYEN', 'Hải sản Quang Nguyễn', 'Phường 4', 'https://www.google.com/maps/place/H%E1%BA%A3i+s%E1%BA%A3n+Quang+Nguy%E1%BB%85n/@10.2346518,105.9879986,243m/data=!3m1!1e3!4m6!3m5!1s0x310a9d891007edc3:0x4efeb5f31365cda0!8m2!3d10.2346145!4d105.98936!16s%2Fg%2F11plj67wy3?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(10, NULL, 'HSTHIENPHUC', 'Hải sản Thiên Phúc', 'Phường 4', 'https://www.google.com/maps/place/H%E1%BA%A3i+s%E1%BA%A3n+Thi%C3%AAn+Ph%C3%BAc,+34+2,+Ph%C6%B0%E1%BB%9Dng+4,+Long+H%E1%BB%93,+V%C4%A9nh+Long/@0,0,22z/data=!4m2!3m1!1s0x310a9d0059c03b11:0x1aa9507780800d79', 1, 'https://www.google.com/maps/place/10%C2%B014\'08.7%22N+105%C2%B059\'24.8%22E/@10.2357152,105.9900183,61m/data=!3m1!1e3!4m4!3m3!8m2!3d10.235749!4d105.990234?entry=ttu', '0917723771', NULL, NULL, 'Gần cầu Chợ Cua'),
(11, NULL, 'HS141', 'Hải sản 141', 'Phường 8', 'https://www.google.com/maps/place/H%E1%BA%A3i+S%E1%BA%A3n+T%C6%B0%C6%A1i+S%E1%BB%91ng+141/@10.2303889,105.9517823,102m/data=!3m1!1e3!4m6!3m5!1s0x310a82bcab2ee2af:0x5415e0b6b7389ad8!8m2!3d10.2303815!4d105.9521472!16s%2Fg%2F11vzrw1p6m?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(12, NULL, 'HSNGOCNGAN', 'Hải sản Ngọc Ngân', 'Phường 3', 'https://www.google.com/maps/place/Qu%C3%A1n+H%E1%BA%A3i+S%E1%BA%A3n+Ng%E1%BB%8Dc+Ng%C3%A2n/@10.2425647,105.9739874,17z/data=!3m1!4b1!4m6!3m5!1s0x310a9dc5601ec70d:0xb3edfe0db14e1a95!8m2!3d10.2425647!4d105.9739874!16s%2Fg%2F11t9ls7q34?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(13, NULL, 'SOCDIEU', 'Sóc điệu', '', '', NULL, '', '', NULL, NULL, NULL),
(14, NULL, 'SIMSUM', 'Dimsum', '', '', NULL, '', '', NULL, NULL, NULL),
(15, NULL, 'HUONGDONGBIEN1', 'Quán Hương đồng biển 1', 'Phường 3', 'https://www.google.com/maps/place/Nh%C3%A0+h%C3%A0ng+H%C6%B0%C6%A1ng+%C4%90%E1%BB%93ng+Bi%E1%BB%83n/@10.2444552,105.9726032,121m/data=!3m1!1e3!4m14!1m7!3m6!1s0x310a9dc5601ec70d:0xb3edfe0db14e1a95!2zUXXDoW4gSOG6o2kgU-G6o24gTmfhu41jIE5nw6Ju!8m2!3d10.2425647!4d105.9739874!16s%2Fg%2F11t9ls7q34!3m5!1s0x310a9ddba4c21ee5:0x45eacc8837e63bc5!8m2!3d10.2446224!4d105.9729514!16s%2Fg%2F11tsp32lkt?entry=ttu', NULL, '', '', NULL, NULL, 'Đi cửa sau, có cái hẻm\r\nSDT: 086 2365591'),
(16, NULL, 'BABATHIT', 'Baba thịt', '', 'https://www.google.com/maps/place/10%C2%B014\'37.5%22N+105%C2%B057\'26.8%22E/@10.243737,105.9573504,51m/data=!3m1!1e3!4m4!3m3!8m2!3d10.2437478!4d105.9574451?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(17, NULL, 'THUCPHANLEDUYEN', 'Thực Phẩm lê duyên', '', 'https://www.google.com/maps/place/10%C2%B014\'42.5%22N+105%C2%B058\'12.7%22E/@10.2451373,105.9695473,204m/data=!3m2!1e3!4b1!4m4!3m3!8m2!3d10.245136!4d105.970191?entry=ttu', NULL, '', '', NULL, NULL, 'đối diện vườn ổi'),
(19, NULL, 'BEXIU', 'Tiệm Nước Mát Bé Xíu', 'Phường 1', 'https://www.google.com/maps/place/Ti%E1%BB%87m+N%C6%B0%E1%BB%9Bc+M%C3%A1t+B%C3%A9+X%C3%ADu/@10.251578,105.9750468,204m/data=!3m2!1e3!4b1!4m6!3m5!1s0x310a9d2de2d5ab7d:0x8c2d9d2fe39b32f1!8m2!3d10.2515767!4d105.9756905!16s%2Fg%2F11vxxnwg8s?entry=ttu', NULL, '', '', NULL, NULL, NULL),
(20, NULL, 'LYSTORE', 'Ly store', NULL, 'https://www.google.com/maps/place/Ly+store/@10.2519586,105.9761452,51m/data=!3m1!1e3!4m6!3m5!1s0x310a9d939e1913c7:0xe327df3f5f661acb!8m2!3d10.2518628!4d105.976247!16s%2Fg%2F11kq200pqw?entry=ttu', NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, 'TRASEN', 'Trà sen ', NULL, 'https://www.google.com/maps/place/10%C2%B015\'12.8%22N+105%C2%B058\'24.8%22E/@10.2534828,105.9732832,51m/data=!3m1!1e3!4m4!3m3!8m2!3d10.253552!4d105.97356?entry=ttu', NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, 'SUPTRANGIA', 'Súp Trần Gia', 'Phường 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceID`);

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
  ADD UNIQUE KEY `U_Store` (`StoreCode`),
  ADD KEY `fk_service` (`ServiceID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `shipments`
--
ALTER TABLE `shipments`
  MODIFY `ShipmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `shippers`
--
ALTER TABLE `shippers`
  MODIFY `ShipperID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `stores`
--
ALTER TABLE `stores`
  MODIFY `StoreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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

--
-- Các ràng buộc cho bảng `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `fk_service` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
