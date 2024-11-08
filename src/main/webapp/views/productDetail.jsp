<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shiko Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/home.css">
    <link rel="stylesheet" href="css/productDetail.css">
    <link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
    <c:import url="header.jsp"></c:import>

    <div class="container mt-5">
        <div class="row">
            <!-- Image Gallery -->
            <div class="col-md-12 col-lg-12 col-xl-9 col-xxl-8">
                <div class="row">
                    <div class="col-md-8 row-col-12 d-flex">
                        <img src="/image/product/${product.image}" class="img-fluid mb-2 px-0 main-img" alt="Main Image">
                    </div>
                    <div class="col-md-4 row-col-12">
                        <div class=" row side-img d-flex">
                            <c:forEach var= "image" items="${image}">
                            	<div class="col-md-12 col-4 sub-img">
                                <img src="/image/product/${image.imageUrl}" class="img-fluid" width="180px" alt="Thumbnail 1">
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Product Details -->
            <div class="col-md-12 col-lg-12 col-xl-3 col-xxl-4 px-0">
                <h1 class="product-title">${product.productName}</h1>
                <p class="price"><fmt:formatNumber type="number" value="${product.price}" /> ₫</p>
                <p class="description">${product.describe}</p>

				<form method="post">
					<div class="d-flex mb-3 align-items-center">
						<select class="select-size" name="sizeSelect">
							<option disabled selected>Select Size</option>
							<c:forEach var="details" items="${detail}">
								<option value="${details.type.typeId}">${details.type.size}</option>
							</c:forEach>
						</select>
					</div>
					<div class="d-grid gap-3">
						<button formaction="/addToCart/${product.productId}" class="btn btn-dark rounded-pill py-3 fw-bold">Add to cart</button>
						<a class="btn btn-dark rounded-pill py-3 fw-bold">Buy</a>
					</div>
				</form>
			</div>
        </div>
        <div class="carousel-container">
            <div class="row">
                <div class="col-6">
                    <h2 class="text-start mb-4 fw-bold">Top picks</h2>
                </div>
                <div class="col-6">
                    <div class="d-flex justify-content-end gap-1">
                        <button class="carousel-btn border border-0 rounded-circle align-items-center" id="prevBtn">
                            <svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
                                viewBox="0 0 320 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path fill="#000000"
                                    d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z" />
                            </svg>
                        </button>
                        <button class="carousel-btn border border-0 rounded-circle align-items-center" id="nextBtn">
                            <svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
                                viewBox="0 0 320 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                <path fill="#000000"
                                    d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
    
            <div class="carousel-track">
				<div class="d-flex">
					<c:forEach var="product" items="${listprd}">
						<div class="carousel-item-product">
							<img src="image/product/${product.image}" alt="Product 1">
							<p class="product-name">${product.productName}</p>
						</div>
					</c:forEach>
				</div>
			</div>
        </div>
    
    
        <!-- Trending Section -->
        <div class="trending py-5">
            <div class="container">
                <h2 class="text-center mb-4 fw-bold">Trending Now</h2>
                <div class="row d-flex justify-content-center">
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/running.jpg" class="img-fluid" alt="Trending Shoe 1">
                        <p class="title">Running</p>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/football.jpg" class="img-fluid" alt="Trending Shoe 2">
                        <p class="title">Football</p>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/trainning_and_gym.jpg" class="img-fluid" alt="Trending Shoe 2">
                        <p class="title">Trainning and gym</p>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/sakteboard.jpg" class="img-fluid" alt="Trending Shoe 2">
                        <p class="title">Skateboard</p>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/tenis.jpg" class="img-fluid" alt="Trending Shoe 2">
                        <p class="title">Tenis</p>
                    </div>
                    <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                        <img src="/image/category/basketball.jpg" class="img-fluid" alt="Trending Shoe 2">
                        <p class="title">Basketball</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="footer.jsp"></c:import>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/home.js"></script>
</body>

</html>