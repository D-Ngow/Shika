-- Tạo database và sử dụng
CREATE DATABASE Shiko;
USE Shiko;

-- Tạo bảng products
CREATE TABLE products (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(255) NOT NULL,
    color NVARCHAR(50),
    quantity INT DEFAULT 0,
    price DECIMAL(18, 2) NOT NULL,
    discountPrice FLOAT,
    status BIT,
    brand NVARCHAR(30),
    image NVARCHAR(100),
    describe NVARCHAR(MAX)
);

-- Tạo bảng productImage
CREATE TABLE productImage (
    imageId INT IDENTITY(1,1) PRIMARY KEY,
    productId INT,
    imageUrl NVARCHAR(100),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

-- Tạo bảng type
CREATE TABLE type (
    typeId INT IDENTITY(1,1) PRIMARY KEY,
    size INT
);

-- Tạo bảng details
CREATE TABLE details (
    detailId INT IDENTITY(1,1) PRIMARY KEY,
    typeId INT,
    productId INT,
    FOREIGN KEY (typeId) REFERENCES type(typeId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

-- Tạo bảng users
CREATE TABLE users (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    phoneNumber NVARCHAR(15),
    password NVARCHAR(255) NOT NULL,
    birthday DATETIME2,
    gender BIT,
    role BIT
);

-- Tạo bảng shippingAddress
CREATE TABLE shippingAddress (
    addressId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT,
    city NVARCHAR(50),
    district NVARCHAR(50),
    ward NVARCHAR(50),
    road NVARCHAR(50),
    FOREIGN KEY (userId) REFERENCES users(userId)
);

-- Tạo bảng invoices
CREATE TABLE invoices (
    invoiceId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    create_date DATETIME DEFAULT GETDATE(),
    total DECIMAL(18, 2) NOT NULL,
    status BIT,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

-- Tạo bảng invoiceDetails
CREATE TABLE invoiceDetails (
    invoiceDetailId INT IDENTITY(1,1) PRIMARY KEY,
    invoiceId INT NOT NULL,
    detailsId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId),
    FOREIGN KEY (detailsId) REFERENCES details(detailId)
);

-- Tạo bảng carts
CREATE TABLE carts (
    cartId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    detailId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (detailId) REFERENCES details(detailId)
);

-- Tạo bảng categories
CREATE TABLE categories (
    categorieId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    image NVARCHAR(100)
);

-- Tạo bảng categorydetails
CREATE TABLE categorydetails (
    id INT IDENTITY(1,1) PRIMARY KEY,
    productId INT NOT NULL,
    categoryId INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES products(productId),
    FOREIGN KEY (categoryId) REFERENCES categories(categorieId)
);

-- Tạo bảng payment
CREATE TABLE payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    invoiceId INT,
    payment_type NVARCHAR(50) NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId)
);

-- Insert vào bảng products
INSERT INTO products (productName, color, quantity, price, discountPrice, status, brand, image, describe)
VALUES 
('Laptop A', 'Silver', 100, 1000.00, 900.00, 1, 'Brand A', 'AirForce1_Black.png', 'A powerful laptop for gaming.'),
('Smartphone B', 'Black', 50, 500.00, 450.00, 1, 'Brand B', 'AirForce1_Green.png', 'A sleek smartphone with excellent battery life.'),
('Headphones C', 'Blue', 200, 100.00, 80.00, 1, 'Brand C', 'AirForce1_White.png', 'Noise-cancelling over-ear headphones.'),
('Tablet D', 'White', 70, 300.00, 50.00, 1, 'Brand D', 'Nike.png', 'A lightweight and portable tablet.'),
('Smartwatch E', 'Black', 150, 200.00, 180.00, 1, 'Brand E', 'NikeDunkLowBlue.png', 'A smartwatch with multiple health features.');

-- Insert vào bảng productImage
INSERT INTO productImage (productId, imageUrl)
VALUES 
(1, 'AirForce1_Black.png'),
(2, 'AirForce1_Green.png'),
(3, 'AirForce1_White.png'),
(4, 'Nike.png'),
(5, 'NikeDunkLowBlue.png');

-- Insert vào bảng type
INSERT INTO type (size)
VALUES (38), (40), (42), (44), (46);

-- Insert vào bảng details
INSERT INTO details (typeId, productId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert vào bảng users
INSERT INTO users (name, email, phoneNumber, password, birthday, gender, role)
VALUES 
('John Doe', 'long@gmail.com', '123456789', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1990-01-01', 1, 1),
('Jane Smith', 'duong@gmail.com', '987654321', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1992-02-15', 0, 0),
('Alice Johnson', 'alice.johnson@example.com', '123123123', 'alice123', '1985-05-10', 0, 1),
('Bob Brown', 'bob.brown@example.com', '555666777', 'bobpassword', '1995-07-20', 1, 0),
('Charlie Green', 'charlie.green@example.com', '777888999', 'charliepass', '2000-12-30', 1, 1);

-- Insert vào bảng shippingAddress
INSERT INTO shippingAddress (userId, city, district, ward, road)
VALUES 
(1, 'City A','Distric B','Ward C','123 XYZ St'),
(2, 'City D','Distric E','Ward F','456 XYZ St'),
(3, 'City G','Distric H','Ward I','789 XYZ St'),
(4, 'City J','Distric K','Ward L','012 XYZ St'),
(5, 'City M','Distric N','Ward O','901 XYZ St');

-- Insert vào bảng invoices
INSERT INTO invoices (userId, total, status)
VALUES 
(1, 1900.00, 1),
(2, 500.00, 1),
(3, 100.00, 1),
(4, 300.00, 1),
(5, 200.00, 1);

-- Insert vào bảng invoiceDetails
INSERT INTO invoiceDetails (invoiceId, detailsId, quantity, price)
VALUES 
(1, 1, 1, 1000.00),
(1, 2, 2, 450.00),
(2, 2, 1, 500.00),
(3, 3, 1, 100.00),
(4, 4, 1, 300.00);

-- Insert vào bảng carts
INSERT INTO carts (userId, detailId, quantity)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);

-- Insert vào bảng categories
INSERT INTO categories (name, image)
VALUES 
('Electronics', 'electronics.jpg'),
('Smartphones', 'smartphones.jpg'),
('Accessories', 'accessories.jpg'),
('Tablets', 'tablets.jpg'),
('Wearables', 'wearables.jpg');

-- Insert vào bảng categorydetails
INSERT INTO categorydetails (productId, categoryId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert vào bảng payment
INSERT INTO payment (invoiceId, payment_type)
VALUES 
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer'),
(4, 'Credit Card'),
(5, 'Cash on Delivery');
