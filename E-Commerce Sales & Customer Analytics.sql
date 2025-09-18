-- ====================================================
-- E-Commerce Sales & Customer Analytics
-- ====================================================

DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ecommerce_db;

-- TABLES
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    signup_date DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(100),
    price DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    payment_method VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_date DATE,
    review_text TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- CUSTOMERS (25)
INSERT INTO Customers (name, gender, age, city, signup_date) VALUES
('Amit Sharma','Male',28,'Mumbai','2023-02-15'),
('Priya Verma','Female',32,'Delhi','2023-03-12'),
('Ravi Kumar','Male',40,'Bangalore','2022-11-05'),
('Sneha Iyer','Female',26,'Chennai','2023-07-19'),
('Arjun Singh','Male',35,'Hyderabad','2022-12-01'),
('Neha Patel','Female',29,'Ahmedabad','2023-01-20'),
('Karan Joshi','Male',31,'Pune','2023-04-10'),
('Divya Rao','Female',24,'Kolkata','2023-05-06'),
('Manish Deshpande','Male',38,'Nagpur','2022-09-14'),
('Sonal Mehta','Female',27,'Surat','2023-06-22'),
('Vikram Gupta','Male',45,'Noida','2021-12-03'),
('Anjali Sen','Female',30,'Kochi','2023-08-01'),
('Rohit Patel','Male',33,'Vadodara','2022-10-28'),
('Pooja Sharma','Female',22,'Indore','2023-09-05'),
('Deepak Nair','Male',36,'Thiruvananthapuram','2022-08-20'),
('Meera Kapoor','Female',34,'Jodhpur','2023-02-28'),
('Sahil Khan','Male',29,'Lucknow','2023-03-30'),
('Tina Dutta','Female',26,'Patna','2023-07-04'),
('Ankit Verma','Male',27,'Bhopal','2023-05-18'),
('Ritu Goyal','Female',31,'Raipur','2023-04-25'),
('Naveen Reddy','Male',39,'Vijayawada','2022-11-30'),
('Isha Anand','Female',28,'Varanasi','2023-06-03'),
('Sunil Bansal','Male',44,'Dehradun','2021-11-11'),
('Kavita Joshi','Female',35,'Amritsar','2022-12-21'),
('Mohan Yadav','Male',41,'Gorakhpur','2023-01-08');

-- PRODUCTS (20)
INSERT INTO Products (category, sub_category, product_name, price) VALUES
('Electronics','Mobile','iPhone 14',80000.00),
('Electronics','Laptop','Dell XPS 13',95000.00),
('Electronics','Accessory','Samsung Earbuds',5000.00),
('Fashion','Clothing','Levi’s Jeans',3500.00),
('Fashion','Footwear','Nike Running Shoes',7000.00),
('Home & Kitchen','Appliances','Philips Mixer',4500.00),
('Home & Kitchen','Cookware','Prestige Non-stick Pan',2200.00),
('Beauty','Skincare','L’Oreal Face Cream',1200.00),
('Beauty','Makeup','Maybelline Mascara',550.00),
('Sports','Fitness','Fitbit Band',9000.00),
('Books','Fiction','The Alchemist',350.00),
('Books','Education','Data Science Handbook',1200.00),
('Grocery','Beverage','Nescafe Coffee Jar',400.00),
('Toys','Kids','Lego Set',4500.00),
('Furniture','Living','Wooden Study Table',12000.00),
('Stationery','Office','Pilot Pen Pack',250.00),
('Automotive','Accessory','Car Air Freshener',300.00),
('Jewellery','Fashion','Silver Pendant',2500.00),
('Baby','Care','Pampers Pack',800.00),
('Health','Wellness','Yoga Mat',1200.00);

-- ORDERS: explicit order_id values 1..60 so child inserts can safely reference them
INSERT INTO Orders (order_id, customer_id, order_date, order_status, payment_method) VALUES
(1,1,'2023-01-15','Completed','UPI'),
(2,2,'2023-01-18','Completed','Credit Card'),
(3,3,'2023-02-02','Completed','Net Banking'),
(4,4,'2023-02-10','Cancelled','UPI'),
(5,5,'2023-02-18','Completed','Debit Card'),
(6,6,'2023-03-01','Completed','UPI'),
(7,7,'2023-03-05','Pending','Credit Card'),
(8,8,'2023-03-12','Completed','UPI'),
(9,9,'2023-03-20','Completed','Net Banking'),
(10,10,'2023-03-22','Completed','COD'),
(11,11,'2023-04-02','Completed','Credit Card'),
(12,12,'2023-04-08','Completed','UPI'),
(13,13,'2023-04-18','Completed','Debit Card'),
(14,14,'2023-04-25','Completed','Credit Card'),
(15,15,'2023-05-01','Pending','Net Banking'),
(16,16,'2023-05-05','Completed','UPI'),
(17,17,'2023-05-12','Completed','Debit Card'),
(18,18,'2023-05-18','Completed','Credit Card'),
(19,19,'2023-06-03','Completed','UPI'),
(20,20,'2023-06-10','Completed','Debit Card'),
(21,21,'2023-06-14','Completed','UPI'),
(22,22,'2023-06-20','Completed','Credit Card'),
(23,23,'2023-07-01','Completed','Net Banking'),
(24,24,'2023-07-09','Completed','UPI'),
(25,25,'2023-07-15','Completed','Debit Card'),
(26,1,'2023-07-20','Completed','Credit Card'),
(27,2,'2023-07-22','Completed','UPI'),
(28,3,'2023-07-25','Completed','Debit Card'),
(29,4,'2023-08-02','Completed','Net Banking'),
(30,5,'2023-08-05','Completed','UPI'),
(31,6,'2023-08-10','Completed','Credit Card'),
(32,7,'2023-08-12','Pending','COD'),
(33,8,'2023-08-15','Completed','UPI'),
(34,9,'2023-08-18','Completed','Debit Card'),
(35,10,'2023-08-20','Completed','Credit Card'),
(36,11,'2023-08-22','Completed','UPI'),
(37,12,'2023-08-25','Completed','Credit Card'),
(38,13,'2023-09-01','Completed','Debit Card'),
(39,14,'2023-09-05','Completed','UPI'),
(40,15,'2023-09-10','Completed','Net Banking'),
(41,16,'2023-09-12','Completed','Credit Card'),
(42,17,'2023-09-15','Completed','UPI'),
(43,18,'2023-09-18','Completed','Debit Card'),
(44,19,'2023-09-20','Cancelled','UPI'),
(45,20,'2023-09-22','Completed','Credit Card'),
(46,21,'2023-09-25','Completed','UPI'),
(47,22,'2023-10-01','Pending','Net Banking'),
(48,23,'2023-10-05','Completed','Debit Card'),
(49,24,'2023-10-10','Completed','UPI'),
(50,25,'2023-10-15','Completed','Credit Card'),
(51,1,'2023-10-20','Completed','UPI'),
(52,2,'2023-10-25','Completed','Debit Card'),
(53,3,'2023-11-01','Completed','Credit Card'),
(54,4,'2023-11-05','Completed','UPI'),
(55,5,'2023-11-10','Completed','Net Banking'),
(56,6,'2023-11-12','Completed','UPI'),
(57,7,'2023-11-15','Completed','Debit Card'),
(58,8,'2023-11-18','Completed','Credit Card'),
(59,9,'2023-11-20','Completed','UPI'),
(60,10,'2023-11-22','Completed','Debit Card');

-- Ensure AUTO_INCREMENT continues after explicit ids
ALTER TABLE Orders AUTO_INCREMENT = 61;

-- ORDER_DETAILS (all order_id values 1..60, product_id 1..20)
INSERT INTO Order_Details (order_id, product_id, quantity, discount, total_amount) VALUES
(1,1,1,5.00,0),
(1,3,2,0.00,0),
(2,2,1,8.00,0),
(3,11,2,0.00,0),
(4,6,1,0.00,0),
(5,4,1,10.00,0),
(6,10,1,0.00,0),
(6,2,1,0.00,0),
(7,5,1,0.00,0),
(8,7,2,0.00,0),
(8,4,1,0.00,0),
(9,12,1,0.00,0),
(9,3,1,0.00,0),
(10,13,3,0.00,0),
(10,5,1,0.00,0),
(11,15,1,0.00,0),
(11,1,1,0.00,0),
(12,8,2,0.00,0),
(12,6,1,0.00,0),
(13,9,1,0.00,0),
(13,7,1,0.00,0),
(14,14,1,5.00,0),
(14,2,1,0.00,0),
(15,16,4,0.00,0),
(15,3,1,0.00,0),
(16,17,2,0.00,0),
(16,9,1,0.00,0),
(17,18,1,0.00,0),
(17,4,2,0.00,0),
(18,19,2,0.00,0),
(18,8,1,0.00,0),
(19,20,1,0.00,0),
(19,12,1,0.00,0),
(20,1,1,5.00,0),
(20,14,1,0.00,0),
(21,2,1,0.00,0),
(21,13,2,0.00,0),
(22,3,2,0.00,0),
(22,15,1,0.00,0),
(23,4,1,0.00,0),
(23,16,1,0.00,0),
(24,5,1,0.00,0),
(24,17,1,0.00,0),
(25,6,1,0.00,0),
(25,18,1,0.00,0),
(26,7,1,0.00,0),
(26,19,1,0.00,0),
(27,8,1,0.00,0),
(27,20,1,0.00,0),
(28,9,2,0.00,0),
(28,1,1,0.00,0),
(29,10,1,10.00,0),
(29,6,1,0.00,0),
(30,11,2,0.00,0),
(30,10,1,0.00,0),
(31,12,1,0.00,0),
(31,11,1,0.00,0),
(32,13,3,0.00,0),
(32,5,1,0.00,0),
(33,14,1,0.00,0),
(33,7,1,0.00,0),
(34,15,1,0.00,0),
(34,8,1,0.00,0),
(35,16,2,0.00,0),
(35,9,1,0.00,0),
(36,17,1,0.00,0),
(36,2,1,0.00,0),
(37,18,1,0.00,0),
(37,3,1,0.00,0),
(38,19,1,0.00,0),
(38,4,1,0.00,0),
(39,20,1,0.00,0),
(39,14,1,0.00,0),
(40,1,1,0.00,0),
(40,6,1,0.00,0),
(41,2,1,5.00,0),
(41,13,1,0.00,0),
(42,3,1,0.00,0),
(42,5,1,0.00,0),
(43,4,2,0.00,0),
(43,7,1,0.00,0),
(44,5,1,0.00,0),
(44,16,1,0.00,0),
(45,6,1,2.00,0),
(45,11,1,0.00,0),
(46,7,1,0.00,0),
(46,18,1,0.00,0),
(47,8,1,0.00,0),
(47,9,1,0.00,0),
(48,9,1,0.00,0),
(48,2,1,0.00,0),
(49,10,1,0.00,0),
(49,15,1,0.00,0),
(50,11,1,0.00,0),
(50,12,1,0.00,0),
(51,12,1,0.00,0),
(51,1,1,0.00,0),
(52,13,2,0.00,0),
(52,17,1,0.00,0),
(53,14,1,0.00,0),
(53,3,1,0.00,0),
(54,15,1,0.00,0),
(54,6,1,0.00,0),
(55,16,1,0.00,0),
(55,10,1,0.00,0),
(56,17,1,0.00,0),
(56,8,1,0.00,0),
(57,18,1,0.00,0),
(57,4,1,0.00,0),
(58,19,2,0.00,0),
(58,13,1,0.00,0),
(59,20,1,0.00,0),
(59,5,1,0.00,0),
(60,1,1,0.00,0),
(60,14,1,0.00,0);

-- Compute total_amount correctly (price * quantity * (1 - discount/100))
UPDATE Order_Details od
JOIN Products p ON od.product_id = p.product_id
SET od.total_amount = ROUND(p.price * od.quantity * (1 - od.discount/100), 2);

-- REVIEWS
INSERT INTO Reviews (customer_id, product_id, rating, review_date, review_text) VALUES
(1,1,5,'2023-01-18','Great phone, excellent camera.'),
(2,2,4,'2023-01-20','Good laptop for office work.'),
(3,11,5,'2023-02-05','Loved the book! Inspiring.'),
(4,6,4,'2023-02-12','Mixer works well for small families.'),
(5,4,3,'2023-02-20','Jeans fit was average.'),
(6,10,4,'2023-03-03','Fitbit is decent for tracking.'),
(7,5,5,'2023-03-07','Running shoes are comfortable.'),
(8,7,4,'2023-03-14','Pan is non-stick as advertised.'),
(9,12,5,'2023-03-25','Very informative for data science learners.'),
(10,13,4,'2023-03-26','Coffee aroma is good.'),
(11,15,4,'2023-04-05','Study table is sturdy.'),
(12,8,3,'2023-04-10','Face cream is okay for daily use.'),
(13,9,4,'2023-04-20','Mascara gives good volume.'),
(14,14,5,'2023-04-28','Kids loved the Lego set.'),
(15,16,4,'2023-05-02','Pens write smoothly.'),
(16,17,3,'2023-05-06','Air freshener fragrance fades quickly.'),
(17,18,5,'2023-05-14','Pendant looks beautiful.'),
(18,19,4,'2023-05-20','Pampers are absorbent.'),
(19,20,4,'2023-06-05','Yoga mat has good grip.'),
(20,1,4,'2023-06-12','Phone is fast but expensive.'),
(21,2,4,'2023-06-16','Good build and display.'),
(22,3,3,'2023-06-25','Earbuds battery life average.'),
(23,4,5,'2023-07-03','Jeans are durable.'),
(24,5,4,'2023-07-11','Shoes are lightweight.'),
(25,6,5,'2023-07-17','Mixer is powerful.'),
(1,7,4,'2023-07-21','Cookware heating is even.'),
(2,8,4,'2023-07-23','Nice face cream.'),
(3,9,3,'2023-07-26','Mascara clumps a little.'),
(4,10,4,'2023-08-03','Fitness band accurate.'),
(5,11,5,'2023-08-07','Great story.'),
(6,12,4,'2023-08-11','Great resource.'),
(7,13,4,'2023-08-15','Coffee tastes good.'),
(8,14,5,'2023-08-16','Lego quality is top notch.'),
(9,15,4,'2023-08-19','Nice table for study.'),
(10,16,3,'2023-08-23','Pens fade a bit.'),
(11,17,2,'2023-08-24','Fragrance too strong.'),
(12,18,5,'2023-08-28','Pendant is elegant.'),
(13,19,4,'2023-09-02','Good diapers.'),
(14,20,4,'2023-09-07','Mat is comfortable.'),
(15,1,5,'2023-09-11','Excellent phone overall.'),
(16,2,4,'2023-09-13','Solid performer.'),
(17,3,3,'2023-09-16','Average earbuds.'),
(18,4,4,'2023-09-19','Good fit.'),
(19,5,5,'2023-09-21','Best shoes I bought.'),
(20,6,4,'2023-09-23','Mixer works fine.'),
(21,7,4,'2023-09-26','Pan cooks evenly.'),
(22,8,3,'2023-09-28','Skin felt okay.'),
(23,9,4,'2023-10-02','Mascara lasts long.'),
(24,10,5,'2023-10-06','Useful band.'),
(25,11,5,'2023-10-12','Loved it!'),
(1,12,4,'2023-10-20','Helpful book.');

-- 1) Total number of customers
SELECT COUNT(*) AS total_customers FROM Customers;

-- 2) Total number of products
SELECT COUNT(*) AS total_products FROM Products;

-- 3) Total number of completed orders
SELECT COUNT(*) AS completed_orders
FROM Orders
WHERE order_status = 'Completed';

-- 4) Total revenue (sum of total_amount for completed orders)
SELECT IFNULL(SUM(od.total_amount),0) AS total_revenue
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
WHERE o.order_status = 'Completed';

-- 5) Monthly revenue (year-month) — simple GROUP BY
SELECT YEAR(o.order_date) AS year, MONTH(o.order_date) AS month, ROUND(SUM(od.total_amount),2) AS revenue
FROM Orders o
JOIN Order_Details od ON o.order_id = od.order_id
WHERE o.order_status = 'Completed'
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;

-- 6) Top 5 cities by number of customers
SELECT city, COUNT(*) AS customers
FROM Customers
GROUP BY city
ORDER BY customers DESC
LIMIT 5;

-- 7) Top 5 products by total sales amount (simple JOIN + GROUP BY)
SELECT p.product_name, SUM(od.total_amount) AS product_sales
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
JOIN Orders o ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name
ORDER BY product_sales DESC
LIMIT 5;

-- 8) Average rating per product (simple)
SELECT p.product_name, ROUND(AVG(r.rating),2) AS avg_rating, COUNT(r.review_id) AS num_reviews
FROM Reviews r
JOIN Products p ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_rating DESC
LIMIT 10;

-- 9) Repeat customers (customers with >1 completed order)
SELECT o.customer_id, COUNT(o.order_id) AS completed_order_count
FROM Orders o
WHERE o.order_status = 'Completed'
GROUP BY o.customer_id
HAVING COUNT(o.order_id) > 1
ORDER BY completed_order_count DESC;

-- 10) Revenue by category (simple aggregation)
SELECT p.category, ROUND(SUM(od.total_amount),2) AS revenue
FROM Order_Details od
JOIN Products p ON od.product_id = p.product_id
JOIN Orders o ON od.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;