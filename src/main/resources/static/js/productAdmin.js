// const app = angular.module("myApp", ["ngRoute"]);
const app = angular.module("myApp", []);

app.controller("productAdminCtrl", function($scope, $http) {
	$scope.loadData = function() {
		$http.get("/manager/product/findall")
			.then(function(response) {
				$scope.products = response.data;
			})
	}

	$scope.addProduct = function(pro) {
		$http.post("/manager/product/" + pro)
			.then(function(response) {
				$scope.loadData();
			})
	}

	$scope.onFileChange = function(event) {
	    var file = event.target.files[0]; // Lấy tệp đã chọn
	    $scope.product.image = file;  // Lưu trữ tệp ảnh vào product.image
	};

	$scope.editProduct = function(product, id) {
    // Tạo đối tượng FormData để gửi dữ liệu
    var formData = new FormData();

    // Thêm các trường dữ liệu vào FormData
    formData.append("productId", product.productId);
    formData.append("productName", product.productName);
    formData.append("color", product.color);
    formData.append("quantity", product.quantity);
    formData.append("price", product.price);
    formData.append("discountPrice", product.discountPrice);
    formData.append("status", product.status);
    formData.append("brand", product.brand);
    formData.append("describe", product.describe);

    // Nếu có file hình ảnh, thêm vào FormData
    if (product.image) {
        formData.append("imgFile", document.getElementById("formFile").files[0]);
    }

    // Gửi yêu cầu POST với FormData
    $http.post("/manager/product/update/" + id, formData, {
        headers: { 
            'Content-Type': undefined // Để cho FormData tự động thiết lập Content-Type
        }
    })
    .then(function(response) {
        // Tải lại dữ liệu sau khi cập nhật thành công
        $scope.loadData();
    })
    .catch(function(error) {
        console.error('Error:', error);
    });
}


	$scope.deleteProduct = function(id) {
		$http.delete("/manager/product/" + id)
			.then(function(response) {
				$scope.loadData();
			})
	}
	
	$scope.loadData()
})
