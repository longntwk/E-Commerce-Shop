-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 21, 2024 at 04:11 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: đồ điện tử'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Đồ điện tử'),
(3, 'Bánh kẹo'),
(4, 'Đô gia dụng'),
(5, 'Phụ kiện');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT '',
  `email` varchar(100) DEFAULT '',
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(100) DEFAULT '',
  `order_date` datetime DEFAULT current_timestamp(),
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT NULL COMMENT 'Trạng thái đơn hàng',
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `shipping_method` varchar(100) DEFAULT NULL,
  `shipping_address` varchar(200) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL CHECK (`price` >= 0),
  `number_of_products` int(11) DEFAULT NULL CHECK (`number_of_products` > 0),
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `color` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(350) DEFAULT NULL COMMENT 'Tên sản phẩm',
  `price` float NOT NULL CHECK (`price` >= 0),
  `thumbnail` varchar(300) DEFAULT '',
  `description` longtext DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Anh Long', 48.3, 'be9056cd-fd4b-4869-83f1-068675e14991_khoc.jpg', 'Liu Liu đồ không có Ny', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(2, 'Sleek Steel Chair', 37.7, 'c59c66a5-afe8-459e-8775-eefe832f4db0_010.jpg', 'Ex non reprehenderit cum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(3, 'Enormous Granite Shoes', 63.3, 'd6348e02-27bd-417a-ad9b-61622b779a0f_014.jpg', 'Sit nihil qui reiciendis ut.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(5, 'Fantastic Silk Shoes', 81.4, 'e5c1f5d6-37a6-4004-9d41-eb179ade5c49_019.jpg', 'Illo velit eum dicta voluptas esse omnis.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(6, 'Mediocre Paper Watch', 51.1, '25dc7977-5aa6-4cef-9420-a6f4ae8cc689_023.jpg', 'Eaque ut aperiam.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(7, 'Sleek Granite Table', 17.9, '57fab8b4-58f4-4ac7-89aa-cd2407354cfd_027.jpg', 'Adipisci sunt id dignissimos ut.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(8, 'Lightweight Paper Coat', 85.7, '33406087-a98e-48ee-9d8f-5f7b99400421_031.jpg', 'Dolore qui dolor quo ut sequi.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(9, 'Aerodynamic Cotton Pants', 67.7, '3a8fd754-d97f-4523-b4bf-7aa137e1e8e3_035.jpg', 'Et odit exercitationem accusantium facere veniam beatae.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(10, 'Intelligent Aluminum Keyboard', 29.4, '9a329768-eaad-4b22-8daf-8884630dcfa2_039.jpg', 'Quia quam ab atque ut omnis vel quos.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(11, 'Synergistic Rubber Gloves', 8, 'b598282f-d321-404c-87f2-74b9a93054c1_043.jpg', 'Nesciunt quia modi minus aliquid omnis amet error.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(12, 'Enormous Steel Lamp', 1.2, '78488af6-8991-45f4-95b3-e72572ea1c22_047.jpg', 'Optio et est explicabo odio optio earum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(13, 'Incredible Copper Computer', 79.1, '3729d767-d2a0-42a4-a5ab-8ec821b15647_051.jpg', 'Et alias ea ducimus corrupti autem.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(14, 'Fantastic Leather Bag', 17.7, '74a04e31-1fc4-4480-8e1e-d847e5ad7af9_055.jpg', 'In inventore recusandae voluptas.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(15, 'Mediocre Marble Shirt', 44.9, 'df0aa3a2-cb69-4e32-8009-5a35b64d419b_059.jpg', 'Voluptas veritatis consectetur accusantium facere id consectetur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(16, 'Small Marble Bench', 26.3, '62bb77b4-60dd-4a7b-b80f-21b32a65bdd7_063.jpg', 'Ipsam repellendus vitae voluptatum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(17, 'Enormous Bronze Chair', 42.4, '3c39c519-6320-436e-85d2-9719839967c9_067.jpg', 'Asperiores id quas ut id.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(18, 'Lightweight Rubber Clock', 44.1, 'd04397f9-31c9-4ae4-853f-89385669f681_071.jpg', 'Harum quis odit quos nulla.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(19, 'Rustic Silk Chair', 33.7, '618c325b-972c-47cf-ba28-e9a9f7f82dd8_075.jpg', 'Eius numquam ipsam vel.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(20, 'Gorgeous Linen Car', 44.9, '1f6dd4ca-86ae-4e44-a1a3-b661e39832bf_079.jpg', 'Omnis enim pariatur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(21, 'Mediocre Bronze Wallet', 63.8, '335056f4-3c5d-4a95-be7d-34f243de2447_083.jpg', 'Corporis voluptas totam aperiam qui unde.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(22, 'Rustic Steel Pants', 38.3, '7d18045e-2fe8-4b1d-ada8-244cf3fbf419_087.jpg', 'Non saepe dolor delectus quidem.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(23, 'Intelligent Wool Keyboard', 22.2, '78ee968a-bd3e-483f-9689-f89d6de40a05_091.jpg', 'Assumenda perferendis temporibus exercitationem ex.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(24, 'Small Paper Pants', 20.4, '813f5d99-e483-4a38-8fa0-300bb3786072_095.jpg', 'Et sit ipsum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(25, 'Durable Wool Watch', 17.1, '446e8eb7-57d4-42a3-8a0a-d0e542bb1c42_099.jpg', 'Recusandae id possimus.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(26, 'Fantastic Iron Gloves', 63.4, 'aa7a6b5a-3321-4657-8db8-039714ee6bbc_0103.jpg', 'Nobis quaerat nulla.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(27, 'Ergonomic Silk Clock', 52.6, 'a32eb6c3-abb1-4d4a-97ae-20c1c81c4089_0107.jpg', 'Necessitatibus excepturi fugiat non minus vitae.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(28, 'Practical Linen Watch', 82.6, '2bfee0ed-abed-4d17-84f1-bb4a4a9d6d2d_0111.jpg', 'Itaque qui vitae.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(29, 'Durable Cotton Car', 75.1, '86b002ca-18af-415f-9782-dd440ccf0fb1_0115.jpg', 'Veniam quisquam nesciunt mollitia minima ea est quis.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(30, 'Enormous Granite Computer', 9.5, '24c5e597-12f0-4cfe-818d-30c4e7fac5a8_0119.jpg', 'Saepe qui quis facere.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(31, 'Synergistic Wool Knife', 74.1, '6b51d390-9789-41b3-b22c-1fc230d66beb_0123.jpg', 'Occaecati laborum quam harum cum suscipit.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(32, 'Ergonomic Iron Plate', 7.4, '248544c9-cda4-49eb-b411-53372ff98902_0127.jpg', 'Unde id voluptates earum a delectus voluptate qui.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(33, 'Gorgeous Plastic Bottle', 31.1, '594fddc1-868f-47dd-9c1e-0c7d660fd53e_0131.jpg', 'Aspernatur necessitatibus accusamus.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(34, 'Durable Steel Table', 2.5, NULL, 'Incidunt et praesentium eum eos doloremque ratione.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(35, 'Awesome Bronze Gloves', 82.5, NULL, 'Quas ex enim aut quam provident quo.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(36, 'Sleek Granite Chair', 86.5, NULL, 'Magnam ipsa consequatur occaecati non dolorem excepturi.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(37, 'Sleek Steel Knife', 9.1, NULL, 'Eos blanditiis aliquid sint veritatis sapiente et.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(38, 'Heavy Duty Paper Clock', 87.2, NULL, 'Reprehenderit voluptas officiis eius dolorem quibusdam autem at.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(39, 'Gorgeous Bronze Bench', 59.2, NULL, 'Aut pariatur nulla.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(40, 'Durable Leather Computer', 50.2, NULL, 'Ut voluptatum consectetur quia amet ipsam.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(41, 'Ergonomic Granite Gloves', 51, NULL, 'Eaque saepe nisi voluptas dolore saepe cumque.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(42, 'Small Marble Bottle', 4.2, NULL, 'Doloribus magnam amet mollitia ducimus in voluptatum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(43, 'Incredible Concrete Bench', 47.3, NULL, 'Enim aut nobis dolores quod.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(44, 'Enormous Bronze Table', 24.3, NULL, 'Possimus asperiores qui quibusdam doloribus dolor quis sint.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(45, 'Practical Granite Wallet', 43.8, NULL, 'Non laudantium occaecati doloribus.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(46, 'Awesome Linen Plate', 6.4, NULL, 'Distinctio ab quia soluta excepturi voluptas praesentium.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(47, 'Fantastic Rubber Shoes', 71.2, NULL, 'Mollitia in consequatur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(48, 'Small Steel Bag', 41.2, NULL, 'Est inventore natus modi.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(49, 'Mediocre Wooden Watch', 32, NULL, 'At minima qui corporis non quo.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(50, 'Fantastic Leather Pants', 56.3, NULL, 'Quisquam eligendi pariatur fugit nostrum ut et fugit.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(51, 'Practical Aluminum Bench', 61.6, NULL, 'Dicta ut corporis sapiente sit.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(52, 'Heavy Duty Linen Clock', 48.9, NULL, 'Qui aliquam eos soluta explicabo exercitationem voluptatibus consequuntur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(53, 'Heavy Duty Plastic Keyboard', 79.9, NULL, 'Adipisci ut dicta facilis qui nihil.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(54, 'Ergonomic Cotton Gloves', 64.3, NULL, 'Odit optio soluta odio quo.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(55, 'Awesome Copper Bench', 5.5, NULL, 'Fuga praesentium ex aliquid quod officia sit nulla.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(56, 'Ergonomic Granite Pants', 82.5, NULL, 'Et dolor neque.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(57, 'Lightweight Plastic Gloves', 65.2, NULL, 'Impedit sunt et.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(58, 'Awesome Paper Watch', 87.2, NULL, 'Impedit id autem iusto illum commodi.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(59, 'Fantastic Rubber Lamp', 66.5, NULL, 'Doloribus omnis facere quidem eveniet minima quae optio.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(60, 'Enormous Silk Keyboard', 46.6, NULL, 'Qui natus aut.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(61, 'Lightweight Plastic Shirt', 69.1, NULL, 'Illum laborum aperiam voluptas.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(62, 'Mediocre Rubber Shirt', 33.1, NULL, 'Laborum neque non et illum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(63, 'Synergistic Cotton Table', 79.4, NULL, 'Cupiditate omnis voluptas quia.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(64, 'Ergonomic Granite Car', 32.7, NULL, 'Molestiae dicta tenetur impedit est nihil tenetur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(65, 'Durable Plastic Bag', 50.4, NULL, 'Incidunt sit tenetur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(66, 'Incredible Aluminum Bottle', 40.6, NULL, 'Est quo sapiente consequatur consequatur.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(67, 'Rustic Cotton Wallet', 42.6, NULL, 'Suscipit impedit quos.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(68, 'Incredible Rubber Car', 68.8, NULL, 'Voluptas animi possimus praesentium.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(69, 'Enormous Linen Bench', 74.4, NULL, 'Qui hic aut dolor pariatur voluptate eum est.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(70, 'Synergistic Silk Bottle', 44.7, NULL, 'Explicabo odit iure molestiae autem libero accusamus inventore.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(71, 'Durable Cotton Coat', 20, NULL, 'Et sed in.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(72, 'Durable Copper Bench', 83.1, NULL, 'Reiciendis laboriosam ut ut.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(73, 'Ergonomic Cotton Watch', 69.2, NULL, 'Et voluptas ea quia architecto aut quia.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(74, 'Rustic Wool Shoes', 25, NULL, 'Dicta possimus facilis.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(75, 'Small Granite Lamp', 70.6, NULL, 'Consequatur possimus consequatur placeat animi pariatur amet.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(76, 'Awesome Bronze Clock', 43.2, NULL, 'Repellendus quo similique corrupti sed culpa est earum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(77, 'Small Bronze Hat', 48.3, NULL, 'Ipsa excepturi exercitationem eaque.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(78, 'Incredible Marble Keyboard', 85.9, NULL, 'Dolorem velit et facilis eligendi cum.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(79, 'Sleek Linen Pants', 14.5, NULL, 'Ad quo rerum aut ea et molestiae laboriosam.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(80, 'Fantastic Copper Car', 22.7, NULL, 'Consectetur rerum dignissimos a qui.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(81, 'Awesome Leather Shirt', 77.2, NULL, 'Unde adipisci ducimus magnam et.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(82, 'Lightweight Cotton Bench', 32.2, NULL, 'Quis tempore beatae commodi.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(83, 'Aerodynamic Bronze Wallet', 39.5, NULL, 'Cupiditate accusantium perferendis aut.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(84, 'Ergonomic Leather Wallet', 64.2, NULL, 'Fugit ut possimus eveniet velit natus esse dolor.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(85, 'Sleek Wool Coat', 59.7, NULL, 'Ipsam minus dolores veniam incidunt quos sit.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(86, 'Mediocre Iron Hat', 48.4, NULL, 'Non laborum accusamus asperiores sapiente sint corrupti.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(87, 'Rustic Bronze Lamp', 22.1, NULL, 'Laudantium occaecati id ab.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(88, 'Incredible Plastic Shirt', 69, NULL, 'Neque iusto temporibus et ad rem.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(89, 'Practical Wooden Shoes', 53.7, NULL, 'Ad excepturi ut voluptas.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(90, 'Gorgeous Cotton Bottle', 74.9, NULL, 'Nihil quis ea tempora labore iste.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(91, 'Fantastic Plastic Plate', 88.8, NULL, 'Asperiores molestiae odit tenetur quis cupiditate.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 2),
(92, 'Mediocre Granite Gloves', 21.5, NULL, 'Provident harum inventore id et.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 3),
(93, 'Intelligent Paper Hat', 23, NULL, 'Ea rerum quis quam.', '2024-07-10 02:10:39', '2024-07-10 02:10:39', 4),
(94, 'Ergonomic Granite Bottle', 64.3, NULL, 'Commodi veritatis quia error et natus dolorum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(95, 'Mediocre Leather Bottle', 21, NULL, 'Est officiis ut deserunt nostrum ipsum quia.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(96, 'Aerodynamic Iron Pants', 89.9, NULL, 'Veniam sed eaque ea tenetur commodi error enim.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(97, 'Fantastic Linen Bottle', 12.8, NULL, 'Dolor distinctio quam est.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(98, 'Sleek Iron Lamp', 46.9, NULL, 'Placeat velit fuga est nihil illum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(99, 'Lightweight Wooden Knife', 63, NULL, 'Voluptas enim perspiciatis sed ea eum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(100, 'Intelligent Wooden Shoes', 83.7, NULL, 'Dolorem aspernatur ut hic.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(101, 'Durable Concrete Keyboard', 31.1, NULL, 'Provident necessitatibus sint beatae id laborum repellat.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(102, 'Fantastic Marble Hat', 54.8, NULL, 'Et labore incidunt incidunt placeat iusto illo sed.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(103, 'Heavy Duty Bronze Knife', 45.9, NULL, 'Minus praesentium ea sint adipisci et et rerum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(104, 'Aerodynamic Silk Keyboard', 20.6, NULL, 'Est et voluptas explicabo et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(105, 'Intelligent Leather Chair', 8.7, NULL, 'Repudiandae ipsam eligendi quia ut et animi laborum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(106, 'Lightweight Plastic Coat', 35.5, NULL, 'At nihil aut quisquam non quasi et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(107, 'Aerodynamic Silk Watch', 56.4, NULL, 'Ex quaerat quae est adipisci minus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(108, 'Ergonomic Bronze Gloves', 58.1, NULL, 'Blanditiis nihil est omnis iure corporis.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(109, 'Gorgeous Steel Shirt', 82.7, NULL, 'Sunt minus in autem voluptatem ut non.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(110, 'Practical Aluminum Watch', 22.5, NULL, 'Eos molestiae eum perspiciatis nihil.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(111, 'Enormous Steel Clock', 73.3, NULL, 'Esse tempore rerum qui.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(112, 'Incredible Wool Bottle', 40, NULL, 'Aut omnis blanditiis non est quos.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(113, 'Incredible Plastic Car', 43.3, NULL, 'Et accusantium vero ullam.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(114, 'Fantastic Plastic Table', 57.2, NULL, 'Officiis alias ab ut.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(115, 'Durable Copper Clock', 20, NULL, 'Non exercitationem error.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(116, 'Incredible Marble Table', 28.3, NULL, 'Dicta et ut aut ipsam quo est quidem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(117, 'Ergonomic Paper Table', 78.5, NULL, 'Maiores quidem ad et et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(118, 'Enormous Leather Computer', 34.5, NULL, 'Magnam sunt nobis voluptatem possimus placeat.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(119, 'Practical Wool Keyboard', 24.6, NULL, 'Et et id vel tenetur ea et accusantium.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(120, 'Rustic Cotton Bottle', 88.7, NULL, 'Velit veniam quas dolorem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(121, 'Lightweight Wool Wallet', 85.7, NULL, 'Omnis architecto a et animi ratione.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(122, 'Aerodynamic Concrete Keyboard', 49.8, NULL, 'Odit reprehenderit quo ea ducimus sed.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(123, 'Sleek Wool Table', 66.7, NULL, 'Atque omnis illum sapiente.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(124, 'Durable Steel Watch', 34.2, NULL, 'Sit quam eaque natus laudantium enim.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(125, 'Gorgeous Wool Lamp', 83.7, NULL, 'Doloremque aut velit iure magni eum optio.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(126, 'Sleek Silk Wallet', 11.4, NULL, 'Et qui repellendus voluptas non repudiandae voluptates vel.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(127, 'Rustic Marble Lamp', 50.6, NULL, 'Quis voluptatem est.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(128, 'Aerodynamic Wool Clock', 62.6, NULL, 'Suscipit labore quo deserunt facere autem ut repellendus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(129, 'Enormous Wool Hat', 24.6, NULL, 'Magni sint nostrum est cupiditate aut autem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(130, 'Mediocre Cotton Bag', 3.2, NULL, 'Tenetur saepe cumque ea.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(131, 'Ergonomic Copper Shoes', 14.6, NULL, 'Facilis voluptas ea vero nihil iusto labore.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(132, 'Small Copper Clock', 83, NULL, 'Praesentium magni omnis commodi et et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(133, 'Rustic Paper Lamp', 32.6, NULL, 'Ut quia vel molestias.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(134, 'Practical Wooden Keyboard', 5.5, NULL, 'Aut sequi est rerum velit.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(135, 'Ergonomic Cotton Lamp', 70.1, NULL, 'Officiis itaque labore.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(136, 'Synergistic Iron Car', 35.9, NULL, 'Et dolores quia.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(137, 'Practical Cotton Plate', 70.6, NULL, 'Rerum ea consequatur.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(138, 'Synergistic Aluminum Shoes', 43.7, NULL, 'Suscipit voluptas eum minima.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(139, 'Awesome Granite Pants', 47.7, NULL, 'Eos atque vel natus mollitia nisi officiis dolores.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(140, 'Intelligent Bronze Wallet', 49.7, NULL, 'Fuga amet deleniti ipsum ipsa.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(141, 'Mediocre Silk Table', 67.9, NULL, 'Mollitia asperiores dolorem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(142, 'Practical Plastic Knife', 62.5, NULL, 'Et qui deserunt quo ratione molestias.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(143, 'Sleek Copper Hat', 17.9, NULL, 'Voluptatem est ad.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(144, 'Durable Plastic Wallet', 59.6, NULL, 'Velit aspernatur dignissimos est.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(145, 'Awesome Wool Watch', 13.3, NULL, 'Aliquam debitis omnis voluptas.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(146, 'Awesome Leather Bottle', 45.2, NULL, 'A rerum est maxime rerum esse.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(147, 'Intelligent Marble Car', 49.8, NULL, 'Alias est ut.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(148, 'Fantastic Marble Computer', 80.1, NULL, 'Aspernatur deleniti voluptates.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(149, 'Practical Steel Plate', 62, NULL, 'Amet et quam.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(150, 'Lightweight Granite Watch', 29.1, NULL, 'Repellendus accusantium deleniti dolorem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(151, 'Heavy Duty Iron Computer', 7.6, NULL, 'Officiis minima tempore et iste facilis autem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(152, 'Lightweight Bronze Clock', 1.1, NULL, 'Minus fugit eaque consequatur.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(153, 'Incredible Wool Watch', 63.6, NULL, 'Aut porro laborum facere.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(154, 'Durable Concrete Gloves', 50.2, NULL, 'Unde aliquam error dolor.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(155, 'Rustic Paper Chair', 28.5, NULL, 'Cum unde est odio vel aut eum sint.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(156, 'Intelligent Iron Gloves', 74.1, NULL, 'Nemo consequatur quidem labore eius esse.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(157, 'Synergistic Rubber Pants', 88.5, NULL, 'Aliquid corrupti dolorem itaque quae.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(158, 'Aerodynamic Iron Computer', 2.4, NULL, 'Ut eos sit dicta saepe et tempora quaerat.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(159, 'Sleek Granite Plate', 57.3, NULL, 'Tempora et qui.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(160, 'Gorgeous Wool Pants', 42.8, NULL, 'Fugiat vitae aut dolor.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(161, 'Aerodynamic Aluminum Bench', 72.9, NULL, 'Temporibus aut repellendus rerum dolor.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(162, 'Ergonomic Paper Computer', 42.5, NULL, 'Architecto eos porro similique qui sed voluptatem sint.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(163, 'Durable Cotton Chair', 81.7, NULL, 'Saepe aperiam nam voluptatum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(164, 'Aerodynamic Leather Shoes', 85.4, NULL, 'Autem laborum et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(165, 'Gorgeous Leather Bottle', 32.6, NULL, 'Sunt labore non earum minus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(166, 'Intelligent Silk Gloves', 83.6, NULL, 'Quis voluptas sed.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(167, 'Practical Concrete Knife', 43.5, NULL, 'Dolor ullam id suscipit similique autem velit.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(168, 'Gorgeous Wool Car', 19.5, NULL, 'Quia et nobis consequatur ad ducimus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(169, 'Synergistic Leather Keyboard', 4.1, NULL, 'Dolorem quia consequuntur et dolor.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(170, 'Aerodynamic Copper Clock', 13.5, NULL, 'Officiis explicabo tempore ipsum necessitatibus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(171, 'Practical Wooden Bag', 25.5, NULL, 'Qui illo veniam nihil.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(172, 'Awesome Concrete Wallet', 65.6, NULL, 'Explicabo ut quia incidunt enim voluptas.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(173, 'Aerodynamic Linen Keyboard', 30.5, NULL, 'Numquam debitis sunt dicta praesentium dignissimos ut odit.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(174, 'Heavy Duty Leather Wallet', 59.8, NULL, 'Eius autem non.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(175, 'Durable Concrete Car', 27.5, NULL, 'Id officiis qui.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(176, 'Incredible Steel Computer', 61, NULL, 'Veniam molestiae ex molestiae dolorem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(177, 'Ergonomic Concrete Shoes', 76.7, NULL, 'Quae commodi fugiat et sunt.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(178, 'Heavy Duty Bronze Table', 78, NULL, 'Ut vero voluptatem ut qui consequuntur architecto sint.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(179, 'Intelligent Copper Pants', 76.6, NULL, 'Est ducimus dignissimos quia illum omnis.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(180, 'Rustic Steel Bag', 20.9, NULL, 'Sunt aut nisi.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(181, 'Synergistic Wool Table', 49.7, NULL, 'Rem id molestias.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(182, 'Mediocre Wooden Shoes', 38.5, NULL, 'Dolore aut dicta aliquam ducimus laborum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 4),
(183, 'Small Marble Computer', 76.7, NULL, 'Voluptas natus in.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(184, 'Awesome Silk Shoes', 24.9, NULL, 'Odio alias quis est aspernatur dolorem placeat.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(185, 'Heavy Duty Marble Chair', 81.3, NULL, 'Rem voluptatibus omnis.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(186, 'Mediocre Plastic Bench', 41, NULL, 'Ut est accusantium nobis eaque quia.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(187, 'Durable Wooden Pants', 26.8, NULL, 'Et et quia delectus qui omnis voluptate necessitatibus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(188, 'Heavy Duty Bronze Plate', 86.2, NULL, 'Et nam culpa voluptatem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(189, 'Sleek Iron Plate', 27.3, NULL, 'Tempora a ut in voluptas voluptatem perferendis pariatur.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(190, 'Ergonomic Concrete Computer', 79.1, NULL, 'Aut inventore tempora nobis odit voluptatibus labore velit.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(191, 'Ergonomic Bronze Knife', 74.1, NULL, 'Doloribus ut autem repudiandae exercitationem nisi recusandae nobis.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(192, 'Heavy Duty Linen Coat', 81.8, NULL, 'Ducimus beatae doloremque nam voluptatem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(193, 'Durable Wooden Lamp', 4.4, NULL, 'Exercitationem ut explicabo sunt eum numquam.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(194, 'Enormous Wooden Keyboard', 88.2, NULL, 'Sequi beatae repellendus officia eius quae illo occaecati.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(195, 'Awesome Concrete Coat', 89.8, NULL, 'Non autem ut libero.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(196, 'Durable Paper Coat', 89.2, NULL, 'Illo facere officia provident.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(197, 'Heavy Duty Leather Computer', 52.9, NULL, 'Minima quam quae perspiciatis necessitatibus ducimus.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(198, 'Small Rubber Pants', 14.7, NULL, 'Ex incidunt quaerat sint repellendus dolor hic.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(199, 'Mediocre Wool Coat', 71.1, NULL, 'Minus saepe autem et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(200, 'Heavy Duty Iron Car', 16.8, NULL, 'Quas nulla dolores libero.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(201, 'Lightweight Leather Pants', 87.9, NULL, 'Quo ut earum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(202, 'Mediocre Rubber Lamp', 44, NULL, 'Et ratione dignissimos.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(203, 'Lightweight Leather Gloves', 55.5, NULL, 'Numquam ut placeat et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(204, 'Incredible Iron Bottle', 14.3, NULL, 'Totam voluptatem commodi.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(205, 'Gorgeous Leather Pants', 69.4, NULL, 'In suscipit dolorem autem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(206, 'Durable Granite Computer', 11, NULL, 'Tempora consequatur deleniti consectetur.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(207, 'Intelligent Copper Knife', 86, NULL, 'Et harum illum quasi.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(208, 'Lightweight Marble Bench', 3.1, NULL, 'Et distinctio recusandae eum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(209, 'Gorgeous Granite Table', 70.6, NULL, 'Tempore quisquam voluptatem aut aut voluptatum.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(210, 'Incredible Granite Wallet', 4.6, NULL, 'Est esse perspiciatis est et.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(211, 'Aerodynamic Plastic Lamp', 34.3, NULL, 'Eius doloremque hic suscipit tempora et ea.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(212, 'Mediocre Aluminum Coat', 57.7, NULL, 'Error laborum est commodi.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(213, 'Durable Bronze Bench', 52.6, NULL, 'Sit repellat error rerum dicta voluptatem molestiae.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(214, 'Ergonomic Marble Wallet', 55.7, NULL, 'Excepturi quia perferendis omnis eaque id autem.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(215, 'Mediocre Steel Clock', 71, NULL, 'Enim ut veritatis consequatur nisi.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 2),
(216, 'Rustic Cotton Plate', 35.6, NULL, 'Commodi ut accusantium modi omnis vero voluptates.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(217, 'Aerodynamic Silk Knife', 39.1, NULL, 'Impedit at magnam adipisci fugit quia qui soluta.', '2024-07-10 02:10:40', '2024-07-10 02:10:40', 3),
(218, 'Lightweight Plastic Bottle', 37.7, NULL, 'Et beatae libero.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(219, 'Gorgeous Paper Shirt', 65.1, NULL, 'Nihil non expedita velit omnis sint sunt.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(220, 'Ergonomic Concrete Table', 11.4, NULL, 'Molestias molestiae alias.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(221, 'Intelligent Concrete Shirt', 7.5, NULL, 'Facere sit est ipsam et magni.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(222, 'Lightweight Concrete Bag', 21.6, NULL, 'Recusandae amet possimus totam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(223, 'Awesome Plastic Coat', 53, NULL, 'Cum qui ratione ea delectus quos quia.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(224, 'Sleek Linen Plate', 19.4, NULL, 'Exercitationem quo aliquid eligendi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(225, 'Awesome Bronze Knife', 43.8, NULL, 'Consectetur animi blanditiis et sunt a.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(226, 'Incredible Bronze Computer', 81.8, NULL, 'Molestiae voluptas iure dicta ut.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(227, 'Synergistic Bronze Hat', 17.6, NULL, 'Dolore aliquid dolorum ab placeat animi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(228, 'Intelligent Rubber Bench', 37, NULL, 'Dolor possimus molestiae illum magnam illo amet.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(229, 'Mediocre Steel Bench', 33.5, NULL, 'Rem quia nostrum aut et.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(230, 'Gorgeous Steel Watch', 75.5, NULL, 'Ex dicta quae non nihil.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(231, 'Durable Marble Clock', 38.9, NULL, 'Blanditiis dolor facere.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(232, 'Rustic Steel Knife', 15.9, NULL, 'At doloremque facere.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(233, 'Fantastic Cotton Shirt', 19.2, NULL, 'Sit voluptas cupiditate suscipit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(234, 'Sleek Leather Clock', 8.1, NULL, 'Soluta et minima exercitationem quas et fuga.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(235, 'Small Steel Wallet', 20.4, NULL, 'Praesentium alias modi at officiis et quam qui.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(236, 'Lightweight Leather Table', 40.5, NULL, 'Nihil voluptatem labore quis sed omnis labore aliquam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(237, 'Durable Paper Shirt', 67.6, NULL, 'Et aliquid esse saepe aut temporibus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(238, 'Aerodynamic Cotton Chair', 5.9, NULL, 'Cupiditate quis asperiores sed enim aliquam qui.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(239, 'Sleek Rubber Bench', 77.1, NULL, 'Nostrum ut cupiditate necessitatibus expedita in rem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(240, 'Intelligent Paper Plate', 40.6, NULL, 'Esse rerum et sint.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(241, 'Small Cotton Knife', 42.7, NULL, 'Itaque culpa laboriosam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(242, 'Incredible Paper Shoes', 49, NULL, 'Id et hic nihil quas consequuntur cum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(243, 'Enormous Wool Clock', 89.4, NULL, 'Est qui repellendus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(244, 'Durable Iron Coat', 54.4, NULL, 'Nisi consequatur optio laborum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(245, 'Enormous Concrete Chair', 22.6, NULL, 'Doloremque voluptate veritatis et molestias aliquam adipisci autem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(246, 'Small Cotton Coat', 88, NULL, 'Corporis id id sit sit eius deleniti quisquam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(247, 'Small Cotton Bag', 43.8, NULL, 'Dolor aut in.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(248, 'Gorgeous Paper Keyboard', 39.9, NULL, 'Eveniet et blanditiis similique sit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(249, 'Gorgeous Concrete Clock', 22.8, NULL, 'Minus tempore et eos aut ipsa.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(250, 'Intelligent Linen Bottle', 73.3, NULL, 'Doloremque placeat odio laboriosam totam voluptas incidunt.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(251, 'Synergistic Linen Watch', 89.4, NULL, 'Blanditiis molestiae doloribus aliquid cum velit voluptatem et.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(252, 'Small Aluminum Table', 81.4, NULL, 'Quos eos consequatur cum quis explicabo quasi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(253, 'Synergistic Wool Lamp', 347950, NULL, 'Illo est sed consequatur quibusdam commodi sunt.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(254, 'Incredible Bronze Pants', 89.2, NULL, 'Sit aut molestias cum velit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(255, 'Sleek Iron Computer', 52.8, NULL, 'Ea blanditiis similique ipsa.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(256, 'Gorgeous Cotton Keyboard', 88.3, NULL, 'Et sed corrupti ex pariatur quo et cupiditate.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(257, 'Lightweight Rubber Bag', 67.1, NULL, 'Et quia nisi ducimus doloribus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(258, 'Fantastic Marble Bag', 15.4, NULL, 'Natus laudantium provident et.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(259, 'Ergonomic Bronze Hat', 47.3, NULL, 'Quia quaerat voluptatibus voluptas mollitia atque ullam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(260, 'Aerodynamic Plastic Clock', 10, NULL, 'Dolorum corporis officiis quod vel in dolor.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(261, 'Durable Wool Clock', 81.5, NULL, 'Ut quia iusto quo deserunt.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(262, 'Gorgeous Paper Shoes', 88.4, NULL, 'Sed aut aut magni.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(263, 'Awesome Steel Watch', 35, NULL, 'Sint repellat modi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(264, 'Synergistic Wooden Plate', 85, NULL, 'Sequi aut accusantium voluptates.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(265, 'Awesome Plastic Table', 59.7, NULL, 'Nihil beatae fugit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(266, 'Lightweight Copper Pants', 10.3, NULL, 'Eos id minus sint et impedit consectetur.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(267, 'Awesome Steel Wallet', 44.3, NULL, 'Sint nostrum quis reprehenderit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(268, 'Sleek Cotton Computer', 16.8, NULL, 'Exercitationem quae commodi consequuntur voluptas fuga nihil.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(269, 'Ergonomic Paper Chair', 77.6, NULL, 'Et et voluptate sed ullam voluptas quia.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(270, 'Practical Aluminum Chair', 53.8, NULL, 'Alias velit in non velit animi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(271, 'Rustic Wool Gloves', 47.4, NULL, 'Eum eum ab repellendus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(272, 'Awesome Bronze Car', 89.4, NULL, 'Saepe eius earum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(273, 'Rustic Rubber Bag', 46.2, NULL, 'Architecto omnis minima.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(274, 'Aerodynamic Paper Bench', 67, NULL, 'Ratione ipsam aliquam quos sit iure et ut.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(275, 'Rustic Steel Watch', 61.5, NULL, 'Id qui cumque.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(276, 'Enormous Rubber Shirt', 5.2, NULL, 'Voluptas quam temporibus modi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(277, 'Incredible Plastic Bag', 25, NULL, 'Est nobis hic aliquam doloribus quia ut officiis.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(278, 'Intelligent Rubber Table', 24.8, NULL, 'Mollitia vel animi aut soluta sint deleniti.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(279, 'Durable Aluminum Bag', 19.7, NULL, 'Ut eos est sit inventore nobis accusantium.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(280, 'Heavy Duty Cotton Shoes', 86.1, NULL, 'Veritatis voluptatem iusto.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(281, 'Durable Copper Watch', 26.5, NULL, 'Ipsa ea odio.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(282, 'Synergistic Wooden Knife', 58, NULL, 'Sunt dignissimos consequatur assumenda iure omnis consequatur quos.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(283, 'Mediocre Plastic Shoes', 2.6, NULL, 'Ratione harum eum placeat.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(284, 'Heavy Duty Granite Gloves', 21.1, NULL, 'Ut voluptas ut rerum libero aut veniam atque.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(285, 'Ergonomic Leather Hat', 47.4, NULL, 'Est sunt sit harum quia maiores a ducimus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(286, 'Incredible Wool Knife', 14.3, NULL, 'Ea nihil unde cupiditate hic et vitae autem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(287, 'Enormous Concrete Wallet', 55.6, NULL, 'Magni qui voluptatem explicabo assumenda.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(288, 'Small Silk Chair', 30.5, NULL, 'Deleniti est voluptas consequuntur cum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(289, 'Aerodynamic Iron Coat', 4.3, NULL, 'Saepe nesciunt alias saepe.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(290, 'Rustic Concrete Bench', 88.4, NULL, 'Vero voluptas ea suscipit dolor occaecati corporis.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(291, 'Incredible Iron Wallet', 18.6, NULL, 'Reprehenderit adipisci illum nostrum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(292, 'Heavy Duty Rubber Hat', 15.2, NULL, 'Maxime a sed aut sit similique.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(293, 'Sleek Cotton Bottle', 3.1, NULL, 'Nisi ut qui vel perferendis minima necessitatibus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(294, 'Synergistic Wool Car', 3.7, NULL, 'Autem eos consequatur eos cupiditate.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(295, 'Lightweight Wooden Table', 8.1, NULL, 'Fugit est occaecati rerum necessitatibus.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(296, 'Synergistic Linen Wallet', 49, NULL, 'Quas doloremque a nobis eum dolor.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(297, 'Small Bronze Bag', 48.3, NULL, 'Debitis id rerum similique ut laboriosam aut ut.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(298, 'Rustic Linen Bottle', 78.8, NULL, 'Ullam voluptatem dolore voluptas et eum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(299, 'Ergonomic Bronze Lamp', 36.5, NULL, 'Quos velit atque doloremque vero.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(300, 'Rustic Copper Plate', 36.3, NULL, 'Aperiam porro et accusantium.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(301, 'Small Plastic Keyboard', 62.3, NULL, 'Minus consequatur eos ut.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(302, 'Heavy Duty Silk Keyboard', 27.9, NULL, 'Ducimus eum error recusandae non.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(303, 'Ergonomic Cotton Bench', 80.3, NULL, 'Fuga aut aut nemo officia et ad.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(304, 'Incredible Leather Car', 69.9, NULL, 'Minus accusantium tempora dignissimos fuga et minus ea.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(305, 'Heavy Duty Rubber Knife', 51.1, NULL, 'Omnis nemo consectetur distinctio eos asperiores.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(306, 'Aerodynamic Wooden Wallet', 39.1, NULL, 'Est voluptatum est at laboriosam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(307, 'Gorgeous Concrete Bottle', 63.5, NULL, 'Accusamus sed qui.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(308, 'Intelligent Plastic Chair', 78.8, NULL, 'Perferendis sint impedit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(309, 'Awesome Plastic Chair', 75.1, NULL, 'Eaque eum laboriosam ut.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(310, 'Incredible Aluminum Watch', 76, NULL, 'Hic molestiae sit nisi aut quia labore.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(311, 'Practical Copper Hat', 46, NULL, 'Sequi culpa ut aut provident voluptates pariatur.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(312, 'Lightweight Paper Clock', 63.7, NULL, 'Ut ut quas quasi labore quia.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(313, 'Enormous Paper Table', 27.9, NULL, 'Rerum reiciendis doloremque.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(314, 'Lightweight Plastic Hat', 27.7, NULL, 'Dolorem illo vero voluptas vel vel.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(315, 'Sleek Iron Clock', 67.7, NULL, 'Quidem qui voluptatem et.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(316, 'Mediocre Leather Computer', 43.4, NULL, 'Eum voluptatem est maiores consequatur doloremque accusamus vel.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(317, 'Awesome Plastic Keyboard', 34.1, NULL, 'Dolore placeat qui voluptatem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(318, 'Sleek Wooden Chair', 76.8, NULL, 'Reiciendis magnam nulla dolores.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(319, 'Incredible Iron Knife', 15.5, NULL, 'Expedita id praesentium cumque.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(320, 'Awesome Marble Bench', 2.6, NULL, 'Rem id modi officiis quod modi facilis sit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(321, 'Synergistic Rubber Chair', 6.4, NULL, 'Ut delectus ullam consequatur sint.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(322, 'Intelligent Copper Coat', 34, NULL, 'Magni eligendi ut modi deleniti debitis ab.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(323, 'Sleek Granite Shoes', 41.2, NULL, 'Et consequatur minus repellat veniam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(324, 'Rustic Aluminum Bottle', 48, NULL, 'Debitis et rerum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(325, 'Enormous Granite Wallet', 64.1, NULL, 'Accusamus consequatur accusamus id quo at.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(326, 'Awesome Wool Keyboard', 38.5, NULL, 'Eum et itaque perspiciatis aut hic sequi.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(327, 'Aerodynamic Copper Pants', 9.9, NULL, 'Sed impedit praesentium aperiam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(328, 'Fantastic Copper Pants', 55.8, NULL, 'Nisi provident quaerat voluptatem itaque vel.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(329, 'Fantastic Paper Coat', 80.4, NULL, 'Aut sunt eum nemo non assumenda et.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(330, 'Sleek Plastic Table', 22, NULL, 'Id debitis sed laborum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(331, 'Awesome Linen Computer', 79.4, NULL, 'Laboriosam dolores ab.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 4),
(332, 'Intelligent Wool Gloves', 32.2, NULL, 'Quia hic et aut voluptatum fugiat.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(333, 'Fantastic Plastic Computer', 53.2, NULL, 'Animi accusantium unde autem id nihil nam labore.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(334, 'Rustic Copper Pants', 84.4, NULL, 'Temporibus expedita fuga quas quis qui.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(335, 'Rustic Steel Shirt', 80.6, NULL, 'Ea tenetur vero et cupiditate.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(336, 'Fantastic Aluminum Bench', 83.7, NULL, 'Repudiandae quibusdam eos veritatis corporis et nulla.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(337, 'Enormous Copper Table', 12.9, NULL, 'Perspiciatis magni ea est non quam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(338, 'Small Rubber Chair', 53.9, NULL, 'Provident eaque alias quae neque.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(339, 'Sleek Aluminum Pants', 1.2, NULL, 'Quia est sit sint maiores totam culpa.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(340, 'Rustic Marble Chair', 86.1, NULL, 'Eos a eveniet.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(341, 'Incredible Cotton Keyboard', 9, NULL, 'Dolorum enim dolor voluptatem dolores provident.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(342, 'Durable Wool Bench', 47.7, NULL, 'Numquam maiores laboriosam.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(343, 'Enormous Leather Gloves', 2.9, NULL, 'Nulla vitae aut odio.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(344, 'Small Wooden Car', 49.1, NULL, 'Laudantium quia modi mollitia.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(345, 'Enormous Linen Shoes', 83.7, NULL, 'Voluptatem temporibus dolorem maiores sunt dolorem provident asperiores.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(346, 'Practical Copper Gloves', 1.2, NULL, 'Error deserunt doloremque veritatis suscipit.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 3),
(347, 'Synergistic Copper Plate', 2.9, NULL, 'Voluptas ipsa rerum.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(348, 'Rustic Iron Shoes', 27.3, NULL, 'Ipsa exercitationem voluptatem odit vero dolorem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(349, 'Heavy Duty Aluminum Gloves', 55.8, NULL, 'Voluptate quia veritatis nostrum porro est doloribus dolorem.', '2024-07-10 02:10:41', '2024-07-10 02:10:41', 2),
(350, 'Ergonomic Plastic Plate', 35.6, NULL, 'Quia sequi et explicabo numquam sunt qui placeat.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(351, 'Enormous Aluminum Table', 79.4, NULL, 'Quia dolores non ut maxime.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(352, 'Practical Leather Car', 1.2, NULL, 'Pariatur quasi labore eum velit cum vero libero.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(353, 'Practical Paper Chair', 64.5, NULL, 'Natus et excepturi possimus repudiandae laboriosam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(354, 'Small Linen Wallet', 54.6, NULL, 'Nulla sint totam et fuga.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(355, 'Fantastic Marble Shoes', 40.4, NULL, 'Aperiam et dolor quisquam quidem quia commodi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(356, 'Fantastic Iron Pants', 84.5, NULL, 'Nulla non sint dignissimos voluptatem hic.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(357, 'Enormous Cotton Bottle', 20.7, NULL, 'Enim sed odio.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(358, 'Gorgeous Bronze Table', 75.1, NULL, 'Est odio explicabo dolorum fugit fugit rerum dolores.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(359, 'Practical Concrete Chair', 19.9, NULL, 'Soluta quidem eaque iure deserunt provident quasi possimus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(360, 'Incredible Steel Plate', 84.1, NULL, 'Ut sunt qui voluptatem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(361, 'Sleek Paper Bottle', 60.5, NULL, 'Odio et repellat ipsam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(362, 'Small Aluminum Knife', 45.6, NULL, 'Dolor impedit saepe.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(363, 'Aerodynamic Wool Shirt', 1.4, NULL, 'Autem repellendus possimus a adipisci placeat aut consequatur.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(364, 'Awesome Silk Chair', 81.3, NULL, 'Quia natus dolore quasi ut culpa provident velit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(365, 'Small Plastic Shoes', 29.3, NULL, 'Voluptatem saepe voluptas voluptas et voluptatem ipsum laboriosam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(366, 'Incredible Leather Keyboard', 63, NULL, 'Esse quia recusandae.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(367, 'Awesome Cotton Shirt', 42.8, NULL, 'Voluptatibus ab qui.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(368, 'Heavy Duty Cotton Watch', 18.1, NULL, 'Sint sequi dolores suscipit dolore recusandae tempora.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(369, 'Fantastic Granite Lamp', 80.4, NULL, 'Sed sapiente omnis ut illo voluptatem rerum voluptas.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(370, 'Fantastic Silk Clock', 79, NULL, 'Animi dolorem labore.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(371, 'Awesome Copper Knife', 8.8, NULL, 'Sapiente veniam eligendi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3);
INSERT INTO `products` (`id`, `name`, `price`, `thumbnail`, `description`, `created_at`, `updated_at`, `category_id`) VALUES
(372, 'Sleek Linen Lamp', 82.6, NULL, 'Incidunt quis enim facilis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(373, 'Awesome Silk Knife', 34.1, NULL, 'Et dolorem recusandae consequuntur iste nostrum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(374, 'Mediocre Plastic Wallet', 81.5, NULL, 'Corporis est consequatur.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(375, 'Incredible Concrete Table', 64.1, NULL, 'Ut ex saepe voluptas quisquam accusamus enim amet.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(376, 'Durable Paper Knife', 84.9, NULL, 'Voluptatem quaerat veritatis sint.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(377, 'Synergistic Wooden Computer', 19.8, NULL, 'Sapiente mollitia qui est corrupti velit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(378, 'Incredible Cotton Lamp', 45.3, NULL, 'Alias fuga saepe et iure qui placeat eius.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(379, 'Mediocre Linen Wallet', 76.3, NULL, 'Incidunt aut ipsa.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(380, 'Ergonomic Wool Computer', 43.5, NULL, 'Dignissimos voluptatem facere corporis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(381, 'Heavy Duty Marble Bench', 55.2, NULL, 'In voluptatem consequatur incidunt dolorem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(382, 'Heavy Duty Aluminum Wallet', 71.4, NULL, 'Et dolore temporibus beatae temporibus necessitatibus cum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(383, 'Gorgeous Concrete Keyboard', 22.4, NULL, 'Corrupti quisquam qui natus quam ex.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(384, 'Fantastic Aluminum Table', 55.3, NULL, 'Maiores eum et ullam pariatur deserunt officiis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(385, 'Practical Wooden Bench', 54.8, NULL, 'Itaque deleniti accusantium in accusamus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(386, 'Practical Rubber Table', 29.5, NULL, 'Veniam itaque inventore quam sit omnis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(387, 'Lightweight Granite Table', 17.1, NULL, 'Sequi est nisi autem blanditiis magni praesentium voluptas.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(388, 'Aerodynamic Paper Shoes', 46.6, NULL, 'Architecto commodi corporis at consequatur est.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(389, 'Fantastic Iron Lamp', 27.8, NULL, 'Quod aliquam quo ut dolorem explicabo voluptatem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(390, 'Durable Linen Computer', 44.8, NULL, 'Porro voluptatum ut aut quo.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(391, 'Awesome Cotton Watch', 20.9, NULL, 'Quae quia repudiandae sed similique quo dolor.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(392, 'Synergistic Rubber Clock', 17, NULL, 'Consequatur et id quia consequatur molestias voluptate qui.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(393, 'Fantastic Copper Shoes', 77.7, NULL, 'Qui ab adipisci reprehenderit sit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(394, 'Fantastic Paper Bag', 30.3, NULL, 'Voluptatem voluptatum est unde.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(395, 'Intelligent Silk Shirt', 33.6, NULL, 'Iure expedita praesentium ipsam dignissimos quis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(396, 'Awesome Copper Keyboard', 40.6, NULL, 'Dolor maxime ducimus quis culpa.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(397, 'Heavy Duty Wooden Pants', 51, NULL, 'In dolorem totam beatae ipsam nisi est.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(398, 'Lightweight Linen Wallet', 51.8, NULL, 'Rerum saepe consequatur suscipit dolorem doloremque.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(399, 'Incredible Cotton Plate', 57.7, NULL, 'Magnam molestias officiis ut.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(400, 'Sleek Steel Shirt', 44.7, NULL, 'Quasi saepe voluptates praesentium quis explicabo.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(401, 'Sleek Paper Watch', 17.1, NULL, 'Debitis totam fugiat ad beatae distinctio sint incidunt.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(402, 'Gorgeous Plastic Chair', 14.1, NULL, 'Repellendus ab laboriosam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(403, 'Heavy Duty Plastic Watch', 61, NULL, 'Suscipit esse eius nihil temporibus architecto et.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(404, 'Rustic Paper Bottle', 77.9, NULL, 'Aut sed saepe omnis in ipsa incidunt sint.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(405, 'Aerodynamic Leather Wallet', 57.9, NULL, 'Autem commodi ut quibusdam ullam ut minus ipsa.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(406, 'Small Paper Knife', 358544, NULL, 'Consequatur autem deleniti beatae.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(407, 'Small Paper Hat', 77.4, NULL, 'Quos mollitia maiores reprehenderit voluptas ut blanditiis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(408, 'Intelligent Wool Lamp', 78.5, NULL, 'Qui ea quia nam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(409, 'Incredible Linen Shoes', 73.2, NULL, 'Eligendi sit cum ea necessitatibus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(410, 'Lightweight Aluminum Plate', 68.6, NULL, 'Similique illum consequatur consequatur et eius occaecati eligendi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(411, 'Awesome Concrete Table', 58.9, NULL, 'Sed adipisci minima esse quos.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(412, 'Gorgeous Granite Gloves', 43.9, NULL, 'Ipsa sed labore ipsam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(413, 'Aerodynamic Cotton Car', 22.6, NULL, 'Eius excepturi accusantium fugiat et ipsa eligendi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(414, 'Intelligent Rubber Wallet', 82.8, NULL, 'Qui rerum distinctio autem eaque quis ea.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(415, 'Practical Linen Clock', 85.6, NULL, 'Omnis delectus quia iste nam quos quia.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(416, 'Heavy Duty Paper Lamp', 30.6, NULL, 'Eos magni mollitia aut in.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(417, 'Ergonomic Cotton Shoes', 31.5, NULL, 'Non quia et iste autem est voluptatem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(418, 'Mediocre Cotton Shirt', 38.6, NULL, 'Error repudiandae veritatis cum odit temporibus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(419, 'Durable Plastic Bottle', 16.9, NULL, 'Quaerat et quam ipsum recusandae et.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(420, 'Synergistic Silk Knife', 71.1, NULL, 'Aspernatur alias placeat.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(421, 'Mediocre Plastic Clock', 64.3, NULL, 'Voluptatum omnis deleniti rem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(422, 'Ergonomic Leather Gloves', 23.4, NULL, 'Quo quo eos voluptatem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(423, 'Mediocre Cotton Pants', 33.7, NULL, 'Facilis doloremque amet aut deserunt natus eligendi unde.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(424, 'Rustic Bronze Chair', 32.4, NULL, 'Ut adipisci et sint sed.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(425, 'Mediocre Silk Watch', 34.8, NULL, 'Velit autem ratione saepe voluptas et rerum dolor.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(426, 'Fantastic Wooden Knife', 24.6, NULL, 'Non quo sit quaerat qui vero.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(427, 'Sleek Linen Bag', 14.8, NULL, 'Est laudantium aliquam soluta nesciunt omnis dolor voluptatibus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(428, 'Enormous Silk Bag', 25.7, NULL, 'Natus autem omnis asperiores omnis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(429, 'Awesome Iron Gloves', 39.5, NULL, 'Aut aut aut unde molestiae.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(430, 'Small Granite Computer', 79.8, NULL, 'Ullam aut quas mollitia qui autem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(431, 'Enormous Paper Lamp', 24.8, NULL, 'Ducimus corporis eaque molestiae quis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(432, 'Heavy Duty Bronze Hat', 80.2, NULL, 'Itaque sed explicabo.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(433, 'Enormous Granite Car', 6.7, NULL, 'Aut odit in id explicabo.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(434, 'Practical Granite Watch', 43.8, NULL, 'Quos qui molestiae quia laboriosam sint ullam quis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(435, 'Lightweight Plastic Shoes', 46.6, NULL, 'Qui eaque nisi voluptatum odio ullam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(436, 'Durable Wool Pants', 71.9, NULL, 'Et aut sit vel.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(437, 'Durable Aluminum Car', 19.9, NULL, 'Deleniti magnam id tempora ullam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(438, 'Mediocre Wool Gloves', 59.2, NULL, 'Nihil ad distinctio corrupti autem.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(439, 'Aerodynamic Linen Computer', 38.4, NULL, 'Sit voluptates et porro nemo vel nostrum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(440, 'Lightweight Linen Car', 28, NULL, 'Molestiae ipsa quas dolorum esse.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(441, 'Practical Leather Gloves', 49.7, NULL, 'Neque minima beatae et id dolor corporis porro.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(442, 'Aerodynamic Linen Pants', 64.3, NULL, 'Laboriosam vero perspiciatis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(443, 'Awesome Plastic Hat', 32.4, NULL, 'Vel beatae qui dolor suscipit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(444, 'Enormous Bronze Clock', 64.4, NULL, 'Aut consequatur sunt voluptatem fugit asperiores et.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(445, 'Gorgeous Granite Shoes', 36.9, NULL, 'Et earum architecto ex odio maiores est.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(446, 'Sleek Linen Knife', 18.3, NULL, 'Et et quisquam odit dignissimos.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(447, 'Small Steel Hat', 89.4, NULL, 'Et odio quaerat laborum voluptates.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(448, 'Enormous Bronze Shirt', 75, NULL, 'Voluptatem quia itaque.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(449, 'Gorgeous Leather Shoes', 71.5, NULL, 'Fugiat pariatur minus et adipisci aliquam minima.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(450, 'Lightweight Copper Knife', 13.5, NULL, 'Veritatis qui ut dolores error.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(451, 'Fantastic Aluminum Shoes', 30.1, NULL, 'Debitis qui porro voluptas sequi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(452, 'Gorgeous Cotton Plate', 22.2, NULL, 'Ut ut perferendis eveniet in enim impedit qui.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(453, 'Heavy Duty Leather Bench', 28.9, NULL, 'Ad hic quis qui rerum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(454, 'Fantastic Wooden Pants', 20.5, NULL, 'Aliquid dolorem velit quis occaecati libero modi.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(455, 'Practical Aluminum Bottle', 78.5, NULL, 'Qui sed ea dicta fuga.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(456, 'Incredible Bronze Coat', 12.9, NULL, 'Quibusdam ut consequatur quia sit eum facilis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(457, 'Enormous Linen Computer', 32, NULL, 'Sunt omnis reprehenderit quod sunt.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(458, 'Small Aluminum Shoes', 61.7, NULL, 'Officia quia libero hic vel.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(459, 'Gorgeous Wooden Pants', 72.8, NULL, 'Architecto eveniet eos fuga autem ut tenetur velit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(460, 'Incredible Aluminum Pants', 56.5, NULL, 'Perspiciatis omnis consequatur.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(461, 'Enormous Linen Coat', 33, NULL, 'Officia rem veritatis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(462, 'Synergistic Bronze Bottle', 86, NULL, 'Aperiam vitae dolores dolorem dolore magnam repellendus.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(463, 'Incredible Plastic Lamp', 54.5, NULL, 'Distinctio quis earum adipisci eveniet.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(464, 'Intelligent Rubber Lamp', 74.4, NULL, 'Iure fugit rerum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(465, 'Rustic Rubber Pants', 57.3, NULL, 'Omnis non pariatur sint quis quo quod.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(466, 'Heavy Duty Concrete Coat', 49, NULL, 'Omnis nobis magnam reprehenderit qui sed corporis.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(467, 'Awesome Iron Shirt', 58.5, NULL, 'Facilis veniam id ut ut neque.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(468, 'Mediocre Aluminum Knife', 25.9, NULL, 'Aut earum quisquam suscipit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(469, 'Gorgeous Leather Clock', 34, NULL, 'Quos neque rerum inventore eum doloribus fugit.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(470, 'Gorgeous Wool Hat', 46.3, NULL, 'Quo eos nostrum.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(471, 'Enormous Bronze Car', 64.5, NULL, 'Maiores doloribus natus enim culpa.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(472, 'Fantastic Linen Bag', 74.1, NULL, 'Sunt qui voluptatem assumenda voluptas ut.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 4),
(473, 'Small Plastic Shirt', 38.1, NULL, 'Amet libero sed ullam eius sunt mollitia.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(474, 'Ergonomic Linen Bag', 10.2, NULL, 'Sit qui accusamus voluptatem earum ut explicabo.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(475, 'Incredible Plastic Knife', 41.7, NULL, 'Optio aliquam doloremque esse consequatur ea maiores in.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(476, 'Intelligent Iron Shirt', 7.5, NULL, 'Perferendis sint nihil.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(477, 'Heavy Duty Silk Bag', 79.1, NULL, 'Tenetur rerum quam quisquam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(478, 'Synergistic Bronze Lamp', 63.5, NULL, 'Et eaque rerum ea aliquid enim.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(479, 'Synergistic Aluminum Gloves', 29.7, NULL, 'Similique id sit deserunt.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(480, 'Ergonomic Marble Keyboard', 1.7, NULL, 'Omnis est omnis quis autem dolor dolorum aliquam.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 2),
(481, 'Fantastic Plastic Chair', 58.7, NULL, 'Molestias occaecati quia qui atque.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3),
(482, 'Awesome Rubber Table', 81.8, NULL, 'Saepe quos reiciendis impedit nihil eveniet.', '2024-07-10 02:10:42', '2024-07-10 02:10:42', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`) VALUES
(1, 1, 'be9056cd-fd4b-4869-83f1-068675e14991_khoc.jpg'),
(2, 1, '75e1223e-3326-482d-b903-d7c04b054c58_h.png'),
(3, 1, 'b46312dd-39b3-4c99-a1a6-355de7ea3a15_haha.jpg'),
(4, 1, 'f639b430-4d58-41c8-b620-1824876de628_010.jpg'),
(5, 1, '23743d1b-db95-461c-9314-f3468b862271_009.jpg'),
(6, 2, 'c59c66a5-afe8-459e-8775-eefe832f4db0_010.jpg'),
(7, 2, '9a7f5f45-59d7-4700-be53-4ac16374dc5a_009.jpg'),
(8, 2, 'a05d64b9-d673-4d8a-b90e-8332800f851a_008.jpg'),
(9, 2, '4207e90b-940a-4873-9fb9-2f1f24e14ae5_007.jpg'),
(10, 2, '882d39f0-e127-4098-9790-608292db7850_006.jpg'),
(11, 3, 'd6348e02-27bd-417a-ad9b-61622b779a0f_014.jpg'),
(12, 3, '81f20d24-3aa5-4202-921e-92bbab1f8579_013.jpg'),
(13, 3, 'bde83a05-3068-461a-af79-0462148528ca_012.jpg'),
(14, 3, 'fe3e2bd4-b263-46fd-a971-ce43ea46a996_011.jpg'),
(15, 5, 'e5c1f5d6-37a6-4004-9d41-eb179ade5c49_019.jpg'),
(16, 5, '61afa255-2167-4aa4-9733-99554be53396_018.jpg'),
(17, 5, '555d4539-1356-4512-b6b3-9344c7e03a39_017.jpg'),
(18, 5, 'a064fc49-896d-4936-8ea3-bbdbb7a2ccec_016.jpg'),
(19, 5, '7f8d798f-fddb-4d00-a2c9-8841043277b8_015.jpg'),
(20, 6, '25dc7977-5aa6-4cef-9420-a6f4ae8cc689_023.jpg'),
(21, 6, '87194b2d-4ecd-49c5-9ec6-18e68417d962_022.jpg'),
(22, 6, '655aacea-27a0-4a60-a797-572b5af39454_021.jpg'),
(23, 6, '14f55a99-49a2-4adc-a8c7-cf40a4e687d0_020.jpg'),
(24, 7, '57fab8b4-58f4-4ac7-89aa-cd2407354cfd_027.jpg'),
(25, 7, '89968d14-b311-4bd7-85a6-752d84967c82_026.jpg'),
(26, 7, '2d2c1554-a180-481a-9ce7-58cd9d1bdb38_025.jpg'),
(27, 7, '9be299ad-1481-4757-808f-8f5193864fc2_024.jpg'),
(28, 8, '33406087-a98e-48ee-9d8f-5f7b99400421_031.jpg'),
(29, 8, '1305d3a7-131d-49b6-a770-9cdf56c0c211_030.jpg'),
(30, 8, '886a61f3-440c-4ba9-a89b-5b3b052219ae_029.jpg'),
(31, 8, '4f8a281e-54aa-4a9d-9b6f-c28417264271_028.jpg'),
(32, 9, '3a8fd754-d97f-4523-b4bf-7aa137e1e8e3_035.jpg'),
(33, 9, 'e0b479b1-5e1a-4ed4-a928-f9a500532163_034.jpg'),
(34, 9, '7ad52e0e-b0be-40c2-b995-0d271cd4001f_033.jpg'),
(35, 9, '99b8d988-dcf0-4e51-829d-d15ad7d42f49_032.jpg'),
(36, 10, '9a329768-eaad-4b22-8daf-8884630dcfa2_039.jpg'),
(37, 10, '17a2f930-d212-40ae-aefa-27513301b3cf_038.jpg'),
(38, 10, '31eb32a2-c0e0-4e36-b00d-a3fc1df7f065_037.jpg'),
(39, 10, 'ee227e94-6c5a-4411-afea-051c82681f04_036.jpg'),
(40, 11, 'b598282f-d321-404c-87f2-74b9a93054c1_043.jpg'),
(41, 11, '54762431-4b70-446a-b59b-108781be3f83_042.jpg'),
(42, 11, '59a3d880-f660-430b-98d7-9706d47ea8bf_041.jpg'),
(43, 11, '86ada772-f45a-462c-a65e-4d835b30cd00_040.jpg'),
(44, 12, '78488af6-8991-45f4-95b3-e72572ea1c22_047.jpg'),
(45, 12, '3206ff7f-5fe7-4357-973d-196b1373a4ee_046.jpg'),
(46, 12, 'e8695aaa-1e37-4ac7-ae83-4545af11d2fc_045.jpg'),
(47, 12, '7e75e94f-9060-4c46-890f-56123722cd99_044.jpg'),
(48, 13, '3729d767-d2a0-42a4-a5ab-8ec821b15647_051.jpg'),
(49, 13, 'e3fc70f1-e955-4fd7-8554-6eb595a2f788_050.jpg'),
(50, 13, '95c36b9f-58a4-4a10-827b-3de7f5707965_049.jpg'),
(51, 13, '610a7545-70ce-4154-bcd9-7798512065bc_048.jpg'),
(52, 14, '74a04e31-1fc4-4480-8e1e-d847e5ad7af9_055.jpg'),
(53, 14, 'd534abe0-521a-4f48-8fcb-314e424244f5_054.jpg'),
(54, 14, '9e2f078e-3d29-47da-894d-fa9308c94ac0_053.jpg'),
(55, 14, 'eea8ccbc-2e8b-4d0b-b929-4efc068bfba3_052.jpg'),
(56, 15, 'df0aa3a2-cb69-4e32-8009-5a35b64d419b_059.jpg'),
(57, 15, '6175cb9e-a8c2-46f0-a7ff-95adf088ce62_058.jpg'),
(58, 15, '40694d19-b22c-458b-b090-e1c60c2ad7d5_057.jpg'),
(59, 15, 'ea087dac-24bd-4b91-898b-c089bbb16993_056.jpg'),
(60, 16, '62bb77b4-60dd-4a7b-b80f-21b32a65bdd7_063.jpg'),
(61, 16, '99fedd68-8235-4b5c-a03e-295cab8927ff_062.jpg'),
(62, 16, '600cd7ec-da7d-4bb2-9301-e1df9adb8e2e_061.jpg'),
(63, 16, '14fc594f-f081-41a4-9367-c509b7e5d73e_060.jpg'),
(64, 17, '3c39c519-6320-436e-85d2-9719839967c9_067.jpg'),
(65, 17, '59ea5e03-2242-4c7c-9627-322e521d1f19_066.jpg'),
(66, 17, '73153fbc-4b3e-4636-b4da-daa531803e54_065.jpg'),
(67, 17, '6abd30e8-645d-4b79-a0ca-7149cc23f083_064.jpg'),
(68, 18, 'd04397f9-31c9-4ae4-853f-89385669f681_071.jpg'),
(69, 18, '7f3832ec-5200-4d24-b84b-2597780562c5_070.jpg'),
(70, 18, '31bffcf5-4e3f-4b18-b2e2-7753eb9e8d22_069.jpg'),
(71, 18, '428f106b-28e4-4295-9a4d-cd9d9a113865_068.jpg'),
(72, 19, '618c325b-972c-47cf-ba28-e9a9f7f82dd8_075.jpg'),
(73, 19, 'de157a39-5921-4716-9fa2-d36c9652aa48_074.jpg'),
(74, 19, '38e55e8a-e722-46f1-95a6-d0e8d43ccd5d_073.jpg'),
(75, 19, 'a6ebd89f-f09a-4abe-9acd-80908373f5c8_072.jpg'),
(76, 20, '1f6dd4ca-86ae-4e44-a1a3-b661e39832bf_079.jpg'),
(77, 20, 'c2f5d2e9-b259-4428-ad81-44fe5a8f99ef_078.jpg'),
(78, 20, '1b5c7540-d2aa-4aa1-b6ad-e901801ee8b0_077.jpg'),
(79, 20, '29bc9931-88c0-40b1-adfb-070466f05bc3_076.jpg'),
(80, 21, '335056f4-3c5d-4a95-be7d-34f243de2447_083.jpg'),
(81, 21, '248761a2-e206-4f16-ab56-81735a63108b_082.jpg'),
(82, 21, '3dab8c9d-eec9-456f-a67c-867a71489d92_081.jpg'),
(83, 21, 'bc1594cc-5ec6-44a2-82a0-f9f03511bb6c_080.jpg'),
(84, 22, '7d18045e-2fe8-4b1d-ada8-244cf3fbf419_087.jpg'),
(85, 22, 'c5941e8d-375d-41b9-822f-7c451769ab8b_086.jpg'),
(86, 22, '203763b2-0ec5-4c36-b23a-a08fea78d28d_085.jpg'),
(87, 22, 'c5a619c6-457b-431e-ab4b-587b847d11f9_084.jpg'),
(88, 23, '78ee968a-bd3e-483f-9689-f89d6de40a05_091.jpg'),
(89, 23, 'b3724233-39bf-4503-a7b9-2c54369b49b4_090.jpg'),
(90, 23, '247720cb-831a-4bdb-bb9a-628842b734ac_089.jpg'),
(91, 23, '38b4bbcd-88a1-4e22-89a0-13c1e423d24b_088.jpg'),
(92, 24, '813f5d99-e483-4a38-8fa0-300bb3786072_095.jpg'),
(93, 24, 'bb8b934f-fffa-4bf6-a97b-192f709fa4b5_094.jpg'),
(94, 24, '6fc26eed-c9ec-4e2c-9b01-acc01ecb2671_093.jpg'),
(95, 24, 'a1ec7097-fb3d-4e42-b4e1-7cd8a8ee0d55_092.jpg'),
(96, 25, '446e8eb7-57d4-42a3-8a0a-d0e542bb1c42_099.jpg'),
(97, 25, 'a9c77e08-c45d-4f65-bbd0-60ded67a4b7b_098.jpg'),
(98, 25, '8640962c-dd49-46a9-897f-f59a9605668a_097.jpg'),
(99, 25, '35aaf8fc-758d-4220-ab75-51feaef0df67_096.jpg'),
(100, 26, 'aa7a6b5a-3321-4657-8db8-039714ee6bbc_0103.jpg'),
(101, 26, '3b32f2bf-b1e8-420f-bb37-1d1cad585d1f_0102.jpg'),
(102, 26, '8d2403b8-5ed6-4246-8cd1-50ae16e49c41_0101.jpg'),
(103, 26, '25de140a-fa69-4251-9350-62353ebca7cd_0100.jpg'),
(104, 27, 'a32eb6c3-abb1-4d4a-97ae-20c1c81c4089_0107.jpg'),
(105, 27, '2122df59-2de5-4e82-82f4-fc3241a69bb4_0106.jpg'),
(106, 27, '3c9363eb-c57e-4656-a82b-c16f3c1d5cba_0105.jpg'),
(107, 27, 'ee1cc0e7-6b4c-4ec8-9723-4fdd8f002773_0104.jpg'),
(108, 28, '2bfee0ed-abed-4d17-84f1-bb4a4a9d6d2d_0111.jpg'),
(109, 28, '3ffac17a-b178-452c-97fa-d55446a01beb_0110.jpg'),
(110, 28, '44017ac0-1b59-4dee-b558-52b0773930ce_0109.jpg'),
(111, 28, '1eee4039-5eb6-4d59-9067-6c96c580fd58_0108.jpg'),
(112, 29, '86b002ca-18af-415f-9782-dd440ccf0fb1_0115.jpg'),
(113, 29, 'c069f28a-292a-4cca-8158-ffaa0ef21de7_0114.jpg'),
(114, 29, '16e47da2-43d9-4ea4-a04f-9fc3590e0123_0113.jpg'),
(115, 29, '3e848059-0253-464b-b74e-0f6f2de42299_0112.jpg'),
(116, 30, '24c5e597-12f0-4cfe-818d-30c4e7fac5a8_0119.jpg'),
(117, 30, 'edcb70d8-c378-4dfb-99f9-b408792283e9_0118.jpg'),
(118, 30, 'ccb4fce8-33db-4c53-9c24-80133fc8526d_0117.jpg'),
(119, 30, 'ea4f8c0d-3863-4228-8ec1-cfc6b115fbca_0116.jpg'),
(120, 31, '6b51d390-9789-41b3-b22c-1fc230d66beb_0123.jpg'),
(121, 31, '1e6130d6-4150-4f55-b170-5eab9905f37e_0122.jpg'),
(122, 31, '94af109f-40c8-4907-8f71-db46a609276e_0121.jpg'),
(123, 31, '0c4a8bc7-f70f-4797-a687-7eb7b510e282_0120.jpg'),
(124, 32, '248544c9-cda4-49eb-b411-53372ff98902_0127.jpg'),
(125, 32, '927c4db5-fe62-4b94-966c-2aca4d469801_0126.jpg'),
(126, 32, 'ba52cbc0-e647-4f1d-b38b-f504e042a76e_0125.jpg'),
(127, 32, 'bf8e567e-3665-44c8-a146-9ec4189d1d2f_0124.jpg'),
(128, 33, '594fddc1-868f-47dd-9c1e-0c7d660fd53e_0131.jpg'),
(129, 33, '7c6bb8af-2830-4aa3-8bef-fe690b79eb10_0130.jpg'),
(130, 33, 'f5eae95b-753d-4a2d-a3e4-49fdf59bc286_0129.jpg'),
(131, 33, 'e7b8b73a-b969-4be4-bfc0-cece49c03654_0128.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'user'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `provider` varchar(20) NOT NULL COMMENT 'Tên nhà social network',
  `provider_id` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL COMMENT 'Email tài khoản',
  `name` varchar(100) NOT NULL COMMENT 'Tên người dùng',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) NOT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT '',
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_of_birth` date DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone_number`, `address`, `password`, `created_at`, `updated_at`, `is_active`, `date_of_birth`, `facebook_account_id`, `google_account_id`, `role_id`) VALUES
(2, 'Nguyễn Văn A', '012345678', 'Nhà a ngõ b', '$2a$10$iVjRomC190c2FljEkfmMzOIrcE2eBzLm5H/NQv/cEqItAMY5nYoOm', '2024-07-16 15:10:57', '2024-07-16 15:10:57', 0, '2004-10-31', 0, 0, 2),
(4, 'Tài khoản Admin 1', '11223344', 'đây là admin', '$2a$10$I2KyUuk1mEpfbZeM4NACWemzUnhL/7IPodR3/UXEcdD6SsbjgHQS.', '2024-07-26 01:49:48', '2024-07-26 01:49:48', 0, '1999-10-31', 0, 0, 2),
(6, 'nguyen van test', '33445566', 'vcl 123', '$2a$10$ALs7IfnCYj9Sh303fioo7eXM5ftUdovXNiiyqNJqRMw/WjhsQCyAy', '2024-08-11 09:25:50', '2024-08-11 09:25:50', 0, '2006-08-11', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_images_product_id` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
