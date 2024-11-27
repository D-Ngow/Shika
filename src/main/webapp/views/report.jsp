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

<body ng-controller="reportCtrl">
	<c:import url="header.jsp"></c:import>

	<div class="container py-5">
		<h3 class="text-start fw-bold mb-3">Report Revenue</h3>
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-6 d-flex justify-content-end">
					<select class="form-select px-3" aria-label="Default select example" id="month" ng-change="loadRevenueMonth()" ng-model="month">
						  <option value="1">Tháng 1</option>
						  <option value="2">Tháng 2</option>
						  <option value="3">Tháng 3</option>
						  <option value="4">Tháng 4</option>
						  <option value="5">Tháng 5</option>
						  <option value="6">Tháng 6</option>
						  <option value="7">Tháng 7</option>
						  <option value="8">Tháng 8</option>
						  <option value="9">Tháng 9</option>
						  <option value="10">Tháng 10</option>
						  <option value="11">Tháng 11</option>
						  <option value="12">Tháng 12</option>
						</select>
						
						<select class="form-select px-3" aria-label="Default select example" id="year" ng-change="loadRevenueMonth(); loadRevenueYear()" ng-model="year">
						  <c:forEach var="year" items="${listYear}">
						  	<option value="${year}">${year}</option>
						  </c:forEach>
						</select>
				</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<canvas id="yearChart"></canvas>
				<h5 class="text-center">Total Revenue Year: {{totalYear | currency:'₫'}}</h5>
			</div>
			<div class="col-md-6">
				<canvas id="monthChart"></canvas>
				<h5 class="text-center">Total Revenue Month: {{totalMonth | currency:'₫'}}</h5>
			</div>
		</div>
		<!--<table class="table">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Name</th>
					<th scope="col">Sold Quantity</th>
					<th scope="col">Total Revenue</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="invDt in listInvoiceDt">
					<th><img alt="" src="/image/product/{{invDt.detail.product.iamge}}"></th>
					<td>{{invDt.detail.product.productName}}</td>
					<td>{{invDt.total}}</td>
					<td>{{invDt.detail.product.price * invDt.total}}</td>
			</tbody>
		</table>  -->
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.6/dist/chart.umd.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/report.js"></script>
</body>

</html>