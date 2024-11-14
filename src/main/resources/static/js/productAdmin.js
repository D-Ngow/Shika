// const app = angular.module("myApp", ["ngRoute"]);
const app = angular.module("myApp", []);

app.controller("productAdminCtrl", function($scope, $http) {
 	$scope.loadData = function(){
         $http.get("/manager/product/findall")
         .then(function(response){
			 console.log("ee: " +response);
             $scope.products = response.data;
         })
         .catch(function(error) {
             console.error("Error loading products data:", error);
         });
     }
     $scope.openModal = function(product) {
        $scope.pro = product;
    };
    $scope.closeProduct = function() {
        $scope.pro = {};
    };
    
 	$scope.addProduct = function(){
		 console.log(1)
		 console.log("a: " +$scope.check_image)
		 console.log("b: " +$scope.pro)
         $http.post("/manager/product", $scope.pro)
         .then(function(response){
			 console.log("hehe");
     $scope.loadData()
             $scope.pro = response.data;
         })
         .catch(function(error) {
             console.error("Error loading create data:", error);
         });
     }
     
 	$scope.editProduct = function(){
		 console.log("update: " +$scope.pro)
         $http.put("/manager/product", $scope.pro)
         .then(function(response){
     $scope.loadData()
             $scope.pro = response.data;
         })
         .catch(function(error) {
             console.error("Error loading cart data:", error);
         });
     }
     
 	$scope.deleteProduct = function(id){
		 console.log("delete: " +$scope.pro.productId)
		 
         $http.delete("/manager/product/"+$scope.pro.productId)
         .then(function(response){
     $scope.loadData()
             $scope.status = response.data;
         })
         .catch(function(error) {
             console.error("Error loading cart data:", error);
         });
     }
     $scope.loadData()
})
