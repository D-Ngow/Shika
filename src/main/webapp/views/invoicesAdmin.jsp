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

<body ng-controller="InvoiceAdminCtrl">
	<c:import url="header.jsp"></c:import>

	<div class="container py-5">
		<h3 class="text-start fw-bold mb-3">Invoice Manager</h3>
		<div class="d-flex justify-content-end">
			<select class="form-select w-25 mx-2" id="fillbystt" ng-change="fill()" ng-model="status"
				aria-label="Default select example">
				<option value="3" >All</option>
				<option value="0">Not yet Confirm</option>
				<option value="1">Confirmed</option>
				<option value="2">Cancelled</option>
			</select> 
			<select class="form-select w-25 mx-2" id="fillbydate" ng-change="fill()" ng-model="date"
				aria-label="Default select example">
				<option  value="asc">Ascending</option>
				<option value="desc">Descending</option>
			</select>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Ship Address</th>
					<th scope="col">Total Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Create Date</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="invoice in listinvoice">
					<th>{{invoice.user.name}}</th>
					<td>{{invoice.shipAddress}}</td>
					<td>{{invoice.total}}</td>
					<td>{{invoice.payment.paymentType}}</td>
					<td>{{invoice.createDate}}</td>
					<td ng-if="invoice.status === 0">Chưa xác nhận</td>
					<td ng-if="invoice.status === 1">Đã xác nhận</td>
					<td ng-if="invoice.status === 2">Đã hủy</td>
					<td>
						<button ng-click="showivlistpro(invoice.invoiceId)" type="button"
							class="btn btn-warning" data-bs-toggle="modal"
							data-bs-target="#exampleModal">Details</button> <!-- Modal -->
						<div class="modal modal-lg fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
											title</h1>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">Product Image</th>
													<th scope="col">Name</th>
													<th scope="col">Color</th>
													<th scope="col">Price</th>
													<th scope="col">Brand</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="product in listpro">
													<td><img src="/image/product/{{product.image}}"
														style="max-width: 70px"></td>
													<td>{{product.productName}}</td>
													<td>{{product.color}}</td>
													<td>{{product.price}}</td>
													<td>{{product.brand}}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<button ng-click="changeivstt(invoice.invoiceId,1)" type="button"
							class="btn btn-success">Confirm</button>
						<button ng-click="changeivstt(invoice.invoiceId,2)" type="button"
							class="btn btn-danger">Cancel</button>
					</td>
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
	<script src="js/invoiceAdmin.js"></script>
</body>

</html>