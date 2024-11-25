<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoe Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/home.css">
    <link rel="icon" href="image/logo/Shiko_logo_bg.png">
</head>

<body onload="alertMess()">
    <c:import url="header.jsp"></c:import>

    <div class="container">
        <div class="d-flex justify-content-center">
            <form method="post" class="w-50 px-5 my-4 mb-5" action="/j_spring_security_check">
                <div class="title text-center">
                    <h1 class="fw-bold">SIGNIN</h1>
                    <hr>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" name="username" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                </div>
                <div class="form-floating mb-2">
                    <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="mb-2 text-start">
                    <a href="#" class="text-dark text-decoration-none fw-medium">Fotgot Password?</a>
                </div>
				<c:if test="${mess!=null}">
					<div class="error-message mb-2 text-start text-danger">
						<p>${mess}</p>
					</div>
				</c:if>
				<div class="d-grid gap-2">
                    <button type="submit" class="btn btn-lg btn-dark">Signin</button>
                    <a href="/signup" class="btn btn-lg btn-outline-dark">Signup</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <c:import url="footer.jsp"></c:import>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="js/home.js"></script>
</body>

</html>