<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" ng-app="myApp">

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

<body ng-controller="productAdminCtrl">
	<!-- Header -->
	<c:import url="header.jsp"></c:import>
	<div class="container py-5">
		<h3 class="text-start fw-bold mb-3">Product Manager</h3>
		<div class="row">
			<div class="dropdown mb-3 col-6">
				<button class="bg-black border-0 text-light filter"
					data-bs-toggle="dropdown" aria-expanded="false"
					data-bs-auto-close="outside">Filter</button>
				<form class="dropdown-menu p-4 border-1 rounded-0">
					<div class="brand">
						<p class="mb-2 text-secondary fw-medium opacity-50">BRAND</p>
						<div class="row g-1">
							<div class="col-6">
								<a href="#" class="text-decoration-none text-black">Nike</a>
							</div>
							<div class="col-6">
								<a href="#" class="text-decoration-none text-black">Adidas</a>
							</div>
							<div class="col-6">
								<a href="#" class="text-decoration-none text-black">Puma</a>
							</div>
							<div class="col-6">
								<a href="#" class="text-decoration-none text-black">Gucci</a>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="d-flex justify-content-end col-6">
				<button class="bg-success border-0 text-light h-50 px-4 me-4"
					data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
				<div class="modal modal-lg fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Add Product</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<form method="post">
								<div class="modal-body">
									<div class="row g-5">
										<div class="col-5">
											<div class="row">
												<div class="col-12">
													<label for="formFile" class="form-label">Product Image</label>
													<img ng-src="/image/product/{{importImg}}" class="card-img-top" alt="..." name="imgCreate"/>
													<div class="mb-2">
														<input ng-model="pro.image" class="form-control"type="file" id="formFile">
													</div>
												</div>
											</div>
										</div>
										<div class="col-7">
											<div class="mb-2">
												<label for="name" class="form-label">Name</label>
												<input type="text" class="form-control" id="productName" ng-model="pro.productName" name="productName">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Color</label>
												<input type="text" class="form-control" id="color" ng-model="pro.color" name="color">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Quantity</label>
												<input type="text" class="form-control" id="quantity" ng-model="pro.quantity" name="quantity">
											</div>
											<div class="mb-2">
												<label for="price" class="form-label">Price</label>
												<div class="input-group">
													<input type="number" class="form-control" id="price" name="price" ng-model="pro.price">
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Discount</label>
												<input type="number" class="form-control" id="buyCount" name="buyCount" ng-model="pro.discountPrice">
											</div>
											<div class="mb-2">
												<label for="developer" class="form-label">Brand</label>
												<input type="text" class="form-control" id="developer" name="developer" ng-model="pro.brand">
											</div>
											<div class="mb-2">
												<label for="publisher" class="form-label">Describe</label>
												<input type="text" class="form-control" id="publisher" name="publisher" ng-model="pro.describe">
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" ng-click="addProduct()">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="dropdown">
					<button class="bg-white border-0" data-bs-toggle="dropdown" aria-expanded="false">
						Dropdown
						<svg xmlns="http://www.w3.org/2000/svg" height="14" width="14"
							viewBox="0 0 512 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#000000"
								d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                    </svg>
					</button>
					<ul class="dropdown-menu border-1 rounded-0">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row row-cols-2 row-cols-md-4 row-cols-sm-3 row-cols-xs-2 g-4 mt-3">
			<div ng-repeat="product in products" class="col-3">
				<button class="btn p-0 m-0" data-bs-toggle="modal" data-bs-target="#exampleModal{{product.productId}}">
					<div class="col-xs-6">
						<div class="card border-1 text-dark">
							<img src="/image/product/{{product.image}}" class="card-img-top">
							<div class="card-body px-3 py-0 text-start my-3">
								<h5 class="card-text fw-bold text-center">{{product.productName}}</h5>
								<div class="row gy-2">
									<div class="col-6">
										<span>Brand: {{product.brand}}</span>
									</div>
									<div class="col-6">
										<span>Color: {{product.color}}</span>
									</div>
									<div class="col-6">
										<span>Quantity: {{product.quantity}}</span>
									</div>
									<div class="col-6">
										<span>Discount: {{product.discountPrice}}₫</span>
									</div>
									<div class="col-6">
										<span>Status: {{product.status ? 'Active' : 'Inactive'}}</span>
									</div>
								</div>
								<div class="card-text mt-3 fw-bold d-flex justify-content-end">
									{{product.price}}₫
								</div>
							</div>
						</div>
					</div>
				</button>
				<div class="modal modal-lg fade" id="exampleModal{{product.productId}}" tabindex="-1"
					aria-labelledby="exampleModalLabel{{product.productId}}" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Edit Product</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<form method="post" ng-submit="editProduct(product, product.productId)" enctype="multipart/form-data">
								<div class="modal-body">
									<div class="row g-5">
										<div class="col-5">
											<div class="row">
												<div class="col-12">
													<label for="formFile" class="form-label">Product Image</label>
													<img src="/image/product/{{product.image}}" class="card-img-top">
													<div class="mb-2">
														<input type="file" ng-model="product.image" class="form-control" name="imgFile" id="imgFile">
													</div>
												</div>
											</div>
										</div>
										<div class="col-7">
											<div class="mb-2">
												<label for="name" class="form-label">Name</label>
												<input type="text" class="form-control" id="productName" ng-model="product.productName" name="productName">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Color</label>
												<input type="text" class="form-control" id="color" ng-model="product.color" name="color">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Quantity</label>
												<input type="text" class="form-control" id="quantity" ng-model="product.quantity" name="quantity">
											</div>
											<div class="mb-2">
												<label for="price" class="form-label">Price</label>
												<div class="input-group">
													<input type="number" class="form-control" id="price" name="price" ng-model="product.price">
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Discount</label>
												<input type="number" class="form-control" id="buyCount" name="buyCount" ng-model="product.discountPrice">
											</div>
											<div class="mb-2">
												<label for="developer" class="form-label">Brand</label>
												<input type="text" class="form-control" id="developer" name="developer" ng-model="product.brand">
											</div>
											<div class="mb-2">
												<label for="publisher" class="form-label">Describe</label>
												<textarea class="form-control" id="describe" name="describe" rows="3" ng-model="product.describe"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Update -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/productAdmin.js"></script>
</body>

</html>