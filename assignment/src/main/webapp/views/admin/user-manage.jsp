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

	<nav class="container">
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<button class="nav-link active button-info btn-outline-light"
				id="nav-user-edit-tab" data-bs-toggle="tab"
				data-bs-target="#nav-user-edit" type="button" role="tab"
				aria-controls="nav-user-edit" aria-selected="true">User
				Edition</button>
			<button class="nav-link button-info btn-outline-light"
				id="nav-user-list-tab" data-bs-toggle="tab"
				data-bs-target="#nav-user-list" type="button" role="tab"
				aria-controls="nav-user-list" aria-selected="false">User
				List</button>

		</div>
	</nav>
	<div class="tab-content container" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-user-edit"
			role="tabpanel" aria-labelledby="nav-user-edit-tab" tabindex="0">
			<div class="container-fluid form-control bg-body bg-opacity-25 text-light d-flex justify-content-center">
				<form class="w-100" action="" method="post" name="form">
					<div class="mb-3">${message}</div>
					<div class=" mb-3">
						<label for="inputUsername" class="form-label">Username?</label> <input
							type="text" class="form-control" id="inputUsername"
							name="username" readonly="readonly" value="${user.username}">
					</div>
					<div class=" mb-3">
						<label for="inputPassword" class="form-label">Password?</label> <input
							type="password" class="form-control" id="inputPassword"
							name="password" readonly="readonly" value="${user.password}">
					</div>
					<div class=" mb-3">
						<label for="inputEmail" class="form-label">Email Address?</label>
						<input type="email" class="form-control" id="inputEmail"
							name="email" value="${user.email}">
					</div>
					<div class="d-flex justify-content-end mt-3">
						<button type="submit"
							formaction="${url = (not empty url) ? url : '..'}/admin/user/update"
							class="btn button-info btn-outline-light ms-3">Update</button>
						<button type="submit"
							formaction="${url = (not empty url) ? url : '..'}/admin/user/delete"
							class="btn button-info btn-outline-light ms-3">Delete</button>
						<button type="submit"
							class="btn button-info btn-outline-light ms-3"
							formaction="${url = (not empty url) ? url : '..'}/admin/user/reset">Reset</button>
					</div>
				</form>
			</div>
		</div>
		<div class="tab-pane fade" id="nav-user-list" role="tabpanel"
			aria-labelledby="nav-user-list-tab" tabindex="0">
			<div class="form-control bg-body bg-opacity-25 text-light">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">Password</th>
							<th scope="col">Email</th>
							<th scope="col">Role</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<!--Dùng forEach  -->
						<c:forEach var="user" items="${users}">
							<tr>
								<td>${user.username}</td>
								<td>${user.password}</td>
								<td>${user.email}</td>
								<td>${user.isAdmin}</td>
								<td><a class="text-decoration-none"
									href="${url = (not empty url) ? url : '..'}/admin/user/edit/${user.username}">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<div>${users.size()} accounts</div>
					<c:if test="${currentPage == 1}">
						<a href=""
							class="btn btn-outline-light button-info fw-bold ms-3 disabled">
							<i class="bi bi-chevron-double-left"></i>
						</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a
							href="${url = (not empty url) ? url : '..'}/admin/user?page=${currentPage - 1}"
							class="btn btn-outline-light button-info fw-bold ms-3"> <i
							class="bi bi-chevron-double-left"></i>
						</a>
					</c:if>
					<c:forEach varStatus="i" begin="1" end="${maxPage}">
						<a
							href="${url = (not empty url) ? url : '..'}/admin/user?page=${i.index}"
							class="btn btn-outline-light button-info fw-bold ms-3 ${currentPage == i.index ? 'active':'' }">
							${i.index} </a>
					</c:forEach>
					<c:if test="${currentPage == maxPage}">
						<a class="btn btn-outline-light button-info fw-bold ms-3 disabled">
							<i class="bi bi-chevron-double-right"></i>
						</a>
					</c:if>
					<c:if test="${currentPage < maxPage}">
						<a
							href="${url = (not empty url) ? url : '..'}/admin/user?page=${currentPage + 1}"
							class="btn btn-outline-light button-info fw-bold ms-3"> <i
							class="bi bi-chevron-double-right"></i>
						</a>
					</c:if>
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