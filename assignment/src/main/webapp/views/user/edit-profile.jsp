<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>Insert title here</title>
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
	<c:url var="url" value="/account"></c:url>
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<!-- Login container-->
		<div
			class="border rounded-5 p-3 bg-white bg-opacity-25 shadow box-area ">
			<!-- Login form -->
			<div class="right-part">
				<div class="align-items-center">
					<div class="header-text mb-4">
						<h3>Chỉnh sửa thông tin</h3>
					</div>
					<div class="mb-3">${message}</div>
					<form action="${url}/editProfile" method="post">
						<div class="form-floating mb-3">
							<input type="text"
								class="form-control form-control-lg bg-light fs-6 border-text"
								id="floatingUsername" placeholder="username" name="id" disabled
								value="${sessionScope.currentUser.username}"> <label for="floatingUsername" class="text-dark">Tên
								tài khoản</label>
						</div>
						<div class="form-floating mb-3">
							<input type="email"
								class="form-control form-control-lg bg-light fs-6 border-text"
								id="floatingEmail" placeholder="Email" name="email"
								value="${sessionScope.currentUser.email}"> <label for="floatingEmail" class="text-dark">Địa
								chỉ email</label>
						</div>
						<div class="form-floating form-check-inline mb-3">
							<input type="text"
								class="form-control form-control-lg bg-light fs-6 border-text"
								id="floatingRole" placeholder="" name="admin" disabled
								value="${sessionScope.currentUser.isAdmin?'Admin':'User'}"> <label
								for="floatingRole" class="text-dark">Role</label>
						</div>
						<div class="input-group mb-3">
							<button class="btn btn-outline-light button-info w-100 fs-6"
								type="submit">Cập nhật</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/commons/_footer.jsp"%>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>