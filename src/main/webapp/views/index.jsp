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
    <link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
    <c:import url="header.jsp"></c:import>

    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/banner/banner1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner2.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner3.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner4.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner5.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Top Picks Section -->

	<div class="carousel-container">
		<div class="row">
			<div class="col-6">
				<h2 class="text-start mb-4 fw-bold">Top picks</h2>
			</div>
			<div class="col-6">
				<div class="d-flex justify-content-end gap-1">
					<button
						class="carousel-btn border border-0 rounded-circle align-items-center"
						id="prevBtn">
						<svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
							viewBox="0 0 320 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#000000"
								d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z" />
                        </svg>
					</button>
					<button
						class="carousel-btn border border-0 rounded-circle align-items-center"
						id="nextBtn">
						<svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
							viewBox="0 0 320 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
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
					<a href="/details?id=${product.productId}" class="text-black text-decoration-none">
						<div class="carousel-item-product">
							<img src="image/product/${product.image}" alt="Product 1">
							<p class="product-name">${product.productName}</p>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="trending py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4 fw-bold">Trending Now</h2>
            <div class="row d-flex justify-content-center">
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/running.jpg" class="img-fluid" alt="Trending Shoe 1">
                    <p class="title">Running</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/football.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Football</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/trainning_and_gym.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Trainning and gym</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/sakteboard.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Skateboard</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/tenis.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Tenis</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/basketball.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Basketball</p>
                </div>
            </div>
        </div>
    </div>

    <!-- New Design Section -->
    <div class="container py-5">
        <div class="row w-100">
            <c:forEach var="top" items="${topSeller}">
				<div class="col-12 col-lg-6 col-md-12 row">
					<div class="col-6 col-lg-6 col-md-6 col-sm-6">
						<img src="image/product/${top.image}"
							class="img-fluid mb-3" alt="Nike React Presto">
					</div>
					<div class="col-6 col-lg-6 col-md-6 col-sm-6 text-start">
						<h2 class="mb-3">${top.productName}</h2>
						<p class="lead">${top.describe}</p>
						<a href="#" class="btn btn-dark">View</a>
					</div>
				</div>
			</c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <c:import url="footer.jsp"></c:import>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/home.js"></script>
</body>

</html>