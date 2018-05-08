<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- 화면 디자인에 필요한 CSS -->
<link href="/resources/admin/main/adminBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/custom.min.css"/>
<script>
	var colorList = new Array();
	var num = 0;
	$(document).ready(function(){
		$("#InsertColorBtn").click(function(){
			var color_nme = $("#color_nme").val();
			$("#prodctImsiColor").append("<input type='text' id='popColor"+num+"' class='form-control' name='prodct_color_nme' style='margin-top:10px; vertical-align: middle; width:70%; height:30px; float:left;' value='"+color_nme+"' readonly>"
			+ "<button type='button' class='btn btn-danger' id='popcColorBtn"+num+"' style='margin-top:10px; width:30%; height:30px; padding:0px; float:left' onclick='popColorDelete("+num+")'>-</button>");
			num++;
			colorList.push(color_nme);
			$("#color_nme").val("");
		});
		$("#sendColorBtn").click(function(){
			opener.parent.insertImsiColor(colorList);
			close();
		});
	});
	function popColorDelete(num){
		$("#popColor"+num).remove();
		$("#popcColorBtn"+num).remove();
		colorList.splice(num,1);
		
	}
</script>
</head>
<body style="background-color: #ecf0f1;">
	<div class="container">
		<div class="row">
			<div class="col-xs-12" style="padding-top:10px">
				<div class="col-xs-2"></div>
				<div class="col-xs-8" style="padding:0px">
					<input type="text" id="color_nme" class="form-control" style="width:80%; height:40px; float:left;">
					<button type="button" id="InsertColorBtn" class="btn btn-primary" style="width:20%; height:40px; padding:0px; float:left">+</button>				
				</div>
				<div class="col-xs-2"></div>
			</div>
			<form id="prodctInsertColorFrm" method="post">
				<div class="col-xs-12">
					<div class="col-xs-1"></div>
					<div id="prodctImsiColor" class="col-xs-6" style="padding-top:5px; padding-bottom:5px">
					</div>
					<div class="col-xs-2"></div>
				</div>
			</form>
			<div class="col-xs-12">
				<div class="col-xs-7"></div>
				<div class="col-xs-5">
					<button type="button" id="sendColorBtn" class="btn btn-default" style="width:40%; height:40px; padding:0px; float:left">등록</button>
					<button type="button" class="btn btn-default" style="width:40%; height:40px; padding:0px; margin-left:5px; float:left">취소</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>