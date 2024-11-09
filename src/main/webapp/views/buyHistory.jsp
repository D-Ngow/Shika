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
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/buyHistory.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
	<c:import url="header.jsp"></c:import>

	<div class="container">
		<div class="row gx-5 my-4">
			<div class="col-2 bg-white p-4 rounded-4">
				<button class="btn btn-light d-md-none" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasResponsive"
					aria-controls="offcanvasResponsive">
					<svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
						viewBox="0 0 448 512">
						<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                        <path fill="#000000"
							d="M0 96C0 78.3 14.3 64 32 64l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 128C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 288c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32L32 448c-17.7 0-32-14.3-32-32s14.3-32 32-32l384 0c17.7 0 32 14.3 32 32z" />
                    </svg>
				</button>

				<div class="offcanvas-md offcanvas-end" tabindex="-1"
					id="offcanvasResponsive" aria-labelledby="offcanvasResponsiveLabel">
					<div class="offcanvas-header">
						<h5 class="offcanvas-title" id="offcanvasResponsiveLabel">Responsive
							offcanvas</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" data-bs-target="#offcanvasResponsive"
							aria-label="Close"></button>
					</div>
					<div class="offcanvas-body">
						<ul class="nav flex-column w-100 fw-bold">
							<li class="nav-item flex-fill rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="/profile">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="12.25" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z" /></svg>
									Profile
							</a></li>
							<li class="nav-item flex-fill bg-light rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="#">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="10.5" viewBox="0 0 384 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8l0 464c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488L0 24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 144zM80 352c0 8.8 7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 336c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 240z" /></svg>
									Buy History
							</a></li>
							<li class="nav-item flex-fill rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="#">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="12.25" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M144 144l0 48 160 0 0-48c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192l0-48C80 64.5 144.5 0 224 0s144 64.5 144 144l0 48 16 0c35.3 0 64 28.7 64 64l0 192c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 256c0-35.3 28.7-64 64-64l16 0z" /></svg>
									Password
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="p-4 bg-white rounded-4 main">
					<c:forEach var="listinvoices" items="${listiv}">
						<div class="card rounded-0 border-0">
							<div class="card border-0">
								<div class="row g-0 align-items-center">
									<c:forEach var="prddt" items="${listinvoices.invoiceDetails}">
										<div class="col-md-2">
											<img src="/image/product/${prddt.detail.product.image}"
												class="img-fluid" alt="Nike Blazer Mid '77 Vintage">
										</div>
										<div class="col-md-10">
											<div class="card-body">
												<div class="d-flex justify-content-between">
													<h5 class="card-title">${prddt.detail.product.productName}</h5>
													<p class="card-text fw-bold">${prddt.detail.product.price}₫</p>
												</div>
												<p class="card-text text-muted mb-1">Men's Shoes</p>
												<p class="card-text text-mute mb-1">White/Black</p>
												<div class="d-flex">
													<p class="me-4">Size:${prddt.detail.type.size}</p>
													<p>Quantity:${prddt.quantity}</p>
												</div>
											</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="card-footer border-0 rounded-0">
							<div class="row">
								<div class="col-7">
									<p class="fw-bold mb-1 mt-3">Shipping Address:</p>
									<p>15 ABC, Đường XYZ, Phường 1, Quận 1, Thành phố Hồ Chí
										Minh, Việt Nam</p>
								</div>
								<div class="col-5">
									<div class="d-flex justify-content-end">
										<h4 class="fw-bold mt-3">Total
											Price:${listinvoices.total}</h4>
									</div>
									<div class="d-flex justify-content-end">
										<div class="fw-bold me-2">Pay Date:</div>
										<p>${listinvoices.createDate}</p>
									</div>
								</div>
							</div>
						</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>

	<c:import url="footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
</body>

</html>