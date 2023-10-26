<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/_taglib.jsp"%>
<body style="font-family: 'Montserrat', sans-serif;"
	class="custom-gradient">
	<div class="container">
		<div id="carouselExampleCaptions" class="carousel slide mb-3"
			data-bs-ride="false">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner user-select-none">
				<div class="carousel-item active">
					<a href=""><img
						src="https://wallpapercave.com/wp/wp4703013.jpg"
						class="d-block w-100" alt="..."></a>
					<div class="carousel-caption d-none d-md-block">
						<h5>First slide label</h5>
						<p>Some representative placeholder content for the first
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<a href=""><img
						src="https://wallpapercave.com/wp/wp4703013.jpg"
						class="d-block w-100" alt="..."></a>
					<div class="carousel-caption d-none d-md-block">
						<h5>Second slide label</h5>
						<p>Some representative placeholder content for the second
							slide.</p>
					</div>
				</div>
				<div class="carousel-item">
					<a href=""><img
						src="https://wallpapercave.com/wp/wp4703013.jpg"
						class="d-block w-100" alt="..."></a>
					<div class="carousel-caption d-none d-md-block">
						<h5>Third slide label</h5>
						<p>Some representative placeholder content for the third
							slide.</p>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>

		<div class="row g-4 ">
			<c:forEach items="${videos}" var="video">
				<jsp:include page="/views/user/_video.jsp">
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

		<div class="d-flex justify-content-center mt-4 mb-3">
			<c:if test="${currentPage == 1}">
				<a href=""
					class="btn btn-outline-light button-info fw-bold ms-3 disabled">
					<i class="bi bi-chevron-double-left"></i>
				</a>
			</c:if>
			<c:if test="${currentPage > 1}">
				<a
					href="${url = (not empty url) ? url : '..'}/user/index?page=${currentPage - 1}"
					class="btn btn-outline-light button-info fw-bold ms-3"> <i
					class="bi bi-chevron-double-left"></i>
				</a>
			</c:if>
			<c:forEach varStatus="i" begin="1" end="${maxPage}">
				<a
					href="${url = (not empty url) ? url : '..'}/user/index?page=${i.index}"
					class="btn btn-outline-light button-info fw-bold ms-3 ${currentPage == i.index ? 'active':'' }">
					${i.index} </a>
			</c:forEach>
			<c:if test="${currentPage == maxPage}">
				<a class="btn btn-outline-light button-info fw-bold ms-3 disabled"> <i
				class="bi bi-chevron-double-right"></i>
			</a>
			</c:if>
			<c:if test="${currentPage < maxPage}">
				<a
					href="${url = (not empty url) ? url : '..'}/user/index?page=${currentPage + 1}"
					class="btn btn-outline-light button-info fw-bold ms-3"> <i
					class="bi bi-chevron-double-right"></i>
				</a>
			</c:if>
			
		</div>
	</div>
</body>
</html>