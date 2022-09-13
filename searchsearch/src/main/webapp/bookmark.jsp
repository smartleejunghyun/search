<%@page import="java.util.List"%>
<%@page import="searchModel.bookMarkDAO"%>
<%@page import="searchModel.userDTO"%>
<%@page import="searchModel.clothDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	userDTO info = (userDTO) session.getAttribute("info");
	List<clothDTO> clothList = new bookMarkDAO().showBookmark(info.getUserId());

	int pageNum = Integer.valueOf(request.getParameter("page"));
	%>
	<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>searchsearch - 즐겨찾기 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="bookmark.css">
</head>
<body>

	<!-- 상단 메뉴 -->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-brand ml-1">
				<a href="index.jsp" target="_self"><img
					src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true"
					width=40% alt="searchsearch" class="d-inline-block align-text-top"></a>
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
			<form class="d-flex">
				<div class="btn-group">
					<a class="btn btn-primary d-grid mx-auto" href="Main.jsp"
						role="button">메인화면</a> <a class="btn btn-primary d-grid mx-auto"
						href="deleteCon.do" role="button">로그아웃</a>
				</div>
			</form>
		</div>
	</nav>



	<!-- 전체선택 체크박스 -->
	<div class="container justify-content-end">
		<div class="row col offset-md-9 col-md-3">
			<label for="checkAll" class="form-check-label"> 전체선택 <input
				type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" />
			</label>
		</div>
	</div>
	<p><%=pageNum%></p>


	<!-- 이미지와 체크박스 -->
	<div class="container d-flex flex-row">
		<div class="row justify-content-md-center">
			<%
			for (int i = 0; i < clothList.size(); i++) {
			%>
			<div class="card col col-md-2">
				<div class="bookmark checked">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked" name="checkRow" value=""> <label
						class="form-check-label" for="flexCheckChecked"> bookmark
						checked </label>
				</div>
				<div class="card h-100">
					<img
						src="https://github.com/yoonseo1004/yoonseo/blob/main/images/clo1.png?raw=true"
						class="card-img-top" value="<%=clothList.get(i).getNumber()%>">
				</div>
			</div>
			<%
			}
			%>





		</div>
	</div>



	<!-- 즐겨찾기삭제 버튼 -->
	<div class="d-grid gap-2 col-2 mx-auto">
		<input class="btn btn-info" type="submit" value="즐겨찾기 삭제">
	</div>


	<!-- 페이지 버튼 -->

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="http://localhost:8081/searchsearch/bookmark.jsp?page=<%=pageNum - 1%>">Previous</a>
			</li>
			<li class="page-item"><a class="page-link"
				href="http://localhost:8081/searchsearch/bookmark.jsp?page=1">1</a></li>
			<li class="page-item"><a class="page-link"
				href="http://localhost:8081/searchsearch/bookmark.jsp?page=2">2</a></li>
			<li class="page-item"><a class="page-link"
				href="http://localhost:8081/searchsearch/bookmark.jsp?page=3">3</a></li>
			<li class="page-item"><a class="page-link"
				href="http://localhost:8081/searchsearch/bookmark.jsp?page=4">Next</a></li>
		</ul>
	</nav>



	<!-- footer -->
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom pb-3 mb-3">
				<li class="nav-item mb-4"></li>
			</ul>
			<p class="text-center text-muted">&copy; 2022 searchsearch
				Company, Inc</p>
		</footer>
	</div>



</body>
</html>




</body>
</html>