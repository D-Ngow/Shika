const inputs = document.getElementById("inputs");

inputs.addEventListener("input", function (e) {
    const target = e.target;
    const val = target.value;

    if (isNaN(val)) {
        target.value = "";
        return;
    }

    if (val != "") {
        const next = target.nextElementSibling;
        if (next) {
            next.focus();
        }
    }
});

inputs.addEventListener("keyup", function (e) {
    const target = e.target;
    const key = e.key.toLowerCase();

    if (key == "backspace" || key == "delete") {
        target.value = "";
        const prev = target.previousElementSibling;
        if (prev) {
            prev.focus();
        }
        return;
    }
});

const app = angular.module("myApp", ["ngRoute"]);
app.controller("passwordCtrl", function($scope, $http) {
	
	$scope.genOTP = function(email){
		$http.get("/changePass/rest/genOTP/"+email)
        .then(function(response) {
            $scope.otp = response.data;
        })
        .catch(function(error) {
            console.error("Error get otp:", error);
        });
	}
	
	$scope.validateOTP = function(email, oldPass, newPass){
		let otp = "";
		const inputs = document.querySelectorAll("#inputs input");
		inputs.forEach(input => {
    		otp += input.value;
  		});
		$http.post("/changePass/rest/submit/"+otp+"/"+email+"/"+oldPass+"/"+newPass)
        .then(function(response) {
            $scope.otpRes = response.data;
            if($scope.otpRes.success){
				swal($scope.otpRes.message, {
				  buttons: false,
				  timer: 3000,
				  icon: "success",
				});
			}else{
				swal($scope.otpRes.message, {
				  buttons: false,
				  timer: 3000,
				  icon: "error",
				});
			}
        })
        .catch(function(error) {
            console.error("Error get otp:", error);
        });
	}
	
})