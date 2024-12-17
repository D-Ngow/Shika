<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shoe Store</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
<link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body onload="alertMess()">
	<c:import url="header.jsp"></c:import>

	<div class="container">
		<div class="d-flex justify-content-center">
			<form method="post" class="w-50 px-5 my-4 mb-5" >
				<div class="title text-center">
					<h1 class="fw-bold">SIGNUP</h1>
					
					<hr>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control"
						name="name"  id="floatingName" placeholder="name@example.com" required= />
					<label for="floatingName">Họ và tên</label>
					
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control"
						name="email" id="floatingEmail" placeholder="Password" required=/>
					<label for="floatingEmail">Email</label>
					
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control"
						name="phone" id="floatingPhone" placeholder="PhoneNumber" required/>
					<label for="floatingPhone">Phone Number</label>
					
				</div>
				<div class="form-floating mb-3">
					<input type="date" class="form-control"
						name="birthday" id="floatingBirthday" placeholder="Password" required/>
					<label for="floatingBirthday">Birthday</label>
					
				</div>
				<div class="form-floating mb-3">
					<select id="gender" class="form-select" name="gender">
						<option value="true">Male</option>
						<option value="false">Female</option>
					</select>
					<label for="gender">Gender</label>
				</div>
				<div class="form-floating mb-4">
					<input type="password" class="form-control"
						name="password" id="floatingPassword" placeholder="Password" required/>
					<label for="floatingPassword">Password</label>
					
				</div>
				<div class="d-grid gap-2">
					<button formaction="/submit"
						class="btn btn-lg btn-dark">Sign up</button>
					<a href="/signin" class="btn btn-lg btn-outline-dark">Sign in</a>
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/home.js"></script>
	<script type="text/javascript">
		document.getElementById('floatingBirthday').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
	</script>
</body>

</html>