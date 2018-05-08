<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- consmrMenu css, js 링크 모아 놓은곳 -->
	<%@ include file="/WEB-INF/include/include-header.jspf" %>  
	<title>나의 옷 등록 - 온스타일</title>
	
	<!-- 화면 디자인에 필요한 CSS -->
	<link href="/resources/consmr/main/consmrBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="/resources/assets/css/custom.min.css"/>
	
	<!-- 부트스트랩의  다양한 기능들을 구현 해놓은 js소스-->
	<script src="/resources/consmr/main/consmrBootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/assets/js/custom.js"></script>
	
	<script src="/resources/consmr/codi/myDressRoom/js/insertClothPopup.js"></script>	
	
	
<style>
.fileContainer { 
 	overflow: hidden; 
 	position: relative;
 }

.fileContainer [type=file] {
  	 cursor: inherit;  
 	 display: block;  
 	 font-size: 15px;  
  	 filter: alpha(opacity=0);  
  	 height: 100%;  
  	 width: 87.72px;  
 	 opacity: 0;  
 	 position: absolute;  
 	 left: 0;  
 	 text-align: right;  
 	 top: 0; 
 }  

 </style>
</head>
<body>
	<div class="mainContainer" style = "margin:0px auto; width:95%;">
		<div class="contiainer">
			<h4 style = "font-size:20px; color:black;">나의 옷 등록</h4>
			
			<hr style = "border : 1px solid rgba(68, 68, 68, 1); margin-top:0px"></hr>
			<form id="myClothFrm" name="myClothFrm" enctype="multipart/form-data">
			<input type="hidden" id="category_seq" name="category_seq">
			<input type="hidden" name="backgrndRemove_src" id="backgrndRemove_src">
				<div class="col-xs-4" style="font-size:15px; height:35px; padding:5px 10px; margin:10px 0px;">카테고리</div>
				<div class="col-xs-8" style = "padding-left:0px; margin:10px 0px;">
					<div class="btn-group">
						<a href="#" id="Category" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
						OUTER 
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#" id="5">OUTER</a></li>
							<li><a href="#" id="1">TOP</a></li>
							<li><a href="#" id="2">BOTTOM</a></li>
							<li><a href="#" id="3">DRESS</a></li>
							<li><a href="#" id="4">SHOES & BAG</a></li>
						</ul>
					</div>
				</div>
					
				<div class="col-xs-4" style="font-size:15px; height:38px; padding:6px 10px; margin:10px 0px;">이미지 업로드</div>
				<div class="col-xs-8" style = "padding-left:0px; margin:10px 0px;">
					<label class="fileContainer">
						 <a href="#" class="btn btn-info">파일 선택</a>
						 <input type="file" name="myCloth_src" id="myCloth_src"/>
					</label>
				</div>
				<div class="col-xs-12" style="font-size:15px; padding:5px 10px">미리보기</div>
				<div id="imgPreview" class="col-xs-12" style="background:url('/resources/consmr/codi/myDressRoom/img/myCloth/transparent.png'); height:420px; border:1px solid #cbcbcb; float:left; text-align:center;" >
					<!-- 이미지 미리보기 -->
				</div>
			</form>
				<div class="col-xs-6" style = "padding-right:5px"><a href="#" id="insertCloth" class="btn btn-info" style="float:right; margin-top:15px">등록</a></div>
				<div class="col-xs-6" style = "padding-left:5px"><a href="#" class="btn btn-default" onclick="javascript:window.close();" style="float:left; margin-top:15px">취소</a></div>
		</div>
	</div>
 
</body>
</html>