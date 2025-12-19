create database LittleLemonDB ;
use LittleLemonDB;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    Phone VARCHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(45) NOT NULL,
    LastName VARCHAR(45) NOT NULL,
    Role VARCHAR(45) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

CREATE TABLE Booking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    StaffID INT,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE MenuItem (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,  -- Cuisine, Starter, Main, Dessert, Drink
    Price DECIMAL(10,2) NOT NULL
);

CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

CREATE TABLE OrderItem (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID)
);

CREATE TABLE OrderDeliveryStatus (
    DeliveryStatusID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    Status VARCHAR(50) NOT NULL, -- e.g., Pending, Delivered
    DeliveryDate DATE,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID)
);

USE LittleLemonDB;

-- =====================================
-- 1. Customer Table Inserts
-- =====================================
INSERT INTO Customer (FirstName, LastName, Phone, Email) VALUES
('Htet', 'Naung', '0951234567', 'htetnaung@example.com'),
('Mya', 'Win', '0951234568', 'myawin@example.com'),
('Aung', 'Kyaw', '0951234569', 'aungkyaw@example.com'),
('Thiri', 'Htet', '0951234570', 'thirih@example.com'),
('Soe', 'Moe', '0951234571', 'soemoe@example.com'),
('Su', 'Lwin', '0951234572', 'sulwin@example.com'),
('Ei', 'Mon', '0951234573', 'eimon@example.com'),
('Zaw', 'Tun', '0951234574', 'zawtun@example.com'),
('Nandar', 'Htet', '0951234575', 'nandar@example.com'),
('Ko', 'Ko', '0951234576', 'koko@example.com'),
('May', 'Su', '0951234577', 'maysu@example.com'),
('Hla', 'Win', '0951234578', 'hlawin@example.com'),
('Kyaw', 'Min', '0951234579', 'kyawmin@example.com'),
('Phyo', 'Zaw', '0951234580', 'phyozaw@example.com'),
('Ei', 'Hnin', '0951234581', 'eihnin@example.com'),
('Min', 'Thu', '0951234582', 'minthu@example.com'),
('Shwe', 'Hla', '0951234583', 'shwehla@example.com'),
('Hnin', 'Ei', '0951234584', 'hninei@example.com'),
('Tun', 'Soe', '0951234585', 'tunsoe@example.com'),
('Su', 'Htet', '0951234586', 'suhtet@example.com'),
('Aye', 'Mon', '0951234587', 'ayemon@example.com'),
('Zin', 'Mar', '0951234588', 'zinmar@example.com'),
('Khin', 'Sandi', '0951234589', 'khinsandi@example.com'),
('Paing', 'Zin', '0951234590', 'paingzin@example.com'),
('Hlaing', 'Win', '0951234591', 'hlaingwin@example.com'),
('Nyein', 'Ei', '0951234592', 'nyeinei@example.com'),
('Thant', 'Zaw', '0951234593', 'thantzaw@example.com'),
('Htet', 'Aung', '0951234594', 'htetaung@example.com'),
('Yamin', 'Thu', '0951234595', 'yaminthu@example.com'),
('Thet', 'Naing', '0951234596', 'thetnaing@example.com');

-- =====================================
-- 2. Staff Table Inserts
-- =====================================
INSERT INTO Staff (FirstName, LastName, Role, Salary) VALUES
('Myo', 'Tun', 'Manager', 1200.00),
('Su', 'Htet', 'Chef', 1000.00),
('Hnin', 'Ei', 'Waiter', 500.00),
('Ko', 'Ko', 'Waiter', 500.00),
('Aye', 'Mon', 'Chef', 950.00),
('Zaw', 'Hla', 'Cleaner', 400.00),
('Thiri', 'Htet', 'Cashier', 450.00),
('Soe', 'Win', 'Chef', 900.00),
('May', 'Su', 'Waiter', 500.00),
('Paing', 'Zin', 'Manager', 1250.00),
('Kyaw', 'Min', 'Waiter', 500.00),
('Ei', 'Hnin', 'Cashier', 450.00),
('Shwe', 'Hla', 'Chef', 950.00),
('Htet', 'Aung', 'Cleaner', 400.00),
('Nandar', 'Htet', 'Waiter', 500.00),
('Thant', 'Zaw', 'Chef', 1000.00),
('Yamin', 'Thu', 'Waiter', 500.00),
('Khin', 'Sandi', 'Cashier', 450.00),
('Tun', 'Soe', 'Chef', 900.00),
('Zin', 'Mar', 'Cleaner', 400.00),
('Hlaing', 'Win', 'Manager', 1300.00),
('Min', 'Thu', 'Chef', 950.00),
('Aung', 'Kyaw', 'Waiter', 500.00),
('Phyo', 'Zaw', 'Waiter', 500.00),
('Ei', 'Mon', 'Chef', 900.00),
('Hla', 'Win', 'Cleaner', 400.00),
('Thiri', 'Mon', 'Waiter', 500.00),
('Sandi', 'Khin', 'Cashier', 450.00),
('Htet', 'Naung', 'Manager', 1200.00),
('Mya', 'Win', 'Chef', 1000.00);

-- =====================================
-- 3. MenuItem Table Inserts
-- =====================================
INSERT INTO MenuItem (Name, Category, Price) VALUES
('Fried Rice', 'Main', 5.50),
('Tom Yum Soup', 'Starter', 3.00),
('Mango Salad', 'Starter', 2.50),
('Grilled Chicken', 'Main', 6.50),
('Coke', 'Drink', 1.50),
('Pepsi', 'Drink', 1.50),
('Chocolate Cake', 'Dessert', 3.50),
('Ice Cream', 'Dessert', 2.50),
('Pasta', 'Main', 6.00),
('Spring Roll', 'Starter', 2.00),
('Lemon Tea', 'Drink', 1.80),
('Green Curry', 'Main', 6.50),
('Fried Noodles', 'Main', 5.50),
('Fruit Juice', 'Drink', 2.00),
('Cheesecake', 'Dessert', 3.80),
('Burger', 'Main', 5.00),
('Garlic Bread', 'Starter', 2.20),
('Coffee', 'Drink', 1.80),
('Brownie', 'Dessert', 3.00),
('Pad Thai', 'Main', 6.20),
('Sushi', 'Main', 7.00),
('Salmon Soup', 'Starter', 3.50),
('Milkshake', 'Drink', 2.50),
('Spring Salad', 'Starter', 2.80),
('Pizza', 'Main', 6.50),
('Tiramisu', 'Dessert', 4.00),
('Smoothie', 'Drink', 2.50),
('Dim Sum', 'Starter', 3.00),
('Fried Fish', 'Main', 6.00),
('Chocolate Pudding', 'Dessert', 3.20);

-- =====================================
-- 4. Booking Table Inserts
-- =====================================
INSERT INTO Booking (CustomerID, StaffID, BookingDate, TableNumber) VALUES
(1, 3, '2025-12-01', 1),
(2, 4, '2025-12-02', 2),
(3, 5, '2025-12-03', 3),
(4, 6, '2025-12-04', 4),
(5, 7, '2025-12-05', 5),
(6, 8, '2025-12-06', 6),
(7, 9, '2025-12-07', 7),
(8, 10, '2025-12-08', 8),
(9, 11, '2025-12-09', 9),
(10, 12, '2025-12-10', 10),
(11, 13, '2025-12-11', 11),
(12, 14, '2025-12-12', 12),
(13, 15, '2025-12-13', 13),
(14, 16, '2025-12-14', 14),
(15, 17, '2025-12-15', 15),
(16, 18, '2025-12-16', 16),
(17, 19, '2025-12-17', 17),
(18, 20, '2025-12-18', 18),
(19, 21, '2025-12-19', 19),
(20, 22, '2025-12-20', 20),
(21, 23, '2025-12-21', 1),
(22, 24, '2025-12-22', 2),
(23, 25, '2025-12-23', 3),
(24, 26, '2025-12-24', 4),
(25, 27, '2025-12-25', 5),
(26, 28, '2025-12-26', 6),
(27, 29, '2025-12-27', 7),
(28, 30, '2025-12-28', 8),
(29, 1, '2025-12-29', 9),
(30, 2, '2025-12-30', 10);

-- =====================================
-- 5. Order Table Inserts
-- =====================================
INSERT INTO `Order` (BookingID, OrderDate, TotalCost) VALUES
(1,'2025-12-01',15.00),
(2,'2025-12-02',12.50),
(3,'2025-12-03',18.00),
(4,'2025-12-04',20.50),
(5,'2025-12-05',25.00),
(6,'2025-12-06',14.50),
(7,'2025-12-07',16.00),
(8,'2025-12-08',22.00),
(9,'2025-12-09',19.50),
(10,'2025-12-10',17.00),
(11,'2025-12-11',21.50),
(12,'2025-12-12',23.00),
(13,'2025-12-13',18.50),
(14,'2025-12-14',20.00),
(15,'2025-12-15',19.00),
(16,'2025-12-16',16.50),
(17,'2025-12-17',22.50),
(18,'2025-12-18',24.00),
(19,'2025-12-19',17.50),
(20,'2025-12-20',18.00),
(21,'2025-12-21',15.50),
(22,'2025-12-22',16.00),
(23,'2025-12-23',21.00),
(24,'2025-12-24',22.50),
(25,'2025-12-25',19.50),
(26,'2025-12-26',23.00),
(27,'2025-12-27',24.50),
(28,'2025-12-28',20.00),
(29,'2025-12-29',18.50),
(30,'2025-12-30',17.00);

-- =====================================
-- 6. OrderItem Table Inserts
-- =====================================
INSERT INTO OrderItem (OrderID, MenuItemID, Quantity, Price) VALUES
(1,1,2,5.50),
(1,5,1,1.50),
(2,2,1,3.00),
(2,6,2,1.50),
(3,3,1,2.50),
(3,4,2,6.50),
(4,7,2,3.50),
(4,8,1,2.50),
(5,9,2,6.00),
(5,10,1,2.00),
(6,11,2,1.80),
(6,12,1,6.50),
(7,13,2,5.50),
(7,14,1,2.00),
(8,15,2,3.80),
(8,16,1,5.00),
(9,17,1,2.20),
(9,18,2,1.80),
(10,19,2,3.00),
(10,20,1,6.20),
(11,21,2,7.00),
(11,22,1,3.50),
(12,23,1,2.50),
(12,24,2,6.50),
(13,25,1,4.00),
(13,26,2,6.50),
(14,27,1,2.50),
(14,28,2,3.00),
(15,29,1,6.00),
(15,30,2,3.20);

-- =====================================
-- 7. OrderDeliveryStatus Table Inserts
-- =====================================
INSERT INTO OrderDeliveryStatus (OrderID, Status, DeliveryDate) VALUES
(1,'Delivered','2025-12-01'),
(2,'Pending','2025-12-02'),
(3,'Delivered','2025-12-03'),
(4,'Delivered','2025-12-04'),
(5,'Pending','2025-12-05'),
(6,'Delivered','2025-12-06'),
(7,'Pending','2025-12-07'),
(8,'Delivered','2025-12-08'),
(9,'Delivered','2025-12-09'),
(10,'Pending','2025-12-10'),
(11,'Delivered','2025-12-11'),
(12,'Delivered','2025-12-12'),
(13,'Pending','2025-12-13'),
(14,'Delivered','2025-12-14'),
(15,'Delivered','2025-12-15'),
(16,'Pending','2025-12-16'),
(17,'Delivered','2025-12-17'),
(18,'Delivered','2025-12-18'),
(19,'Pending','2025-12-19'),
(20,'Delivered','2025-12-20'),
(21,'Pending','2025-12-21'),
(22,'Delivered','2025-12-22'),
(23,'Delivered','2025-12-23'),
(24,'Pending','2025-12-24'),
(25,'Delivered','2025-12-25'),
(26,'Delivered','2025-12-26'),
(27,'Pending','2025-12-27'),
(28,'Delivered','2025-12-28'),
(29,'Delivered','2025-12-29'),
(30,'Pending','2025-12-30');

CREATE VIEW OrdersView AS SELECT o.OrderID,ot.Quantity,ot.Price FROM `Order` o inner join OrderItem ot ON o.OrderID = ot.OrderID;
SELECT * FROM OrdersView;

SELECT 
    c.CustomerID,
    CONCAT (c.FirstName, ' ',c.LastName) AS FullName,
    o.OrderID,
    o.TotalCost,
    m.Name,
    m.Category
FROM Customer c
INNER JOIN Booking b ON c.CustomerID = b.CustomerID
INNER JOIN `Order` o ON b.BookingID = o.BookingID
WHERE o.TotalCost > 150;

SELECT 
    c.CustomerID ,
    CONCAT(c.FirstName, ' ', c.LastName) AS CFullName,
    o.OrderID,
    o.TotalCost AS Cost,
    m.Name AS MenuName,
    m.Category
FROM Customer c
INNER JOIN Booking b ON c.CustomerID = b.CustomerID
INNER JOIN `Order` o ON b.BookingID = o.BookingID
INNER JOIN OrderItem ot ON o.OrderID = ot.OrderID
INNER JOIN MenuItem m ON ot.MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150;

SELECT Name, Category
FROM MenuItem
WHERE MenuItemID = ANY (
    SELECT MenuItemID
    FROM OrderItem
    GROUP BY MenuItemID
    HAVING SUM(Quantity) > 2
);

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderedQuantity
    FROM OrderItem;
END //

DELIMITER ;

CALL GetMaxQuantity();

SET @id = 1;

PREPARE GetOrderDetail FROM 
'SELECT o.OrderID, ot.Quantity, ot.Price
 FROM `Order` o
 INNER JOIN Booking b ON o.BookingID = b.BookingID
 INNER JOIN OrderItem ot ON o.OrderID = ot.OrderID
 WHERE b.CustomerID = ?';

EXECUTE GetOrderDetail USING @id;

DELIMITER $$

CREATE PROCEDURE CancelOrder(IN p_OrderID INT)
BEGIN
    DECLARE orderExists INT;

    SELECT COUNT(*) INTO orderExists
    FROM `Order`
    WHERE OrderID = p_OrderID;

    IF orderExists > 0 THEN
        DELETE FROM OrderItem WHERE OrderID = p_OrderID;
        DELETE FROM OrderDeliveryStatus WHERE OrderID = p_OrderID;

        DELETE FROM `Order` WHERE OrderID = p_OrderID;

        SELECT CONCAT('Order ', p_OrderID, ' has been successfully cancelled.') AS Confirmation;
    ELSE
        SELECT CONCAT('Order ', p_OrderID, ' does not exist.') AS Confirmation;
    END IF;
END $$

DELIMITER ;

call CancelOrder(5);



