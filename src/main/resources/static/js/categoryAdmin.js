const app = angular.module("myApp", ["ngRoute"]);
app.controller("categoryCtrl", function($scope, $http) {
	
	$scope.loadData = function(){
		$http.get("/manager/category/findAll")
		.then(function(response){
			$scope.category = response.data;
		})
	}
	
	$scope.loadPro = function(id){
		$http.get("/manager/category/findPro/"+id)
		.then(function(response){
			$scope.listPro = response.data;
		})
	}
	
	$scope.loadAllPro = function(id){
		$http.get("/manager/category/findAllPro")
		.then(function(response){
			$scope.listAllPro = response.data;
			console.log($scope.listAllPro);
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
};

	
	$scope.loadData();
	
});