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
<style type="text/css">
.products-manager {
	padding: 2rem;
}

.product-card {
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 1rem;
	background-color: white;
	margin-bottom: 1rem;
}

.product-card img {
	width: 100%;
	height: auto;
}

.product-info {
	margin-top: 1rem;
}

.product-info p {
	margin: 0;
}
</style>
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
					data-bs-toggle="modal" data-bs-target="#exampleModal1">Add</button>
				<div class="modal modal-lg fade" id="exampleModal1" tabindex="-1"
					aria-labelledby="exampleModalLabel1" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">{{pro.productName
									? 'Edit Product' : 'Add Product'}}</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<form method="post"
							 >
								<div class="modal-body">
									<div class="row g-5">
										<div class="col-5">
											<div class="row">
												<div class="col-12">
													<label for="formFile" class="form-label">Product
														Image</label> <img src="/image/product/{{pro.image}}"
														class="card-img-top" alt="..." />
													<div class="mb-2">
														<input ng-model="check_image" class="form-control"
															type="file" id="formFile" name="check_image">
														<input ng-model="pro.productId" class="form-control"
															type="text" id="formFile" name="productId" hidden>
													</div>

												</div>
											</div>
										</div>
										<div class="col-7">
											<div class="mb-2">
												<label for="name" class="form-label">Product Name</label> <input
													type="text" class="form-control" id="productName"
													ng-model="pro.productName" value="${pro.productName}"
													name="productName">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Color</label> <input
													type="text" class="form-control" id="color"
													ng-model="pro.color" value="${pro.color}" name="color">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Quantity</label> <input
													type="text" class="form-control" id="quantity"
													ng-model="pro.quantity" value="${pro.quantity}"
													name="quantity">
											</div>
											<div class="mb-2">
												<label for="price" class="form-label">Price</label>
												<div class="input-group">
													<input type="number" class="form-control" id="price"
														name="price" ng-model="pro.price" value="${pro.price}">
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Discount</label> <input
													type="number" class="form-control" id="buyCount"
													name="buyCount" ng-model="pro.discountPrice"
													value="${pro.discountPrice}">
											</div>
											<div class="mb-2">
												<label for="developer" class="form-label">Brand</label> <input
													type="text" class="form-control" id="developer"
													name="developer" ng-model="pro.brand" value="${pro.brand}">
											</div>
											<div class="mb-2">
												<label for="publisher" class="form-label">Describe</label> <input
													type="text" class="form-control" id="publisher"
													name="publisher" ng-model="pro.describe"
													value="${pro.describe}">
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal"  ng-click="closeProduct()">Close</button>

									<!-- Show Save button if pro is empty, Update and Delete if pro is not empty -->
									<button type="button" class="btn btn-primary"
										ng-if="!pro.productId" data-bs-dismiss="modal" ng-click="addProduct()">Save</button>
									<button type="button" class="btn btn-warning"
										ng-if="pro.productId" data-bs-dismiss="modal" ng-click="editProduct()">Update</button>
									<button type="button" class="btn btn-danger"
										ng-if="pro.productId" data-bs-dismiss="modal" ng-click="deleteProduct()">Delete</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="dropdown">
					<button class="bg-white border-0" data-bs-toggle="dropdown"
						aria-expanded="false">
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

		<div
			class="row row-cols-2 row-cols-md-4 row-cols-sm-3 row-cols-xs-2 g-4 mt-3">
			<button class="btn p-0 m-0" data-bs-toggle="modal"
				ng-repeat="product in products" ng-click="openModal(product)"
				data-bs-target="#exampleModal1">
				<div class="col-xs-6">
					<div class="card border-1 text-dark">
						<img src="/image/product/{{product.image}}" class="card-img-top"
							alt="...">
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
									<span>Discount: {{product.discount}}₫</span>
								</div>
								<div class="col-6">
									<span>Status: {{product.status}}</span>
								</div>
							</div>
							<div class="card-text mt-3 fw-bold d-flex justify-content-end">
								<!-- <fmt:formatNumber type="number" value="5000" /> ₫ -->
								{{product.price}}₫
							</div>
						</div>
					</div>
				</div>
			</button>
		</div>
		<!-- Update -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- <script src="js/home.js"></script>  -->
	<script src="js/productAdmin.js"></script>
</body>

</html>