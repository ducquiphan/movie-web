<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<title>Share</title>
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
	<div
		class="container d-flex justify-content-center align-items-center min-vh-300">
		<div
			class="row border rounded-5 p-3 bg-white bg-opacity-25 shadow box-area"
			style="max-width: 35rem;">
			<div class="h5 text-light mb-3">Gửi video đến bạn của bạn</div>
			<div class="mb-3 text-light">${message}</div>
			<form
				action="${url = (not empty url) ? url : '..'}/video?action=share&id=${video.video}"
				method="post">
				<div class="mb-3 form-floating">
					<input type="email"
						class="form-control form-control-lg bg-light fs-6 border-text"
						id="floatingEmail" placeholder="email" name="email" value="">
					<label for="floatingEmail" class="text-dark">Email của bạn bạn?</label>
				</div>
				<div class="mb-3">
					<button class="btn button-info btn-outline-light float-end mb-2">Chia
						sẻ</button>
				</div>
			</form>
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