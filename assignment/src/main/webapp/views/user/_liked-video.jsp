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
</head>
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
					<a class="btn btn-outline-light button-info" href="${url = (not empty url) ? url : '..'}/user/favorites?action=like&id=${param.link}" >
						<c:choose>
							<c:when test="${param.flagLikedBtn}">
								Unlike
							</c:when>
							<c:otherwise>Like</c:otherwise>
						</c:choose>
					</a> 
					<a
						href="${url = (not empty url) ? url : '..'}/video?action=share&id=${param.link}"
						class="btn btn-outline-light button-info">Share</a>
				</c:if>
				<a
					href="${url = (not empty url) ? url : '..'}/video?action=watch&id=${param.link}"
					class="btn btn-outline-light button-info">Xem</a> <input
					type="hidden" value="${param.link}"
					id="videoIdHidden${param.index}">
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var videoId = $('#videoIdHidden${param.index}').val();
	var btnLike = '#likeOrUnlikeBtn${param.index}';
	$(btnLike).click(function() {
		$.ajax({
			url : 'favorites?action=like&id=' + ${param.link}
			data: { session: '${pageContext.session.id}' }
		}).then(function(data) {
			var text = $(btnLike).text();
			if (text.indexOf('Like') != -1) {
				$(btnLike).text('Unlike');
			} else {
				$(btnLike).text('Like');
			}
		}).fail(function(error) {
			alert('Oops!! Please try again!');
		})
	});
</script>
</body>
</html>