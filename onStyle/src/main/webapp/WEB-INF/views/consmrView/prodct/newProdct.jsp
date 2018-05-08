<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- 		thumbnail -->
<link href="/resources/consmr/prodct/css/thumbnail.css" rel="stylesheet" type="text/css"/>
<script>			
	function prodctView(prodct_seq){
		var prodct_sell_state = $("#"+prodct_seq).val();
		if(prodct_sell_state != "N"){
			formData = {"prodct_seq" : prodct_seq}
			$.ajax({
				type : "POST",
				url : "/prodctView.do",
				data : formData,
				success:function(data){
					$("#prodctArrayStd").hide();
					$("#prodctDiv").html(data);				
				},
				error:function(xhr,status,error){ 
// 		            alert("$");
// 		            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		        }
			});
		}
		else{
			alert("상품 판매중이 아닙니다.");
		}
	}
	function prodctSelect(prodct_state){
		window.location.href = "/prodctFrameSelect.do?prodct_state="+prodct_state+"&category_seq="+${category_seq};
	}
//		thumbnail
	$(document).ready(function() {
	   //이미지 섬네일
	    var xOffset = 10;
	    var yOffset = 30;
	    $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
	    	var prodct_seq = $(this).attr("data-seq");	    	
	    	formData = {"prodct_seq" : prodct_seq}
		 	//상품 베스트 코디 미리보기
	    	$.ajax({ 		 		
				type:"POST",
				url:"/selectProdctBestCodi.do",
				data:formData,
				success:function(data){
					if(data.codi_img_route != null){
						$("body").append("<p id='preview' style='background-color:white; border:1px solid #e5e5e5'><img src='"+data.codi_img_route+"' width='300px' height='300px' /></p>"); //보여줄 이미지를 선언                       
			 	        $("#preview")
			 	            .css("top",(e.pageY - xOffset) + "px")
			 	            .css("left",(e.pageX + yOffset) + "px")
			 	            .fadeIn("fast"); //미리보기 화면 설정 셋팅
					}
					
				},
				error:function(request,status,error){
// 					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
	    });     
	    $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
	        $("#preview")
	            .css("top",(e.pageY - xOffset) + "px")
	            .css("left",(e.pageX + yOffset) + "px");
	    });     
	    $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
	        $("#preview").remove();
	    });
	});
</script> 
</head>
<body>		
   	<div class="col-md-12">		
		<c:forEach var="prodctList" items="${prodctList}" varStatus="status">
			<div class="col-md-4" style="padding-bottom:10px; overflow:hidden;">
				<input type="hidden" id="${prodctList.prodct_seq}" value="${prodctList.prodct_sell_state}">
				<a href="#" onclick="prodctView(${prodctList.prodct_seq})">
					<img class="thumbnail" data-seq="${prodctList.prodct_seq}" data-state="${prodct_sell_state}" style="width:400px; height:350px" src="${prodctList.prodct_img_route1}">
				</a> 	
			</div>									
		</c:forEach>     					       						       									      	
   	</div>	                  										
</body>
</html>