const app = angular.module("myApp", ["ngRoute"]);
app.controller("cartCtrl", function($scope, $http) {
    $scope.subtotal = 0;
    $scope.discount = 0;
    $scope.total = 0;
    $scope.selectedProducts = $scope.selectedProducts || [];
    
    // Tải dữ liệu giỏ hàng ban đầu
    $scope.loadData = function(){
	    // Lấy tất cả sản phẩm từ giỏ hàng
	    $http.get("/cart/findAll")
	    .then(function(response){
	        $scope.carts = response.data;
	        
	        // Sau khi tải giỏ hàng, gọi API để lấy các sản phẩm đã chọn từ session
	        $http.get("/cart/getSelectedProducts")
	        .then(function(response) {
	            // Lấy danh sách cartId của các sản phẩm đã chọn
	            let selectedCartIds = response.data.map(cart => cart.cartId);
	
	            // Duyệt qua tất cả sản phẩm trong giỏ hàng
	            angular.forEach($scope.carts, function(cart) {
	                // Nếu cartId của sản phẩm có trong danh sách đã chọn, set selected = true
	                if (selectedCartIds.includes(cart.cartId)) {
	                    cart.selected = true;
	                } else {
	                    cart.selected = false;  // Nếu không có trong danh sách, set selected = false
	                }
	            });
	
	            // Sau khi cập nhật selected cho các sản phẩm, tính lại tổng
	            $scope.calculateTotals();
	        })
	        .catch(function(error) {
	            console.error("Error loading selected products from session:", error);
	        });
	    })
	    .catch(function(error) {
	        console.error("Error loading cart data:", error);
	    });
	}


    // Hàm tính toán tổng số tiền và giảm giá
    $scope.calculateTotals = function() {
	    $scope.subtotal = 0;
	    $scope.discount = 0;
	    $scope.total = 0;
	
	    // Duyệt qua các sản phẩm trong giỏ hàng để tính tổng cho các sản phẩm đã được chọn
	    angular.forEach($scope.carts, function(cart){
	        if (cart.selected) {  // Chỉ tính tổng cho các sản phẩm đã được chọn
	            $scope.subtotal += cart.subtotal;  // Cộng dồn subtotal của sản phẩm
	            $scope.discount += cart.discount;  // Cộng dồn discount nếu có
	        }
	    });
	
	    // Tính tổng cuối cùng
	    $scope.total = $scope.subtotal - $scope.discount;
	};


    // Cập nhật số lượng sản phẩm trong giỏ hàng
    $scope.changeQuantity = function(id, quantity){
	    $http.put("/cart/changeQuantity/" + id + "/" + quantity)
	    .then(function(response) {
	        // Tìm sản phẩm trong $scope.carts và cập nhật lại thông tin
	        let updatedCart = $scope.carts.find(cart => cart.cartId === id);
	        if (updatedCart) {
	            updatedCart.quantity = quantity;
	            updatedCart.subtotal = updatedCart.quantity * updatedCart.price; // Cập nhật lại subtotal
	        }
	        
	        // Cập nhật lại tổng sau khi thay đổi số lượng
	        $scope.calculateTotals();
	    })
	    .catch(function(error) {
	        console.error("Error updating quantity:", error);
	    });
	};



    // Xóa sản phẩm khỏi giỏ hàng
    $scope.deleteCart = function(id){
        $http.delete("/cart/deleteCart/"+id)
        .then(function(response) {
            // Loại bỏ sản phẩm khỏi $scope.carts
            $scope.carts = $scope.carts.filter(cart => cart.id !== id);
            // Cập nhật lại tổng sau khi xóa sản phẩm
            $scope.calculateTotals();
        })
        .catch(function(error) {
            console.error("Error delete product:", error);
        });
    }

    $scope.toggleCartSelection = function() {
	    // Duyệt qua tất cả các sản phẩm trong giỏ hàng, nếu sản phẩm nào được chọn thì thêm vào selectedProducts
	    angular.forEach($scope.carts, function(cartItem) {
	        if (cartItem.selected && !$scope.selectedProducts.includes(cartItem)) {
	            $scope.selectedProducts.push(cartItem);
	        }
	    });
	
	    // Cập nhật lại tổng sau khi thay đổi sản phẩm được chọn
	    $scope.calculateTotals();
	
	    // Lưu danh sách đã chọn vào session
	    $http.post("/cart/saveSelectedProducts", $scope.selectedProducts)
	        .then(function(response) {
	            // Không cần gọi lại calculateTotals ở đây nữa
	        })
	        .catch(function(error) {
	            console.error("Error saving selected products:", error);
	        });
	};



    
    // Gọi loadData khi controller được khởi tạo
    $scope.loadData();
});
