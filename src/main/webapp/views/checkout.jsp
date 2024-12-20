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
<link rel="stylesheet" href="css/cart.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
	<c:import url="header.jsp"></c:import>

	<div class="container py-3 px-5">
		<div class="row">
			<div class="col-md-8">
				<h3 class="mb-4">Bag</h3>
				<c:forEach var="cart" items="${listCart}">
					<div class="card mb-3 border-0">
						<div class="row g-0 align-items-center">
							<div class="col-md-2">
								<img src="/image/product/${cart.detail.product.image}"
									class="img-fluid" alt="">
							</div>
							<div class="col-md-10">
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h5 class="card-title">${cart.detail.product.productName}</h5>
										<p class="card-text fw-bold">
											<fmt:formatNumber type="number"
												value="${cart.detail.product.price}" />
											₫
										</p>
									</div>
									<p class="card-text text-muted mb-1">Brand: ${cart.detail.product.brand}</p>
									<p class="card-text text-mute mb-1">Color: ${cart.detail.product.color}</p>
									<div class="d-flex">
										<div class="me-3 d-flex align-items-center">Size: ${cart.detail.type.size}</div>
										<div class="d-flex align-items-center">Quantity: ${cart.quantity}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-md-4">
                <form method="post">
                	<div class="card border-0">
	                    <div class="card-body">
	                        <h5 class="card-title mb-2">Shipping Details</h5>
	                        <p class="d-flex justify-content-between fw-medium">
	                            <span>Name:</span>
	                            <span>${user.name}</span>
	                        </p>
	                        <p class="d-flex justify-content-between fw-medium">
	                            <span>Phone Number:</span>
	                            <span>${user.phoneNumber}</span>
	                        </p>
	                        <p class="d-flex justify-content-between fw-medium">
	                            <span>Email:</span>
	                            <span>${user.email}</span>
	                        </p>
	                        <p class="d-flex justify-content-between fw-medium mb-0">Ship Address:</p>
	                        <select class="form-select form-select mb-3" name="address">
	                            <c:forEach var="address" items="${user.shippingAddresses}">
	                            	<option value="${address.road}, ${address.ward}, ${address.district}, ${address.city}">${address.road}, ${address.ward}, ${address.district}, ${address.city}</option>
	                            </c:forEach>
	                        </select>
	                        <p class="d-flex justify-content-between fw-medium mb-0">Payment Type:</p>
	                        <select class="form-select form-select mb-3" name="payment">
	                            <c:forEach var="payment" items="${listPayment}">
	                            	<option value="${payment.paymentId}">${payment.paymentType}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                </div>
	                <div class="card border-0">
	                    <div class="card-body">
	                        <h5 class="card-title mb-3">Summary</h5>
	                        <p class="d-flex justify-content-between">
								<span class="fw-medium">Subtotal</span> <span class="fw-medium"><fmt:formatNumber
										type="number" value="${subtotal}" />₫</span>
							</p>
							<p class="d-flex justify-content-between">
								<span class="fw-medium">Discount</span> <span class="fw-medium"><fmt:formatNumber
										type="number" value="${discount}" />₫</span>
							</p>
							<hr>
							<p class="d-flex justify-content-between fw-bold">
								<span>Total</span> <span><fmt:formatNumber type="number"
										value="${total}" />₫</span>
							</p>
	                        <button formaction="/genInvoice" class="btn btn-dark w-100 rounded-pill checkout">Checkout</button>
	                    </div>
	                </div>
                </form>
            </div>
		</div>
	</div>
	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
</body>

</html>