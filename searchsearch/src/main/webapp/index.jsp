<!DOCTYPE html>
<%@page import="searchModel.clothDAO"%>
<%@page import="java.util.List"%>
<%@page import="searchModel.userDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="KR">

<head>
<style>
input {
	border: none;
	border-right: 0px;
	border-bottom: 0px;
	border-left: 0px;
	border-top: 0px
}
</style>

<script src="index.js"></script>
<link href="index.css" rel="stylesheet">



<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Document</title>

</head>

<body style="overflow: hidden;">


	<div class=" header">
		<div class="home">
			<img
				src="https://github.com/yoonseo1004/yoonseo/blob/main/home.png?raw=true">
			<h3>search search</h3>
		</div>
		<ul class="loginbox">
			<li><a href="Login.jsp">Login</a></li>
			<li><a href="Join.jsp">Sign up</a></li>
		</ul>
	</div>
	<script class="jsbin"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<div class="file-upload">
		<div class="mb-3" style="text-align: center;">
			<!-- 토글 만들기 -->

			<span style="margin-right: 20px; display: inline-block">남자</span> <label
				class="switch">남자 <input id="gender" type="checkbox">
				<span class="slider round"></span>
			</label> <span style="margin-left: 20px; display: inline-block">여자</span>

			<!-- 토글 부분 끝 -->
		</div>
		<button class="file-upload-btn" type="button"
			onclick="$('.file-upload-input').trigger( 'click' )">Add
			Image</button>

		<div class="image-upload-wrap">
			<input class="file-upload-input" type='file'
				onchange="readURL(this);init().then(()=>predict());"
				accept="image/*" />
			<div class="drag-text">
				<h3>Drag and drop a file or select add Image</h3>
			</div>
		</div>
		<div class="file-upload-content">
			<img class="file-upload-image" style="width: 300px; height: 300px;"
				id="face-image" src="#" alt="your image" />
			<div class="image-title-wrap">
				<button type="button" onclick="removeUpload()" class="remove-image">
					Remove <span class="image-title">Uploaded Image</span>
				</button>
			</div>
		</div>


	</div>

	</div>



	<div id="webcam-container"></div>
	<div id="label-container" style="text-align: center"></div>

	<div style="text-align: center">
		<i id='loading' style="display: inline-block; visibility: hidden"
			class="fa fa-circle-o-notch fa-spin"></i>
	</div>
	    <div style="text-align:center">
        <a id="recommandCloth" href="recommand.jsp"><button style="visibility: hidden" id="recommand" class="btn-primary" style="text-align:center">쇼핑몰 바로가기</button></a>
    </div>
	




	
















	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>



	<script type="text/javascript">
        // More API functions here:
        // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

        // the link to your model provided by Teachable Machine export panel
        const URL = "https://teachablemachine.withgoogle.com/models/SO6NEweB3/";

        let model, labelContainer, maxPredictions;
        let i1 = document.getElementById("loading");
        // 토글로 남자인지 여자인지 체크하는 부분
        let checkBox = document.getElementById("gender");
        // Load the image model and setup the webcam
        async function init() {

            i1.style.visibility = "visible"
            const modelURL = URL + "model.json";
            const metadataURL = URL + "metadata.json";

            // load the model and metadata
            // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
            // or files from your local hard drive
            // Note: the pose library adds "tmImage" object to your window (window.tmImage)
            model = await
                tmImage.load(modelURL, metadataURL);
            maxPredictions = model.getTotalClasses();

            // Convenience function to setup a webcam
            const flip = true; // whether to flip the webcam

            // append elements to the DOM

            labelContainer = document.getElementById("label-container");
            for (let i = 0; i < maxPredictions; i++) { // and class labels
                labelContainer.appendChild(document.createElement("div"));
            }
            /* 사진이 올라가고 초기화 중에는 일단 로딩표시가 돌게 함 */


        }

        // run the webcam image through the image model
        async function predict() {
            $('#loading').attr("style", "visibility:hidden");
            $("#recommand").attr("style", "visibility:visible")
            $('body').attr("style", "overflow:auto");
           
            // predict can take in an image, video or canvas html element
            var image = document.getElementById("face-image");
            const prediction = await model.predict(image, false);
            prediction.sort((a, b) => parseFloat(b.probability) - parseFloat(a.probability))

            let typebox = document.getElementById("result");
            let max = 0;
            let type;
            for (let i = 0; i < maxPredictions; i++) {
                let gage = prediction[i].probability.toFixed(2) * 100;
                let classPrediction = prediction[i].className + ": " + gage;
                type = prediction[i].className
                if (max <= gage) {
                    $('input[name=result]').attr('value', type)

                }
                labelContainer.childNodes[i].innerHTML = classPrediction;
                $('#label-container > div:nth-child(' + i + ')').attr('class', 'item' + i)
                $('#label-container > div:nth-child(' + i + ')').attr('width', 100)
				 $('#recommandCloth').attr("href", "recommand.jsp?clothType="+type)
            }

        }
    </script>

</body>

</html>