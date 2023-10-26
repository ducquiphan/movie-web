<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<nav class="navbar navbar-expand-lg bg-white bg-opacity-25 ">
	<div class="container-fluid ">
		<div class="navbar-brand user-select-none text-light">Administration
			tool</div>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active text-light"
					aria-current="page" href="${url = (not empty url) ? url : '..'}/user/index">Home</a></li>
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item"><a
							class="nav-link text-light user-select-none">Xin chào
								${sessionScope.currentUser.username}!</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/admin/video">Videos</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/admin/user">Users</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/admin/reports">Reports</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/user/favorites">Video yêu thích</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/account/changePassword">Đổi mật khẩu</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/account/editProfile">Sửa thông tin</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/account/logout">Đăng xuất</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/account/login">Đăng nhập</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							href="${url = (not empty url) ? url : '..'}/account/register">Đăng ký</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
</html>