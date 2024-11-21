const app = angular.module("myApp", ["ngRoute"]);
app.controller("categoryCtrl", function($scope, $http) {

	$scope.loadData = function() {
		$http.get("/manager/category/findAll")
			.then(function(response) {
				$scope.category = response.data;
			})
	}

	$scope.loadPro = function(id) {
		$http.get("/manager/category/findPro/" + id)
			.then(function(response) {
				$scope.listPro = response.data;
			})
	}

	$scope.loadAllPro = function() {
		$http.get("/manager/category/findAllPro")
			.then(function(response) {
				$scope.listAllPro = response.data;
			})
	}

	$scope.addCate = function(Catename) {
		var formData = new FormData();
		formData.append('name', Catename);
		const image = document.getElementById('cateimage');
		if (image.files.length > 0) {
			formData.append('image', image.files[0]);
		} else {
			swal("Chose image before add category", {
				buttons: false,
				timer: 3000,
				icon: "error",
			});
			return;
		}
		$http.post("/manager/category/addCate", formData, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(function(response) {
			swal("Add successfully", {
				buttons: false,
				timer: 3000,
				icon: "success",
			});
			$scope.loadData();
		})
	}

	$scope.addPro = function(cateId, proId) {
		$http.post("/manager/category/addPro/" + cateId + "/" + proId)
			.then(function(response) {
				$scope.success = response.data;
				if ($scope.success) {
					swal("Thêm thành công", {
						buttons: false,
						timer: 3000,
						icon: "success",
					});
				} else {
					swal("Thêm thất bại", {
						buttons: false,
						timer: 3000,
						icon: "error",
					});
				}
			})
			.catch(function(error) {
				console.error("Lỗi khi thêm sản phẩm:", error);
				swal("Đã xảy ra lỗi", {
					buttons: false,
					timer: 3000,
					icon: "error",
				});
			});
		$scope.loadData();
	};

	$scope.deletePro = function(cateId, proId) {
		$http.delete("/manager/category/deletePro/" + cateId + "/" + proId)
			.then(function(response) {
				$scope.loadData();
			})
	}
	$scope.deletecate = function(cateId) {
		$http.delete("/manager/category/deleteCate/" + cateId)
			.then(function(response) {
				$scope.loadData();
			})
	}
	$scope.loadData();

});