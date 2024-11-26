const app = angular.module("myApp", ["ngRoute"]);
app.controller("sizeAdminCtrl", function($scope, $http) {
	$scope.loadData = function() {
		$http.get("/manager/product/findall")
			.then(function(response) {
				$scope.products = response.data;
			})
	}
	
	$scope.loadData();
})