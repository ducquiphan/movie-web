<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>My Favorites</title>
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



	<div class="container">
		<div class="fs-2 text-light mb-3">VIDEO YÊU THÍCH</div>
		<div class="row g-4 ">
			<c:forEach items="${histories}" var="history" varStatus="loop">
				<jsp:include page="/views/user/_liked-video.jsp">
					<jsp:param name="id" value="${history.video.id}" />
					<jsp:param name="title" value="${history.video.title}" />
					<jsp:param name="description" value="${history.video.description}" />
					<jsp:param name="views" value="${history.video.views}" />
					<jsp:param name="shares" value="${history.video.shares}" />
					<jsp:param name="link" value="${history.video.video}" />
					<jsp:param name="poster" value="${history.video.poster}" />
					<jsp:param name="flagLikedBtn" value="${history.isLiked}" />
					<jsp:param name="index" value="${loop.index}" />
				</jsp:include>
			</c:forEach>
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