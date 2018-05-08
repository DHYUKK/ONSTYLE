<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- prdct css -->
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
<style>
.like {
	width: 20px;
	height: 20px;
	background: url("/resources/consmr/codi/codiShr/img/profile.PNG")
		no-repeat;
}

.mem_profile {
	width: 100px;
	height: 100px;
	object-fit: cover;
	object-position: top;
	border-radius: 50%;
}

.codiUseProdct {
	width: 200px;
	height: 200px;
}
.centered { display: table; margin-left: auto; margin-right: auto; } 

</style>
<script>
var sale_adPr = 0;
var prodct_price = 0;

	//좋아요 버튼 색 변경 및 갯수
	$(document).ready(function(){
		
		//세일가 적용 ////위치 가 제일 위에 있어야 합니다.
		sale_p();
		
		selectQuanty();
		$(".likeButton").click(function(){
			codi_shr_seq = $(this).children().eq(0).val();
			formData = "codi_shr_seq="+codi_shr_seq;
			like = $(this).children().eq(1);
			
			$.ajax({
				type: "POST",
				url: "/like.do",
				data : formData,
				success: function(data){
					if(data.liked == 1){
						like.html("<img class='like' style='cursor:pointer' src='resources/consmr/codi/codiShr/img/like/liked.png'>");
					}
					else {
						like.html("<img class='like' style='cursor:pointer' src='resources/consmr/codi/codiShr/img/like/liking.png'>");
					}
					$.ajax({
						type: "POST",
						url: "/countLike.do",
						data: formData,
						success: function(data){
							$("#countLike").html(data.liked)	
						}
					})
				},
				error:function(xhr,status,error)
					 { //ajax 오류인경우  
						alert("로그인 후 이용가능합니다.");		
					}
			}); 
		});		
	});
	
	//다른 코디 조회
	function viewOther(o){
		var codiViewForm = $("#codiViewForm").serialize();
		window.location.href="/codiView.do?"+codiViewForm+"&codi_shr_seq="+o;
	}

	//선택한 상품 조회
	function prodct_read(prodct_seq){
		 window.location.href = "/prodctFrameSelect.do?prodct_seq="+prodct_seq;
	}
	
	//스크랩
	function scrap(s){
		formData = "codi_shr_seq="+s;
		$.ajax({
			type : "POST",
			url : "/scrap.do",
			data : formData,
			success : function(data){
				$("#scrap").html("");
				alert("스크랩이 완료되었습니다. [나의 옷장] > [스크랩 코디]에서 확인 하세요.");
			},
			error:function(xhr,status,error)
				 { //ajax 오류인경우  
					alert("로그인 후 이용가능합니다.");		 
				}
		})
	}
	
	function selectQuanty(){

		var chooseSize = $("#chooseSize").val();
		var chooseColor = $("#chooseColor").val();
		
		$("#prodctSelectedColor").html(chooseColor);
		$("#prodctSelectedSize").html(chooseSize);
		$(".btn").css("padding", "0px 0px 0px 1px");
		var stat = $('#imsiQuanty').val(); 
// 		var prodct_price = parseInt($("#prodctPrice").text(), 10);
		var num = parseInt(stat,10);			
		var prodctTotalPrice = prodct_price * num;
		$("#prodctTotalPrice").html(prodctTotalPrice+"원");
		$("#prodctTotalPriceV").html(prodctTotalPrice+"원");
		$("#prodctTotalNum").html("(1)");
		
	
	}

	$("#increaseQuantiy").click(function(){
// 		var prodct_price = parseInt($("#prodctPrice").text(), 10);		
		var stat = $('#imsiQuanty').val(); 		
		var num = parseInt(stat,10);  //(parseInt() 함수는 문자열 아규먼트를 파싱하고, 특정 radix(진수: 수의 진법 체계에 기준이 되는 값)의 정수를 리턴합니다.)
		
		num++;   //숫자 감소
		if(num>10){   //num의 기본값 1보다 작거나 0과 같으면
  			 alert('더이상 늘릴수 없습니다.');   //경고창이 뜬다
  			 num =10;   //num의 기본값 1
		}
		var prodctTotalPrice = prodct_price * num;
   		$('#imsiQuanty').val(num);
   		$("#prodctTotalPrice").html(prodctTotalPrice+"원");
   		$("#prodctTotalPriceV").html(prodctTotalPrice+"원");
   		$("#prodctTotalNum").html("("+num+")");
	});
 	
	$("#decreaseQuantiy").click(function(){	
// 		var prodct_price = parseInt($("#prodctPrice").text(), 10);	
		var stat = $('#imsiQuanty').val(); 		
		var num = parseInt(stat,10);  //(parseInt() 함수는 문자열 아규먼트를 파싱하고, 특정 radix(진수: 수의 진법 체계에 기준이 되는 값)의 정수를 리턴합니다.)		
		num--;   //숫자 감소
		if(num<=0){   //num의 기본값 1보다 작거나 0과 같으면
  			 alert('더이상 줄일수 없습니다.');   //경고창이 뜬다
  			 num =1;   //num의 기본값 1
		}
		var prodctTotalPrice = prodct_price * num;
		$('#imsiQuanty').val(num);
		$("#prodctTotalPrice").html(prodctTotalPrice+"원");
		$("#prodctTotalPriceV").html(prodctTotalPrice+"원");
		$("#prodctTotalNum").html("("+num+")");
   		
	});//num의 기본값보다 1이상일때 화면에 표시된다 
	
	//장바구니 담기
	$("#addCartButton").click(function(){
		$("#shpbag_color").val($("#prodctSelectedColor").text());
		$("#shpbag_size").val($("#prodctSelectedSize").text());
// 		alert($("#shpbag_size").val());
		document.cartInsertForm.action = "/cartInsert.do";
		document.cartInsertForm.submit();	
	});
	
	///세일가 적용
	function sale_p(){
		sale_adPr = parseInt($("#prodctPrice").text(), 10)*(100 - $("#sale_price").val())/100
		if( $("#sale_price").val() != ""){
			$("#prodctPrice").html(
					"<div class='pull-left'><font color=red size=4.5em>"+$("#sale_price").val()+"% Sale</font></div>"
					+"<div class='pull-left' style='margin-left:20px;margin-top:-7px'>"
						+"<strike><font size=2.5em color=#BDBDBD>"+$("#prodctPrice").text()+"</font></strike><br>"
						+"<font size=4.5em style='line-height:7px'>"+sale_adPr+"원</font></div>"
			)
		}
		prodct_price = sale_adPr;
	}
	
</script> 
</head>
<body>
<!--     	여기서부터 상품 상세보기				  	 -->
   	<div class="col-md-12" style="margin-top:22px">	
		<div class="col-md-7" style="overflow:hidden">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:600px; height:500px">
	        	<ol class="carousel-indicators">
         			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
          			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
          			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
        		</ol>
        		<div class="carousel-inner" style="height:500px">
			        <div class="item active">
			           <img src="${prodctVO.prodct_img_route1}" style="width:600px; height:500px" alt="First slide">
			        </div>
			        <div class="item">
			           <img src="${prodctVO.prodct_img_route2}" style="width:600px; height:500px" alt="Second slide">
			        </div>
			        <div class="item">
			           <img src="${prodctVO.prodct_img_route3}"  style="width:600px; height:500px" alt="Third slide">
			        </div>
  			        <div class="item">
			           <img src="${prodctVO.prodct_img_route4}"  style="width:600px; height:500px" alt="fourth slide">
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
   		<div class="col-md-5">
   			<table class="table" style="border:1px solid #ddd">
   				<tr>
   					<td></td><td><p style="font-family:Noto Sans KR; font-size: 16px; font-weight:600; color: #000000;">${prodctVO.prodct_nme}</p></td><td></td>
   				</tr>
   				<tr>
   					<td><p style="font-size:15px; font-weight: bold;">PRICE</p></td>
   					<td><span id="prodctPrice" style="font-family:Noto Sans KR; font-size:16px; font-weight:600;">${prodctVO.prodct_price}원</span></td>
   					<td></td>
   				</tr>
   				<tr>
   					<td><span style="font-size:15px; font-weight: bold;">SNS</span></td>
   					<td>
   						<div style="margin-top:5px;">
	   						<img src="/resources/consmr/prodct/img/facebook_social_pin-128.png" style="width:20px; height:20px">
	   						<img src="/resources/consmr/prodct/img/circle_social-twitter-glyph-128.png" style="width:20px; height:20px">
   						</div>
   					</td>
   					<td></td>
   				</tr>
   				<tr id ="sizeZone"> 				
					<td><span style="font-size:15px; font-weight: bold;">SIZE</span></td>
   					<td>
   						<select id="chooseSize" class="btn btn-default" style="font-size:12px; width:200px; height:30px" onchange="javascript:selectQuanty()">
						<c:forEach var="prodctSizeList" items="${prodctSizeList}" varStatus="status">
							<c:choose>
								<c:when test="${prodctVO.category_seq == 3 or prodctVO.category_seq == 5 or prodctVO.category_seq == 6 or prodctVO.category_seq == 7 or prodctVO.category_seq == 8}">
									<option value="${prodctSizeList.top_size_nme}">&nbsp;${prodctSizeList.top_size_nme}</option> 							
								</c:when>
								<c:when test="${prodctVO.category_seq == 9 or prodctVO.category_seq == 10 }">
									<option value="${prodctSizeList.bottom_size_nme}">&nbsp;${prodctSizeList.bottom_size_nme}</option>
								</c:when>
							</c:choose> 							
						</c:forEach>
   						</select>
					</td>
					<td></td>
   				</tr>   				
   				<tr id="colorZone">
					<td><span style="font-size:15px; font-weight: bold;">COLOR</span></td>
   					<td>
   						<select id="chooseColor" class="btn btn-default" style="font-size:12px; width:200px; height:30px" onchange="javascript:selectQuanty()">
						<c:forEach var="prodctColorList" items="${prodctColorList}" varStatus="status">
							<option value="${prodctColorList.prodct_color_nme}">&nbsp;${prodctColorList.prodct_color_nme}</option>  							
						</c:forEach>
   						</select>
					</td>
					<td></td>
   				</tr>
			</table>
			<form name="cartInsertForm" method="post">
				<input type="hidden" name="prodct_seq" value="${prodctVO.prodct_seq}">
				<input type="hidden" id="shpbag_color" name="shpbag_color" value="">
				<input type="hidden" id="shpbag_size" name="shpbag_size" value="">								  
				<input type="hidden" name="mem_seq" value="${memVO.mem_seq}">
									        				
				<div class="col-md-12" id="prodctQuanty" style="height:145px; border-top:1px solid #ddd; border-bottom:1px solid #ddd; padding-top:10px;">
					<div class="col-md-12">
						<div class="col-md-8" style="text-align:left;">
							<p style="font-family:Noto Sans KR; font-size:16px; font-weight:500">${prodctVO.prodct_nme}</p>
							<span id="prodctSelectedColor" style="font-family:Noto Sans KR; font-size:15px;"></span>/<span id="prodctSelectedSize" style="font-family:Noto Sans KR; font-size:15px"></span>
						</div>
						<div class="col-md-4" style="padding-top:30px; float:right">
							<div class="btn-group-vertical" role="group" aria-label="..." style="float:right">
					 			<button type="button" id="increaseQuantiy" class="btn btn-default" style="width: 25px;height: 22px;padding: 0px;"><span style="margin-left:1px">▲</span></button>
								<button type="button" id="decreaseQuantiy" class="btn btn-default" style="width: 25px;height: 22px;padding: 0px 0px 0px 1px;"><span>▼</span></button>
							</div>
							<div style="margin-left: 32px;margin-top: 7px;">	
								<input type="text" id="imsiQuanty" name="shpbag_quanty" value="1" style="border:1px solid #D5D5D5; border-radius:3px; width:30px;height:30px;text-align: center;">
							</div>	
						</div>
					</div>
					<div class="col-md-12" style="height:20px">
					</div>
					<div class="col-md-12">
						<span style="font-family:Noto Sans KR; font-size:15px; font-weight:600;">총 상품금액</span>
						<span style="font-family:Noto Sans KR; font-size:12px;">(수량) : </span>
						<span id="prodctTotalPriceV" style="font-family:Noto Sans KR; font-weight:600; font-size:15px;"></span>
						<span id="prodctTotalNum" style="font-family:Noto Sans KR; font-size:12px;"></span>
					</div>
				</div>
				<div class="col-md-12" style="padding-top:20px" >
					<div class="col-md-6">
						<button type="button" class="btn btn-info" style="width:130px; height:40px; margin-left:23px"><font size="3">BUY IT NOW</font></button>
					</div>
					<div class="col-md-6">
						<button type="button" id="addCartButton" class="btn btn-default" style="width:130px; height:40px; margin-left:23px"><font size="3">ADD TO CART</font></button>
					</div>
				</div>
			</form>		  				        		
   		</div>	     				
	</div>
<!-- 	민기꺼 가져오기   시작-->
	<c:if test="${codiShrVO.liked >= 30}">
	<div class="col-md-12" style="height:30px"></div>
	<div class="col-md-12">
		<div class="codi_image_wrapper document_content_wrapper">
					<div class="profile_image" style="border:1px solid #e5e5e5; z-index:1; text-align:center; width:40%; float:right; height:100%;">
						<img style="margin-top:5px;" class="mem_profile" src="${codiShrVO.mem_img_route}"> <br>
						<font size=4 style="font-weight:bold;">${codiShrVO.mem_nicknme}</font>
						<div style="height:320px;">
							<table style="margin:0 auto; width:80%;">
								<tr>
									<c:forEach var="memCodiList" items="${memCodiList}" varStatus="status">
										<c:if test="${status.index%2 == 0}">
											</tr>
											<tr><td colspan=3 style="height:5px;"></td></tr>
											<tr>
										</c:if>
										<td id="codi${memCodiList.codi_shr_seq}" style="cursor:pointer; border:1px solid #e5e5e5; z-index:2; width:48%; height:140px;" onclick="viewOther(${memCodiList.codi_shr_seq})">
											<img style="max-height:90%; max-width:100%; z-index:3;" src="${memCodiList.codi_img_route}" onclick="viewOther(${memCodiList.codi_shr_seq})">
										</td>
										<td style="width:2%;"></td>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="image_wrapper" style="border:1px solid #e5e5e5; width:60%; text-align:center; height:420px;">
							<img style="max-height:85%; max-width:85%; margin: 5% auto;" 
							src="${codiShrVO.codi_img_route}">
					</div>
					<div class="line"></div>
					<div class="bottom_wrapper" style="bottom: 0px; border: 1px solid #e5e5e5; width: 60%">
						<div style="margin-left: 20px;">
							<table>
								<tr> 
									<td class="likeButton" style="text-align: center;">
										<input type="hidden" value="${codiShrVO.codi_shr_seq}">
										<div id="like">
											<c:if test="${codiShrVO.likeState==0}">
												<img class="like" src="resources/consmr/codi/codiShr/img/like/liking.png" style="cursor:pointer;">
											</c:if> 
											<c:if test="${codiShrVO.likeState==1}">
												<img class="like" src="resources/consmr/codi/codiShr/img/like/liked.png" style="cursor:pointer;">
											</c:if>
										</div>
									</td>
									<td>
										<h6><span id="countLike" style="padding-left:7px; font-weight:bold;">${codiShrVO.liked}</span></h6>
									</td>
									<td style="width: 300px;"><h6>명이 좋아합니다.</h6></td>
									<td><h6>댓글</h6></td>
									<td style="padding-left:7px; width: 100px;">
										<h6><b>${codiShrVO.reply}</b>개</h6>
									</td>
									<c:if test="${codiShrVO.scrapState==0 and codiShrVO.mem_seq!=mem_seq}">
										<td style="font-weight:bold; font-size: 14px;">스크랩</td>
										<td id="scrap" style="text-align: center;" onclick="javascript:scrap(${codiShrVO.codi_shr_seq})">
											<img src="resources/consmr/codi/codiShr/img/like/scrap.png" style="width:57%; cursor:pointer;">
										</td>
									</c:if>
									
								</tr>
							</table>
						</div>
					</div>

					<div class="prodct_wrapper">
						<div style="margin: 0 auto; border: 1px solid #e5e5e5;">
							<h5><center><b>코디에 사용된 미스봄 상품</b></center></h5>
						</div>
						<div class="row" style="border: 1px solid #e5e5e5; width: 100%; height: 270px; margin: 0 auto;">
				  			<c:import url="/codiUsedPordct.do?codi_seq=${codiShrVO.codi_seq}&pageCode=2"/>
						</div>
					</div>
				</div>
	</div>
	</c:if>
	<!-- 민기꺼 가져오기 끝 -->
	<div class="col-md-12" style="height:50px"></div>
	<div class="centered" id="imgViewDiv">
		${prodctVO.prodct_detail}
	</div>
<!-- 	치수 측정표 -->
	<div class="col-md-12" style="height:20px"></div>
	<div class="col-md-12 col-xs-12">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="border:1px solid #ddd; border-radius:4px 4px 4px 4px; padding-top:10px">
			<table class="table" style="font-size:15px; text-align:center;">				
				<tr class="active">					
					<td>사이즈</td>
					<c:choose>
						<c:when test="${prodctVO.category_seq == 1 or prodctVO.category_seq == 3 or prodctVO.category_seq == 5 or prodctVO.category_seq == 6 or prodctVO.category_seq == 7 or prodctVO.category_seq == 8}">
							<td>A 총기장</td>
							<td>B 어깨넓이</td>
							<td>C 가슴둘레</td>
							<td>D 밑단둘레</td>
							<td>E 소매길이</td>
							<td>F 소매통</td>
							<td>G 소매절개선둘레</td>
						</c:when>
						<c:when test="${prodctVO.category_seq == 2 or prodctVO.category_seq == 9 or prodctVO.category_seq == 10}">
							<td>A 총기장</td>
							<td>B 허리둘레</td>
							<td>C 힙둘레</td>
							<td>D 허벅지둘레</td>
							<td>E 밑단둘레</td>
							<td>F 앞밑위둘레</td>
							<td>G 뒷밑위둘레</td>
						</c:when>
					</c:choose>
				</tr>
			<c:forEach var="prodctSizeList" items="${prodctSizeList}" varStatus="status">				
				<tr>
					<c:choose>
						<c:when test="${prodctVO.category_seq == 1 or prodctVO.category_seq == 3 or prodctVO.category_seq == 5 or prodctVO.category_seq == 6 or prodctVO.category_seq == 7 or prodctVO.category_seq == 8}">					
							<td>${prodctSizeList.top_size_nme}</td>
							<td>${prodctSizeList.top_length}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_length}</c:if></td>
							<td>${prodctSizeList.top_shouldr}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_shouldr}</c:if></td>
							<td>${prodctSizeList.top_bust}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_bust}</c:if></td>
							<td>${prodctSizeList.top_tail_girth}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_tail_girth}</c:if></td>
							<td>${prodctSizeList.top_slv_length}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_slv_length}</c:if></td>
							<td>${prodctSizeList.top_slv_opening}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_slv_opening}</c:if></td>
							<td>${prodctSizeList.top_slv_bill}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_top_slv_bill}</c:if></td>
						</c:when>
						<c:when test="${prodctVO.category_seq == 2 or prodctVO.category_seq == 9 or prodctVO.category_seq == 10}">
							<td>${prodctSizeList.bottom_size_nme}</td>
							<td>${prodctSizeList.bottom_length}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_length}</c:if></td>
							<td>${prodctSizeList.bottom_waist}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_waist}</c:if></td>
							<td>${prodctSizeList.bottom_hip}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_hip}</c:if></td>
							<td>${prodctSizeList.bottom_thigh}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_thigh}</c:if></td>
							<td>${prodctSizeList.bottom_tail_girth}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_tail_girth}</c:if></td>
							<td>${prodctSizeList.bottom_front_width}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_front_width}</c:if></td>
							<td>${prodctSizeList.bottom_back_width}<c:if test="${memVO.mem_seq ne 0}">/${memVO.mem_bottom_back_width}</c:if></td>
						</c:when>
					</c:choose>							
				</tr>
			</c:forEach>				
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
<!-- 	치수측정표끝 -->
	<div class="col-md-12" style="height:220px; margin:auto"></div>
	<div class="col-md-12">
		<div class="col-md-5" style="border-right:3px solid; height:400px">
			<div class="col-md-12" style="height:200px"></div>
			<div class="col-md-6">
				<p style="font-size:20px; text-align:right;">u-jin, model</p>
				<p style="font-size:15px; text-align:right; font-weight:bold"> blog</p>
				<p style="font-size:15px; text-align:right; font-weight:bold">facebook</p>
				<p style="font-size:15px; text-align:right; font-weight:bold">instagram</p>
			</div>
			<div class="col-md-6" style="text-align:left; margin-top:25px;">												
				<p style="font-size:15px;"> blog.naver.com/missbom11</p>
				<p style="font-size:15px;">미스봄 검색</p>
				<p style="font-size:15px;">@miss.bom</p>
			</div>
		</div>
		<div class="col-md-7">
			<div class="col-md-12" style="height:200px"></div>
			<div class="col-md-12">
				<p style="font-size:20px; text-align:center;">163cm / 44kg / top 44 / bottom 25 / shoes 225-320</p>
			</div>
		</div>
	</div>	
	<div class="col-md-12" style="height:160px"></div>
	<div class="col-md-12">
		<div class="col-md-12" style="padding:5px">
			<img src="/resources/consmr/prodct/img/mm.PNG"  style="display:block; margin-right:auto; margin-left:auto">
		</div>
		<div class="col-md-12">
			<hr>
			<button type="button" style="float:right; width:100px; height:30px; background-color:#000000;">
				<span style="font-family:arial; font-size:15px; color:white">WRITE</span>
			</button>						
		</div>
	</div>	
	
	<input type ="hidden" id="sale_price" value="${storeVo.sale_bridge_discntrate }">			
</body>
</html>