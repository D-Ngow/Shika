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

<body>
	<c:import url="header.jsp"></c:import>

	<div class="container">
		<div class="d-flex justify-content-center">
			<form:form method="post" class="w-50 px-5 my-4 mb-5" modelAttribute="us">
				<div class="title text-center">
					<h1 class="fw-bold">SIGNUP</h1>
					
					<hr>
				</div>
				<div class="form-floating mb-3">
					<form:input path="name" type="text" class="form-control"
						name="name"  id="floatingName" placeholder="name@example.com" />
					<label for="floatingName">Họ và tên</label>
					<form:errors path="name" cssClass="text-danger" />
				</div>
				<div class="form-floating mb-3">
					<form:input path="email" type="email" class="form-control"
						name="email" id="floatingEmail" placeholder="Password" />
					<label for="floatingEmail">Email</label>
					<form:errors path="email" cssClass="text-danger" />
				</div>
				<div class="form-floating mb-3">
					<form:input path="phoneNumber" type="text" class="form-control"
						name="phone" id="floatingPhone" placeholder="Password" />
					<label for="floatingPhone">Số điện thoại</label>
					<form:errors path="phoneNumber" cssClass="text-danger" />
				</div>
				<div class="form-floating mb-3">
					<form:input path="birthday" type="date" class="form-control"
						name="birthday" id="floatingBirthday" placeholder="Password"/>
					<label for="floatingBirthday">Ngày sinh</label>
					<form:errors path="birthday" cssClass="text-danger" />
				</div>
				<div class="form-floating mb-3">
					<form:select path="gender" id="gender" class="form-select"
						name="gender">
						<option value="true">Nam<option>
						<option value="false">Nữ<option>
					</form:select>
					<label for="gender">Giới tính</label>
					<form:errors path="gender" cssClass="text-danger" />
				</div>
				<div class="form-floating mb-4">
					<form:input path="password" type="password" class="form-control"
						name="password" id="floatingPassword" placeholder="Password" />
					<label for="floatingPassword">Password</label>
					<form:errors path="password" cssClass="text-danger" />
				</div>
				<div class="d-grid gap-2">
					<button formaction="/signup"
						class="btn btn-lg btn-dark">Đăng ký</button>
					<button class="btn btn-lg btn-outline-dark">Đăng nhập</button>
				</div>
			</form:form>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/home.js"></script>
</body>

</html>