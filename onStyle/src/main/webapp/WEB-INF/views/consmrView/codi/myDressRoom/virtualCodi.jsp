<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>가상코디 - 온스타일</title>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %> 

<link rel="stylesheet" href="/resources/consmr/codi/myDressRoom/css/create.css?1">
<link rel="stylesheet" href="/resources/consmr/codi/myDressRoom/css/base.css">
<link rel="stylesheet" href="/resources/consmr/codi/myDressRoom/css/style.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<!-- <script src="http://www.nihilogic.dk/labs/canvas2image/canvas2image.js"></script> -->

<script src="/resources/consmr/codi/myDressRoom/js/virtualCodi.js"></script>
<script src="/resources/consmr/codi/myDressRoom/js/virtualCodiCRUD.js"></script>
<style>
.item_info{
/*[지우기] 버튼 눌렀을 때, 좌측 옷 이미지 지우기 위해 만듬*/
	 box-shadow: inset 0px 0px 20px 0 rgba(0, 0, 0, 0.15);
	 background: #e5e5e5;
}
</style>


</head>
<body style="height:100%">
 <div>
	<c:import url="/menu.do" />
 </div>
 
 <div class="mainContainer" style="margin: 7% 12% 0% 6%;">
	<input type="hidden" name="bigGroup">
	<input type="hidden" id="myCategory" name="myCategory">
	<input type="hidden" id="prodctCategory" name="prodctCategory">
	<form id="codiInsertForm" name="codiInsertForm">
		<input type="hidden" name="codi_img_route">
	</form>
		
		<div id="collage_container" style="height: 80%;">
		
			<!-- 캔버스 안 상품정보 표시 -->
			<div class="panel panel-primary" style="float: left; position: relative; width: 8%; top: 0px; overflow: hidden; height: 100%; overflow: overlay; z-index: 9;">
				<div class="panel-heading" style="height: 69px;">
					<h3 class="panel-title" style="text-align: center; margin-top:17px; font-size:18px; font-weight: bold;">Information</h3>
				</div>
				<div class="panel-body" style="padding: 10px 0px;">
					<table id="item_thumb" style="text-align:center">
					
					</table>
				</div>
			</div>
			
			<!-- 기능조작 메뉴 -->
			<div id="canvas_menu">
				<a href="#" onclick="saveCodi(1)" class="btn btn-info" style=" margin-top: 17px;">코디저장</a> 
				<a href="#" id="layer_up" class="btn btn-default" style="margin-left: 5px; margin-top: 17px;">▲</a> 
				<a href="#" id="layer_down" class="btn btn-default" style="margin-right: 5px; margin-top: 17px;">▼</a> 
				<a href="#" id="layer_plus" class="btn btn-default" style="margin-left: 5px; margin-top: 17px;">+</a> 
				<a href="#" id="layer_minus" class="btn btn-default" style="margin-right: 5px; margin-top: 17px;">-</a> 
				<a href="#" id="layer_delete" class="btn btn-default" style="margin-left: 5px; margin-top: 17px;">지우기</a>
				<a href="#" onclick="layer_allDelete()" class="btn btn-default" style="margin-left: 5px; margin-right: 5px; margin-top: 17px;">
					<img src="/resources/consmr/codi/myDressRoom/img/myCloth/refresh.png" style="width: 22px;">
				</a> 
				<a href="#" onclick="insertClothPopup()" style="float: right"><img src="/resources/consmr/codi/myDressRoom/img/myCloth/insertCloths.png" style="width: 45px; margin-top: 10px;"></a>
			</div>
			
			<!-- 가상코디 div -->
			<div id="canvas" style="float:left; width:42%; height:91%;">
						
			</div>
			<div id="tab_panel" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
				<!-- 오른쪽 카테고리 및 옷 조회-->		 
				<div class="col-xs-6" style="padding: 0px 1px">
					<a id="myCloth" class="btn btn-default" onclick="setBigGroup('myCloth')" style="width: 100%;">나의 옷장</a>
				</div>
				<div class="col-xs-6" style="padding: 0px 1px">
					<a id="prodct" class="btn btn-default" onclick="setBigGroup('prodct')" style="width: 100%;">미스봄 상품</a>
				</div>
				
				<div style="width:20%; float:left; padding: 0px 1px">
					<a id="5" href="#" class="btn btn-default" onclick="clothSelectList(5)" style="width: 100%;">Outer</a>
				</div>
				<div style="width:20%; float:left; padding: 0px 1px">
					<a id="1" href="#" class="btn btn-default" onclick="clothSelectList(1)" style="width: 100%;">Top</a>
				</div>
				<div style="width:20%; float:left; padding: 0px 1px">
					<a id="2" href="#" class="btn btn-default" onclick="clothSelectList(2)" style="width: 100%;">Bottom</a>
				</div>
				<div style="width:20%; float:left; padding: 0px 1px">
					<a id="3" href="#" class="btn btn-default" onclick="clothSelectList(3)" style="width: 100%;">Dress</a>
				</div>
				<div style="width:20%; float:left; padding: 0px 1px">
					<a id="4" href="#" class="btn btn-default" onclick="clothSelectList(4)" style="width: 100%;">Shoes & Bag</a>
				</div>
				
				<!-- 옷 조회 -->
				<div id="all_panel" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" 
				aria-expanded="true" aria-hidden="false">
					<div id="clothSelectList" class="wrapper" style="display: block;">
				 
					</div>
				</div>
			</div>
		</div>
	</div>
	
	



</body>
</html>