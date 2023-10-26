<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp" %>
<nav class="navbar navbar-expand-lg bg-white bg-opacity-25">
	<div class="container-fluid">
		<a class="navbar-brand user-select-none fw-bold text-light" href="${url = (not empty url) ? url : '..'}/user/index">Online
			Entertaiment</a>
		<button class="navbar-toggler bi-list" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation"></button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${not empty sessionScope.currentUser}">
						<li class="nav-item"><a class="nav-link text-light user-select-none">Xin chào
							${sessionScope.currentUser.username}!</a></li>
						<li class="nav-item "><a class="nav-link text-light"
							aria-current="page" href="${url = (not empty url) ? url : '..'}/user/favorites">Video yêu thích</a></li>
						<li class="nav-item "><a class="nav-link text-light" href="${url = (not empty url) ? url : '..'}/account/changePassword">Đổi
								mật khẩu</a></li>
						<li class="nav-item "><a class="nav-link text-light" href="${url = (not empty url) ? url : '..'}/account/editProfile">Sửa
								thông tin</a></li>
						<li class="nav-item "><a class="nav-link text-light" href="${url = (not empty url) ? url : '..'}/account/logout">Đăng
								xuất</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item "><a class="nav-link text-light" href="${url = (not empty url) ? url : '..'}/account/login">Đăng
								nhập</a></li>
						<li class="nav-item "><a class="nav-link text-light" href="${url = (not empty url) ? url : '..'}/account/register">Đăng
								ký</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
