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
									<div class="form-check">
										<input class="form-check-input" type="checkbox" name="brand" value="${brand}" id="flexCheckDefault${brand}">
										<label class="form-check-label" for="flexCheckDefault${brand}">${brand}</label>
									</div>
								</div>
							</c:forEach>
						</div>
						<p class="mb-2 text-secondary fw-medium opacity-50 mt-2">COLOR</p>
						<div class="row g-1">
							<c:forEach var="color" items="${listcolor}">
								<div class="col-6">
									<div class="form-check">
											<input class="form-check-input" type="checkbox" name="color" value="${color}" id="flexCheckDefault${color}">
											<label class="form-check-label" for="flexCheckDefault${color}">${color}</label>
									</div>
								</div>
							</c:forEach>
						</div>
						<p class="mb-2 text-secondary fw-medium opacity-50 mt-2">PRICE</p>
						<div class="row g-1">
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="price" value="0" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">Low to High</label>
							</div>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="price" value="1" id="flexRadioDefault2">
							  <label class="form-check-label" for="flexRadioDefault2">High to Low</label>
							</div>
						</div>
						<div class="row g-1 mt-3">
							<button formaction="/product" class="btn btn-dark border-0 rounded-0">Fill</button>
						</div>
					</div>					
				</form>
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