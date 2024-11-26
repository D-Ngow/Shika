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

<body ng-controller="sizeAdminCtrl">
	<c:import url="header.jsp"></c:import>

	<div class="container py-5">
		<h3 class="text-start fw-bold mb-3">Product Size Manager</h3>
		<div class="d-flex justify-content-end">
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Product</th>
					<th scope="col">34</th>
					<th scope="col">35</th>
					<th scope="col">36</th>
					<th scope="col">37</th>
					<th scope="col">38</th>
					<th scope="col">39</th>
					<th scope="col">40</th>
					<th scope="col">41</th>
					<th scope="col">42</th>
					<th scope="col">43</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="product in products">
					<td><img src="/image/product/{{product.image}}" class="img-fluid" alt="" style="max-width: 50px"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
					<td><input class="form-check-input" type="checkbox"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/sizeAdmin.js"></script>
</body>

</html>