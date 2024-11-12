<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html ng-app="myApp" lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shiko Store</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/cart.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body ng-controller="cartCtrl">
	<c:import url="header.jsp"></c:import>

	<div class="container bag">
		<div class="row">
			<div class="col-md-8">
				<h3 class="mb-4">Bag</h3>
					<div class="card mb-3 border-0" ng-repeat="cart in carts">
						<div class="row g-0 align-items-center">
							<div class="col-md-3">
								<img src="/image/product/{{cart.image}}" class="img-fluid" alt="">
							</div>
							<div class="col-md-9">

								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h5 class="card-title">{{cart.productName}}</h5>
										<p class="card-text fw-bold price">{{cart.price | currency:'₫'}}</p>
									</div>
									<p class="card-text text-muted mb-1">{{cart.brand}}</p>
									<p class="card-text text-mute mb-1">{{cart.color}}</p>
									<div class="d-flex">
										<div class="me-3 d-flex align-items-center">Size: {{cart.size}}</div>
										<div class="d-flex align-items-center">Quantity:
											<input type="number" ng-change="changeQuantity(cart.cartId, cart.quantity)" ng-model="cart.quantity" min="1" class="quantity">
										</div>
									</div>
									<button class="border-0 bg-white" ng-click="deleteCart(cart.cartId)">
										<svg xmlns="http://www.w3.org/2000/svg" height="20"
											width="17.5" viewBox="0 0 448 512">
											<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
											<path fill="#000000"
												d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z" /></svg>
									</button>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="col-md-4">
				<div class="card border-0">
					<div class="card-body">
						<h5 class="card-title mb-3">Summary</h5>
						<p class="d-flex justify-content-between">
							<span class="fw-medium">Subtotal</span>
							<span class="fw-medium" id="subtotal" ng-model="subtotal">{{subtotal | currency:'₫'}}</span>
						</p>
						<p class="d-flex justify-content-between">
							<span class="fw-medium">Discount</span>
							<span class="fw-medium" id="discount" ng-model="discount">{{discount | currency:'₫'}}</span>
						</p>
						<hr>
						<p class="d-flex justify-content-between fw-bold">
							<span>Total</span>
							<span ng-model="total">{{total | currency:'₫'}}</span>
						</p>
						<button class="btn btn-dark w-100 rounded-pill checkout">Checkout</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/cart.js"></script>
</body>

</html>