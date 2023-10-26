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

	<nav class="container">
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<button class="nav-link active button-info btn-outline-light"
				id="nav-video-edit-tab" data-bs-toggle="tab"
				data-bs-target="#nav-video-edit" type="button" role="tab"
				aria-controls="nav-video-edit" aria-selected="true">Video
				Edition</button>
			<button class="nav-link button-info btn-outline-light"
				id="nav-video-list-tab" data-bs-toggle="tab"
				data-bs-target="#nav-video-list" type="button" role="tab"
				aria-controls="nav-video-list" aria-selected="false">Video
				List</button>

		</div>
	</nav>
	<div class="tab-content container" id="nav-tabContent">
		<div class="tab-pane fade show active " id="nav-video-edit"
			role="tabpanel" aria-labelledby="nav-video-edit-tab" tabindex="0">
			<div class="card bg-body bg-opacity-25">
				<form action="" method="post" name="form">
					<div class="card-body">
						<div class="row">
							<div class="col-4">
								<img class="img-fluid rounded" alt="Picture"
									src="${video.poster}">
							</div>
							<div class="col-8">
								<div class="mb-3">${message}</div>
								<div class="mb-3">
									<label for="youtubeID" class="form-label">Youtube ID?</label> <input
										type="text" class="form-control" id="youtubeID" name="id"
										readonly value="${video.id}">
								</div>
								<div class="mb-3">
									<label for="videoTitle" class="form-label">Video Title?</label>
									<input type="text" class="form-control" id="videoTitle"
										name="title" value="${video.title}">
								</div>
								<div class="mb-3">
									<label for="videoTPicture" class="form-label">Video
										Poster?</label> <input type="text" class="form-control"
										id="videoTPicture" name="poster" value="${video.poster}">
								</div>
								<div class="mb-3">
									<label for="videoLink" class="form-label">Video Link?</label> <input
										type="text" class="form-control" id="videoLink" name="video" value="${video.video}">
								</div>
								<div class="mb-3">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="isActive"
											id="1" value="true" checked="${video.isActive?'checked':''}"> <label class="form-check-label"
											for="1">Active</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="isActive"
											id="0" value="false"> <label class="form-check-label"
											for="0">Inative</label>
									</div>
								</div>
								<div class="mb-3">
									<label for="description" class="form-label">Description</label>
									<textarea class="form-control" id="description"
										name="description" rows="3" cols="100%">${video.description}</textarea>
								</div>

							</div>
						</div>
					</div>
					<div class="card-footer d-flex justify-content-end">
						<button type="submit"
							class="btn button-info btn-outline-light ms-3"
							 formaction="${url = (not empty url) ? url : '..'}/admin/video/create">Create</button>
						<button type="submit"
							class="btn button-info btn-outline-light ms-3"
							 formaction="${url = (not empty url) ? url : '..'}/admin/video/update">Update</button>
						<button type="submit"
							class="btn button-info btn-outline-light ms-3"
							 formaction="${url = (not empty url) ? url : '..'}/admin/video/delete">Delete</button>
						<button type="submit"
							class="btn button-info btn-outline-light ms-3"
							 formaction="${url = (not empty url) ? url : '..'}/admin/video/reset">Reset</button>
					</div>
				</form>
			</div>
		</div>
		<div class="tab-pane fade" id="nav-video-list" role="tabpanel"
			aria-labelledby="nav-video-list-tab" tabindex="1">
			<div class="form-control text-light bg-body bg-opacity-25">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Youtube ID</th>
							<th scope="col">Video Title</th>
							<th scope="col">Poster</th>
							<th scope="col">Video Link</th>
							<th scope="col">Status</th>
							<th scope="col">Description</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody class="text-light">
						<!--Dùng forEach  -->
						<c:forEach var="video" items="${videos}">
							<tr>
								<td>${video.id}</td>
								<td>${video.title}</td>
								<td>${video.poster}</td>
								<td>${video.video}</td>
								<td>${video.isActive}</td>
								<td>${video.description}</td>
								<td><a class="text-decoration-none"
									href="${url = (not empty url) ? url : '..'}/admin/video/edit/${video.video}">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="d-flex justify-content-between">
					<div>${videos.size()} videos</div>
					<c:if test="${currentPage == 1}">
						<a href=""
							class="btn btn-outline-light button-info fw-bold ms-3 disabled">
							<i class="bi bi-chevron-double-left"></i>
						</a>
					</c:if>
					<c:if test="${currentPage > 1}">
						<a
							href="${url = (not empty url) ? url : '..'}/admin/video?page=${currentPage - 1}"
							class="btn btn-outline-light button-info fw-bold ms-3"> <i
							class="bi bi-chevron-double-left"></i>
						</a>
					</c:if>
					<c:forEach varStatus="i" begin="1" end="${maxPage}">
						<a
							href="${url = (not empty url) ? url : '..'}/admin/video?page=${i.index}"
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
							href="${url = (not empty url) ? url : '..'}/admin/video?page=${currentPage + 1}"
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