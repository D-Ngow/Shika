const app = angular.module("myApp", ["ngRoute"]);
app.controller("reportCtrl", function($scope, $http) {
	$scope.month='1';
	$scope.year='2024';
	let chart = null
	
	$scope.loadBestSelling = function(){
		$http.get("/report/getBestSelling")
		.then(function(response){
			$scope.listInvoiceDt = response.data;
		})
	}
	
	$scope.loadRevenueYear = function(){
		year = document.getElementById('year').value;
		$http.get("/report/getRevenue/"+year)
		.then(function(response){
			$scope.revenue = response.data;
			const ctx = document.getElementById('yearChart');
			const data = {
				labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				datasets: [{
					label: 'Doanh thu (VNĐ)',
					data: $scope.revenue,
					fill: false,
					borderColor: 'rgb(75, 192, 192)',
					tension: 0.1
				}]
			}
			const config = {
				type: 'line',
				data: data
			}
			const yearChart = new Chart(ctx, config);
			$scope.totalYear = 0;
			angular.forEach($scope.revenue, function(rev) {
				$scope.totalYear += rev;
			});
		})
	}
	
	$scope.loadRevenueMonth = function(month, year) {
		month = document.getElementById('month').value;
		year = document.getElementById('year').value;
	    $http.get("/report/getDailyRevenue/" + year + "/" + month)
	        .then(function(response) {
	            $scope.revenue = response.data;
				if (chart) {
			        chart.destroy();  // Hủy biểu đồ cũ nếu có
			    }
	            // Tính số ngày trong tháng
	            const daysInMonth = new Date(year, month, 0).getDate();
	
	            // Tạo mảng labels chứa các ngày trong tháng
	            const labels = Array.from({ length: daysInMonth }, (_, i) => (i + 1).toString());
	
	            // Cấu hình dữ liệu biểu đồ
	            const ctx = document.getElementById('monthChart');
	            const data = {
	                labels: labels,
	                datasets: [{
	                    label: 'Doanh thu (VNĐ)',
	                    data: $scope.revenue.slice(0, daysInMonth), // Lấy đúng số ngày
	                    fill: false,
	                    borderColor: 'rgb(75, 192, 192)',
	                    tension: 0.1
	                }]
	            };
	
	            // Cấu hình và tạo biểu đồ
	            const config = {
	                type: 'line',
	                data: data
	            };
	            chart = new Chart(ctx, config);
	            $scope.totalMonth = 0;
				angular.forEach($scope.revenue, function(rev) {
					$scope.totalMonth += rev;
				});
	        });
	};
	
	$scope.loadRevenueYear();
	$scope.loadRevenueMonth();
	$scope.loadBestSelling();
})
