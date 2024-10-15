<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoe Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/home.css">
    <link rel="icon" href="image/logo/Shiko_Logo_Black.png">
</head>

<body>
    <nav class="navbar navbar-expand-lg bg-light sticky-top">
        <div class="container">
            <img src="image/logo/Shiko_Logo_Black.png" alt="Logo" width="45" class="navbar-brand mx-5">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="#" class="text-dark nav-link">HOME</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="text-dark nav-link">PRODUCTS</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-dark" href="#" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">
                            CATEGORIES
                        </a>
                        <ul class="dropdown-menu border border-0 rounded-0 bg-light">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="text-dark nav-link">PRODUCTS</a>
                    </li>
                    <li class="nav-item">
                        <a class="text-dark nav-link">CONTACT</a>
                    </li>
                    <li class="nav-item">
                        <a class="text-dark nav-link">ACCOUNT</a>
                    </li>
                </ul>
                <div class="d-flex align-items-center gap-5">
                    <form class="search-box" role="search" method="post">
                        <input type="text" class="search-input" />
                        <button class="search-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20"
                                viewBox="0 0 512 512">
                                <path fill="#ffffff"
                                    d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                            </svg>
                        </button>
                    </form>
                    <a href="#">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="22.5"
                            viewBox="0 0 576 512">
                            <path fill="#000000"
                                d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="image/banner/banner1.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner2.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner3.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner4.png" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="image/banner/banner5.png" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Top Picks Section -->

    <div class="carousel-container">
        <div class="row">
            <div class="col-6">
                <h2 class="text-start mb-4 fw-bold">Top picks</h2>
            </div>
            <div class="col-6">
                <div class="d-flex justify-content-end gap-1">
                    <button class="carousel-btn border border-0 rounded-circle align-items-center" id="prevBtn">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
                            viewBox="0 0 320 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#000000"
                                d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z" />
                        </svg>
                    </button>
                    <button class="carousel-btn border border-0 rounded-circle align-items-center" id="nextBtn">
                        <svg xmlns="http://www.w3.org/2000/svg" height="20" width="12.5"
                            viewBox="0 0 320 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#000000"
                                d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <div class="carousel-track">
            <div class="d-flex">
                <c:forEach var="product" items="${listprd}">
                	<div class="carousel-item-product">
                    <img src="image/product/${product.image}" alt="Product 1">
                    <p class="product-name">${product.productName}</p>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>


    <!-- Trending Section -->
    <div class="trending py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4 fw-bold">Trending Now</h2>
            <div class="row d-flex justify-content-center">
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/running.jpg" class="img-fluid" alt="Trending Shoe 1">
                    <p class="title">Running</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/football.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Football</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/trainning_and_gym.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Trainning and gym</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/sakteboard.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Skateboard</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/tenis.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Tenis</p>
                </div>
                <div class="col-6 col-lg-4 col-md-6 col-sm-6 category">
                    <img src="image/category/basketball.jpg" class="img-fluid" alt="Trending Shoe 2">
                    <p class="title">Basketball</p>
                </div>
            </div>
        </div>
    </div>

    <!-- New Design Section -->
    <div class="container py-5">
        <div class="row w-100">
            <div class="col-12 col-lg-6 col-md-12 row">
                <div class="col-6 col-lg-6 col-md-6 col-sm-6">
                    <img src="image/product/AIR+FORCE+1+'07 (3).png" class="img-fluid mb-3" alt="Nike React Presto">
                </div>
                <div class="col-6 col-lg-6 col-md-6 col-sm-6 text-start">
                    <h2 class="mb-3">NIKE REACT PRESTO BY YOU</h2>
                    <p class="lead">Take advantage of brand new cushioning technology with fresh Nike React shoes.</p>
                    <a href="#" class="btn btn-dark">View</a>
                </div>
            </div>
            <div class="col-12 col-lg-6 col-md-12 row">
                <div class="col-6 col-lg-6 col-md-6 col-sm-6">
                    <img src="image/product/AIR+FORCE+1+'07 (3).png" class="img-fluid mb-3" alt="Nike React Presto">
                </div>
                <div class="col-6 col-lg-6 col-md-6 col-sm-6 text-start">
                    <h2 class="mb-3">NIKE REACT PRESTO BY YOU</h2>
                    <p class="lead">Take advantage of brand new cushioning technology with fresh Nike React shoes.</p>
                    <a href="#" class="btn btn-dark">View</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-black text-white py-4">
        <div class="container d-flex justify-content-between gap-3">
            <div>
                <div class="d-flex justify-content-center">
                    <img src="image/logo/Shiko_Logo_White.png" alt="Logo" width="50">
                </div>
                <p class="mt-2 text-center">� 2024 Shiko</p>
            </div>
            <div>
                <h5>Info</h5>
                <ul class="list-unstyled">
                    <li class="my-3"><a href="#" class="text-white">Find a store</a></li>
                    <li class="my-3"><a href="#" class="text-white">Discount</a></li>
                    <li class="my-3"><a href="#" class="text-white">Feedback</a></li>
                </ul>
            </div>
            <div>
                <h5>Shop</h5>
                <ul class="list-unstyled">
                    <li class="my-3"><a href="#" class="text-white">Men</a></li>
                    <li class="my-3"><a href="#" class="text-white">Women</a></li>
                    <li class="my-3"><a href="#" class="text-white">Kids</a></li>
                </ul>
            </div>
            <div>
                <h5>About</h5>
                <ul class="list-unstyled">
                    <li class="my-3"><a href="#" class="text-white">News</a></li>
                    <li class="my-3"><a href="#" class="text-white">Careers</a></li>
                </ul>
            </div>
            <div class="d-flex gap-0 row">
                <div class="col-12 col-lg-3 col-sm-6 d-flex justify-content-center">
                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
                    viewBox="0 0 448 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                        d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64h98.2V334.2H109.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H255V480H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z" />
                </svg>
                </div>
                <div class="col-12 col-lg-3 col-sm-6 d-flex justify-content-center">
                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
                    viewBox="0 0 448 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                        d="M194.4 211.7a53.3 53.3 0 1 0 59.3 88.7 53.3 53.3 0 1 0 -59.3-88.7zm142.3-68.4c-5.2-5.2-11.5-9.3-18.4-12c-18.1-7.1-57.6-6.8-83.1-6.5c-4.1 0-7.9 .1-11.2 .1c-3.3 0-7.2 0-11.4-.1c-25.5-.3-64.8-.7-82.9 6.5c-6.9 2.7-13.1 6.8-18.4 12s-9.3 11.5-12 18.4c-7.1 18.1-6.7 57.7-6.5 83.2c0 4.1 .1 7.9 .1 11.1s0 7-.1 11.1c-.2 25.5-.6 65.1 6.5 83.2c2.7 6.9 6.8 13.1 12 18.4s11.5 9.3 18.4 12c18.1 7.1 57.6 6.8 83.1 6.5c4.1 0 7.9-.1 11.2-.1c3.3 0 7.2 0 11.4 .1c25.5 .3 64.8 .7 82.9-6.5c6.9-2.7 13.1-6.8 18.4-12s9.3-11.5 12-18.4c7.2-18 6.8-57.4 6.5-83c0-4.2-.1-8.1-.1-11.4s0-7.1 .1-11.4c.3-25.5 .7-64.9-6.5-83l0 0c-2.7-6.9-6.8-13.1-12-18.4zm-67.1 44.5A82 82 0 1 1 178.4 324.2a82 82 0 1 1 91.1-136.4zm29.2-1.3c-3.1-2.1-5.6-5.1-7.1-8.6s-1.8-7.3-1.1-11.1s2.6-7.1 5.2-9.8s6.1-4.5 9.8-5.2s7.6-.4 11.1 1.1s6.5 3.9 8.6 7s3.2 6.8 3.2 10.6c0 2.5-.5 5-1.4 7.3s-2.4 4.4-4.1 6.2s-3.9 3.2-6.2 4.2s-4.8 1.5-7.3 1.5l0 0c-3.8 0-7.5-1.1-10.6-3.2zM448 96c0-35.3-28.7-64-64-64H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96zM357 389c-18.7 18.7-41.4 24.6-67 25.9c-26.4 1.5-105.6 1.5-132 0c-25.6-1.3-48.3-7.2-67-25.9s-24.6-41.4-25.8-67c-1.5-26.4-1.5-105.6 0-132c1.3-25.6 7.1-48.3 25.8-67s41.5-24.6 67-25.8c26.4-1.5 105.6-1.5 132 0c25.6 1.3 48.3 7.1 67 25.8s24.6 41.4 25.8 67c1.5 26.3 1.5 105.4 0 131.9c-1.3 25.6-7.1 48.3-25.8 67z" />
                </svg>
                </div>
                <div class="col-12 col-lg-3 col-sm-6 d-flex justify-content-center">
                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
                    viewBox="0 0 448 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                        d="M282 256.2l-95.2-54.1V310.3L282 256.2zM384 32H64C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64zm14.4 136.1c7.6 28.6 7.6 88.2 7.6 88.2s0 59.6-7.6 88.1c-4.2 15.8-16.5 27.7-32.2 31.9C337.9 384 224 384 224 384s-113.9 0-142.2-7.6c-15.7-4.2-28-16.1-32.2-31.9C42 315.9 42 256.3 42 256.3s0-59.7 7.6-88.2c4.2-15.8 16.5-28.2 32.2-32.4C110.1 128 224 128 224 128s113.9 0 142.2 7.7c15.7 4.2 28 16.6 32.2 32.4z" />
                </svg>
                </div>
                <div class="col-12 col-lg-3 col-sm-6 d-flex justify-content-center">
                    <svg xmlns="http://www.w3.org/2000/svg" height="20" width="17.5"
                    viewBox="0 0 448 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path fill="#ffffff"
                        d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM351.3 199.3v0c0 86.7-66 186.6-186.6 186.6c-37.2 0-71.7-10.8-100.7-29.4c5.3 .6 10.4 .8 15.8 .8c30.7 0 58.9-10.4 81.4-28c-28.8-.6-53-19.5-61.3-45.5c10.1 1.5 19.2 1.5 29.6-1.2c-30-6.1-52.5-32.5-52.5-64.4v-.8c8.7 4.9 18.9 7.9 29.6 8.3c-9-6-16.4-14.1-21.5-23.6s-7.8-20.2-7.7-31c0-12.2 3.2-23.4 8.9-33.1c32.3 39.8 80.8 65.8 135.2 68.6c-9.3-44.5 24-80.6 64-80.6c18.9 0 35.9 7.9 47.9 20.7c14.8-2.8 29-8.3 41.6-15.8c-4.9 15.2-15.2 28-28.8 36.1c13.2-1.4 26-5.1 37.8-10.2c-8.9 13.1-20.1 24.7-32.9 34c.2 2.8 .2 5.7 .2 8.5z" />
                </svg>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/home.js"></script>
</body>

</html>