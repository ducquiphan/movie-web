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
			<button class="nav-link button-info btn-outline-light ${not empty chosenVideo?'':'active'}"
				id="nav-favorites-tab" data-bs-toggle="tab"
				data-bs-target="#nav-favorites" type="button" role="tab"
				aria-controls="nav-favorites" aria-selected="${not empty chosenVideo?false:true}">Favorites</button>
			<button class="nav-link button-info btn-outline-light ${not empty chosenVideo?'active':''}"
				id="nav-fav-users-tab" data-bs-toggle="tab"
				data-bs-target="#nav-fav-users" type="button" role="tab"
				aria-controls="nav-fav-users" aria-selected="${not empty chosenVideo?true:false}">Favorite
				Users</button>
		</div>
	</nav>
	<div class="tab-content container" id="nav-tabContent">
		<div class="tab-pane fade  ${not empty chosenVideo?'':'show active'}" id="nav-favorites"
			role="tabpanel" aria-labelledby="nav-favorites-tab" tabindex="0">
			<div class="form-control bg-body bg-opacity-25">
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Video Title</th>
							<th scope="col">Link</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<!--Dùng forEach  -->
						<c:forEach var="video" items="${sessionScope.videoLikedInfos}">
							<tr>
								<td>${video.title}</td>
								<td><a
									href="${url = (not empty url) ? url : '..'}/video?action=watch&id=${video.link}">${video.link}</a></td>
								<td>${video.totalLike}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="tab-pane fade ${not empty chosenVideo?'show active':''}" id="nav-fav-users" role="tabpanel"
			aria-labelledby="nav-fav-users-tab" tabindex="0">
			<div class="form-control bg-body bg-opacity-25">
				<div class="form-group">
					<label class="form-label text-light" for="combo-video-title">Video
						Title?</label>
					<!--Dùng forEach -->
					<form action="reports" method="post">
						<select class="form-select mb-3" onchange="this.form.submit()"
							aria-label="Default select example" name="videoLink">
							<option disabled="disabled" selected="selected">Chọn</option>
							<c:forEach items="${videos}" var="video">
								<option ${chosenVideo.equals(video.video)?"selected":""}
								 value="${video.video}">${video.title}</option>
							</c:forEach>
						</select>
					</form>
				</div>
				<table class="table text-light">
					<thead>
						<tr>
							<th scope="col">Username</th>
							<th scope="col">Email</th>
							<th scope="col">Liked Date</th>
						</tr>
					</thead>
					<tbody>
						<!--Dùng forEach  -->
						<c:forEach items="${reports}" var="report">
							<tr>
								<td>${report.username}</td>
								<td>${report.email}</td>
								<td>${report.likedDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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