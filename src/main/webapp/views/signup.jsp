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

<body>
    <c:import url="header.jsp"></c:import>

    <div class="container">
        <div class="d-flex justify-content-center">
            <form method="post" class="w-50 px-5 my-4 mb-5">
                <div class="title text-center">
                    <h1 class="fw-bold">SIGNUP</h1>
                    <hr>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingName" placeholder="name@example.com">
                    <label for="floatingName">Họ và tên</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingEmail" placeholder="Password">
                    <label for="floatingEmail">Email</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" id="floatingPhone" placeholder="Password">
                    <label for="floatingPhone">Số điện thoại</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="floatingBirthday" placeholder="Password">
                    <label for="floatingBirthday">Ngày sinh</label>
                </div>
                <div class="form-floating mb-4">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Password</label>
                </div>
                <div class="d-grid gap-2">
                    <button formaction="#" class="btn btn-lg btn-dark">Đăng nhập</button>
                    <button class="btn btn-lg btn-outline-dark">Đăng ký</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <c:import url="footer.jsp"></c:import>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/home.js"></script>
</body>

</html>