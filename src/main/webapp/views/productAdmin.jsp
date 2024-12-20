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
			<div class="col-6">
				
			</div>
			<div class="d-flex justify-content-end col-6">
				<input type="text" ng-model="productName" class="form-control w-50 me-4" placeholder="Search product">
				<button class="bg-success border-0 text-light px-4 me-4"
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

							<form ng-submit="addProduct(pro)" class="needs-validation" novalidate id="productForm" method="post" enctype="multipart/form-data">

								<div class="modal-body">
									<div class="row g-5">
										<div class="col-5">
											<div class="row">
												<div class="col-12">
													<label for="formFile" class="form-label">Product Image</label>
													<div class="mb-2">
														<input ng-model="pro.image" class="form-control"type="file" id="imgPro" required>
													</div>
												</div>
											</div>
										</div>
										<div class="col-7">
											<div class="mb-2">
												<label for="name" class="form-label">Name</label>
												<input type="text" class="form-control" id="productName" ng-model="pro.productName" name="productName" required>
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Color</label>
												<input type="text" class="form-control" id="color" ng-model="pro.color" name="color" required>
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Quantity</label>
												<input type="number" min="1" class="form-control" id="quantity" ng-model="pro.quantity" name="quantity" min="1" required>
											</div>
											<div class="mb-2">
												<label for="price" class="form-label">Price</label>
												<div class="input-group">
													<input type="number" min="0" class="form-control" id="price" name="price" ng-model="pro.price" min="1" required>
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Discount</label>
												<div class="input-group">
													<input type="number" min="0" class="form-control" id="buyCount" name="buyCount" ng-model="pro.discountPrice" min="0" required>
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Status:</label>
											    <div class="d-flex">
											    	<div class="form-check me-5">
												        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" ng-value="true"
												            ng-model="pro.status" required>
												        <label class="form-check-label" for="flexRadioDefault1">
												            Active
												        </label>
												    </div>
												    <div class="form-check">
												        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" ng-value="false"
												            ng-model="pro.status" required>
												        <label class="form-check-label" for="flexRadioDefault2">
												            Inactive
												        </label>
												    </div>
											    </div>
											</div>
											<div class="mb-2">
												<label for="developer" class="form-label">Brand</label>
												<input type="text" class="form-control" id="developer" name="developer" ng-model="pro.brand" required>
											</div>
											<div class="mb-2">
												<label for="publisher" class="form-label">Describe</label>
												<input type="text" class="form-control" id="publisher" name="publisher" ng-model="pro.describe" required>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row row-cols-2 row-cols-md-4 row-cols-sm-3 row-cols-xs-2 g-4 mt-3">
			<div ng-repeat="product in products | filter:productName" class="col-3">
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
										<span>Status: {{product.status ? 'Active' : 'Inactive'}}</span>
									</div>
									<div class="col-12">
										<span>Discount: {{product.discountPrice | currency:'₫'}}</span>
									</div>
								</div>
								<div class="card-text mt-3 fw-bold d-flex justify-content-end">
									{{product.price | currency:'₫'}}
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
							<form method="post" ng-submit="editProduct(product)" class="needs-validation" novalidate id="proForm" enctype="multipart/form-data">
								<div class="modal-body">
									<div class="row g-5">
										<div class="col-5">
											<div class="row">
												<div class="col-12">
													<img src="/image/product/{{product.image}}" class="card-img-top">
													<div class="row">
														<div class="col-4 px-0 mt-2 ps-1" ng-repeat="image in product.images">
			                                                <div class="card border rounded-4 uploadContainer" style="cursor: pointer;" ng-click="triggerFileInput('subFile')">
			                                                    <img class="rounded-4" src="/image/subImage/{{image.imageUrl}}" alt="Sub Image" id="previewImg">
			                                                    <input type="file" class="form-control" name="subFile" id="subFile" ng-model="product.images" multiple style="display: none;">
			                                                </div>
			                                            </div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-7">
											<div class="mb-2">
												<label for="name" class="form-label">Name</label>
												<input type="text" class="form-control" id="productName" ng-model="product.productName" name="productName" required>
											</div>
											<div class="mt-2">
												<label for="formFile" class="form-label">Product Image</label>
												<input type="file" ng-model="product.image" class="form-control" name="imgFile" id="imgFile{{product.productId}}">
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Color</label>
												<input type="text" class="form-control" id="color" ng-model="product.color" name="color" required>
											</div>
											<div class="mb-2">
												<label for="name" class="form-label">Quantity</label>
												<input type="number" min="1" class="form-control" id="quantity" ng-model="product.quantity" name="quantity" min="1" required>
											</div>
											<div class="mb-2">
												<label for="price" class="form-label">Price</label>
												<div class="input-group">
													<input type="number" min="0" class="form-control" id="price" name="price" ng-model="product.price" min="1" required>
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Discount</label>
												<div class="input-group">
													<input type="number" min="0" class="form-control" id="buyCount" name="buyCount" ng-model="product.discountPrice" min="0" required>
													<span class="input-group-text">VNĐ</span>
												</div>
											</div>
											<div class="mb-2">
												<label for="buyCount" class="form-label">Status:</label>
											    <div class="d-flex">
											    	<div class="form-check me-5">
												        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" ng-value="true"
												            ng-model="product.status">
												        <label class="form-check-label" for="flexRadioDefault1">
												            Active
												        </label>
												    </div>
												    <div class="form-check">
												        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" ng-value="false"
												            ng-model="product.status">
												        <label class="form-check-label" for="flexRadioDefault2">
												            Inactive
												        </label>
												    </div>
											    </div>
											</div>
											<div class="mb-2">
												<label for="developer" class="form-label">Brand</label>
												<input type="text" class="form-control" id="developer" name="developer" ng-model="product.brand" required>
											</div>
											<div class="mb-2">
												<label for="publisher" class="form-label">Describe</label>
												<textarea class="form-control" id="describe" name="describe" rows="3" ng-model="product.describe" required></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">Save</button>
									<button type="button" class="btn btn-danger" ng-click="deleteProduct(product.productId)" data-bs-dismiss="modal">Delete</button>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/productAdmin.js"></script>
</body>

</html>