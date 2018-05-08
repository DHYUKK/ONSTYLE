<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>   

<title>관리자 메인 - 온스타일</title>

<script>
//이미지 섬네일
var xOffset = 10;
var yOffset = 30;
$(document).on("mouseover",".thumbnail",function(e){ //마우스 오버시
    $("body").append("<p id='preview' style='background-color:white; border:1px solid #e5e5e5'><img src='"+ $(this).attr("src") +"' width='200px' /></p>"); //보여줄 이미지를 선언                       
   $("#preview")
      .css("top",(e.pageY - xOffset) + "px")
      .css("left",(e.pageX + yOffset) + "px")
      .fadeIn("fast"); //미리보기 화면 설정 셋팅
});    
$(document).on("mousemove",".thumbnail",function(e){ //마우스 이동시
   $("#preview")
      .css("top",(e.pageY - xOffset) + "px")
      .css("left",(e.pageX + yOffset) + "px");
});    
$(document).on("mouseout",".thumbnail",function(){ //마우스 아웃시
   $("#preview").remove();
});

function adminCodiReqstRead(reqstSeq){
	window.location.href = "/adminCodiReqstRead.do?codi_reqst_seq="+reqstSeq;
}

function codiShrRead(codi_shr_seq){
	window.location.href = "/codiShrRead.do?codi_shr_seq="+codi_shr_seq;
}

function adminCodiReqstRead(reqstSeq){
   window.location.href = "/adminCodiReqstRead.do?codi_reqst_seq="+reqstSeq;
}

function codiShrRead(codi_shr_seq){
   window.location.href = "/codiShrRead.do?codi_shr_seq="+codi_shr_seq;
}
</script>

</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do"/>
	</div>
	
	<style>
		#preview{
			z-index: 9999;
			position:absolute;
			border:0px solid #ccc;
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
	
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
	<div class="col-xs-12">
		<legend>배너관리
			<a href="/banner.do" class="list-group-item" style="float:right; padding-top:0px; padding-bottom:0px; padding-left:15px; padding-right:15px;">+</a>
		</legend>
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
	 			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	  			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
	  			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" style="height:761px">
				<div class="item active">
					<img src="/resources/admin/store/img/banner1.png" style="height: 761px; width: 1506px;" alt="First slide">
				</div>
				<div class="item">
					<img src="/resources/admin/store/img/banner2.png" style="height: 761px; width: 1506px;" alt="Second slide">
				</div>
				<div class="item">
					<img src="/resources/admin/store/img/banner3.png" style="height: 761px; width: 1506px;" alt="Third slide">
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
		<div class="col-xs-12">
			<div class="col-xs-12" style="margin:3% 0%; padding:0px">
				<legend>주문현황
				</legend>
				<div class="col-xs-1"><a href="/allOrder.do" class="btn btn-info" style="padding-top:15px; padding-bottom:15px; font-size:15px;">주문현황<br>전체조회</a></div>
				<div class="col-xs-11" style="float:left; background-color: #f5f5f5; border-bottom: 2px solid #dddddd; border-top: 0; padding: 8px; line-height: 1.846; font-weight: bold;">
					<div class="col-xs-1" style="text-align:center">입금 전</div>
					<div class="col-xs-1" style="text-align:center">상품 준비중</div>
					<div class="col-xs-1" style="text-align:center">배송 준비중</div>
					<div class="col-xs-1" style="text-align:center">배송중</div>
					<div class="col-xs-1" style="text-align:center">배송완료</div>
					<div class="col-xs-1" style="text-align:center">입금 전 취소</div>
					<div class="col-xs-1" style="text-align:center">입금 후 취소</div>
					<div class="col-xs-1" style="text-align:center">교환</div>
					<div class="col-xs-1" style="text-align:center">반품</div>
				</div>
				<div class="col-xs-11" style="float:left; padding: 8px;">
					<div class="col-xs-1" style="text-align:center"><a href="/creditList.do" style="color:black">3</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="/prodctReadyList.do" style="color:black">4</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="/shippingReady.do" style="color:black">5</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="/shippingList.do" style="color:black">3</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="/shippingFinish.do" style="color:black">8</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="" style="color:black">0</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="" style="color:black">0</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="" style="color:black">2</a></div>
					<div class="col-xs-1" style="text-align:center"><a href="" style="color:black">1</a></div>
				</div>
			</div>
		</div>
		<div class="col-xs-6">
			<legend>코디요청 현황
				<a href="/adminCodiReqst.do" class="list-group-item" style="float:right; padding-top:0px; padding-bottom:0px; padding-left:15px; padding-right:15px;">+</a>
			</legend>
			<table class="table table-hover">
				<thead>
					<tr class="active">
						<th class="text-center">요청<br>번호</th>
						<th class="text-center">요청<br>이미지</th>
						<th class="text-center">답변<br>이미지</th>
						<th class="text-center">회원 ID</th>
						<th class="text-center" style="vertical-align: middle;">회원이름</th>
						<th class="text-center" style="vertical-align: middle;">닉네임</th>
						<th class="text-center" style="vertical-align: middle;">요청날짜</th>
						<th class="text-center" style="vertical-align: middle;">요청상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reqstList" items="${reqstList}" varStatus="status">
						<tr>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${reqstList.codi_reqst_seq}</td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:5%; cursor:pointer"><img src="${reqstList.reqst_codi_img_route}" class="thumbnail"></td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:5%; cursor:pointer"><img src="${reqstList.answr_codi_img_route}" class="thumbnail"></td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${reqstList.mem_id}</td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:10%; cursor:pointer">${reqstList.mem_name}</td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:10%; cursor:pointer">${reqstList.mem_nicknme}</td>
							<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:10%; cursor:pointer">${reqstList.codi_reqst_date}</td>
							<c:if test="${reqstList.codi_reqst_state eq 'n'}">
								<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:10%; color:limegreen; cursor:pointer">요청</td>
							</c:if>
							<c:if test="${reqstList.codi_reqst_state eq 'y'}">
								<td onclick="adminCodiReqstRead(${reqstList.codi_reqst_seq})" class="text-center" style="vertical-align: middle; width:10%; color:red; cursor:pointer">완료</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-xs-6">
			<legend>코디공유 게시판
				<a href="/adminCodiShr.do" class="list-group-item" style="float:right; padding-top:0px; padding-bottom:0px; padding-left:15px; padding-right:15px;">+</a>
			</legend>
			<table class="table table-hover">
				<thead>
					<tr class="active">
						<th class="text-center" style="vertical-align: middle; width:10%">번호</th>
						<th class="text-center">코디<br>이미지</th>
						<th class="text-center" style="vertical-align: middle;">회원 ID</th>
						<th class="text-center" style="vertical-align: middle;">회원이름</th>
						<th class="text-center" style="vertical-align: middle;">닉네임</th>
						<th class="text-center" style="vertical-align: middle;">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="shrList" items="${shrList}" varStatus="status">
						<tr>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="width:3%; vertical-align: middle; cursor:pointer">${shrList.codi_shr_seq}</td>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="width:10%; vertical-align: middle; cursor:pointer"><img src="${shrList.codi_img_route}" class="thumbnail"></td>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_id}</td>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_name}</td>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_nicknme}</td>
							<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.codi_shr_regtime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-xs-12">
			<legend>1:1 문의 요청
				<a href="#" class="list-group-item" style="float:right; padding-top:0px; padding-bottom:0px; padding-left:15px; padding-right:15px;">+</a>
			</legend>
		</div>
	
	</div>
</body>
</html>