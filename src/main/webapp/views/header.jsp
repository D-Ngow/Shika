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
<link rel="stylesheet" href="css/product.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-white sticky-top border border-bottom-1">
		<div class="container">
			<img src="image/logo/Shiko_Logo_Black.png" alt="Logo" width="45"
				class="navbar-brand mx-5">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a href="/home"
						class="text-dark nav-link">HOME</a></li>
					<li class="nav-item"><a href="/product"
						class="text-dark nav-link">PRODUCTS</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#" role="button"
						data-bs-toggle="dropdown" data-bs-target="#cateMenu"
						aria-expanded="false"> CATEGORIES </a>
						<ul class="dropdown-menu border border-0 rounded-0 bg-light"
							id="cateMenu">
							<c:forEach var="cate" items="${listcate}">
								<li><a class="dropdown-item" href="/product?cateId=${cate.categorieId}">${cate.name}</a></li>
							</c:forEach>
						</ul></li>
					<li class="nav-item"><a href="#footer"
						class="text-dark nav-link">CONTACT</a></li>
					<li class="nav-item"><a href="#footer"
						class="text-dark nav-link">ABOUT US</a></li>
					<c:if test="${userrole == 'Admin'}">
						<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle text-dark" href="#" role="button"
						data-bs-toggle="dropdown" data-bs-target="#cateMenu1"
						aria-expanded="false"> CRUD </a>
						<ul class="dropdown-menu border border-0 rounded-0 bg-light"
							id="cateMenu1">
								<li><a class="dropdown-item" href="/managerProduct">Product</a></li>
								<li><a class="dropdown-item" href="/managerCategory">Categories</a></li>
								<li><a class="dropdown-item" href="#">Invoice</a></li>
						</ul></li>
					</c:if>
				</ul>
				<div class="d-flex align-items-center gap-5">
					<form action="/search" class="search-box" role="search"
						method="post">
						<input type="text" class="search-input" name="search" />
						<button class="search-btn">
							<svg xmlns="http://www.w3.org/2000/svg" height="20" width="20"
								viewBox="0 0 512 512">
                                <path fill="#ffffff"
									d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                            </svg>
						</button>
					</form>
					<div class="dropdown-center d-flex alignment-item-center">
						<button type="button" class="dropdown-toggle border-0 bg-white bg-light"
							data-bs-toggle="dropdown" data-bs-target="#userMenu"
							aria-expanded="false">
							<svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
								viewBox="0 0 448 512">
								<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
								<path fill="#000000"
									d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z" /></svg>
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item d-flex align-items-center"
								href="/signin"> <svg xmlns="http://www.w3.org/2000/svg"
										height="20" width="20" viewBox="0 0 512 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M217.9 105.9L340.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L217.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1L32 320c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM352 416l64 0c17.7 0 32-14.3 32-32l0-256c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32l64 0c53 0 96 43 96 96l0 256c0 53-43 96-96 96l-64 0c-17.7 0-32-14.3-32-32s14.3-32 32-32z" /></svg>
									<span class="ms-2">Sign in</span>
							</a></li>
							<li><a class="dropdown-item" href="/profile"> <svg
										xmlns="http://www.w3.org/2000/svg" height="20" width="20"
										viewBox="0 0 576 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M64 32C28.7 32 0 60.7 0 96L0 416c0 35.3 28.7 64 64 64l448 0c35.3 0 64-28.7 64-64l0-320c0-35.3-28.7-64-64-64L64 32zm80 256l64 0c44.2 0 80 35.8 80 80c0 8.8-7.2 16-16 16L80 384c-8.8 0-16-7.2-16-16c0-44.2 35.8-80 80-80zm-32-96a64 64 0 1 1 128 0 64 64 0 1 1 -128 0zm256-32l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64l128 0c8.8 0 16 7.2 16 16s-7.2 16-16 16l-128 0c-8.8 0-16-7.2-16-16s7.2-16 16-16z" /></svg>
									<span class="ms-2">Account</span>
							</a></li>
							<li><a class="dropdown-item" href="/logout"> <svg
										xmlns="http://www.w3.org/2000/svg" height="20" width="20"
										viewBox="0 0 512 512">
										<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
										<path fill="#000000"
											d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z" /></svg>
									<span class="ms-2">Sign out</span>
							</a></li>
						</ul>
					</div>
					<a href="/cart"> <svg xmlns="http://www.w3.org/2000/svg"
							height="20" width="20" viewBox="0 0 576 512">
                            <path fill="#000000"
								d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
                        </svg>
					</a>
				</div>
			</div>
		</div>
	</nav>
</body>