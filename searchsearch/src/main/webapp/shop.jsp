<%@page import="searchModel.userDTO"%>
<%@page import="searchModel.bookMarkDTO"%>
<%@page import="java.util.List"%>
<%@page import="searchModel.clothDAO"%>
<%@page import="searchModel.clothDTO"%>
<%@page import="searchModel.bookMarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>searchsearch - 추천 쇼핑몰 페이지</title>
<link rel="stylesheet" href="shop.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>

<body>
	<%
	String clothType = request.getParameter("clothType");
	List<clothDTO> clothList = new clothDAO().show(clothType);
	userDTO info = (userDTO) session.getAttribute("info");
	if (info != null) {
		List<clothDTO> bookMarkList = new bookMarkDAO().showBookmark(info.getUserId());

	}
	%>



	<!-- 상단 메뉴 -->
	<div style="display: flex; flex-direction: column">
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
						<a class="btn btn-primary d-grid mx-auto" href="#" role="button">로그인</a>
						<a class="btn btn-primary d-grid mx-auto" href="#" role="button">즐겨찾기</a>
					</div>
				</form>
			</div>
		</nav>




		<!-- 쇼핑몰 카드 -->
		<div class="container d-flex flex-row justify-content-center">
			<div class="row">
				<!-- 쇼핑몰 카드 반복부분 -->
				<%
				for (int i = 0; i < 8; i++) {
					/* 로그인 했을 경우 */
					if (info != null) {
				%>

				<div class="col-md-auto">
					<div class="card" style="width: 15rem;">
						<img src="./image/<%=clothList.get(i).getFilename()%>.jpg">
						<div class="card-body">
							<h5 class="card-title">Mr.Street</h5>
							<p class="card-text">모노 바람막이 점퍼</p>
							<a href="https://mr-s.co.kr/index.html" target="_blank"
								class="btn btn-info">쇼핑몰 보러가기</a>
							<div class="bookmark checked">
								<%
								//(로그인상태) 북마크 등록을 해놓았을 경우
								bookMarkDTO bookMark = new bookMarkDTO(info.getUserId(), clothList.get(i).getNumber());
								if (!new bookMarkDAO().checkBookmark(bookMark)) {
								%>
								<img src="image/star.png" style="width: 50px; height: 50px"
									class="star" onclick="Change(this)"
									value="<%=clothList.get(i).getNumber()%>">
								<%//(로그인상태) 북마크 등록 하지 않았을 경우
								} else {
								%>
								<img src="image/star.gif" style="width: 50px; height: 50px"
									class="star" onclick="Change(this)"
									value="<%=clothList.get(i).getNumber()%>">
								<%
								}
								%>


							</div>

						</div>
					</div>


				</div>

				<%
				/* 로그인 했을 경우 카드생성 종료 */

				
				//로그인 하지 않았을 경우
				} else {
				%>
				<div class="col-md-auto">
					<div class="card" style="width: 15rem;">
						<img src="./image/<%=clothList.get(i).getFilename()%>.jpg">
						<div class="card-body">
							<h5 class="card-title">Mr.Street</h5>
							<p class="card-text">모노 바람막이 점퍼</p>
							<a href="https://mr-s.co.kr/index.html" target="_blank"
								class="btn btn-info">쇼핑몰 보러가기</a>
							<div class="bookmark checked">

								<img src="image/star.png" style="width: 50px; height: 50px"
									class="star" onclick="Change(this)"
									value="<%=clothList.get(i).getNumber()%>">


							</div>

						</div>
					</div>


				</div>

				<%
				}
				}
				%>



			</div>
		</div>


		<!-- 하단 버튼 -->
		<div class="d-grid gap-2 col-4 mx-auto">
			<a class="btn btn-info rebutton" href="Main.jsp" role="button">photo
				reuplode</a>
		</div>
	</div>
	<script>
	  <%if (info == null) {%>
      function Change(e){
      	alert("북마크 기능을 사용하시려면 로그인을 해주세요");	
      }
    <%} else {%>
         
          function Change(e){
      	
      	let clothNumber = $(e).attr("value");
       
      	let userId = '<%=info.getUserId()%>';
    	
      	if($(e).attr('src')=="image/star.png"){        	
      	$(e).attr('src', "image/star.gif");
     		
      	console.log(clothNumber);
      	$.ajax({
  			//요청 경로 url
  			url:'BookmarkCon.do',
  			//요청 데이터(사용자가 입력한 댓글, 게시물번호)
  		//json 방식 {key:value(실제값)}
  			data:{'clothNumber' : clothNumber, 'userId' : userId},
  		//요청 방식 지정 type(html-form태그의 method)(get/post) 따로 지정 안해주면 get방식
  			type: 'get',
  			success : (data) => alert("북마크 추가 성공"),
  			error : (data) => alert("북마크 추가 실패")
  		});
      	}else{
      		$.ajax({
      			//요청 경로 url
      			url:'BookmarkDeleteCon.do',
      			//요청 데이터(사용자가 입력한 댓글, 게시물번호)
      		//json 방식 {key:value(실제값)}
      			data:{'clothNumber' : clothNumber, 'userId' : userId},
      		//요청 방식 지정 type(html-form태그의 method)(get/post) 따로 지정 안해주면 get방식
      			type: 'get',
      			success : (data) => alert("북마크 삭제 성공"),
      			error : (data) => alert("북마크 삭제 실패")
      		});
          	$(e).attr('src', "image/star.png");
          	is_checked=0;
      	}
          
      }
      
    <%}%>
	
	</script>
</body>
</html>