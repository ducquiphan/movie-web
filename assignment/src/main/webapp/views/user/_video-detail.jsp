<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="/commons/_head.jsp"%>
</head>

<body style="font-family: 'Montserrat', sans-serif;"
	class="custom-gradient">
	<div class="container-fluid row">
		<div class="col-md-6">
			<div class="ratio ratio-16x9">
				<iframe src="https://www.youtube.com/embed/${param.link}"
					title="YouTube video" allowfullscreen></iframe>
			</div>
		</div>
		<div class="col-md-6">
			<div class="">
				<h3 class="">${param.title}</h3>
				<hr>
				<p class="">${param.description}</p>
				<hr>
				<p>Lượt xem: ${param.views}</p>
				<p>Lượt chia sẻ: ${param.shares}</p>
				<c:if test="${not empty sessionScope.currentUser}">
					<div class="float-end">
						<a class="btn btn-outline-light button-info" href="${url = (not empty url) ? url : '..'}/video?action=like&id=${param.link}" >
							<c:choose>
								<c:when test="${flagLikedBtn}">
									Unlike
								</c:when>
								<c:otherwise>Like</c:otherwise>
							</c:choose>
						</a> 
						<a href="${url = (not empty url) ? url : '..'}/video?action=share&id=${param.link}" class="btn btn-outline-light button-info">Share</a>
					</div>
				</c:if>
				<input type="hidden" value="${param.link}" id="videoIdHidden">
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>