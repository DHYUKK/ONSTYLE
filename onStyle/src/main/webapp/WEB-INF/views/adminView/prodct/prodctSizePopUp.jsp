<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	$(document).ready(function(){
		$("#InsertSizeBtn").click(function(){
			var formData = $("#prodctInsertSizeFrm").serialize();
			opener.parent.abc(formData);
			$("input[name=top_size_nme]:text").val("");
			$("input[name=top_length]:text").val("");
			$("input[name=top_size_nme]:text").val("");
			$("input[name=top_shouldr]:text").val("");
			$("input[name=top_bust]:text").val("");
			$("input[name=top_tail_girth]:text").val("");
			$("input[name=top_slv_length]:text").val("");
			$("input[name=top_slv_opening]:text").val("");
			$("input[name=top_slv_bill]:text").val("");
			$("input[name=bottom_size_nme]:text").val("");
			$("input[name=bottom_length]:text").val("");
			$("input[name=bottom_waist]:text").val("");
			$("input[name=bottom_hip]:text").val("");
			$("input[name=bottom_thigh]:text").val("");
			$("input[name=bottom_tail_girth]:text").val("");
			$("input[name=bottom_front_width]:text").val("");
			$("input[name=bottom_back_width]:text").val("");
					
		});
		$("#InsertSizeCancelBtn").click(function(){
			window.close();
		});
	});
	function popUpCategory(val){
		$("#sizeCategory").val(val);
	}
	function selectCategory(){
		windows
	}
</script>
</head>
<body>
	<div class="container">
		<input type="hidden" id="sizeCategory" name="sizeCategory">
		<div class="row">
			<div class="col-xs-12" style="padding-top:10px">
			</div>
			<div class="col-xs-12" style="padding-top:10px">
			<form name="prodctInsertSizeFrm" id="prodctInsertSizeFrm" method="post">
				<input type="hidden" name="category_seq" value="${category_seq}">
				<table class="table table-bordered" style="width:100%; float:left; text-align:center">
   					<tr>
    					<th colspan="8" class="active text-center">
    						size
    					</th>
   					</tr>
   					<c:choose>
   						<c:when test="${category_seq == 0}">
   							<tr>
   								<td style="text-align:center">
   									카테고리를 선택하세요
   								</td>
   							</tr>
   						</c:when>
   						<c:when test="${category_seq == 1}">
		   					<tr>
		  						<td>
		  							사이즈
		  						</td>
		  						<td>
		  							총기장
		  						</td>
		  						<td>
		  							어깨넓이
		  						</td>
		  						<td>
		  							가슴 둘레
		  						</td>
		  						<td>
		  							밑단 둘레
		  						</td>
		  						<td>
		  							소매 길이
		  						</td>
		  						<td>
		  							소매통
		  						</td>
		  						<td>
		  							소매 절개선 둘레
		  						</td>
		   					</tr>
		   					<tr>
		   						<td>
		  							<input type=text name="top_size_nme" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_length" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_shouldr" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_bust" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_tail_girth" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_slv_length" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_slv_opening" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="top_slv_bill" class="form-control" style="width:100%">
		  						</td>
		   					</tr>
   						</c:when>
   						<c:when test="${category_seq == 2}">
		   					<tr>
		  						<td>
		  							사이즈
		  						</td>
		  						<td>
		  							총기장
		  						</td>
		  						<td>
		  							허리둘레
		  						</td>
		  						<td>
		  							 엉덩이둘레
		  						</td>
		  						<td>
		  							허벅지
		  						</td>
		  						<td>
		  							밑단 둘레
		  						</td>
		  						<td>
		  							앞 밑위 둘레
		  						</td>
		  						<td>
		  							뒷 밑위 둘레
		  						</td>
		   					</tr>
		   					<tr>

		   						<td>
		  							<input type=text name="bottom_size_nme" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_length" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_waist" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_hip" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_thigh" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_tail_girth" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_front_width" class="form-control" style="width:100%">
		  						</td>
		  						<td>
		  							<input type=text name="bottom_back_width" class="form-control" style="width:100%">
		  						</td>
		   					</tr>
   						</c:when>
   					</c:choose>
   				</table>
				</form>
			</div>
			<div class="col-xs-12">
				<button type="button" id="InsertSizeCancelBtn" class="btn btn-default" style="border:1px solid; float:right">취소</button>
				<button type="button" id="InsertSizeBtn" class="btn btn-default" style="border:1px solid; margin-right:10px; float:right">등록</button>
			</div>
		</div>
	</div>
</body>
</html>