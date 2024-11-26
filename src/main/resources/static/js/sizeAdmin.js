const app = angular.module("myApp", ["ngRoute"]);
app.controller("sizeAdminCtrl", function($scope, $http) {
	$scope.loadData = function() {
		$http.get("/manager/size/findAll")
			.then(function(response) {
				$scope.products = response.data;
				console.log($scope.products)
			})
	}
	
	$scope.updateSize = function(productId, size, isChecked) {
		const url = isChecked ? "/manager/size/add" : "/manager/size/remove";
		const method = isChecked ? "POST" : "DELETE";

		$http({
			method: method,
			url: url,
			params: { productId: productId, size: size }
		})
		.catch(function(error) {
			swal("Fail to update size", {
				buttons: false,
				timer: 2000,
				icon: "error",
			});
			console.error(error);
		})
	};
	
	$scope.loadData();
})