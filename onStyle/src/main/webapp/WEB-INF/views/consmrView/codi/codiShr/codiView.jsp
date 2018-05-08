<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디 상세보기</title>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf"%>
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

<script>
//공유 취소
function cancelShr(){
	window.location.href="/cancelShr.do?selectedCodiSeq=${codiView.codi_seq}"
}

//게시글 삭제
function deleteCodi(){
	var codiViewForm = $("#codiViewForm").serialize();
	window.location.href="/cancelShr.do?"+codiViewForm+"&codi_seq=${codiView.codi_seq}&location=2"
}

//댓글 등록
function replyInsert(){
	var codiViewForm = $("#codiViewForm").serialize();
	document.replyWrite.action = "/insertReply.do?"+codiViewForm+"&codi_shr_seq=${codiView.codi_shr_seq}";
	document.replyWrite.method = "post"
	document.replyWrite.submit();
}

//댓글 삭제
function replyDelete(a){
	window.location.href="/deleteReply.do?codi_shr_seq=${codiView.codi_shr_seq}&&codi_reply_seq="+a;
}

//다른 코디 조회
function viewOther(o){
	var codiViewForm = $("#codiViewForm").serialize();
	window.location.href="/codiView.do?"+codiViewForm+"&codi_shr_seq="+o;
}

//선택한 상품 조회
function prodct_read(prodct_seq){
	 window.location.href = "/prodctFrameSelect.do?prodct_seq="+prodct_seq;
}

function back(){
	if("${pageInfo.pageCode}"==4){
		window.location.href="/codiShr.do";
	} else {
		var codiViewForm = $("#codiViewForm").serialize();
		window.location.href="/codiSet.do?"+codiViewForm;
	}
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

//댓글 더보기
function moreReply(login){
	
	$("#replyView").val(Number($("#replyView").val())+5);
	formData = "reply_view="+$("#replyView").val()+"&codi_shr_seq=${codiView.codi_shr_seq}";
	
	$.ajax({
		type : "GET",
		url : "/selectReply.do",
		data : formData,
		success : function(data){
			$.each(data, function(i, vo){
				var output = '';
				output += '<tr>'; 
				output += '<td style="padding:5px 5px; width: 10%;"><img class="mem_profile" src="'+vo.mem_img_route+'" data-toggle="tooltip" data-placement="bottom" title="'+vo.mem_nicknme+'" style="width: 50px; height: 50px;"></td>';
			output += '<td style="vertical-align: middle; text-align: left; font-size:17px; width: 85%;">'+ vo.codi_reply_contnt+'</td>';
				if(login == vo.mem_seq){
					output +='<td style="vertical-align: middle; width: 5%">';
					output +='<input type="hidden" value="'+vo.mem_seq+'" id="memSeq">';
				  	output +='<button class="btn btn-default" onclick="replyDelete('+vo.codi_reply_seq+')">삭제</button></td>';
				}
				output += '</tr>';
				
				$("#replyList").append(output);
				$(function () {
					$('[data-toggle="tooltip"]').tooltip()
			})
			})
		},
		error:function(xhr,status,error)
			 { //ajax 오류인경우  
// 				alert("error");
// 				alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);		 
			}
	});
}

//좋아요 버튼 색 변경 및 갯수
$(document).ready(function(){
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	
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
})
</script>
</head>

<body>
	<div>	
		<c:import url="/menu.do" />
	</div>

	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer" style="height:100%;">
		<div class="container" style="height:75%; width:70%;">
		<form id="codiViewForm">
			<input type="hidden" name="pageCode" value="${pageInfo.pageCode}">
			<input type="hidden" name="sortType" value="${pageInfo.sortType}">
			<input type="hidden" name="currentPageNo" value="${pageInfo.currentPageNo}">
			<input type="hidden" name="selectRecordCount" value="${pageInfo.selectRecordCount}">
		</form>
		<a href="javascript:back()" class="btn btn-info" style = "float:left">목록</a>
			<div style="height:50px; text-align:right;">
				<c:if test="${codiView.mem_seq == mem_seq}">
						<a href="#" class="btn btn-danger" onclick="deleteCodi()">게시글 삭제</a>
				</c:if>
			</div>
			
		
			<div class="codi_view_wrapper"">
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
										<input type="hidden" value="${codiView.codi_shr_seq}">
										<div id="like">
											<c:if test="${codiView.likeState==0}">
												<img class="like" src="resources/consmr/codi/codiShr/img/like/liking.png" style="cursor:pointer;">
											</c:if> 
											<c:if test="${codiView.likeState==1}">
												<img class="like" src="resources/consmr/codi/codiShr/img/like/liked.png" style="cursor:pointer;">
											</c:if>
										</div>
									</td>
									<td>
										<h6><span id="countLike" style="padding-left:7px; font-weight:bold;">${codiView.liked}</span></h6>
									</td>
									<td style="width: 300px;"><h6>명이 좋아합니다.</h6></td>
									<td><h6>댓글</h6></td>
									<td style="padding-left:7px; width: 100px;">
										<h6><b>${codiView.reply}</b>개</h6>
									</td>
									<c:if test="${codiView.scrapState==0 and codiView.mem_seq!=mem_seq}">
										<td style="font-weight:bold; font-size: 14px;">스크랩</td>
										<td id="scrap" style="text-align: center;" onclick="javascript:scrap(${codiView.codi_shr_seq})">
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
				  			<c:import url="/codiUsedPordct.do?codi_seq=${codiView.codi_seq}&pageCode=2"/>
						</div>
					</div>
					
					<div class="reply_wrapper" style="border: 1px solid #e5e5e5;">
						<form name="replyWrite">
							<c:if test="${mem_seq!=null}">
								<table style="text-align: center; width: 100%;">
									<tr>
										<td style="padding:5px 5px; width: 10%;"><img class="mem_profile" src="${userInfo.mem_img_route}" 
										data-toggle="tooltip" data-placement="bottom" title="${userInfo.mem_nicknme}" style="width: 50px; height: 50px;"></td>
										<td style="width: 85%;"><input type="text" name="codi_reply_contnt" class="form-control"
											placeholder="코디에 대한 댓글을 달아주세요!" style="text-align: center;"></td>
										<td style="width: 5%;">
											<button class="btn btn-info" type="submit"
												onclick="javascript:replyInsert()">등록</button>
										</td>
									</tr>
								</table>
							</c:if>
						</form>
						
						<div>
							<table id="replyList" class="table table-condensed" style="margin-bottom:0px; width: 100%; text-align: center;">
								<c:forEach var="replyList" items="${replyList}" varStatus="status">
									<c:set var="memSeq" value="${replyList.mem_seq}"/>
									<tr>
										<td style="padding:5px 5px; width: 10%;"><img class="mem_profile" src="${replyList.mem_img_route}"
								data-toggle="tooltip" data-placement="bottom" title="${replyList.mem_nicknme}" style="width: 50px; height: 50px;"></td>
										<td style="vertical-align: middle; text-align: left; font-size:17px; width: 85%;">${replyList.codi_reply_contnt}</td>
										<c:if test="${replyList.mem_seq==mem_seq}">
											<td style="vertical-align: middle; width: 5%">
												<input type="hidden" value="${replyList.mem_seq}" id="memSeq">
												<button class="btn btn-default" onclick="replyDelete(${replyList.codi_reply_seq})">삭제</button>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
							
							<table class="table table-condensed" style="width: 100%; text-align: center;">
								<tr>
									<td><input type="hidden" value="0" id="replyView"></td> 
									<td onclick="moreReply(${mem_seq})">
										<center>
											<h6><b style="cursor:pointer;">댓글 더보기</b></h6> 
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
	</div>
</body>
</html>