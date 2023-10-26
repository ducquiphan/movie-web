<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>Online Entertainment</title>
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

	<div>
		<%@ include file="/views/user/_home.jsp"%>
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