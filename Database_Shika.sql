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


-- Insert vào bảng products
INSERT INTO products (productName, color, quantity, price, discountPrice, status, brand, image, describe)
VALUES 
('NIKE AIR 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE AIR 1.png', N'Giày thể thao hiệu năng cao, được thiết kế đặc biệt để hỗ trợ các hoạt động vận động mạnh và mang lại sự thoải mái tối đa.'),
('NIKE AIR 2', 'Black', 50, 500.00, 0, 1, 'Nike', 'NIKE AIR 2.png', N'Giày chạy bộ với lớp đệm đặc biệt, giúp giảm thiểu tác động khi chạy và mang lại trải nghiệm tuyệt vời.'),
('NIKE AIR 3', 'Blue', 200, 100.00, 0, 1, 'Nike', 'NIKE AIR 3.png', N'Giày sneaker nhẹ, thích hợp để đi hàng ngày, với thiết kế thời trang và độ bền cao.'),
('NIKE AIR 4', 'White', 70, 300.00, 0, 1, 'Nike', 'NIKE AIR 4.png', N'Giày thời trang cổ điển, phù hợp với nhiều phong cách từ công sở đến dạo phố.'),
('NIKE AIR 5', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE AIR 5.png', N'Giày bóng rổ chuyên dụng với hỗ trợ cổ chân tốt, mang lại cảm giác an toàn và vững chắc khi thi đấu.'),
('NIKE AIR 6', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE AIR 6.png', N'Mẫu giày đa năng với công nghệ đệm khí hiện đại, giúp tăng cường hiệu suất trong các môn thể thao.'),
('AIR FORCE', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR FORCE.png', N'Giày thể thao phong cách retro với chất liệu cao cấp, mang lại sự thoải mái và bền bỉ.'),
('AIR FORCE 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR FORCE 1.png', N'Một biểu tượng kinh điển của làng giày thể thao với thiết kế tối giản và sang trọng.'),
('KILLSHOT', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'KILLSHOT.png', N'Giày sneaker retro cổ thấp, được thiết kế với phong cách tối giản, phù hợp để sử dụng hàng ngày.'),
('KILLSHOT 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'KILLSHOT 1.png', N'Mẫu giày hoàn hảo cho những người yêu thích phong cách vintage với chất liệu bền bỉ và thoải mái.'),
('NIKE DUNK', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK.png', N'Giày bóng rổ đỉnh cao với khả năng chống trượt tốt, được ưa chuộng bởi các vận động viên chuyên nghiệp.'),
('NIKE DUNK 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 1.png', N'Một phiên bản nâng cấp của dòng Dunk, với thiết kế hiện đại và hỗ trợ tốt hơn cho hoạt động thể thao.'),
('NIKE DUNK 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 2.png', N'Dòng giày với chất liệu cao cấp, mang lại cảm giác chắc chắn và phong cách thời thượng.'),
('NIKE DUNK 3', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 3.png', N'Giày thiết kế với phần đế chống trượt, thích hợp cho nhiều loại mặt sân.'),
('NIKE DUNK 4', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 4.png', N'Thiết kế cổ thấp hiện đại, mang lại phong cách trẻ trung và năng động.'),
('NIKE DUNK 5', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 5.png', N'Giày sneaker cổ điển với lớp đệm thoải mái, phù hợp cho các hoạt động hàng ngày.'),
('NIKE DUNK 6', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK 6.png', N'Thiết kế đơn giản nhưng tinh tế, mang lại sự thoải mái tối ưu cho người sử dụng.'),
('NIKE DUNK HI', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK HI.png', N'Dòng giày cổ cao hỗ trợ tốt cho cổ chân, lý tưởng cho bóng rổ và các hoạt động thể thao.'),
('NIKE DUNK HI 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE DUNK HI 1.png', N'Phiên bản cải tiến với thiết kế đệm chân nhẹ, mang lại sự linh hoạt khi di chuyển.'),
('AIR ZM', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR ZM.png', N'Dòng giày hiện đại với thiết kế năng động, phù hợp với các hoạt động ngoài trời.'),
('AIR ZM 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR ZM 1.png', N'Giày thể thao chất lượng cao với phần đế chống sốc, bảo vệ đôi chân hiệu quả.'),
('AIR ZM 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR ZM 2.png', N'Dòng giày với phần đế thoáng khí, mang lại cảm giác thoải mái suốt cả ngày.'),
('AIR ZOOM', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR ZOOM.png', N'Công nghệ Zoom tiên tiến giúp tăng tốc độ và giảm áp lực trên bàn chân khi chạy.'),
('AIR ZOOM 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'AIR ZOOM 1.png', N'Đôi giày hoàn hảo cho những người yêu thích thể thao với thiết kế nhẹ và thoáng khí.'),
('KILLSHOT', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'KILLSHOT.png', N'Phong cách retro cổ điển, kết hợp sự thoải mái và bền bỉ.'),
('KILLSHOT 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'KILLSHOT 1.png', N'Một lựa chọn hoàn hảo cho những tín đồ yêu thích thiết kế tối giản.'),
('WKILLSHOT', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'WKILLSHOT.png', N'Giày thời trang nữ với thiết kế nhẹ nhàng và năng động.'),
('WKILLSHOT 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'WKILLSHOT 1.png', N'Dòng sản phẩm dành cho phái đẹp, kết hợp giữa phong cách và sự tiện lợi.'),
('WKILLSHOT 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'WKILLSHOT 2.png', N'Được thiết kế đặc biệt cho những người yêu thích sự nhẹ nhàng và thoải mái.'),
('W NIKE', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE.png', N'Giày thể thao nữ với thiết kế trẻ trung và phong cách hiện đại.'),
('VOMERO', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'VOMERO.png', N'Giày thể thao với thiết kế đệm êm ái, giúp bạn thoải mái vận động suốt ngày dài. Chất liệu cao cấp, nhẹ nhàng và thời trang.'),
('W NIKE 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 1.png', N'Giày thể thao nữ với thiết kế hiện đại, mang đến sự thoải mái và hiệu suất tối ưu cho các hoạt động thể thao và luyện tập.'),
('W NIKE 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 2.png', N'Mẫu giày thể thao cổ điển cho nữ, phù hợp với cả tập luyện thể thao và phong cách hàng ngày. Đệm êm ái và bền bỉ.'),
('W NIKE 3', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 3.png', N'Giày thể thao nữ nhẹ nhàng, dễ chịu, với thiết kế tối giản nhưng không kém phần thời trang. Chất liệu thoáng khí, lý tưởng cho các buổi tập.'),
('W NIKE 4', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 4.png', N'Giày thể thao nữ thiết kế đẹp mắt, cung cấp sự thoải mái cho mọi hoạt động, từ chạy bộ đến dạo phố.'),
('W NIKE 5', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 5.png', N'Một đôi giày thể thao hoàn hảo cho nữ với độ bền cao, phù hợp cho cả luyện tập thể thao và đi lại hàng ngày.'),
('LEBRON', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'LEBRON.png', N'Giày thể thao nam với công nghệ đệm tiên tiến, hỗ trợ vận động hiệu quả và giảm chấn tối ưu khi di chuyển.'),
('JORDAN', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'JORDAN.jpg', N'Mẫu giày thể thao với phong cách thể thao hiện đại, đệm êm ái và hỗ trợ tốt trong các hoạt động thể thao.'),
('JORDAN 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'JORDAN 1.jpg', N'Giày thể thao nam nổi bật với thiết kế mạnh mẽ, rất phù hợp cho các môn thể thao và các hoạt động ngoài trời.'),
('JORDAN 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'JORDAN 2.jpg', N'Một đôi giày thể thao mạnh mẽ và phong cách, cung cấp sự ổn định và thoải mái cho các vận động viên.'),
('TEAMHUSTLE', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'TEAMHUSTLE.png', N'Giày thể thao với thiết kế đơn giản nhưng mạnh mẽ, phù hợp cho các môn thể thao cũng như đi lại hàng ngày.'),
('NIKE QUEST', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE QUEST.png', N'Giày thể thao đa năng với công nghệ đệm giúp bạn dễ dàng vận động và cảm thấy thoải mái suốt ngày dài.'),
('NIKE QUEST 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE QUEST 1.png', N'Giày thể thao với thiết kế hiện đại, giảm thiểu áp lực khi di chuyển và cung cấp sự thoải mái cho người sử dụng.'),
('NIKE QUEST 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE QUEST 2.jpg', N'Giày thể thao chất lượng cao, cung cấp sự hỗ trợ tuyệt vời cho mọi hoạt động thể thao, từ chạy bộ đến các bài tập nặng.'),
('NIKE QUEST 3', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE QUEST 3.png', N'Một đôi giày thể thao chắc chắn với đệm khí hỗ trợ hoàn hảo cho từng bước đi, lý tưởng cho các hoạt động ngoài trời.'),
('NIKE ZOOMX', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE ZOOMX.png', N'Giày thể thao với công nghệ đệm ZoomX, tạo cảm giác nhẹ nhàng và nhanh nhạy trong từng bước di chuyển.'),
('NIKE ZOOMX 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE ZOOMX 1.png', N'Giày thể thao hiệu suất cao với công nghệ đệm ZoomX tiên tiến, hỗ trợ tốt cho các môn thể thao đòi hỏi tốc độ.'),
('NIKE ZOOMX 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE ZOOMX 2.jpg', N'Sản phẩm giày thể thao với thiết kế nhẹ nhàng, đệm ZoomX giúp nâng cao hiệu suất vận động trong các bài tập cường độ cao.'),
('NIKE ZOOMX 3', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE ZOOMX 3.png', N'Giày thể thao lý tưởng cho người yêu thích chạy bộ, thiết kế tối ưu với đệm ZoomX mang lại sự êm ái tuyệt vời.'),
('NIKE ZOOMX 4', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE ZOOMX 4.png', N'Giày thể thao với khả năng giảm chấn hiệu quả và đệm ZoomX giúp tối ưu hoá trải nghiệm vận động.'),
('W NIKE 6', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 6.png', N'Giày thể thao nữ được thiết kế với phong cách hiện đại và chất liệu cao cấp, mang đến sự thoải mái và bền bỉ.'),
('W NIKE 7', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 7.png', N'Giày thể thao nữ với thiết kế tối giản nhưng cực kỳ hiệu quả, giúp bạn dễ dàng thực hiện mọi hoạt động thể thao.'),
('W NIKE 8', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 8.png', N'Mẫu giày thể thao nữ phù hợp cho việc luyện tập thể thao và các hoạt động ngoài trời với độ bền cao.'),
('W NIKE 9', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 9.png', N'Giày thể thao nữ hiện đại, nhẹ nhàng với thiết kế dễ chịu, phù hợp cho mọi hoạt động thể thao.'),
('W NIKE 10', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 10.png', N'Giày thể thao nữ bền bỉ, được thiết kế với công nghệ đệm cải tiến, mang lại sự thoải mái tuyệt vời khi di chuyển.'),
('W NIKE 11', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 11.png', N'Giày thể thao nữ có kiểu dáng thời trang, nhẹ nhàng và tiện lợi, giúp bạn dễ dàng thực hiện các bài tập thể thao.'),
('W NIKE 12', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'W NIKE 12.png', N'Giày thể thao nữ tiện dụng với thiết kế sang trọng và đệm êm ái, hỗ trợ bạn trong mọi hoạt động.'),
('NIKE P', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE P.png', N'Giày thể thao với thiết kế mạnh mẽ, thích hợp cho cả tập luyện thể thao lẫn đi lại hàng ngày. Đệm êm ái giúp giảm chấn tối đa.'),
('NIKE P 1', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE P 1.png', N'Giày thể thao với phong cách hiện đại, độ bền cao và đệm êm giúp bạn cảm thấy thoải mái trong suốt cả ngày.'),
('NIKE P 2', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE P 2.png', N'Giày thể thao có thiết kế đơn giản nhưng mạnh mẽ, lý tưởng cho mọi hoạt động thể thao và sử dụng hàng ngày.'),
('NIKE P 3', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE P 3.png', N'Giày thể thao với công nghệ đệm tiên tiến, đem lại sự thoải mái tối đa cho người sử dụng trong mọi hoạt động.'),
('NIKE P 4', 'Silver', 100, 1000.00, 0, 1, 'Nike', 'NIKE P 4.png', N'Giày thể thao phù hợp với nhiều loại hình thể thao, mang lại sự hỗ trợ tuyệt vời cho đôi chân trong suốt quá trình vận động.');


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
(11, 'before11.png'), (11, 'beside11.png'), (11, 'after11.png'),
(12, 'before12.png'), (12, 'beside12.png'), (12, 'after12.png'),
(13, 'before13.png'), (13, 'beside13.png'), (13, 'after13.png'),
(14, 'before14.png'), (14, 'beside14.png'), (14, 'after14.png'),
(15, 'before15.png'), (15, 'beside15.png'), (15, 'after15.png'),
(16, 'before16.png'), (16, 'beside16.png'), (16, 'after16.png'),
(17, 'before17.png'), (17, 'beside17.png'), (17, 'after17.png'),
(18, 'before18.png'), (18, 'beside18.png'), (18, 'after18.png'),
(19, 'before19.png'), (19, 'beside19.png'), (19, 'after19.png'),
(20, 'before20.jpg'), (20, 'beside20.png'), (20, 'after20.png'),
(21, 'before21.jpg'), (21, 'beside21.png'), (21, 'after21.png'),
(22, 'before22.png'), (22, 'beside22.png'), (22, 'after22.png'),
(23, 'before23.png'), (23, 'beside23.png'), (23, 'after23.png'),
(24, 'before24.png'), (24, 'beside24.png'), (24, 'after24.png'),
(25, 'before25.png'), (25, 'beside25.png'), (25, 'after25.png'),
(26, 'before26.png'), (26, 'beside26.png'), (26, 'after26.png'),
(27, 'before27.png'), (27, 'beside27.png'), (27, 'after27.png'),
(28, 'before28.png'), (28, 'beside28.png'), (28, 'after28.png'),
(29, 'before29.png'), (29, 'beside29.png'), (29, 'after29.png'),
(30, 'before30.png'), (30, 'beside30.png'), (30, 'after30.png'),
(31, 'before31.jpg'), (31, 'beside31.jpg'), (31, 'after31.png'),
(32, 'before32.png'), (32, 'beside32.png'), (32, 'after32.png'),
(33, 'before33.png'), (33, 'beside33.png'), (33, 'after33.png'),
(34, 'before34.png'), (34, 'beside34.png'), (34, 'after34.png'),
(35, 'before35.jpg'), (35, 'beside35.jpg'), (35, 'after35.png'),
(36, 'before36.png'), (36, 'beside36.png'), (36, 'after36.png'),
(37, 'before37.png'), (37, 'beside37.png'), (37, 'after37.png'),
(38, 'before38.png'), (38, 'beside38.jpg'), (38, 'after38.png'),
(39, 'before39.jpg'), (39, 'beside39.jpg'), (39, 'after39.png'),
(40, 'before40.jpg'), (40, 'beside40.jpg'), (40, 'after40.png'),
(41, 'before41.jpg'), (41, 'beside41.png'), (41, 'after41.png'),
(42, 'before42.png'), (42, 'beside42.png'), (42, 'after42.png'),
(43, 'before43.jpg'), (43, 'beside43.png'), (43, 'after43.png'),
(44, 'before44.jpg'), (44, 'beside44.jpg'), (44, 'after44.png'),
(45, 'before45.jpg'), (45, 'beside45.png'), (45, 'after45.png'),
(46, 'before46.png'), (46, 'beside46.jpg'), (46, 'after46.png'),
(47, 'before47.png'), (47, 'beside47.png'), (47, 'after47.png'),
(48, 'before48.png'), (48, 'beside48.png'), (48, 'after48.png'),
(49, 'before49.jpg'), (49, 'beside49.jpg'), (49, 'after49.jpg'),
(50, 'before50.png'), (50, 'beside50.png'), (50, 'after50.png'),
(51, 'before51.png'), (51, 'beside51.png'), (51, 'after51.png'),
(52, 'before52.jpg'), (52, 'beside52.png'), (52, 'after52.png'),
(53, 'before53.jpg'), (53, 'beside53.jpg'), (53, 'after53.png'),
(54, 'before54.jpg'), (54, 'beside54.png'), (54, 'after54.png'),
(55, 'before55.png'), (55, 'beside55.png'), (55, 'after55.png'),
(56, 'before56.jpg'), (56, 'beside56.png'), (56, 'after56.png'),
(57, 'before57.png'), (57, 'beside57.png'), (57, 'after57.png'),
(58, 'before58.png'), (58, 'beside58.png'), (58, 'after58.png'),
(59, 'before59.png'), (59, 'beside59.png'), (59, 'after59.png'),
(60, 'before60.png'), (60, 'beside60.png'), (60, 'after60.png'),
(61, 'before61.png'), (61, 'beside61.png'), (61, 'after61.png'),
(62, 'before62.jpg'), (62, 'beside62.png'), (62, 'after62.png');

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
(6, 57), (7, 57), (8, 57), (9, 57), (10, 57),
(6, 58), (7, 58), (8, 58), (9, 58), (10, 58),
(6, 59), (7, 59), (8, 59), (9, 59), (10, 59),
(6, 60), (7, 60), (8, 60), (9, 60), (10, 60),
(6, 61), (7, 61), (8, 61), (9, 61), (10, 61),
(6, 62), (7, 62), (8, 62), (9, 62), (10, 62);

-- Insert vào bảng users
INSERT INTO users (name, email, phoneNumber, password, birthday, gender, role)
VALUES 
(N'Trần Huỳnh Phi Long', 'long@gmail.com', '0962457991', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '2004-08-26', 1, 1),
('Jane Smith', 'duong@gmail.com', '987654321', '$2a$12$zIdRLPR/37w4L5tJtm8Jtu/YtZxOPqBQFB401a7hMjVEZd/P9p8Ua', '1992-02-15', 0, 0);

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
