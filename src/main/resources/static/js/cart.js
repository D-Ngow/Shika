function alertMess(){
	const queryString = window.location.search;
	const params = new URLSearchParams(queryString);
	const message = params.get('message');
	console.log("vàooooooooo")
	if(message.length>0){
		swal(message, {
		  buttons: false,
		  timer: 3000,
		  icon: "warning",
		});
	}
}

const app = angular.module("myApp", ["ngRoute"]);
app.controller("cartCtrl", function($scope, $http) {
	
	$scope.loadData = function(){
        $http.get("/rest/cart/findAll")
        .then(function(response){
            $scope.carts = response.data;
            $scope.subtotal = 0;
            $scope.discount = 0;
            angular.forEach($scope.carts, function(cart){
				$scope.subtotal += cart.subtotal;
				$scope.discount += cart.discount;
			});
			$scope.total = $scope.subtotal - $scope.discount;
        })
        .catch(function(error) {
            console.error("Error loading cart data:", error);
        });
    }
    $scope.changeQuantity = function(id, quantity){
		$http.put("/rest/cart/changeQuantity/"+id+"/"+quantity)
        .then(function(response) {
            $scope.loadData(); // Load lại dữ liệu sau khi cập nhật thành công
        })
        .catch(function(error) {
            console.error("Error updating quantity:", error);
            //alert("Failed to update quantity. Please try again.");
        });
	}
	
	$scope.deleteCart = function(id){
		$http.delete("/rest/cart/deleteCart/"+id)
        .then(function(response) {
            $scope.loadData();
        })
        .catch(function(error) {
            console.error("Error delete product:", error);
        });
	}
    
    $scope.loadData();
})
