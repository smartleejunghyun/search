<!doctype html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchsearch - 즐겨찾기 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="bookmark.css">
</head>
<body>
<%	String clothType = request.getParameter("clothType");
	
%>
    <!-- 전체선택 체크박스 -->
    <div class="container justify-content-end">
    <div class="row col offset-md-9 col-md-3">
        <label for="checkAll" class="form-check-label">
            전체선택
        <input type="checkbox" name="checkAll" id="checkAll" onclick="checkAll();" />
        </label>
    </div>
    </div>


    <!-- 이미지와 체크박스 -->
    <div class="container d-flex flex-row">
    <div class="row justify-content-md-center">
       
        <div class="card h-100 col col-md-2">
            <div class="bookmark checked">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkRow" value="${content.IDX}">
                <label class="form-check-label" for="flexCheckChecked">
                  bookmark checked
                </label>
            </div>
          
          
        <div class="card h-100">
            <img src="https://github.com/yoonseo1004/yoonseo/blob/main/clo1.png?raw=true" class="card-img-top" alt="...">
          </div>
        </div>
       
        <div class="card h-100 col col-md-2">
            <div class="bookmark checked">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkRow" value="${content.IDX}">
                <label class="form-check-label" for="flexCheckChecked">
                  bookmark checked
                </label>
              </div>
          <div class="card h-100">
            <img src="https://github.com/yoonseo1004/yoonseo/blob/main/clo2.png?raw=true" class="card-img-top" alt="...">
          </div>
        </div>
       
        <div class="card h-100 col col-md-2">
            <div class="bookmark checked">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkRow" value="${content.IDX}">
                <label class="form-check-label" for="flexCheckChecked">
                  bookmark checked
                </label>
              </div>
          <div class="card h-100">
            <img src="https://github.com/yoonseo1004/yoonseo/blob/main/clo3.png?raw=true" class="card-img-top" alt="...">
          </div>
        </div>
       
        <div class="card h-100 col col-md-2">
            <div class="bookmark checked">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" name="checkRow" value="${content.IDX}">
                <label class="form-check-label" for="flexCheckChecked">
                  bookmark checked
                </label>
              </div>
          <div class="card h-100">
            <img src="https://github.com/yoonseo1004/yoonseo/blob/main/clo4.png?raw=true" class="card-img-top" alt="...">
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
          <li class="page-item disabled">
            <a class="page-link">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>


    <!-- 전체선택 전체해제 체크박스 -->
    <script>
        function checkAll() {
            if ($("#checkAll").is(':checked')) {
                $("input[name=checkRow]").prop("checked", true);
            } else {
                $("input[name=checkRow]").prop("checked", false);
            }
        }
    </script>





</body>
</html>