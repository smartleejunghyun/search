<!doctype html>

<%@page import="searchModel.bookMarkDTO"%>
<%@page import="searchModel.bookMarkDAO"%>
<%@page import="searchModel.userDTO"%>
<%@page import="java.util.List"%>
<%@page import="searchModel.clothDAO"%>
<%@page import="searchModel.clothDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<style>
.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48;
}
</style>

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
	<!-- 전체선택 체크박스 -->
	<div class="container justify-content-end">
		<div class="row col offset-md-9 col-md-3">
			<label for="checkAll" class="form-check-label"> 전체선택 <input
				type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" />
			</label>
		</div>
	</div>


	<!-- 이미지와 체크박스 -->

	<div class="container d-flex flex-row">

		<div class="row justify-content-md-center">
			<%
			for (int i = 0; i < clothList.size(); i++) {
			%>
			<div class="card h-100 col col-md-2">
				<div class="bookmark checked">
					<%bookMarkDTO bookMark = new bookMarkDTO(info.getUserId(), clothList.get(i).getNumber());
					if(!new bookMarkDAO().checkBookmark(bookMark)){
					%>
					<img src="image/star.png" style="width: 50px; height: 50px"
						class="star" onclick="Change(this)"
						value="<%=clothList.get(i).getNumber()%>">
					<%}else{ %>
					<img src="image/star.gif" style="width: 50px; height: 50px"
						class="star" onclick="Change(this)"
						value="<%=clothList.get(i).getNumber()%>">
					<%} %>

				</div>


				<div class="card h-100">
					<img src="./image/<%=clothList.get(0).getFilename()%>.jpg"
						class="card-img-top" alt="...">
				</div>
			</div>
			<%
			}
			%>

			<div class="card h-100 col col-md-2">
				<div class="bookmark checked">
					<img src="image/star.png" style="width: 50px; height: 50px"
						class="star" onclick="Change(this)"> </label>
				</div>
				<div class="card h-100">
					<img src="./image/<%=clothList.get(1).getFilename()%>.jpg"
						class="card-img-top" alt="...">
				</div>
			</div>

			<div class="card h-100 col col-md-2">
				<div class="bookmark checked">
					<img src="image/star.png" style="width: 50px; height: 50px"
						class="star" onclick="Change(this)"> bookmark checked </label>
				</div>
				<div class="card h-100">
					<img src="./image/<%=clothList.get(2).getFilename()%>.jpg"
						class="card-img-top" alt="...">
				</div>
			</div>

			<div class="card h-100 col col-md-2">
				<div class="bookmark checked">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckChecked" name="checkRow" value="${content.IDX}">
					<label class="form-check-label" for="flexCheckChecked">
						bookmark checked </label>
				</div>
				<div class="card h-100">
					<img
						src="https://github.com/yoonseo1004/yoonseo/blob/main/clo4.png?raw=true"
						class="card-img-top" alt="...">
				</div>
			</div>
		</div>
	</div>



	<!-- 즐겨찾기삭제 버튼 -->
	<div class="d-grid gap-2 col-2 mx-auto">
		<input class="btn btn-info" type="submit" value="즐겨찾기 삭제">
	</div>


	<!-- 페이지 버튼 -->

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>


	<!-- 전체선택 전체해제 체크박스 -->
	<script>
    
    let is_checked=0;
        function checkAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[name=checkRow]").prop("checked", true);
            } else {
                $("input[name=checkRow]").prop("checked", false);
            }
        }
      <%if(info==null){%>
        function Change(e){
        	alert("북마크 기능을 사용하시려면 로그인을 해주세요");	
        }
      <%}else{%>
           
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