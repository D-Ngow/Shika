app.controller("cart-ctrl", function($scope, $http) {
	// Hàm tính toán tổng subtotal và discount
	function calculateTotal() {
		let subtotal = 0;
		let discountTotal = 0;

		// Lấy tất cả các phần tử input có class 'quantity'
		const quantities = document.querySelectorAll('.quantity');

		quantities.forEach((input) => {
			// Tìm phần tử chứa giá của sản phẩm tương ứng
			const cardBody = input.closest('.card-body');
			const priceElement = cardBody.querySelector('.price');
			
			// Lấy giá trị từ các phần tử
			const price = parseFloat(priceElement.textContent.replace(/,/g, '')) || 0;
			const quantity = parseInt(input.value) || 0;
			
			$http.get(`/rest/cart`).then(resp => {
				var listDiscount = resp.data;
				for(const item of listDiscount){
					discountTotal += item * quantity;
				}
			});
			
			// Tính toán subtotal và discount cho từng sản phẩm
			subtotal += price * quantity;
		});

		// Cập nhật giá trị subtotal và discount trên giao diện
		document.getElementById('subtotal').textContent = subtotal.toLocaleString();
		document.getElementById('discount').textContent = discountTotal.toLocaleString();
	}

	// Thêm sự kiện onchange cho tất cả input.quantity
	document.querySelectorAll('.quantity').forEach((input) => {
		input.addEventListener('change', calculateTotal());
	});
})
