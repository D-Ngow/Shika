function showMess(){
	const queryString = window.location.search;
            const params = new URLSearchParams(queryString);
            const message = params.get('message');
            const status = params.get('status');

            if (message && message.length > 0) {
                Swal.fire({
                    title: status === 'success' ? 'Success!' : 'Error!',
                    text: message,
                    icon: status, // 'success', 'error', 'warning', 'info'
                    timer: 3000,
                    showConfirmButton: false
                });
            }
}


const app = angular.module("myApp", ["ngRoute"]);
app.controller("buyHistoryCtrl", function($scope, $http) {
    $scope.confirm = function(id) {
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, cancel it!"
        }).then((result) => {
            if (result.isConfirmed) {
                $http.post("/buyHistory/cancel/" + id)
                    .then(function(response) {
                        Swal.fire({
                            title: "Canceled!",
                            text: "Your order has been canceled.",
                            icon: "success"
                        }).then(() => {
                            // Reload lại trang
                            window.location.reload();
                        });
                    })
                    .catch(function(error) {
                        Swal.fire({
                            title: "Cancel fail!",
                            text: "Something wrong, please try again.",
                            icon: "error"
                        });
                        console.log(error);
                    });
            }
        });
    }
});
