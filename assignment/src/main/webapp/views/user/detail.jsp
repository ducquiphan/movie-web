<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>${video.title}</title>
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

	<div class="container mt-5">
		<div class="row g-3 mb-3">
			<jsp:include page="../user/_video-detail.jsp">
				<jsp:param name="id" value="${video.id}" />
				<jsp:param name="title" value="${video.title}" />
				<jsp:param name="description" value="${video.description}" />
				<jsp:param name="views" value="${video.views}" />
				<jsp:param name="shares" value="${video.shares}" />
				<jsp:param name="link" value="${video.video}" />
				<jsp:param name="poster" value="${video.poster}" />
			</jsp:include>
		</div>

		<div class="text-uppercase mb-3 fs-5">Một số video khác</div>

		<div class="row g-4 ">
			<c:forEach items="${suggestList}" var="video">
				<jsp:include page="../user/_video.jsp">
					<jsp:param name="id" value="${video.id}" />
					<jsp:param name="title" value="${video.title}" />
					<jsp:param name="description" value="${video.description}" />
					<jsp:param name="views" value="${video.views}" />
					<jsp:param name="shares" value="${video.shares}" />
					<jsp:param name="link" value="${video.video}" />
					<jsp:param name="poster" value="${video.poster}" />
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