create database temp
use temp


CREATE TABLE products (
    productId INT IDENTITY(1,1) PRIMARY KEY,
    productName NVARCHAR(255) NOT NULL,
    color NVARCHAR(50),
    quantity INT DEFAULT 0,
    price DECIMAL(18, 2) NOT NULL,
    discountPrice FLOAT,
    status BIT,
    brand NVARCHAR(30),
    describe NVARCHAR(MAX)
);

CREATE TABLE productImage (
    imageId INT IDENTITY(1,1) PRIMARY KEY,
    productId INT,
    imageUrl NVARCHAR(100),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE type (
    typeId INT IDENTITY(1,1) PRIMARY KEY,
    size NVARCHAR(10)
);

CREATE TABLE details (
    detailId INT IDENTITY(1,1) PRIMARY KEY,
    typeId INT,
    productId INT,
    FOREIGN KEY (typeId) REFERENCES type(typeId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE users (
    userId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    email NVARCHAR(255) NOT NULL UNIQUE,
    phoneNumber NVARCHAR(15),
    password NVARCHAR(30) NOT NULL,
    birthday DATETIME,
    gender BIT,
    role BIT
);

CREATE TABLE shippingAddress (
    addressId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT,
    address NVARCHAR(MAX),
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE invoices (
    invoiceId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    create_date DATETIME DEFAULT GETDATE(),
    total DECIMAL(18, 2) NOT NULL,
    status BIT,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE invoiceDetails (
    invoiceDetailId INT IDENTITY(1,1) PRIMARY KEY,
    invoiceId INT NOT NULL,
    detailsId INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId),
    FOREIGN KEY (detailsId) REFERENCES details(detailId)
);

CREATE TABLE carts (
    cartId INT IDENTITY(1,1) PRIMARY KEY,
    userId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (productId) REFERENCES products(productId)
);

CREATE TABLE categories (
    categorieId INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    image NVARCHAR(100)
);

CREATE TABLE categorydetails (
	id int primary key,
    productId INT NOT NULL,
    categoryId INT NOT NULL,
    FOREIGN KEY (productId) REFERENCES products(productId),
    FOREIGN KEY (categoryId) REFERENCES categories(categorieId)
);

CREATE TABLE payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    invoiceId INT,
    payment_type NVARCHAR(50) NOT NULL,
    FOREIGN KEY (invoiceId) REFERENCES invoices(invoiceId)
);

-- Insert into products
INSERT INTO products (productName, color, quantity, price, discountPrice, status, brand, describe)
VALUES 
('Laptop A', 'Silver', 100, 1000.00, 900.00, 1, 'Brand A', 'A powerful laptop for gaming.'),
('Smartphone B', 'Black', 50, 500.00, 450.00, 1, 'Brand B', 'A sleek smartphone with excellent battery life.'),
('Headphones C', 'Blue', 200, 100.00, 80.00, 1, 'Brand C', 'Noise-cancelling over-ear headphones.'),
('Tablet D', 'White', 70, 300.00, NULL, 1, 'Brand D', 'A lightweight and portable tablet.'),
('Smartwatch E', 'Black', 150, 200.00, 180.00, 1, 'Brand E', 'A smartwatch with multiple health features.');

-- Insert into productImage
INSERT INTO productImage (productId, imageUrl)
VALUES 
(1, 'laptopA.jpg'),
(2, 'smartphoneB.jpg'),
(3, 'headphonesC.jpg'),
(4, 'tabletD.jpg'),
(5, 'smartwatchE.jpg');

-- Insert into type
INSERT INTO type (size)
VALUES 
('S'),
('M'),
('L'),
('XL'),
('XXL');

-- Insert into details
INSERT INTO details (typeId, productId)
VALUES 
(1, 1),  -- Size S for Laptop A
(2, 2),  -- Size M for Smartphone B
(3, 3),  -- Size L for Headphones C
(4, 4),  -- Size XL for Tablet D
(5, 5);  -- Size XXL for Smartwatch E

-- Insert into users
INSERT INTO users (name, email, phoneNumber, password, birthday, gender, role)
VALUES 
('John Doe', 'john.doe@example.com', '123456789', 'password123', '1990-01-01', 1, 1),
('Jane Smith', 'jane.smith@example.com', '987654321', 'securepass', '1992-02-15', 0, 0),
('Alice Johnson', 'alice.johnson@example.com', '123123123', 'alice123', '1985-05-10', 0, 1),
('Bob Brown', 'bob.brown@example.com', '555666777', 'bobpassword', '1995-07-20', 1, 0),
('Charlie Green', 'charlie.green@example.com', '777888999', 'charliepass', '2000-12-30', 1, 1);

-- Insert into shippingAddress
INSERT INTO shippingAddress (userId, address)
VALUES 
(1, '123 Elm St, City A, Country A'),
(2, '456 Maple St, City B, Country B'),
(3, '789 Oak St, City C, Country C'),
(4, '101 Pine St, City D, Country D'),
(5, '202 Cedar St, City E, Country E');

-- Insert into invoices
INSERT INTO invoices (userId, total, status)
VALUES 
(1, 1900.00, 1),
(2, 500.00, 1),
(3, 100.00, 1),
(4, 300.00, 1),
(5, 200.00, 1);

-- Insert into invoiceDetails
INSERT INTO invoiceDetails (invoiceId, detailsId, quantity, price)
VALUES 
(1, 1, 1, 1000.00),
(1, 2, 2, 450.00),
(2, 2, 1, 500.00),
(3, 3, 1, 100.00),
(4, 4, 1, 300.00);

-- Insert into carts
INSERT INTO carts (userId, productId, quantity)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);

-- Insert into categories
INSERT INTO categories (name, image)
VALUES 
('Electronics', 'electronics.jpg'),
('Smartphones', 'smartphones.jpg'),
('Accessories', 'accessories.jpg'),
('Tablets', 'tablets.jpg'),
('Wearables', 'wearables.jpg');

-- Insert into categorydetails
INSERT INTO categorydetails
VALUES 
(1,1, 1),  -- Laptop A belongs to Electronics
(2,2, 2),  -- Smartphone B belongs to Smartphones
(3,3, 3),  -- Headphones C belongs to Accessories
(4,4, 4),  -- Tablet D belongs to Tablets
(5,5, 5);  -- Smartwatch E belongs to Wearables

-- Insert into payment
INSERT INTO payment (invoiceId, payment_type)
VALUES 
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer'),
(4, 'Credit Card'),
(5, 'Cash on Delivery');



