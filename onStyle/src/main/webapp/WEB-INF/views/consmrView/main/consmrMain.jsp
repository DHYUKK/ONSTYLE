<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="/resources/consmr/prodct/css/prodctView.css" rel="stylesheet" type="text/css" />

<script>
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
function prodctView(prodct_seq){
    window.location.href = "/prodctFrameSelect.do?prodct_seq="+prodct_seq;
}

function prodctSelect(prodct_sell_state){
// 	alert(prodct_sell_state);
	window.location.href = "/prodctFrameSelect.do?prodct_sell_state="+prodct_sell_state;
}
</script>   
</head>
<body>
	<div>
		<c:import url="/menu.do"/>
	</div>
	<style>
		/* 미리보기 스타일 셋팅 */
		#preview{
		    z-index: 9999;
		    position:absolute;
		    background:#333;
		    padding:1px;
		    display:none;
		    color:#fff;
		}
		/* 이미지 썸네일 */
		.thumbnail{
		   display:inline;
		   margin-bottom:0px;
		   height:50px;
		   width:50px;
		}
	</style>
	<div class="prodctContainer">
		<div class="col-xs-12">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
		 			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		  			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		  			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" style="height:650px">
					<div class="item active">
						<img src="/resources/admin/store/img/banner1.png" style="height: 650px; width: 1170px;" alt="First slide">
					</div>
					<div class="item">
						<img src="/resources/admin/store/img/banner2.png" style="height: 650px; width: 1170px;" alt="Second slide">
					</div>
					<div class="item">
						<img src="/resources/admin/store/img/banner3.png" style="height: 650px; width: 1170px;" alt="Third slide">
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		 			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
	   			</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		  			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		 			<span class="sr-only">Next</span>
	   			</a>		
			</div>
		</div>
		
		<div class="col-xs-12" style="margin-top:7%; margin-bottom:1%; text-align:center;"><h4>NEW ARRIVAL</h4></div>
		<div class="col-xs-12">
			<c:forEach var="mainProdctSelect" items="${mainProdctSelect}" varStatus="status">
				<div class="col-xs-4" style="padding-left: 0px; padding-right: 0px; margin:10px 0px">
					<a href="#" onclick="prodctView(${mainProdctSelect.prodct_seq})">
						<img class="thumbnail" data-seq="${mainProdctSelect.prodct_seq}" style="width:400px; height:350px" src="${mainProdctSelect.prodct_img_route1}">
					</a> 	
				</div>									
			</c:forEach> 
		</div>
		
		<div class="col-md-12" style="border-top:1px solid; border-bottom:1px solid; padding-top:100px; padding-bottom:100px; margin-top:50px">
	    		<div class="col-md-1"></div>
				<div class="col-md-10">			
					<p style="
								display: block; font-size: 20px;
								font-weight: 700;
								line-height: 25px;
		    					color: #252525;							
		 						letter-spacing: 0.2px;"
						>
							053 267 7288
						</p>
					<p>MONDAY - FRIDAY PM12:00 - PM6:00 / SAT SUN HOLIDAY CLOSED</p>
					<h4 style=" 
								font-size: 11px;
							    color: #252525;
							    font-weight: 700;
							    letter-spacing: 1px;
							    height: 20px;
							    margin-top: 20px;
							    margin-left: 0.5px;"
					>
						COMPANY INFO
					</h4>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						" COMPANY. MISSBOM OWNER. SEO U JIN TEL. 053 267 7288 EMAIL. missbom11@naver.com ADDRESS. 대구 달서구 신당동 1814-1 미스봄 "
					</P>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						" MAIL ORDER LICENSE. 2015-대구달서-0651 BUSINESS LICENSE. 414-12-00143 "
					</p>
					<P style="    
								display: block;
  									padding: 0px 0 0 1px;
							    font-size: 11px;
							    font-weight: 400;
							    line-height: 20px;
							    color: #252525;								   
							    letter-spacing: 0.3px"	
					>
						COPYRIGHT @ MISSBOM ALL RIGHTS RESERVED.
					</p>					
				</div>
				<div class="col-md-1"></div>			
			</div>		
	</div>
</body>
</html>
