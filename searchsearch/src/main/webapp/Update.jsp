<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="searchModel.userDTO"%>
<html lang="ko">
<head>
<script class="jsbin"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>searchsearch - 회원 정보 수정</title>
    <link rel="stylesheet" href="Update.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        
</head>

<body>
   <% userDTO dto = (userDTO) session.getAttribute("info"); %> 
    <!-- 상단 메뉴 -->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-brand ml-1">
                <a href="index.jsp" target="_self"><img src="https://github.com/yoonseo1004/yoonseo/blob/main/images/search_logo.png?raw=true" width=40%
                    alt="searchsearch" class="d-inline-block align-text-top"></a>
                    <h4>정보수정</h4>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
            <form class="d-flex">
                <div class="btn-group">
                    <a class="btn btn-primary d-grid mx-auto" href="update.html" role="button">정보수정</a>
                    <a class="btn btn-primary d-grid mx-auto" href="Login.jsp" role="button">로그인</a>
                    <a class="btn btn-primary d-grid mx-auto" href="bookmark.jsp" role="button">즐겨찾기</a> 
                </div>
            </form>
        </div>
    </nav>


    <!-- 본문 -->
    <div class="container mt-5">
        <div class="row">
            <div class="col col-lg-4 col-md-4 offset-md-4">
                <form action="UpdateCon.do">
                    <div class="mb-3">
                        <label for="id" class="form-label">닉네임</label>
                        <input type="text" class="form-control" id="nickname" name="userName">
                        
                    </div>
                    <div class="mb-3">
                        <label for="Password1" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="userPw" name="currentPw">
                    <p id="pwCheck"></p>
                    </div>
                    <div class="mb-3">
                        <label for="Password2" class="form-label">변경할 비밀번호</label>
                         <input type="password" class="form-control" id="userPw2" name="userPw">
                    </div>
                    <input type="hidden" name="userName" value="<%=dto.getUserName()%>">
                    
                    <button type="button" onclick="pwCheck()" class="btn btn-primary d-grid col-5 mx-auto">변경하기</button>
                    
                </form>
                <div class="col col-lg-4 col-md-4"></div>
            </div>
        </div>
    </div>


    <!-- footer -->
    <div class="container">
        <footer class="py-3 my-4">
          <ul class="nav justify-content-center border-bottom pb-3 mb-3">
            <li class="nav-item mb-4"></li>
          </ul>
          <p class="text-center text-muted">&copy; 2022 searchsearch Company, Inc</p>
        </footer>
      </div>

 </form>
 
 <script>
 const pwCheck = () =>{
	let currentPw = $('#userPw').val();
 $.ajax({
		//요청 경로 url
		url:'pwCheckCon.do',
		//요청 데이터(사용자가 입력한 댓글, 게시물번호)
	//json 방식 {key:value(실제값)}
		data:{'currentPw' : currentPw},
	//요청 방식 지정 type(html-form태그의 method)(get/post) 따로 지정 안해주면 get방식
		type: 'get',
		success : (result) => {
			if(result=='success'){
				let userPw2 = $('#userPw2').val();
				let userNickname = $('#nickname').val();
				$.ajax({
					//요청 경로 url
					url:'UpdateCon.do',
					//요청 데이터(사용자가 입력한 댓글, 게시물번호)
				//json 방식 {key:value(실제값)}
					data:{'userPw2' : userPw2, 'userNickname' : userNickname},
				//요청 방식 지정 type(html-form태그의 method)(get/post) 따로 지정 안해주면 get방식
					type: 'get',
					success : (data) => location.href="Main.jsp",
					error : (data) => alert("업데이트 실패")
				});
				

			}else{
				$('#userPw').val('');
				$('#pwCheck').attr("style", "color:red");
				$('#pwCheck').html("비밀번호가 틀렸습니다..");
				

			};
			},
		error : (data) => alert('fail')
	});
 }
</script>
</body>
</html>