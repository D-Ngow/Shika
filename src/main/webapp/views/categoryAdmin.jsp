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
<link rel="stylesheet" href="css/product.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body>
	<c:import url="header.jsp"></c:import>

	<div ng-controller="categoryCtrl" class="container py-5">
        <h3 class="text-start fw-bold mb-3">Category Manager</h3>
        <div class="row">
            <div class="dropdown mb-3 col-6">
            </div>
            <div class="d-flex justify-content-end col-6">
                <button class="bg-success border-0 text-light h-50 px-4 me-4" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">Add</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel1"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Add Address</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/crudUpdate" method="post" enctype="multipart/form-data">
                                    <div class="row g-5">
                                        <div class="col-12">
                                            <div class="mb-2">
                                                <label for="name" class="form-label">Name</label> <input type="text"
                                                    class="form-control" id="name" name="name" value="${pro.name}">
                                            </div>
                                            <div class="mb-2">
                                                <label for="formFile" class="form-label">9:16
                                                    image</label> <input class="form-control" type="file" id="formFile"
                                                    name="image">
                                            </div>
                                            <div class="d-flex justify-content-end">
                                                <button formaction="/crudUpdate?id=${pro.id}" class="btn btn-primary mx-2">Save</button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="bg-white border-0" data-bs-toggle="dropdown" aria-expanded="false">
                        Sort
                        <svg xmlns="http://www.w3.org/2000/svg" height="14" width="14"
                            viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                            <path fill="#000000"
                                d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                        </svg>
                    </button>
                    <ul class="dropdown-menu border-1 rounded-0">
                        <li><a class="dropdown-item" href="#">New to old</a></li>
                        <li><a class="dropdown-item" href="#">Old to new</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row row-cols-2 row-cols-md-4 row-cols-sm-3 row-cols-xs-2 g-4">
        	<div ng-repeat="cate in category" class="col-3">
        		<button class="btn p-0 m-0" data-bs-toggle="modal" data-bs-target="#exampleModal{{cate.categorieId}}" ng-click="loadPro(cate.categorieId)">
                <div class="col-xs-6">
                    <div class="card border-1 text-dark">
                        <img src="/image/category/{{cate.image}}" class="card-img-top" alt="...">
                        <div class="card-body px-3 py-0 text-start my-3">
                            <h5 class="card-text fw-bold">{{cate.name}}</h5>
                            <div class="card-text fw-bold">
                                Product quantity: 1
                            </div>
                        </div>
                    </div>
                </div>
            </button>
            <div class="modal modal-lg fade" id="exampleModal{{cate.categorieId}}" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add Address</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <table class="table">
                                    <thead>
                                      <tr>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Color</th>
                                        <th scope="col">Brand</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Status</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr ng-repeat="pro in listPro">
                                        <td><img src="/image/product/{{pro.image}}" class="w-25"></td>
                                        <td>{{pro.productName}}</td>
                                        <td>{{pro.color}}</td>
                                        <td>{{pro.brand}}</td>
                                        <td>{{pro.quantity}}</td>
                                        <td>{{pro.status}}</td>
                                      </tr>
                                    </tbody>
                                  </table>
                            </div>
                            <div class="modal-footer">
                                <button ng-click="loadAllPro()" class="btn btn-primary mx-2" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">Add</button>
                                <button formaction="/crudDelete?id=${pro.id}" class="btn btn-danger mx-2">Delete</button>
                              </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
                tabindex="-1">
                <div class="modal-dialog modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">Select Product</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
            
                        <div class="modal-body">
                            <form method="post">
                                <div class="form-floating">
                                    <select name="proId" class="form-select" ng-model="selectedProId">
                                        <option ng-repeat="pro in listAllPro" ng-value="pro.productId">{{pro.productName}}</option>
                                    </select>
                                    <label for="gender">Product</label>
                                </div>
                                <div class="d-grid gap-2">
                                    <button ng-click="addPro(cate.categorieId, selectedProId)" class="btn btn-primary my-2">Save</button>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary mx-2" data-bs-target="#exampleModal{{cate.categorieId}}" data-bs-toggle="modal">Back</button>
                        </div>
            
                    </div>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/home.js"></script>
	<script src="js/categoryAdmin.js"></script>
</body>

</html>