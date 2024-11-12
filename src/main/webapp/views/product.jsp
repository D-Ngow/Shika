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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/product.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
	<c:import url="header.jsp"></c:import>

	<div class="container py-5">
		<h3 class="text-start fw-bold mb-3">Product</h3>
		<div class="row">
			<div class="dropdown mb-3 col-6">
				<button class="bg-black border-0 text-light filter"
					data-bs-toggle="dropdown" aria-expanded="false"
					data-bs-auto-close="outside">Filter</button>
				<form class="dropdown-menu p-4 border-1 rounded-0">
					<div class="brand">
						<p class="mb-2 text-secondary fw-medium opacity-50">BRAND</p>
						<div class="row g-1">
							<c:forEach var="brand" items="${listbrand}">
								<div class="col-6">
									<input type="checkbox" name="brand" value="${brand}">${brand}
								</div>
							</c:forEach>
						</div>
						<p class="mb-2 text-secondary fw-medium opacity-50 mt-2">COLOR</p>
						<div class="row g-1">
							<c:forEach var="color" items="${listcolor}">
								<div class="col-6">
									<input type="checkbox" name="color" value="${color}">${color}
								</div>
							</c:forEach>
						</div>
						<p class="mb-2 text-secondary fw-medium opacity-50 mt-2">COLOR</p>
						<div class="row g-1">
							<input type="radio" name="price" value="0">Low to High
							<input type="radio" name="price" value="1">High to Low
						</div>
						<button formaction="/product">Fill</button>
					</div>					
				</form>
			</div>
			<div class="d-flex justify-content-end col-6">
				<div class="dropdown">
					<button class="bg-white border-0" data-bs-toggle="dropdown"
						aria-expanded="false">
						Sort by Price
						<svg xmlns="http://www.w3.org/2000/svg" height="14" width="14"
							viewBox="0 0 512 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#000000"
								d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" /></svg>
					</button>
					<ul class="dropdown-menu border-1 rounded-0">
						<li><a href="/product?price=0">Low to High</a></li>
						<li><a href="/product?price=1">High to Low</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div
			class="row row-cols-2 row-cols-md-4 row-cols-sm-3 row-cols-xs-2 g-4">
			<c:forEach var="product" items="${proList}">
				<div class="col-xs-6">
					<a href="/details?id=${product.productId}"
						class="text-decoration-none">
						<div class="card border-0 text-dark">
							<img src="/image/product/${product.image}" class="card-img-top"
								alt="...">
							<div class="card-text mt-3 fw-bold">${product.productName}</div>
							<div class="card-text mt-3 fw-bold">
								<fmt:formatNumber type="number" value="${product.price}" />
								₫
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
</body>

</html>