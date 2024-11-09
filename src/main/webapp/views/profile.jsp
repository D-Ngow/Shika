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
							<li class="nav-item flex-fill bg-light rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="#">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="12.25" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#000000"
											d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z" />
                                    </svg> Profile
							</a></li>
							<li class="nav-item flex-fill rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="/buyhistory">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="10.5" viewBox="0 0 384 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#000000"
											d="M14 2.2C22.5-1.7 32.5-.3 39.6 5.8L80 40.4 120.4 5.8c9-7.7 22.3-7.7 31.2 0L192 40.4 232.4 5.8c9-7.7 22.3-7.7 31.2 0L304 40.4 344.4 5.8c7.1-6.1 17.1-7.5 25.6-3.6s14 12.4 14 21.8l0 464c0 9.4-5.5 17.9-14 21.8s-18.5 2.5-25.6-3.6L304 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L192 471.6l-40.4 34.6c-9 7.7-22.3 7.7-31.2 0L80 471.6 39.6 506.2c-7.1 6.1-17.1 7.5-25.6 3.6S0 497.4 0 488L0 24C0 14.6 5.5 6.1 14 2.2zM96 144c-8.8 0-16 7.2-16 16s7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 144zM80 352c0 8.8 7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 336c-8.8 0-16 7.2-16 16zM96 240c-8.8 0-16 7.2-16 16s7.2 16 16 16l192 0c8.8 0 16-7.2 16-16s-7.2-16-16-16L96 240z" />
                                    </svg> Buy History
							</a></li>
							<li class="nav-item flex-fill rounded-3 mb-2"><a
								class="nav-link text-black d-flex align-items-center" href="#">
									<svg xmlns="http://www.w3.org/2000/svg" class="me-2"
										height="14" width="12.25" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#000000"
											d="M144 144l0 48 160 0 0-48c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192l0-48C80 64.5 144.5 0 224 0s144 64.5 144 144l0 48 16 0c35.3 0 64 28.7 64 64l0 192c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 256c0-35.3 28.7-64 64-64l16 0z" />
                                    </svg> Password
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-10">
				<div class="p-4 bg-white rounded-4">
					<div class="row">
						<div class="col-6">
							<h5>Thông tin</h5>
							<form action="/profile/edit?id=${user.userId}" method="post">
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="name" id="name"
										placeholder="name" value="${user.name}"> <label
										for="name">Họ tên</label>
								</div>
								<div class="form-floating mb-3">
									<input type="number" class="form-control" name="phoneNumber"
										id="phone" placeholder="phone" value="${user.phoneNumber}">
									<label for="phone">Số điện thoại</label>
								</div>

								<div class="form-floating mb-3">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="email" value="${user.email}">
									<label for="email">Email</label>
								</div>

								<div class="row mb-3">
									<div class="form-floating col-md-6">
										<input type="date" class="form-control" name="birthday"
											id="dob" value="${birthday}"> <label for="dob"
											class="ms-2 ps-3">Ngày sinh</label>
									</div>
									<div class="form-floating col-md-6">
										<select id="gender" class="form-select" name="gender">
											<option selected value="true">Nam</option>
											<option value="false">Nữ</option>
											<option>Khác</option>
										</select> <label for="gender" class="ms-2 ps-3">Giới tính</label>
									</div>
								</div>

								<button type="submit" class="btn btn-primary mb-4">
									<svg xmlns="http://www.w3.org/2000/svg" height="20"
										width="17.5" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#ffffff"
											d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-242.7c0-17-6.7-33.3-18.7-45.3L352 50.7C340 38.7 323.7 32 306.7 32L64 32zm0 96c0-17.7 14.3-32 32-32l192 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32L96 224c-17.7 0-32-14.3-32-32l0-64zM224 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z" />
                                    </svg>
								</button>
							</form>
						</div>

						<div class="col-6">
							<div class="d-flex justify-content-between align-items-center">
								<h5>Địa chỉ</h5>
								<button type="button" class="btn btn-success"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									<svg xmlns="http://www.w3.org/2000/svg" height="18"
										width="16.25" viewBox="0 0 448 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path fill="#ffffff"
											d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l320 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zM200 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
                                    </svg>
								</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Add
													Address</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<form action="/profile/address" method="post">
												<div class="modal-body">
													<div class="form-floating mb-3">
														<input type="text" class="form-control" name="tp"
															id="floatingInput" placeholder="name@example.com">
														<label for="floatingInput">Tỉnh / Thành phố</label>
													</div>
													<div class="form-floating mb-3">
														<input type="text" class="form-control" name="quan"
															id="floatingInput" placeholder="name@example.com">
														<label for="floatingInput">Quận / Huyện</label>
													</div>
													<div class="form-floating mb-3">
														<input type="text" class="form-control" name="xa"
															id="floatingInput" placeholder="name@example.com">
														<label for="floatingInput">Phường / Xã</label>
													</div>
													<div class="form-floating mb-3">
														<input type="text" class="form-control" name="duong"
															id="floatingInput" placeholder="name@example.com">
														<label for="floatingInput">Số nhà / Tên Đường</label>
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary">Save
														changes</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
							<div class="overflow-auto">
								<c:forEach var="address" items="${listadr}">
									<div class="card my-2">

										<div
											class="card-body d-flex justify-content-between align-items-center my-1">
											<div>
												<p class="mb-0">${address.address}</p>
											</div>
											<div class="d-flex">

												<button type="button" class="btn btn-warning me-2"
													data-bs-toggle="modal" data-bs-target="#exampleModal1">
													<svg xmlns="http://www.w3.org/2000/svg" height="16"
														width="16" viewBox="0 0 512 512">
														<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                    <path fill="#ffffff"
															d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z" />
                                                </svg>
												</button>
												<div class="modal fade" id="exampleModal1" tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="exampleModalLabel">Edit
																	Address</h1>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<form action="/profile/address" method="post">
																<div class="modal-body">
																	<div class="form-floating mb-3">
																		<input type="text" class="form-control" name="tp"
																			id="floatingInput" placeholder="name@example.com">
																		<label for="floatingInput">Tỉnh / Thành phố</label>
																	</div>
																	<div class="form-floating mb-3">
																		<input type="text" class="form-control" name="quan"
																			id="floatingInput" placeholder="name@example.com">
																		<label for="floatingInput">Quận / Huyện</label>
																	</div>
																	<div class="form-floating mb-3">
																		<input type="text" class="form-control" name="xa"
																			id="floatingInput" placeholder="name@example.com">
																		<label for="floatingInput">Phường / Xã</label>
																	</div>
																	<div class="form-floating mb-3">
																		<input type="text" class="form-control" name="duong"
																			id="floatingInput" placeholder="name@example.com">
																		<label for="floatingInput">Số nhà / Tên Đường</label>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="submit" class="btn btn-primary">Save
																		changes</button>
																</div>
															</form>
														</div>
													</div>
												</div>
												
												<a class="btn btn-danger"
													href="/profile/deleteadr?idadr=${address.addressId}"> <svg
														xmlns="http://www.w3.org/2000/svg" height="16"
														width="16.25" viewBox="0 0 448 512">
														<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                                    <path fill="#ffffff"
															d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0L284.2 0c12.1 0 23.2 6.8 28.6 17.7L320 32l96 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 96C14.3 96 0 81.7 0 64S14.3 32 32 32l96 0 7.2-14.3zM32 128l384 0 0 320c0 35.3-28.7 64-64 64L96 512c-35.3 0-64-28.7-64-64l0-320zm96 64c-8.8 0-16 7.2-16 16l0 224c0 8.8 7.2 16 16 16s16-7.2 16-16l0-224c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16l0 224c0 8.8 7.2 16 16 16s16-7.2 16-16l0-224c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16l0 224c0 8.8 7.2 16 16 16s16-7.2 16-16l0-224c0-8.8-7.2-16-16-16z" />
                                                </svg>
												</a>
											</div>
										</div>

									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
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
