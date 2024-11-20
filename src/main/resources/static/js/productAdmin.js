// const app = angular.module("myApp", ["ngRoute"]);
const checkForm = function(id) {
	document.getElementById(id).addEventListener('submit', function(event) {
		// Lấy tất cả các input trong form
		const inputs = document.querySelectorAll('#productForm input');
		let formValid = true;

		// Kiểm tra từng input
		inputs.forEach(function(input) {
			// Kiểm tra trường 'input file'
			if (input.type === 'file') {
				if (input.files.length === 0) {  // Nếu không có tệp được chọn
					formValid = false;  // Đánh dấu form không hợp lệ
				}
			} else if (input.type === 'radio') {
				// Kiểm tra các trường radio button
				const radioGroup = document.getElementsByName(input.name);
				const isRadioChecked = Array.from(radioGroup).some(radio => radio.checked);
				if (!isRadioChecked) {  // Nếu không có radio nào được chọn
					formValid = false;
				}
			} else {
				// Kiểm tra các trường input khác (text, number, etc.)
				if (input.value.trim() === '') {
					formValid = false;  // Nếu có trường nào trống, đánh dấu form không hợp lệ
				}
			}
		});

		// Nếu form không hợp lệ, ngừng hành động submit
		return formValid;
	});
}

const app = angular.module("myApp", []);

app.controller("productAdminCtrl", function($scope, $http, $timeout) {
	// Cờ kiểm tra việc gọi hàm
    $scope.isFileInputClicked = false;

    // Hàm gọi khi click vào container để mở input file
    $scope.triggerFileInput = function(fileInputId) {
        if ($scope.isFileInputClicked) return; // Tránh gọi nhiều lần

        $scope.isFileInputClicked = true; // Đánh dấu đã gọi
        const fileInput = document.getElementById(fileInputId);
        if (fileInput) {
            // Sử dụng $timeout để thao tác với DOM một cách an toàn
            $timeout(function() {
                fileInput.click();
                $scope.isFileInputClicked = false; // Đặt lại cờ sau khi thao tác xong
            });
        }
    };
	
	$scope.loadData = function() {
		$http.get("/manager/product/findall")
			.then(function(response) {
				$scope.products = response.data;
			})
	}

	$scope.addProduct = function(pro) {
		// Tạo đối tượng FormData để gửi dữ liệu
	    var formData = new FormData();
	
	    // Thêm các trường dữ liệu vào FormData
		formData.append('productName', pro.productName);
		formData.append('color', pro.color);
		formData.append('quantity', pro.quantity);
		formData.append('price', pro.price);
		formData.append('discountPrice', pro.discountPrice);
		formData.append('status', pro.status);
		formData.append('brand', pro.brand);
		formData.append('describe', pro.describe);
		var fileInput = document.getElementById("imgPro");
		formData.append('imgFile', fileInput.files[0]);
	
	    // Gửi yêu cầu POST với FormData
	    $http.post("/manager/product/add", formData, {
	        transformRequest: angular.identity,
			headers: {'Content-Type': undefined}
	    })
	    .then(function(response) {
	        // Tải lại dữ liệu sau khi cập nhật thành công
	        swal("Thêm thành công", {
                buttons: false,
                timer: 3000,
                icon: "success",
            });
	        $scope.loadData();
	    })
	    .catch(function(error) {
			swal("Thêm thất bại", {
                buttons: false,
                timer: 3000,
                icon: "error",
            });
	        console.error('Error:', error);
	    });
	}

	$scope.editProduct = function(product) {

    var formData = new FormData();

    // Thêm các trường dữ liệu vào FormData
    formData.append('productId', product.productId);
    formData.append('productName', product.productName);
    formData.append('color', product.color);
    formData.append('quantity', product.quantity);
    formData.append('price', product.price);
    formData.append('discountPrice', product.discountPrice);
    formData.append('status', product.status);
    formData.append('brand', product.brand);
    formData.append('describe', product.describe);

    // Lấy file chính (imgFile)
    var fileInput = document.getElementById("imgFile");
    if (fileInput.files.length > 0) {
        formData.append('imgFile', fileInput.files[0]); // Nếu có file thì thêm vào FormData
    }

    // Lấy các file phụ (subImg)
    var subInput = document.getElementById("subFile");
    var subImg = subInput.files;  // `files` chứa tất cả các tệp người dùng chọn

    // Thêm tất cả các tệp phụ vào FormData
    if (subImg.length > 0) {
        angular.forEach(subImg, function(file, index) {
            formData.append('subImg', file);  // Thêm mỗi tệp vào FormData
        });
    }

    // Gửi yêu cầu POST với FormData
    $http.post("/manager/product/update", formData, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
    })
    .then(function(response) {
        // Tải lại dữ liệu sau khi cập nhật thành công
        swal("Update thành công", {
            buttons: false,
            timer: 3000,
            icon: "success",
        });
        $scope.loadData();
    })
    .catch(function(error) {
        swal("Update thất bại", {
            buttons: false,
            timer: 3000,
            icon: "error",
        });
        console.error('Error:', error);
    });
};



	$scope.deleteProduct = function(id) {
		$http.delete("/manager/product/delete/" + id)
			.then(function(response) {
				$scope.loadData();
			})
	}
	
	$scope.loadData()
})
