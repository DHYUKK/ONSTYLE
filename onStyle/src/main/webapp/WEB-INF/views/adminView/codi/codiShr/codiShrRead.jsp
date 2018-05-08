<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>	
<title>코디공유게시판 관리 - 온스타일</title>

<script src=/resources/admin/codi/codiShr/js/codiShrRead.js></script>

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
</style>
</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=4"/>
	</div>
<!-- 본인 디자인은 여기 안에서 -->	
	<div class="mainContainer" style="height:100%;">
		
		<form id="shrReadFrm">
			<input type="hidden" name="shrCheckGroup" value="${codiView.codi_shr_seq}">
			<input type="hidden" name="location" value="1">
		</form>
		<form id="pageSearchFrm">
			<input type="hidden"name="searchCondition1" value="${pageSearchInfo.searchCondition1}">
			<input type="hidden" name="currentPageNo" value="${pageSearchInfo.currentPageNo}">
			<input type="hidden" name="oneDatepicker" value="${pageSearchInfo.oneDatepicker}">
			<input type="hidden" name="twoDatepicker" value="${pageSearchInfo.twoDatepicker}">
			<input type="hidden" name="searchContent" value="${pageSearchInfo.searchContent}">
		</form>
		<div class="container" style="height:75%; width:70%;">
			<div style="height:50px;">
						<a href="javascript:back()" class="btn btn-info" style="float:left;">목록</a>
						<a href="javascript:shrDelete(${codiView.codi_shr_seq})" class="btn btn-danger" style="float:right;">삭제</a>
			</div>	
			<div class="codi_view_wrapper">
				<div class="codi_image_wrapper document_content_wrapper">		
					<div class="profile_image" style="border:1px solid #e5e5e5; z-index:1; text-align:center; width:40%; float:right; height:100%;">
						<img style="margin-top:5px;" class="mem_profile" src="${codiView.mem_img_route}"> <br>
						<font size=4 style="font-weight:bold;">${codiView.mem_nicknme}</font>
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
					 	src="${codiView.codi_img_route}">
					</div>
					<div class="line"></div>
					<div class="bottom_wrapper" style="bottom: 0px; border: 1px solid #e5e5e5; width: 60%">
						<div style="margin-left: 20px;">
							<table>
								<tr> 
									<td class="likeButton" style="text-align: center;">
										<img class="like" src="resources/consmr/codi/codiShr/img/like/liking.png">
									</td>
									<td>
										<h6><span id="countLike" style="padding-left:7px; font-weight:bold;">${codiView.liked}</span></h6>
									</td>
									<td style="width: 300px;"><h6>명이 좋아합니다.</h6></td>
									<td><h6>댓글</h6></td>
									<td style="padding-left:7px; width: 100px;">
										<h6><b>${codiView.reply}</b>개</h6>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="prodct_wrapper">
						<div style="margin: 0 auto; border: 1px solid #e5e5e5;">
							 <h5><center><b>코디에 사용된 미스봄 상품</b></center></h5>
						</div>
						<div class="row" style="border: 1px solid #e5e5e5; width: 100%; height: 270px; margin: 0 auto;">
							<c:import url="/codiUsedPordct.do?codi_seq=${codiView.codi_seq}&pageCode=2"/>
						</div>
					</div>
					
					<div class="reply_wrapper" style="border: 1px solid #e5e5e5;">
					 <table id="replyList" class="table table-condensed" style="margin-bottom:0px; width: 100%; text-align: center;">
							<c:forEach var="replyList" items="${replyList}" varStatus="status">
								<tr>
							<td style="padding:5px 5px; width: 10%;"><img class="mem_profile" src="${replyList.mem_img_route}"
								data-toggle="tooltip" data-placement="bottom" title="${replyList.mem_nicknme}" style="width: 50px; height: 50px;"></td>
							<td style="vertical-align: middle; text-align: left; font-size:17px; width: 85%;">${replyList.codi_reply_contnt}</td>
								<td style="vertical-align: middle; width: 5%">
										<input type="hidden" value="${replyList.mem_seq}" id="mem_seq">
										<button class="btn btn-default" onclick="adminDeleteReply(${replyList.codi_reply_seq})">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</table>
						<form id="replyFrm">
							<input type="hidden" value="0" name="firstRecordIndex" id="firstRecordIndex">
							<input type="hidden" value="${pageInfo.currentPageNo}" name="currentPageNo" id="currentPageNo">
						</form>
						<input type="hidden" value="${pageInfo.totalRecordCount}" name="totalRecordCount" id="totalRecordCount">
						<input type="hidden" value="${pageInfo.totalPageCount}" name="totalPageCount" id="totalPageCount">
						
						<table class="table table-condensed" style="width: 100%; text-align: center;">
							<tr>
								<td onclick="moreReply()" style="cursor:pointer">
									<center>
										<h6 id="replyInfo"><b>댓글 더보기(${pageInfo.currentPageNo-1}/${pageInfo.totalPageCount-1})</b></h6> 
									</center>
								</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>