<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>Login</title>
</head>

<body style="font-family: 'Montserrat', sans-serif;"
	class="custom-gradient">
	<!-- Header -->
	<c:choose>
		<c:when
			test="${not empty sessionScope.currentUser  && sessionScope.currentUser.isAdmin}">
			<div class="mb-3">
				<%@ include file="/commons/_layout-admin.jsp"%>
			</div>
		</c:when>
		<c:otherwise>
			<div class="mb-3">
				<%@ include file="/commons/_layout-customer.jsp"%>
			</div>
		</c:otherwise>
	</c:choose>
	
	<!-- Login -->
	<c:url var="url" value="${requestContextPath}/account"></c:url>
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<!-- Login container-->
		<div
			class="row border rounded-5 p-3 bg-white bg-opacity-25 shadow box-area ">
			<!-- Pic -->
			<div
				class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column ">
				<p class="text-white fs-3">Khám phá vũ trụ điện ảnh!</p>
			</div>
			<!-- Login form -->
			<div class="col-md-6 right-part">
				<div class="align-items-center">
					<div class="header-text mb-4 text-white">
						<h3>Chào mừng bạn đã trở lại!</h3>
					</div>
					<form action="${url}/login" method="post">
						<div class="mb-3">${message}</div>
						<div class="form-floating mb-3">
							<input type="text"
								class="form-control form-control-lg bg-light fs-6 border-text"
								id="floatingUsername" placeholder="username" name="username">
							<label for="floatingUsername" class="text-dark">Tên tài
								khoản</label>
						</div>
						<div class="form-floating mb-1">
							<input type="password"
								class="form-control form-control-lg bg-light fs-6 border-text"
								id="floatingPassword" placeholder="password" name="password">
							<label for="floatingPassword" class="text-dark">Mật khẩu</label>
						</div>
						<div class="input-group mb-3 d-flex">
							<div class="forgot">
								<small><a href="${url}/forgotPassword">Quên mật
										khẩu?</a></small>
							</div>
						</div>
						<div class="input-group mb-3">
							<button class="btn btn-outline-light button-info w-100 fs-6"
								type="submit">Đăng nhập</button>
						</div>
					</form>
					<div class="">
						<small>Chưa có tài khoản? <a href="${url}/register">Đăng
								ký ngay</a></small>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/commons/_footer.jsp"%>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
</body>
</html>