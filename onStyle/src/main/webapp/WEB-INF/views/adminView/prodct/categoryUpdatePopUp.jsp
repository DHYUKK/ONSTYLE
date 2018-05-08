<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 분류 수정</title>
<!-- 화면 디자인에 필요한 CSS -->
<link href="/resources/consmr/main/consmrBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/custom.min.css"/>

<!-- 부트스트랩의  다양한 기능들을 구현 해놓은 js소스-->
<script src="/resources/consmr/main/consmrBootstrap/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/custom.js"></script>
   
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script>
$(document).ready(function(){
	var check = $("#check").is(":checked");
	$("input[name=check]:checkbox").prop("checked", true);
			
	//중분류 초기 값
	var firstOutput = '';
	firstOutput += '<option value="6" selected="selected"> T-shirts </option>';
	firstOutput += '<option value="7" selected="selected"> blouse&shirts </option>';
	firstOutput += '<option value="8" selected="selected"> knit </option>';

	$("#mid_category").append(firstOutput);
})


//대분류 선택하면 중분류 변경
function selectCategory(){
	var category_seq = $("#category option:selected").val();
	formData = "category_seq="+category_seq;
	$("#mid_category").append('');
	$.ajax({
	   type: "POST",
	   url: "/selectCategory.do",
	   data : formData,
	   success: function(data){
		   $("#mid_category").html("");
		   
		   $.each(data, function(i, vo){
				var output = '';
				output += '<option value="'+ vo.category_seq +'selected="selected">'+vo.category_nme+'</option>';
				$("#mid_category").append(output);
			})
		},
	   error:function(xhr,status,error)
	       { //ajax 오류인경우  
			alert("error");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	       }
	}); 
}

//팝업창 닫기
function cancelPopup(){
    window.opener.location.reload();
    self.close();
};

//상품 카테고리 수정
function categoryUpdate(){
	var group=[];
	var category_seq = $("#mid_category").val();
	
	//팝업창 상품 seq
	$("input:checkbox[name=check]:checked").each(function(i,elements){
    	group.push($(this).val());
    });

	var formData = "group="+group+"&category_seq="+category_seq
	$.ajax({
		type: "POST",
		url: "/updatePopUpProdct.do",
		data: formData,
		success: function(data){
		},
		error:function(xhr,status,error)
	       { //ajax 오류인경우  
	       }
	});
	window.opener.location.reload();
	self.close();
};
</script>
</head>
<body>
<div class="maincontainer">
	<div class="container" style="color: #fff; background-color: #000; border-radius:4px; padding:3px 8px; margin-top:1%;">
		<h4><font color="white">상품 분류 수정</font></h4>
	</div>
	
	<div class="container" id=" " style="width:80%; padding-top:2%; margin:0 auto;">
		<table class="table" style="margin:0 auto; width:100%; text-align:center;">
			<tr style="height:50px;">
				<td class="active" style="width:40%; vertical-align:middle;"><h5><b>선택된 상품</b></h5></td>
				<td class="active" style="vertical-align:middle;"><h5><b>카테고리</b></h5></td>
			</tr>
				<c:forEach items="${popUpProdctList}" var="adminProdctVo" varStatus="status">
					<tr style="height:30px;">
						<input type="checkbox" name="check" value="${adminProdctVo.prodct_seq}" style="display:none">	
						<td>${adminProdctVo.prodct_nme}</td>
						<td>${adminProdctVo.category_nme}
							&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;
							${adminProdctVo.mid_category_nme}</td>
					</tr>
				</c:forEach>
		</table>
	</div>
	
	<!-- 셀렉 상자 -->
	<div style="width:50%; text-align:center; padding-top:3%; margin:0 auto;">
		<table style="margin:0 auto;">
			<tr>
				<td style="width:50%;">
					<select id="category" name="search_category"  class="form-control" onchange="selectCategory()">
						<option value="1">Top</option>
						<option value="2">Bottom</option>
						<option value="3">Dress</option>
						<option value="4">Shoes & Bag</option> 
					</select>
				</td>
				<td style="padding-left:12%;">
					<select id="mid_category" class="form-control" style="width:100%;">
					</select>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 버튼들 -->
	<div style="margin-top:2%; text-align:center;">
		<input type="button" class="btn btn-default" value="확인" onclick="categoryUpdate()"> 
		<input type="button" class="btn btn-default" style="margin-left:1%;" value="취소" onclick="cancelPopup()">
	</div>
</div>	
</body>
</html>