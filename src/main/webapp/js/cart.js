const app = angular.module("myApp", ["ngRoute"]);
app.controller("cartCtrl", function($scope, $http) {
	
	$scope.loadData = function(){
        $http.get("/rest/cart/findAll")
        .then(function(response){
            $scope.carts = response.data
            console.log($scope.carts);
        })
        .catch(function(error) {
            console.error("Error loading cart data:", error);
        });
    }
    
    $scope.loadData();
})
