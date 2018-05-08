<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코디 조회</title>
 
<style>
.codi{
	align:center;
	height:300px;
	width:300px;
	display:block;
	margin-left:auto;
	margin-right:auto;
}

.thumb_wrapper{
	align:center;
	margin:0 auto;
	
}

.mem_profile{
	width: 50px; height: 50px;
	 object-fit: cover;
	 object-position: top;
	 border-radius: 50%;
}

.like{
	width: 20px; 
	height: 20px;
	background: url("/resources/consmr/codi/codiShr/img/profile.PNG") no-repeat; 
}

.scrap{
	width: 20px; 
	height: 20px;
}

.outer:hover{
	transform:scale(1.1);				
	-webkit-transform:scale(1.1); 
	-moz-transform:scale(1.1); 
	-o-transform:scale(1.1);
	overflow:hidden;
	transition: transform .35s;  
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}
</style>

<script>
$(document).on(function(){
	
	//좋아요 버튼 색 변경 및 갯수
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
					like.html("<img class='like' src='resources/consmr/codi/codiShr/img/like/liked.png'>");
				}
				else {
					like.html("<img class='like' src='resources/consmr/codi/codiShr/img/like/liking.png'>");
				}
				$.ajax({
					type: "POST",
					url: "/countLike.do",
					data: formData,
					success: function(data){
						$("#countLike"+data.codi_shr_seq).html(data.liked)	
					}
				})
			},
			error:function(xhr,status,error)
				 { //ajax 오류인경우  
		  	 	alert("로그인 후 이용가능합니다.");		 
				 }
		}); 
	});
	
	//스크랩
	$(".scrapButton").click(function(){
		codi_shr_seq = $(this).children().eq(0).val();
		formData = "codi_shr_seq="+codi_shr_seq;
		scrap = $(this).children().eq(1);
		$.ajax({
			type : "POST",
			url : "/scrap.do",
			data : formData,
			success : function(data){
				scrap.html("");
			},
			error:function(xhr,status,error)
				 { //ajax 오류인경우  
		  		alert("로그인 후 이용가능합니다.");  
				 }
		})
	});
})

function viewCodi(c){
	window.location.href = "/codiView.do?codi_shr_seq="+c+"&pageCode=4";
}
</script>
</head>		
<body>
	<c:forEach items="${codiShrList}" var="codiShrVo" varStatus="status">
		
		<div class="col-xs-3 outer" style="height:410px; border:1px solid #e0e0e0; padding:0px 0px; margin:50px 60px">
			<div class="set codi" style="width:100%;">
				<div class="thumb_wrapper" onclick="viewCodi(${codiShrVo.codi_shr_seq});">
					<img class="codi" src="${codiShrVo.codi_img_route}" style="cursor:pointer; margin-top:20px; max-width:50%; max-height:50%;">
				</div>
			</div>
			<div class="profile_wrapper" style="margin:0px 15px">
				<table style="width:100%">
					<tr>
						<td>
							<img class="mem_profile" src="${codiShrVo.mem_img_route}">
							<br>
							<font size=4>${codiShrVo.mem_nicknme}</font>
						</td>
						<td id="like">
							<input type="hidden" value = "${codiShrVo.like_seq}" id="like_seq">
						 		받은 좋아요 &nbsp;
							<span id="countLike${codiShrVo.codi_shr_seq}" style="font-weight:bold;">${codiShrVo.liked}</span>
						</td>
						<td>
																					댓글 수 &nbsp;
							<span style="font-weight:bold;">${codiShrVo.reply}개</span>
						</td>
						<td class="likeButton">
							<input type="hidden" value="${codiShrVo.codi_shr_seq}">
							<div id="like${codiShrVo.codi_shr_seq}">
								<c:if test="${codiShrVo.likeState==0}">
									<img class="like" src="resources/consmr/codi/codiShr/img/like/liking.png" style="cursor:pointer">
								</c:if>
								<c:if test="${codiShrVo.likeState==1}">
									<img class="like" src="resources/consmr/codi/codiShr/img/like/liked.png" style="cursor:pointer">
								</c:if>
							</div>
						</td>
						<td class="scrapButton">
							<input type="hidden" value="${codiShrVo.codi_shr_seq}">
							<div id="scrap${codiShrVo.codi_shr_seq}">
								<c:if test="${codiShrVo.scrapState==0 and codiShrVo.mem_seq!=mem_seq}">
									<img class="scrap" src="resources/consmr/codi/codiShr/img/like/scrap.png" style="cursor:pointer">
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</c:forEach>
</body>
</html>