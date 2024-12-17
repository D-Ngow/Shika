-- Tạo database và sử dụng
DROP DATABASE Shiko

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

-- Tạo bảng payment
CREATE TABLE payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    paymentType NVARCHAR(50) NOT NULL
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
    createDate DATETIME DEFAULT GETDATE(),
    total DECIMAL(18, 2) NOT NULL,
	shipAddress NVARCHAR(100),
	paymentId INT,
    status INT,
    FOREIGN KEY (userId) REFERENCES users(userId),
	FOREIGN KEY (paymentId) REFERENCES payment(paymentId)
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

CREATE OR ALTER TRIGGER trg_UpdateProductQuantity
ON invoiceDetails
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật số lượng sản phẩm trong bảng products
    UPDATE p
    SET p.quantity = p.quantity - i.quantity
    FROM products p
    JOIN details d ON p.productId = d.productId
    JOIN inserted i ON d.detailId = i.detailsId
    WHERE p.quantity >= i.quantity; -- Chỉ trừ nếu số lượng đủ

END;
GO

CREATE OR ALTER TRIGGER trg_UpdateProductStatus
ON products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật status thành false nếu quantity = 0
    UPDATE p
    SET p.status = 0
    FROM products p
    JOIN inserted i ON p.productId = i.productId
    WHERE i.quantity = 0;
END;
GO




-- Insert vào bảng products
INSERT INTO products (productName, color, quantity, price, discountPrice, status, brand, image, describe)
VALUES 
('Nike Air Max 90', 'Gray', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 1.png', N'Giày thể thao hiệu năng cao, được thiết kế đặc biệt để hỗ trợ các hoạt động vận động mạnh và mang lại sự thoải mái tối đa.'),
('Nike Air Max 90', 'White', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 2.png', N'Giày chạy bộ với lớp đệm đặc biệt, giúp giảm thiểu tác động khi chạy và mang lại trải nghiệm tuyệt vời.'),
('Nike Air Max 90', 'Pink', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 3.png', N'Giày sneaker nhẹ, thích hợp để đi hàng ngày, với thiết kế thời trang và độ bền cao.'),
('Nike Air Max 90', 'Pink', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 4.png', N'Giày thời trang cổ điển, phù hợp với nhiều phong cách từ công sở đến dạo phố.'),
('Nike Air Max 90', 'Brown', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 5.png', N'Giày bóng rổ chuyên dụng với hỗ trợ cổ chân tốt, mang lại cảm giác an toàn và vững chắc khi thi đấu.'),
('Nike Air Max 90', 'Snail', 100, 4109000, 0, 1, 'Nike', 'NIKE AIR 6.png', N'Mẫu giày đa năng với công nghệ đệm khí hiện đại, giúp tăng cường hiệu suất trong các môn thể thao.'),
('Nike Air Force 1', 'Black', 100, 2679000, 0, 1, 'Nike', 'AIR FORCE.png', N'Giày thể thao phong cách retro với chất liệu cao cấp, mang lại sự thoải mái và bền bỉ.'),
('Nike Air Force 1', 'White', 100, 2679000, 0, 1, 'Nike', 'AIR FORCE 1.png', N'Một biểu tượng kinh điển của làng giày thể thao với thiết kế tối giản và sang trọng.'),
('Nike Killshot 2 Leather', 'Snail', 100, 3089000, 0, 1, 'Nike', 'KILLSHOT.png', N'Giày sneaker retro cổ thấp, được thiết kế với phong cách tối giản, phù hợp để sử dụng hàng ngày.'),
('Nike Killshot 2 Leather', 'White', 100, 3089000, 0, 1, 'Nike', 'KILLSHOT 1.png', N'Mẫu giày hoàn hảo cho những người yêu thích phong cách vintage với chất liệu bền bỉ và thoải mái.'),
('Nike Killshot 2 Leather', 'Black', 100, 2779000, 0, 1, 'Nike', 'WKILLSHOT.png', N'Giày thời trang nữ với thiết kế nhẹ nhàng và năng động.'),
('Nike Killshot 2 Leather', 'Snail', 100, 2779000, 0, 1, 'Nike', 'WKILLSHOT 1.png', N'Dòng sản phẩm dành cho phái đẹp, kết hợp giữa phong cách và sự tiện lợi.'),
('Nike Killshot 2 Leather', 'White', 100, 2779000, 0, 1, 'Nike', 'WKILLSHOT 2.png', N'Được thiết kế đặc biệt cho những người yêu thích sự nhẹ nhàng và thoải mái.'),
('Nike Dunk Low', 'Black', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK.png', N'Giày bóng rổ đỉnh cao với khả năng chống trượt tốt, được ưa chuộng bởi các vận động viên chuyên nghiệp.'),
('Nike Dunk Low', 'Blue', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK 1.png', N'Một phiên bản nâng cấp của dòng Dunk, với thiết kế hiện đại và hỗ trợ tốt hơn cho hoạt động thể thao.'),
('Nike Dunk Low', 'Blue', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK 2.png', N'Dòng giày với chất liệu cao cấp, mang lại cảm giác chắc chắn và phong cách thời thượng.'),
('Nike Dunk Low', 'Ocean', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK 3.png', N'Giày thiết kế với phần đế chống trượt, thích hợp cho nhiều loại mặt sân.'),
('Nike Dunk Low', 'Snail', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK 4.png', N'Thiết kế cổ thấp hiện đại, mang lại phong cách trẻ trung và năng động.'),
('Nike Dunk Low', 'Pink', 100, 2929000, 0, 1, 'Nike', 'NIKE DUNK 5.png', N'Giày sneaker cổ điển với lớp đệm thoải mái, phù hợp cho các hoạt động hàng ngày.'),
('Nike Dunk High Retro', 'Black', 100, 3369000, 0, 1, 'Nike', 'NIKE DUNK HI.png', N'Dòng giày cổ cao hỗ trợ tốt cho cổ chân, lý tưởng cho bóng rổ và các hoạt động thể thao.'),
('Nike Dunk High Retro', 'Green', 100, 3239000, 0, 1, 'Nike', 'NIKE DUNK HI 1.png', N'Phiên bản cải tiến với thiết kế đệm chân nhẹ, mang lại sự linh hoạt khi di chuyển.'),
('Nike Pegasus 41 GORE-TEX', 'Black', 100, 4699000, 0, 1, 'Nike', 'AIR ZM.png', N'Dòng giày hiện đại với thiết kế năng động, phù hợp với các hoạt động ngoài trời.'),
('Nike Pegasus 41 GORE-TEX', 'Gray', 100, 4699000, 0, 1, 'Nike', 'AIR ZM 1.png', N'Giày thể thao chất lượng cao với phần đế chống sốc, bảo vệ đôi chân hiệu quả.'),
('Nike Pegasus 41 GORE-TEX', 'White', 100, 4699000, 0, 1, 'Nike', 'AIR ZM 2.png', N'Dòng giày với phần đế thoáng khí, mang lại cảm giác thoải mái suốt cả ngày.'),
('Nike Pegasus 41', 'Black', 100, 3829000, 0, 1, 'Nike', 'AIR ZOOM.png', N'Công nghệ Zoom tiên tiến giúp tăng tốc độ và giảm áp lực trên bàn chân khi chạy.'),
('Nike Pegasus 41', 'Gray', 100, 3829000, 0, 1, 'Nike', 'AIR ZOOM 1.png', N'Đôi giày hoàn hảo cho những người yêu thích thể thao với thiết kế nhẹ và thoáng khí.'),
('Nike Zoom Vomero 5', 'Snail', 100, 4699000, 0, 1, 'Nike', 'W NIKE.png', N'Giày thể thao nữ với thiết kế trẻ trung và phong cách hiện đại.'),
('Nike Zoom Vomero 5', 'Gray', 100, 4699000, 0, 1, 'Nike', 'W NIKE 1.png', N'Giày thể thao nữ với thiết kế hiện đại, mang đến sự thoải mái và hiệu suất tối ưu cho các hoạt động thể thao và luyện tập.'),
('Nike Zoom Vomero 5', 'Gray', 100, 4699000, 0, 1, 'Nike', 'W NIKE 2.png', N'Mẫu giày thể thao cổ điển cho nữ, phù hợp với cả tập luyện thể thao và phong cách hàng ngày. Đệm êm ái và bền bỉ.'),
('Nike Zoom Vomero 5', 'Snail', 100, 4699000, 0, 1, 'Nike', 'W NIKE 5.png', N'Một đôi giày thể thao hoàn hảo cho nữ với độ bền cao, phù hợp cho cả luyện tập thể thao và đi lại hàng ngày.'),
('Nike Zoom Vomero Roam', 'Black', 100, 5279000, 0, 1, 'Nike', 'W NIKE 3.png', N'Giày thể thao nữ nhẹ nhàng, dễ chịu, với thiết kế tối giản nhưng không kém phần thời trang. Chất liệu thoáng khí, lý tưởng cho các buổi tập.'),
('Nike Zoom Vomero Roam', 'Brown', 100, 5279000, 0, 1, 'Nike', 'W NIKE 4.png', N'Giày thể thao nữ thiết kế đẹp mắt, cung cấp sự thoải mái cho mọi hoạt động, từ chạy bộ đến dạo phố.'),
('LeBron XXI EP', 'Gray', 100, 5869000, 0, 1, 'Nike', 'LEBRON.png', N'Giày thể thao nam với công nghệ đệm tiên tiến, hỗ trợ vận động hiệu quả và giảm chấn tối ưu khi di chuyển.'),
('Jordan Stay Loyal 3', 'Red', 100, 2149000, 0, 1, 'Nike', 'JORDAN.jpg', N'Mẫu giày thể thao với phong cách thể thao hiện đại, đệm êm ái và hỗ trợ tốt trong các hoạt động thể thao.'),
('Jordan Stay Loyal 3', 'Black', 100, 2419000, 0, 1, 'Nike', 'JORDAN 1.jpg', N'Giày thể thao nam nổi bật với thiết kế mạnh mẽ, rất phù hợp cho các môn thể thao và các hoạt động ngoài trời.'),
('Jordan Stay Loyal 3', 'White', 100, 2419000, 0, 1, 'Nike', 'JORDAN 2.jpg', N'Một đôi giày thể thao mạnh mẽ và phong cách, cung cấp sự ổn định và thoải mái cho các vận động viên.'),
('Nike Quest 6', 'White', 100, 2349000, 0, 1, 'Nike', 'NIKE QUEST.png', N'Giày thể thao đa năng với công nghệ đệm giúp bạn dễ dàng vận động và cảm thấy thoải mái suốt ngày dài.'),
('Nike Quest 6', 'Black', 100, 2349000, 0, 1, 'Nike', 'NIKE QUEST 1.png', N'Giày thể thao với thiết kế hiện đại, giảm thiểu áp lực khi di chuyển và cung cấp sự thoải mái cho người sử dụng.'),
('Nike Quest 6', 'Gray', 100, 2349000, 0, 1, 'Nike', 'NIKE QUEST 2.jpg', N'Giày thể thao chất lượng cao, cung cấp sự hỗ trợ tuyệt vời cho mọi hoạt động thể thao, từ chạy bộ đến các bài tập nặng.'),
('Nike Quest 6', 'Black', 100, 2349000, 0, 1, 'Nike', 'NIKE QUEST 3.png', N'Một đôi giày thể thao chắc chắn với đệm khí hỗ trợ hoàn hảo cho từng bước đi, lý tưởng cho các hoạt động ngoài trời.'),
('Nike Streakfly', 'Ivory', 100, 4699000, 0, 1, 'Nike', 'NIKE ZOOMX.png', N'Giày thể thao với công nghệ đệm ZoomX, tạo cảm giác nhẹ nhàng và nhanh nhạy trong từng bước di chuyển.'),
('Nike Streakfly', 'Blue', 100, 4699000, 0, 1, 'Nike', 'NIKE ZOOMX 1.png', N'Giày thể thao hiệu suất cao với công nghệ đệm ZoomX tiên tiến, hỗ trợ tốt cho các môn thể thao đòi hỏi tốc độ.'),
('Nike Streakfly', 'Black', 100, 4699000, 0, 1, 'Nike', 'NIKE ZOOMX 2.jpg', N'Sản phẩm giày thể thao với thiết kế nhẹ nhàng, đệm ZoomX giúp nâng cao hiệu suất vận động trong các bài tập cường độ cao.'),
('Nike Streakfly', 'Vivid', 100, 4699000, 0, 1, 'Nike', 'NIKE ZOOMX 3.png', N'Giày thể thao lý tưởng cho người yêu thích chạy bộ, thiết kế tối ưu với đệm ZoomX mang lại sự êm ái tuyệt vời.'),
('Nike Streakfly', 'Volt', 100, 4699000, 0, 1, 'Nike', 'NIKE ZOOMX 4.png', N'Giày thể thao với khả năng giảm chấn hiệu quả và đệm ZoomX giúp tối ưu hoá trải nghiệm vận động.'),
('Nike Journey Run', 'Pink', 100, 2649000, 0, 1, 'Nike', 'W NIKE 6.png', N'Giày thể thao nữ được thiết kế với phong cách hiện đại và chất liệu cao cấp, mang đến sự thoải mái và bền bỉ.'),
('Nike Journey Run', 'Bicoastal', 100, 2649000, 0, 1, 'Nike', 'W NIKE 7.png', N'Giày thể thao nữ với thiết kế tối giản nhưng cực kỳ hiệu quả, giúp bạn dễ dàng thực hiện mọi hoạt động thể thao.'),
('Nike Journey Run', 'White', 100, 2649000, 0, 1, 'Nike', 'W NIKE 8.png', N'Mẫu giày thể thao nữ phù hợp cho việc luyện tập thể thao và các hoạt động ngoài trời với độ bền cao.'),
('Nike Journey Run', 'Snail', 100, 2649000, 0, 1, 'Nike', 'W NIKE 9.png', N'Giày thể thao nữ hiện đại, nhẹ nhàng với thiết kế dễ chịu, phù hợp cho mọi hoạt động thể thao.'),
('Nike Journey Run', 'Black', 100, 2649000, 0, 1, 'Nike', 'W NIKE 10.png', N'Giày thể thao nữ bền bỉ, được thiết kế với công nghệ đệm cải tiến, mang lại sự thoải mái tuyệt vời khi di chuyển.'),
('Nike Journey Run', 'Gray', 100, 2649000, 0, 1, 'Nike', 'W NIKE 11.png', N'Giày thể thao nữ có kiểu dáng thời trang, nhẹ nhàng và tiện lợi, giúp bạn dễ dàng thực hiện các bài tập thể thao.'),
('Nike P-6000', 'Snail', 100, 3239000, 0, 1, 'Nike', 'W NIKE 12.png', N'Giày thể thao nữ tiện dụng với thiết kế sang trọng và đệm êm ái, hỗ trợ bạn trong mọi hoạt động.'),
('Nike P-6000', 'Gray', 100, 3239000, 0, 1, 'Nike', 'NIKE P.png', N'Giày thể thao với thiết kế mạnh mẽ, thích hợp cho cả tập luyện thể thao lẫn đi lại hàng ngày. Đệm êm ái giúp giảm chấn tối đa.'),
('Nike P-6000', 'Gray', 100, 3239000, 0, 1, 'Nike', 'NIKE P 1.png', N'Giày thể thao với phong cách hiện đại, độ bền cao và đệm êm giúp bạn cảm thấy thoải mái trong suốt cả ngày.'),
('Nike P-6000', 'Snail', 100, 3239000, 0, 1, 'Nike', 'NIKE P 2.png', N'Giày thể thao có thiết kế đơn giản nhưng mạnh mẽ, lý tưởng cho mọi hoạt động thể thao và sử dụng hàng ngày.'),
('Nike P-6000', 'Gray', 100, 3239000, 0, 1, 'Nike', 'NIKE P 3.png', N'Giày thể thao với công nghệ đệm tiên tiến, đem lại sự thoải mái tối đa cho người sử dụng trong mọi hoạt động.'),
('Nike P-6000', 'Gray', 100, 3239000, 0, 1, 'Nike', 'NIKE P 4.png', N'Giày thể thao phù hợp với nhiều loại hình thể thao, mang lại sự hỗ trợ tuyệt vời cho đôi chân trong suốt quá trình vận động.');


-- Insert vào bảng productImage
INSERT INTO productImage (productId, imageUrl)
VALUES 
(1, 'before1.png'), (1, 'beside1.png'), (1, 'after1.png'),
(2, 'before2.png'), (2, 'beside2.png'), (2, 'after2.png'),
(3, 'before3.png'), (3, 'beside3.png'), (3, 'after3.png'),
(4, 'before4.png'), (4, 'beside4.png'), (4, 'after4.png'),
(5, 'before5.png'), (5, 'beside5.png'), (5, 'after5.png'),
(6, 'before6.png'), (6, 'beside6.png'), (6, 'after6.png'),
(7, 'before7.png'), (7, 'beside7.png'), (7, 'after7.png'),
(8, 'before8.png'), (8, 'beside8.png'), (8, 'after8.png'),
(9, 'before9.png'), (9, 'beside9.png'), (9, 'after9.png'),
(10, 'before10.png'), (10, 'beside10.png'), (10, 'after10.png'),
(11, 'before27.png'), (11, 'beside27.png'), (11, 'after27.png'),
(12, 'before28.png'), (12, 'beside28.png'), (12, 'after28.png'),
(13, 'before29.png'), (13, 'beside29.png'), (13, 'after29.png'),
(14, 'before11.png'), (14, 'beside11.png'), (14, 'after11.png'),
(15, 'before12.png'), (15, 'beside12.png'), (15, 'after12.png'),
(16, 'before13.png'), (16, 'beside13.png'), (16, 'after13.png'),
(17, 'before14.png'), (17, 'beside14.png'), (17, 'after14.png'),
(18, 'before15.png'), (18, 'beside15.png'), (18, 'after15.png'),
(19, 'before16.png'), (19, 'beside16.png'), (19, 'after16.png'),
(20, 'before18.png'), (20, 'beside18.png'), (20, 'after18.png'),
(21, 'before19.png'), (21, 'beside19.png'), (21, 'after19.png'),
(22, 'before20.jpg'), (22, 'beside20.png'), (22, 'after20.png'),
(23, 'before21.jpg'), (23, 'beside21.png'), (23, 'after21.png'),
(24, 'before22.png'), (24, 'beside22.png'), (24, 'after22.png'),
(25, 'before23.png'), (25, 'beside23.png'), (25, 'after23.png'),
(26, 'before24.png'), (26, 'beside24.png'), (26, 'after24.png'),
(27, 'before30.png'), (27, 'beside30.png'), (27, 'after30.png'),
(28, 'before32.png'), (28, 'beside32.png'), (28, 'after32.png'),
(29, 'before33.png'), (29, 'beside33.png'), (29, 'after33.png'),
(30, 'before36.png'), (30, 'beside37.png'), (30, 'after36.png'),
(31, 'before34.png'), (31, 'beside34.png'), (31, 'after34.png'),
(32, 'before35.jpg'), (32, 'beside35.jpg'), (32, 'after35.png'),
(33, 'before64.jpg'), (33, 'beside64.png'), (33, 'after64.png'),
(34, 'before38.png'), (34, 'beside38.jpg'), (34, 'after38.png'),
(35, 'before39.jpg'), (35, 'beside39.jpg'), (35, 'after39.png'),
(36, 'before40.jpg'), (36, 'beside40.jpg'), (36, 'after40.png'),
(37, 'before42.png'), (37, 'beside42.png'), (37, 'after42.png'),
(38, 'before43.jpg'), (38, 'beside43.png'), (38, 'after43.png'),
(39, 'before44.jpg'), (39, 'beside44.jpg'), (39, 'after44.png'),
(40, 'before45.jpg'), (40, 'beside45.png'), (40, 'after45.png'),
(41, 'before47.png'), (41, 'beside47.png'), (41, 'after47.png'),
(42, 'before48.png'), (42, 'beside48.png'), (42, 'after48.png'),
(43, 'before49.jpg'), (43, 'beside49.jpg'), (43, 'after49.jpg'),
(44, 'before50.png'), (44, 'beside50.png'), (44, 'after50.png'),
(45, 'before51.png'), (45, 'beside51.png'), (45, 'after51.png'),
(46, 'before52.jpg'), (46, 'beside52.png'), (46, 'after52.png'),
(47, 'before53.jpg'), (47, 'beside53.jpg'), (47, 'after53.png'),
(48, 'before54.png'), (48, 'beside54.png'), (48, 'after54.png'),
(49, 'before55.png'), (49, 'beside55.png'), (49, 'after55.png'),
(50, 'before56.jpg'), (50, 'beside56.png'), (50, 'after56.png'),
(51, 'before57.png'), (51, 'beside57.png'), (51, 'after57.png'),
(52, 'before58.png'), (52, 'beside58.png'), (52, 'after58.png'),
(53, 'before59.png'), (53, 'beside59.png'), (53, 'after59.png'),
(54, 'before63.jpg'), (54, 'beside63.png'), (54, 'after63.png'),
(55, 'before60.png'), (55, 'beside60.png'), (55, 'after60.png'),
(56, 'before61.png'), (56, 'beside61.png'), (56, 'after61.png'),
(57, 'before62.jpg'), (57, 'beside62.png'), (57, 'after62.png');

-- Insert vào bảng type
INSERT INTO type (size)
VALUES (34), (35), (36), (37), (38), (39), (40), (41), (42), (43);

-- Insert vào bảng details
INSERT INTO details (typeId, productId)
VALUES 
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(1, 2), (2, 2), (3, 2), (4, 2), (5, 2),
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3),
(1, 4), (2, 4), (3, 4), (4, 4), (5, 4),
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5),
(1, 6), (2, 6), (3, 6), (4, 6), (5, 6),
(1, 7), (2, 7), (3, 7), (4, 7), (5, 7),
(1, 8), (2, 8), (3, 8), (4, 8), (5, 8),
(1, 9), (2, 9), (3, 9), (4, 9), (5, 9),
(1, 10), (2, 10), (3, 10), (4, 10), (5, 10),
(1, 11), (2, 11), (3, 11), (4, 11), (5, 11),
(1, 12), (2, 12), (3, 12), (4, 12), (5, 12),
(1, 13), (2, 13), (3, 13), (4, 13), (5, 13),
(1, 14), (2, 14), (3, 14), (4, 14), (5, 14),
(1, 15), (2, 15), (3, 15), (4, 15), (5, 15),
(1, 16), (2, 16), (3, 16), (4, 16), (5, 16),
(1, 17), (2, 17), (3, 17), (4, 17), (5, 17),
(1, 18), (2, 18), (3, 18), (4, 18), (5, 18),
(1, 19), (2, 19), (3, 19), (4, 19), (5, 19),
(1, 20), (2, 20), (3, 20), (4, 20), (5, 20),
(1, 21), (2, 21), (3, 21), (4, 21), (5, 21),
(1, 22), (2, 22), (3, 22), (4, 22), (5, 22),
(1, 23), (2, 23), (3, 23), (4, 23), (5, 23),
(1, 24), (2, 24), (3, 24), (4, 24), (5, 24),
(1, 25), (2, 25), (3, 25), (4, 25), (5, 25),
(1, 26), (2, 26), (3, 26), (4, 26), (5, 26),
(1, 27), (2, 27), (3, 27), (4, 27), (5, 27),
(1, 28), (2, 28), (3, 28), (4, 28), (5, 28),
(1, 29), (2, 29), (3, 29), (4, 29), (5, 29),
(1, 30), (2, 30), (3, 30), (4, 30), (5, 30),
(1, 31), (2, 13), (3, 13), (4, 13), (5, 31),
(6, 32), (7, 32), (8, 32), (9, 32), (10, 32),
(6, 33), (7, 33), (8, 33), (9, 33), (10, 33),
(6, 34), (7, 34), (8, 34), (9, 34), (10, 34),
(6, 35), (7, 35), (8, 35), (9, 35), (10, 35),
(6, 36), (7, 36), (8, 36), (9, 36), (10, 36),
(6, 37), (7, 37), (8, 37), (9, 37), (10, 37),
(6, 38), (7, 38), (8, 38), (9, 38), (10, 38),
(6, 39), (7, 39), (8, 39), (9, 39), (10, 39),
(6, 40), (7, 40), (8, 40), (9, 40), (10, 40),
(6, 41), (7, 41), (8, 41), (9, 41), (10, 41),
(6, 42), (7, 42), (8, 42), (9, 42), (10, 42),
(6, 43), (7, 43), (8, 43), (9, 43), (10, 43),
(6, 44), (7, 44), (8, 44), (9, 44), (10, 44),
(6, 45), (7, 45), (8, 45), (9, 45), (10, 45),
(6, 46), (7, 46), (8, 46), (9, 46), (10, 46),
(6, 47), (7, 47), (8, 47), (9, 47), (10, 47),
(6, 48), (7, 48), (8, 48), (9, 48), (10, 48),
(6, 49), (7, 49), (8, 49), (9, 49), (10, 49),
(6, 50), (7, 50), (8, 50), (9, 50), (10, 50),
(6, 51), (7, 51), (8, 51), (9, 51), (10, 51),
(6, 52), (7, 52), (8, 52), (9, 52), (10, 52),
(6, 53), (7, 53), (8, 53), (9, 53), (10, 53),
(6, 54), (7, 54), (8, 54), (9, 54), (10, 54),
(6, 55), (7, 55), (8, 55), (9, 55), (10, 55),
(6, 56), (7, 56), (8, 56), (9, 56), (10, 56),
(6, 57), (7, 57), (8, 57), (9, 57), (10, 57);

-- Insert vào bảng users
INSERT INTO users (name, email, phoneNumber, password, birthday, gender, role)
VALUES 
(N'Trần Huỳnh Phi Long', 'long@gmail.com', '0962457991', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '2004-08-26', 1, 1),
('Jane Smith', 'duong@gmail.com', '987654321', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1992-02-15', 0, 0),
(N'Nguyễn Văn A', 'nguyenvana@gmail.com', '0912345678', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '2000-05-10', 1, 0),
(N'Trần Thị B', 'tranthib@gmail.com', '0923456789', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1995-07-22', 0, 1),
(N'Lê Thị C', 'lethic@gmail.com', '0934567890', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1993-11-30', 0, 0),
(N'Nguyễn Minh D', 'nguyenminhd@gmail.com', '0945678901', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1998-04-05', 1, 1),
(N'Phan Thiết E', 'phanthiet@gmail.com', '0956789012', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '2001-12-17', 0, 0),
(N'Hồ Thị F', 'hothif@gmail.com', '0967890123', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1994-01-25', 0, 1),
(N'Vũ Văn G', 'vuvang@gmail.com', '0978901234', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1999-03-13', 1, 0),
(N'Bùi Thị H', 'builong@gmail.com', '0989012345', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1997-08-19', 0, 1);

-- Insert vào bảng shippingAddress
INSERT INTO shippingAddress (userId, city, district, ward, road)
VALUES 
(1, 'City A','Distric B','Ward C','123 XYZ St'),
(2, 'City D','Distric E','Ward F','456 XYZ St');

-- Insert vào bảng categories
INSERT INTO categories (name, image)
VALUES 
('Running', 'running.jpg'),
('Tenis', 'tenis.jpg'),
('Skateboard', 'skateboard.jpg'),
('Football', 'football.jpg'),
('Trainning and gym', 'trainning_and_gym.jpg'),
('Basketball', 'basketball.jpg');

-- Insert vào bảng categorydetails
INSERT INTO categorydetails (productId, categoryId)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Insert vào bảng payment
INSERT INTO payment ( paymentType)
VALUES 
('VNPay'),
(N'Thanh toán khi nhận hàng');

INSERT INTO invoices (userId, createDate, total, shipAddress, paymentId, status)
VALUES
(1, '2024-01-03 14:23:45', 12345000, N'123 Lý Thường Kiệt, TP.HCM', 1, 1),
(2, '2024-01-05 10:15:30', 4567000, N'45 Trần Hưng Đạo, TP.HCM', 2, 1),
(3, '2024-01-08 18:45:00', 2349000, N'67 Lê Duẩn, Hà Nội', 1, 1),
(4, '2024-01-12 09:12:15', 4699000, N'89 Nguyễn Huệ, Đà Nẵng', 2, 1),
(5, '2024-01-15 20:30:25', 3089000, N'321 Hai Bà Trưng, Cần Thơ', 2, 1),
(6, '2024-01-18 11:50:00', 2679000, N'56 Võ Văn Kiệt, TP.HCM', 1, 1),
(7, '2024-01-21 15:00:45', 2929000, N'78 Phan Đình Phùng, Hà Nội', 2, 1),
(8, '2024-01-24 08:20:10', 3369000, N'34 Hùng Vương, Đà Nẵng', 2, 1),
(9, '2024-01-27 19:45:30', 5869000, N'90 Quang Trung, TP.HCM', 1, 1),
(10, '2024-01-30 13:35:50', 2419000, N'123 Lý Thường Kiệt, Hà Nội', 2, 1),
(3, '2024-02-02 10:30:00', 7858000, N'123 Lý Thường Kiệt, TP HCM', 1, 1),
(5, '2024-02-05 15:45:00', 9418000, N'567 Hoàng Hoa Thám, Hà Nội', 2, 1),
(7, '2024-02-08 18:20:00', 12346000, N'21 Nguyễn Trãi, TP HCM', 1, 1),
(2, '2024-02-10 11:15:00', 6458000, N'89 Lê Duẩn, Đà Nẵng', 2, 1),
(6, '2024-02-12 14:50:00', 3528000, N'56 Trần Hưng Đạo, Cần Thơ', 2, 1),
(8, '2024-02-14 20:30:00', 11289000, N'234 Phạm Văn Đồng, TP HCM', 1, 1),
(4, '2024-02-17 09:00:00', 7367000, N'123 Bạch Mai, Hà Nội', 1, 1),
(9, '2024-02-20 13:25:00', 9823000, N'45 Cầu Giấy, Hà Nội', 1, 1),
(10, '2024-02-23 16:40:00', 11946000, N'678 Võ Văn Kiệt, TP HCM', 2, 1),
(1, '2024-02-25 19:10:00', 8765000, N'34 Lê Lợi, Đà Nẵng', 1, 1),
(3, '2024-03-02 12:30:00', 9547000, N'123 Nguyễn Thị Minh Khai, TP HCM', 1, 1),
(4, '2024-03-05 14:40:00', 8256000, N'789 Trần Phú, Hà Nội', 2, 1),
(5, '2024-03-07 17:10:00', 6382000, N'34 Đặng Thị Rành, TP HCM', 2, 1),
(6, '2024-03-10 11:30:00', 4723000, N'56 Hùng Vương, Cần Thơ', 1, 1),
(7, '2024-03-12 15:00:00', 11145000, N'22 Trương Định, TP HCM', 2, 1),
(8, '2024-03-14 18:45:00', 12839000, N'99 Lê Lợi, TP HCM', 1, 1),
(9, '2024-03-16 10:20:00', 9827000, N'21 Hoàng Văn Thụ, Hà Nội', 2, 1),
(10, '2024-03-18 13:55:00', 8750000, N'47 Phan Đình Phùng, TP HCM', 2, 1),
(2, '2024-03-20 16:30:00', 6358000, N'109 Bùi Viện, TP HCM', 1, 1),
(1, '2024-03-22 19:00:00', 7564000, N'5 Nguyễn Trãi, Đà Nẵng', 2, 1),
(2, '2024-04-02 12:15:00', 8645000, N'123 Nguyễn Thị Minh Khai, TP HCM', 1, 1),
(3, '2024-04-04 14:25:00', 9312000, N'789 Trần Phú, Hà Nội', 2, 1),
(4, '2024-04-06 17:05:00', 7420000, N'34 Đặng Thị Rành, TP HCM', 2, 1),
(5, '2024-04-09 11:40:00', 10930000, N'56 Hùng Vương, Cần Thơ', 1, 1),
(6, '2024-04-11 15:30:00', 7654000, N'22 Trương Định, TP HCM', 2, 1),
(7, '2024-04-13 18:00:00', 8907000, N'99 Lê Lợi, TP HCM', 1, 1),
(8, '2024-04-15 10:55:00', 11321000, N'21 Hoàng Văn Thụ, Hà Nội', 1, 1),
(9, '2024-04-18 13:15:00', 4782000, N'47 Phan Đình Phùng, TP HCM', 2, 1),
(10, '2024-04-20 16:00:00', 6195000, N'109 Bùi Viện, TP HCM', 1, 1),
(1, '2024-04-22 19:30:00', 8428000, N'5 Nguyễn Trãi, Đà Nẵng', 1, 1),
(2, '2024-05-02 11:00:00', 10450000, N'29 Lê Lai, TP HCM', 1, 1),
(3, '2024-05-04 16:20:00', 9456000, N'85 Trần Hưng Đạo, Hà Nội', 2, 1),
(4, '2024-05-06 14:10:00', 7638000, N'90 Nguyễn Thái Học, TP HCM', 2, 1),
(5, '2024-05-08 13:25:00', 11210000, N'44 Nguyễn Thị Minh Khai, TP HCM', 1, 1),
(6, '2024-05-10 18:30:00', 5290000, N'22 Hoàng Sa, Đà Nẵng', 2, 1),
(7, '2024-05-12 17:45:00', 7428000, N'37 Phạm Văn Đồng, TP HCM', 2, 1),
(8, '2024-05-14 10:50:00', 9281000, N'78 Trường Chinh, TP HCM', 1, 1),
(9, '2024-05-16 14:35:00', 5317000, N'62 Nguyễn Văn Cừ, Cần Thơ', 2, 1),
(10, '2024-05-18 16:00:00', 7535000, N'49 Quang Trung, TP HCM', 1, 1),
(1, '2024-05-20 19:00:00', 8654000, N'19 Trần Nhật Duật, TP HCM', 1, 1),
(2, '2024-06-02 12:00:00', 11620000, N'12 Đoàn Văn Bơ, TP HCM', 1, 1),
(3, '2024-06-04 15:10:00', 7856000, N'45 Nguyễn Thái Học, TP HCM', 2, 1),
(4, '2024-06-06 17:45:00', 9820000, N'54 Lê Lợi, TP HCM', 2, 1),
(5, '2024-06-08 10:15:00', 7134000, N'79 Hoàng Văn Thụ, TP HCM', 1, 1),
(6, '2024-06-10 19:00:00', 11670000, N'33 Phan Bội Châu, Đà Nẵng', 2, 1),
(7, '2024-06-12 14:40:00', 7932000, N'11 Nguyễn Lâm, TP HCM', 1, 1),
(8, '2024-06-14 11:00:00', 12450000, N'15 Lê Thị Riêng, TP HCM', 1, 1),
(9, '2024-06-16 14:30:00', 6532000, N'70 Trần Quang Khải, Cần Thơ', 2, 1),
(10, '2024-06-18 13:30:00', 9356000, N'29 Phạm Ngọc Thạch, TP HCM', 2, 1),
(1, '2024-06-20 19:20:00', 8745000, N'19 Trần Hưng Đạo, TP HCM', 1, 1),
(2, '2024-07-02 11:10:00', 10980000, N'32 Nguyễn Trãi, TP HCM', 1, 1),
(3, '2024-07-04 15:30:00', 8125000, N'62 Hoàng Diệu, TP HCM', 2, 1),
(4, '2024-07-06 17:20:00', 10540000, N'48 Nguyễn Thị Minh Khai, TP HCM', 1, 1),
(5, '2024-07-08 10:40:00', 7826000, N'39 Đinh Tiên Hoàng, TP HCM', 1, 1),
(6, '2024-07-10 19:15:00', 12130000, N'23 Hồ Tùng Mậu, TP HCM', 2, 1),
(7, '2024-07-12 16:55:00', 8047000, N'57 Nguyễn Lương Bằng, TP HCM', 2, 1),
(8, '2024-07-14 11:20:00', 9361000, N'16 Lê Lai, TP HCM', 1, 1),
(9, '2024-07-16 18:00:00', 6824000, N'72 Hoàng Hoa Thám, TP HCM', 2, 1),
(10, '2024-07-18 13:50:00', 8264000, N'51 Thái Văn Lung, TP HCM', 1, 1),
(1, '2024-07-20 14:30:00', 9531000, N'44 Trần Quốc Toản, TP HCM', 1, 1),
(2, '2024-08-02 10:30:00', 11350000, N'10 Lê Lai, TP HCM', 1, 1),
(3, '2024-08-04 14:20:00', 9470000, N'55 Nguyễn Thiện Thuật, TP HCM', 2, 1),
(4, '2024-08-06 18:00:00', 8505000, N'40 Trần Quốc Toản, TP HCM', 2, 1),
(5, '2024-08-08 12:00:00', 10030000, N'19 Nguyễn Bỉnh Khiêm, TP HCM', 1, 1),
(6, '2024-08-10 16:30:00', 10690000, N'22 Lê Văn Sỹ, TP HCM', 2, 1),
(7, '2024-08-12 13:40:00', 8347000, N'75 Nguyễn Thị Thập, TP HCM', 1, 1),
(8, '2024-08-14 11:30:00', 9392000, N'40 Trường Chinh, TP HCM', 1, 1),
(9, '2024-08-16 17:10:00', 11110000, N'58 Phan Văn Trị, TP HCM', 2, 1),
(10, '2024-08-18 15:00:00', 9076000, N'12 Bùi Thị Xuân, TP HCM', 2, 1),
(1, '2024-08-20 16:50:00', 8302000, N'34 Hoàng Đạo Thúy, TP HCM', 1, 1),
(2, '2024-09-02 11:00:00', 10520000, N'35 Lê Văn Lương, TP HCM', 1, 1),
(3, '2024-09-04 14:20:00', 9060000, N'82 Đinh Tiên Hoàng, TP HCM', 2, 1),
(4, '2024-09-06 17:30:00', 9730000, N'59 Quang Trung, TP HCM', 1, 1),
(5, '2024-09-08 12:40:00', 11370000, N'49 Nguyễn Trãi, TP HCM', 1, 1),
(6, '2024-09-10 19:10:00', 9520000, N'58 Hoàng Diệu, TP HCM', 2, 1),
(7, '2024-09-12 14:30:00', 7845000, N'19 Bùi Thị Xuân, TP HCM', 2, 1),
(8, '2024-09-14 10:00:00', 9331000, N'21 Nguyễn Thị Minh Khai, TP HCM', 1, 1),
(9, '2024-09-16 16:30:00', 8043000, N'39 Phan Văn Trị, TP HCM', 2, 1),
(10, '2024-09-18 13:00:00', 8674000, N'72 Nguyễn Lương Bằng, TP HCM', 1, 1),
(1, '2024-09-20 17:50:00', 9627000, N'50 Trần Quang Khải, TP HCM', 1, 1),
(2, '2024-10-02 11:30:00', 10780000, N'80 Hồ Tùng Mậu, TP HCM', 1, 1),
(3, '2024-10-04 14:40:00', 9230000, N'63 Trường Chinh, TP HCM', 2, 1),
(4, '2024-10-06 17:10:00', 10540000, N'30 Hoàng Đạo Thúy, TP HCM', 2, 1),
(5, '2024-10-08 12:20:00', 9425000, N'42 Lý Thường Kiệt, TP HCM', 1, 1),
(6, '2024-10-10 18:50:00', 10620000, N'25 Nguyễn Thiện Thuật, TP HCM', 2, 1),
(7, '2024-10-12 15:10:00', 7951000, N'29 Phạm Hồng Thái, TP HCM', 1, 1),
(8, '2024-10-14 10:30:00', 9510000, N'18 Trần Quốc Toản, TP HCM', 1, 1),
(9, '2024-10-16 13:50:00', 8137000, N'63 Lê Lai, TP HCM', 2, 1),
(10, '2024-10-18 16:40:00', 8730000, N'72 Nguyễn Bỉnh Khiêm, TP HCM', 2, 1),
(1, '2024-10-20 14:30:00', 10930000, N'38 Hoàng Hoa Thám, TP HCM', 1, 1),
(2, '2024-11-02 11:40:00', 11320000, N'43 Trần Quang Diệu, TP HCM', 1, 1),
(3, '2024-11-04 14:00:00', 9050000, N'19 Trần Nhật Duật, TP HCM', 2, 1),
(4, '2024-11-06 17:00:00', 9930000, N'28 Nguyễn Lâm, TP HCM', 1, 1),
(5, '2024-11-08 12:50:00', 10600000, N'25 Bà Huyện Thanh Quan, TP HCM', 1, 1),
(6, '2024-11-10 18:30:00', 8830000, N'70 Nguyễn Văn Cừ, TP HCM', 2, 1),
(7, '2024-11-12 14:00:00', 9445000, N'63 Lê Thị Riêng, TP HCM', 2, 1),
(8, '2024-11-14 11:00:00', 10980000, N'19 Trần Hưng Đạo, TP HCM', 1, 1),
(9, '2024-11-16 17:20:00', 8056000, N'31 Phan Văn Trị, TP HCM', 2, 1),
(10, '2024-11-18 13:40:00', 9622000, N'62 Nguyễn Thái Học, TP HCM', 1, 1);

INSERT INTO invoiceDetails (invoiceId, detailsId, quantity, price)
VALUES
(1, 42, 3, 4563000),
(2, 5, 3, 4426000),
(3, 8, 2, 4262000),
(4, 12, 2, 4726000),
(5, 14, 3, 4174000),
(6, 16, 1, 4795000),
(7, 18, 2, 3203000),
(8, 22, 3, 4976000),
(9, 62, 1, 4109000),
(9, 66, 1, 2679000),
(10, 70, 2, 2149000),
(10, 73, 1, 2419000),
(11, 2, 2, 4109000),
(11, 8, 1, 2679000),
(12, 14, 3, 2929000),
(12, 5, 1, 5869000),
(13, 27, 2, 3829000),
(14, 36, 1, 4699000),
(15, 42, 1, 2349000),
(15, 49, 2, 4699000),
(16, 52, 1, 3239000),
(16, 61, 2, 4699000),
(17, 7, 1, 2679000),
(17, 11, 3, 2779000),
(18, 16, 2, 2929000),
(18, 23, 1, 2149000),
(19, 25, 3, 4699000),
(20, 45, 2, 2649000),
(20, 51, 1, 3239000),
(21, 3, 2, 3219000),
(21, 4, 1, 6338000),
(22, 7, 1, 2679000),
(22, 16, 2, 5239000),
(23, 19, 2, 3698000),
(23, 22, 1, 2649000),
(24, 29, 3, 4699000),
(24, 33, 1, 3867000),
(25, 12, 2, 4699000),
(25, 17, 1, 3239000),
(26, 9, 3, 2349000),
(26, 11, 2, 2779000),
(27, 31, 1, 3239000),
(28, 38, 2, 4699000),
(29, 40, 1, 4198000),
(30, 41, 3, 3198000),
(31, 5, 2, 4319000),
(31, 8, 1, 4326000),
(32, 12, 1, 4739000),
(32, 14, 3, 4385000),
(33, 16, 2, 4396000),
(33, 18, 1, 3187000),
(34, 22, 3, 5312000),
(34, 26, 1, 4857000),
(35, 29, 2, 3872000),
(35, 32, 1, 4138000),
(36, 34, 1, 5327000),
(37, 37, 2, 3423000),
(38, 39, 3, 3872000),
(39, 41, 2, 4986000),
(40, 42, 1, 4515000),
(41, 45, 2, 3781000),
(41, 5, 2, 4622000),
(41, 8, 1, 4210000),
(42, 12, 1, 4739000),
(42, 14, 3, 3996000),
(43, 16, 2, 4782000),
(43, 18, 1, 3014000),
(44, 22, 3, 4973000),
(44, 26, 1, 4548000),
(45, 29, 2, 3883000),
(45, 32, 1, 4138000),
(46, 34, 1, 5315000),
(47, 37, 2, 3427000),
(48, 39, 3, 3709000),
(49, 41, 2, 4937000),
(50, 42, 1, 4556000),
(51, 5, 3, 4663000),
(51, 8, 2, 4137000),
(52, 12, 2, 4735000),
(52, 14, 3, 4139000),
(53, 16, 1, 4784000),
(53, 18, 2, 3120000),
(54, 22, 3, 4917000),
(54, 26, 2, 4593000),
(55, 29, 1, 3845000),
(55, 32, 2, 4141000),
(56, 34, 2, 5320000),
(57, 37, 1, 3407000),
(58, 39, 2, 3791000),
(59, 41, 3, 4948000),
(60, 42, 1, 4513000),
(61, 5, 3, 4413000),
(61, 8, 2, 4210000),
(62, 12, 1, 4732000),
(62, 14, 3, 4178000),
(63, 16, 1, 4794000),
(63, 18, 2, 3200000),
(64, 22, 3, 4978000),
(64, 26, 2, 4591000),
(65, 29, 1, 3856000),
(65, 32, 2, 4126000),
(66, 34, 2, 5332000),
(67, 37, 2, 3414000),
(68, 39, 3, 3782000),
(69, 41, 1, 4926000),
(70, 42, 2, 4562000),
(71, 5, 3, 4337000),
(71, 8, 1, 4264000),
(72, 12, 1, 4720000),
(72, 14, 2, 4180000),
(73, 16, 2, 4780000),
(73, 18, 1, 3100000),
(74, 22, 3, 4947000),
(74, 26, 2, 4579000),
(75, 29, 2, 3882000),
(75, 32, 1, 4134000),
(76, 34, 2, 5318000),
(77, 37, 3, 3420000),
(78, 39, 2, 3795000),
(79, 41, 2, 4923000),
(80, 42, 1, 4558000),
(81, 5, 2, 4643000),
(81, 8, 1, 4198000),
(82, 12, 1, 4736000),
(82, 14, 2, 4005000),
(83, 16, 3, 4781000),
(83, 18, 1, 3002000),
(84, 22, 2, 4932000),
(84, 26, 1, 4541000),
(85, 29, 2, 3886000),
(85, 32, 1, 4112000),
(86, 34, 1, 5316000),
(87, 37, 3, 3431000),
(88, 39, 2, 3724000),
(89, 41, 1, 4934000),
(90, 42, 2, 4560000),
(91, 5, 3, 4670000),
(91, 8, 1, 4159000),
(92, 12, 1, 4743000),
(92, 14, 2, 4160000),
(93, 16, 2, 4790000),
(93, 18, 1, 3118000),
(94, 22, 3, 4938000),
(94, 26, 2, 4598000),
(95, 29, 2, 3877000),
(95, 32, 1, 4145000),
(96, 34, 2, 5329000),
(97, 37, 2, 3412000),
(98, 39, 1, 3801000),
(99, 41, 2, 4928000),
(100, 42, 3, 4563000),
(101, 5, 3, 4426000),
(101, 8, 2, 4262000),
(102, 12, 2, 4726000),
(102, 14, 3, 4174000),
(103, 16, 1, 4795000),
(103, 18, 2, 3203000),
(104, 22, 3, 4976000),
(104, 26, 2, 4596000),
(105, 29, 1, 3848000),
(105, 32, 2, 4135000),
(106, 34, 2, 5330000),
(107, 37, 3, 3419000),
(108, 39, 2, 3797000),
(109, 41, 1, 4929000);

