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