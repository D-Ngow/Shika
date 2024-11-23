const app = angular.module("myApp", ["ngRoute"]);
app.controller("InvoiceAdminCtrl", function($scope, $http) {
$scope.loaddata = function(){
	$http.get("/manager/invoice/findall")
	.then(function(response){
		$scope.listinvoice = response.data;
	})
 }
 
 $scope.loaddata();
 $scope.status = "3";
 $scope.date = "asc";
 
 $scope.changeivstt = function(id,stt){
	$http.put("/manager/invoice/changestt/"+id+"/"+stt)
	.then(function(response){
		$scope.loaddata();
	})
 };
 
 $scope.showivlistpro = function(ivid){
	$http.get("/manager/invoice/findone/"+ivid)
	.then(function(response){
		$scope.listpro = response.data;
	})
 }
 
 $scope.fill = function(){
	const stt = document.getElementById("fillbystt").value;
	const date = document.getElementById("fillbydate").value;
	
	$http.get("/manager/invoice/fill/"+stt+"/"+date)
	.then(function(response){
		$scope.listinvoice = response.data;
	})
 }
})