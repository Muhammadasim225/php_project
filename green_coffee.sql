-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 09:07 AM
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
-- Database: `green_coffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `profile`) VALUES
('A0wxZ0HE99R4hmYd31yg', 'Faraz Ali', 'farazali@gmail.com', '2fc69fc00ff2cda5b9667d4a3989556eb1e2c280', '02.jpg'),
('ce8IuZvkapsrnbFU5Nug', 'Shahazad Khan', 'khan@gmail.com', '3d3cfc160cb8c834c62e61a6d26cd66cb6279b61', '02.jpg'),
('hFLVcfRnSrmKTtMD2rIG', 'Muhammad Abdullah', 'abdullah@gmail.com', '9bedad947e2454ba2fa8fd33e5911f84c0cdcf43', '02.jpg'),
('kvVAxKDYZz7mYcdjmR2Q', 'Muhammad Arsalan', 'arsalan23@gmail.com', '2efe429815b9ebd4a34fd6631aa953285d704b48', '02.jpg'),
('ska0cV7dSpQPdZmQLP8Z', 'Ali Ahmed', 'aliahmed@gmail.com', '9c7478e0ce3e1d701ffebc2eb29fce4958c23fdd', '02.jpg'),
('TkItBWdnv1G86XEAcKtA', 'Haider Ali', 'haider123@gmail.com', '62648096b3c6834a239da93ddebf66cb3aeb9e48', '02.jpg'),
('xm8qo4oYpt33HugorbRM', 'Ali Hassan Lodhi', 'ali12@gmail.com', '5d210094dbd7c236266cd3d5b7e5a1d3257970bb', '02.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `qty` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `name`, `email`, `subject`, `message`) VALUES
('0', '0', 'mahi', 'mahinazir@gmail.com', 'shop', 'good'),
('0', '0', 'mahi', 'mahinazir@gmail.com', 'shop', 'good'),
('0', '0', 'mahi', 'mahinazir@gmail.com', 'shop', 'good'),
('0', '0', 'mahi', 'mahinazir@gmail.com', 'shop', 'good');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_type` varchar(10) NOT NULL,
  `method` varchar(50) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(10) NOT NULL,
  `qty` varchar(2) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `address`, `address_type`, `method`, `product_id`, `price`, `qty`, `date`, `status`, `payment_status`) VALUES
('JDH7389HCHDJ983HD', 'JH873HDJDH8394JD', 'John Doe', 2147483647, 'johndoe@example.com', '123 Main St, Anytown, USA', 'home', 'credit card', 'ABC123', 50, '2', '2024-05-15', 'in progress', 'complete'),
('KDJD8393DJJDJ8392J', 'KJH8394JDHJDJH928', 'Jane Smith', 1234567890, 'janesmith@example.com', '456 Oak Ave, Othertown, USA', 'work', 'paypal', 'DEF456', 30, '1', '2024-05-14', 'in progress', 'pending'),
('JDH8392JHDJH8392HD', 'HJD8392JHDJH8392J', 'Bob Brown', 2147483647, 'bobbrown@example.com', '321 Pine St, Othercity, USA', 'home', 'credit card', 'JKL012', 20, '1', '2024-05-12', 'in progress', 'unpaid'),
('KDJH8392HDJ8392JH', 'KJH8392JHDJH8392J', 'Emily Davis', 2147483647, 'emilydavis@example.com', '987 Cedar St, Anothercity, USA', 'work', 'credit card', 'MNO345', 60, '2', '2024-05-11', 'canceled', 'paid'),
('HJD8392JHDJ8392JH', 'HJD8392JHDJ8392JH', 'Michael Wilson', 2147483647, 'michaelwilson@example.com', '654 Birch St, Somewhere, USA', 'home', 'paypal', 'PQR678', 80, '1', '2024-05-10', 'canceled', 'paid'),
('HJD8392HDJ8392JHD', 'KJH8392JHDJ8392J', 'Sarah Garcia', 2147483647, 'sarahgarcia@example.com', '741 Maple St, Anywhere, USA', 'work', 'cash on delivery', 'STU901', 100, '2', '2024-05-09', 'in progress', '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` varchar(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` int(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_detail` varchar(1000) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `product_detail`, `status`) VALUES
('psX13QGqylJbBUauFTVy', 'green coffee beans', 2000, '4.webp', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus dignissimos repellendus veritatis corrupti facere perferendis quam ipsam dolore laboriosam rerum ipsa nam alias, iste sequi expedita non consectetur! Iusto animi obcaecati minus odio officia! Alias aut ad dolorum officia enim vero quam accusamus cumque hic ex sequi, voluptas assumenda, ea recusandae sint commodi saepe! Minima provident tempore at consectetur ea illo ad sed animi numquam suscipit asperiores corrupti assumenda quis nihil, sapiente dicta ex quaerat, quas molestias excepturi maiores possimus ducimus mollitia! Animi eos, reiciendis corporis rem natus magnam omnis quia accusantium, molestias at nulla impedit ipsum nam nemo odio fuga! Corporis sit repudiandae ullam distinctio eius doloribus nostrum, debitis similique dicta. Minima vel nulla saepe, dignissimos, sunt quod possimus corporis numquam ratione, eveniet perferendis sequi porro similique eum excepturi nisi. Temporibus praesentium, adipisci hic vitae im', 'active'),
('S33CIlqHoXQlAvhCZPQK', 'green tea', 300, 'about0.jfif', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloribus dignissimos repellendus veritatis corrupti facere perferendis quam ipsam dolore laboriosam rerum ipsa nam alias, iste sequi expedita non consectetur! Iusto animi obcaecati minus odio officia! Alias aut ad dolorum officia enim vero quam accusamus cumque hic ex sequi, voluptas assumenda, ea recusandae sint commodi saepe! Minima provident tempore at consectetur ea illo ad sed animi numquam suscipit asperiores corrupti assumenda quis nihil, sapiente dicta ex quaerat, quas molestias excepturi maiores possimus ducimus mollitia! Animi eos, reiciendis corporis rem natus magnam omnis quia accusantium, molestias at nulla impedit ipsum nam nemo odio fuga! Corporis sit repudiandae ullam distinctio eius doloribus nostrum, debitis similique dicta. Minima vel nulla saepe, dignissimos, sunt quod possimus corporis numquam ratione, eveniet perferendis sequi porro similique eum excepturi nisi. Temporibus praesentium, adipisci hic vitae im', 'active'),
('suMvBc771TowntRmppPW', 'Macroniiiiiii', 500, '1.jpg', 'loremdddddddddddddddddddddddddddddddsd', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
('uosjkIXMJSI18281JCK9', 'Sheraz Baig', 'sheraz@example.com', 'baig01829@@@', 'user'),
('UO1839jsiUOJDD192jaQ', 'Saifullah Khan ', 'saifullah@example.com', 'saifullah0881', 'user'),
('jdkQIUD89392Qovo928j', ' Kamranullah ', 'kamran@example.com', 'kamranwaziristan', 'user'),
('jk92927UQIJV197794iq', 'Naqibullah ', 'naqibzada@example.com', 'naqibullahnuml', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
