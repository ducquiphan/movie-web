<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/views/css/item.css'/>">
<title>Insert title here</title>
</head>
<body style="font-family: 'Montserrat', sans-serif;"
	class="custom-gradient">
	<div class="col-md-4">
		<div class="card bg-opacity-10 bg-body"
			style="height: 16rem; width: 24rem;">
			<a href="../video?action=watch&id=${param.link}"
				style="height: 100%; width: 100%;"><img src="${param.poster}"
				class="img-fluid" style="height: 100%; width: 100%;"></a>
			<div class="descriptions">
				<h1>${param.title}</h1>
				<div>Views: ${param.views}</div>
				<div>Share: ${param.shares}</div>
				<div class="float-end">
					<c:if test="${not empty sessionScope.currentUser}">
						<%-- <button id="likeOrUnlikeBtn"
							class="btn btn-outline-light button-info" disabled="disabled">
							<c:choose>
								<c:when test="${flagLikedBtn.equals(true)}">
										Unlike
									</c:when>
								<c:otherwise>Like</c:otherwise>
							</c:choose>
						</button> --%>
						<a
							href="${url = (not empty url) ? url : '..'}/video?action=share&id=${param.link}"
							class="btn btn-outline-light button-info">Share</a>
					</c:if>
					<a
						href="${url = (not empty url) ? url : '..'}/video?action=watch&id=${param.link}"
						class="btn btn-outline-light button-info">Xem</a>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous">
		
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$('#likeOrUnlikeBtn').click(function() {
		var videoId = $('#videoIdHidden').val();
		$.ajax({
			url : 'video?action=like&id=' + videoId
		}).then(function(data) {
			var text = $('#likeOrUnlikeBtn').text();
			if (text.indexOf('Like') != -1) {
				$('#likeOrUnlikeBtn').text('Unlike');
			} else {
				$('#likeOrUnlikeBtn').text('Like');
			}
		}).fail(function(error) {
			alert('Oops!! Please try again!');
		})
	});
</script>
</body>

</html>