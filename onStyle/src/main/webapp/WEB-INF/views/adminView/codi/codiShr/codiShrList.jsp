<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
</script>
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
</head>
<body>
	<table class="table table-hover" style="margin-top:3%">
		<thead>
			<tr class="active">
				<th class="text-center" style="padding-bottom: 13px;"><input type="checkbox" id="chk_all" name="chk_all"></th>
				<th class="text-center">번호</th>
				<th class="text-center">코디 이미지</th>
				<th class="text-center">회원 ID</th>
				<th class="text-center">회원이름</th>
				<th class="text-center">닉네임</th>
				<th class="text-center">좋아요</th>
				<th class="text-center">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="shrList" items="${shrList}" varStatus="status">
				<tr>
					<td class="text-center" style="width:5%; vertical-align: middle;"><input type="checkbox" id="chk[${status.index}]" name="chk" value="${shrList.codi_shr_seq}"></td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="width:3%; vertical-align: middle; cursor:pointer">${shrList.codi_shr_seq}</td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="width:10%; vertical-align: middle; cursor:pointer"><img src="${shrList.codi_img_route}" class="thumbnail"></td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_id}</td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_name}</td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.mem_nicknme}</td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="width:4%; vertical-align: middle; cursor:pointer">${shrList.likeCount}</td>
					<td onclick="javascript:codiShrRead(${shrList.codi_shr_seq})" class="text-center" style="vertical-align: middle; cursor:pointer">${shrList.codi_shr_regtime}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="col-lg-12">
		<button type="button" class="btn btn-danger" onclick="checkedDelete()" style="float:right">삭제</button>
	</div>
	
	<div class="col-lg-12">
		<!-- 페이징 -->
		<div class="pagination_wrapper">
			<div class="bs-component" style="text-align: center;">
				<ul class="pagination">
				
					<!-- 무조건 1페이지로 << 버튼 -->
					<c:if test = "${pageSearchInfo.currentPageNo>10}">
						<li><a href="javascript:searchPaging(1)">«</a></li>
					</c:if>
					<c:if test = "${pageSearchInfo.currentPageNo<=10}">
						<li class="disabled"><a href="#">«</a></li>
					</c:if>
					
					<!-- 한 단위 앞으로 < 버튼 -->
		            <c:if test = "${pageSearchInfo.currentPageNo>5}">
						<li><a href="javascript:searchPaging(1)">‹</a></li>
					</c:if>
					<c:if test = "${pageSearchInfo.currentPageNo<=5}">
						<li class="disabled"><a href="#">‹</a></li>
					</c:if>
					
					<!-- 페이지 리스트 -->
					<c:forEach varStatus="status" begin="${pageSearchInfo.firstPageNoOnPageList}" end="${pageSearchInfo.lastPageNoOnPageList}">
						<li ${pageSearchInfo.currentPageNo==status.current ? "class='active'" : ""} >
							<a href="javascript:searchPaging(${status.current})">${status.current}</a>
						</li>
					</c:forEach>
					
					<!-- 한 단위 뒤로 > 버튼 -->
					<c:if test = "${pageSearchInfo.firstPageNoOnPageList + 5 < pageSearchInfo.totalPageCount}">
						<li><a href="#">&rsaquo;</a></li>
					</c:if>	
					<c:if test = "${pageSearchInfo.firstPageNoOnPageList + 5 > pageSearchInfo.totalPageCount}">
						<li class="disabled"><a href="#">&rsaquo;</a></li>
					</c:if>	
					
		            <!-- 무조건 마지막페이지로 >> 버튼 -->
		            <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 < pageSearchInfo.totalPageCount}">
						<li><a href="javascript:searchPaging(${pageSearchInfo.totalPageCount})">»</a></li>
					</c:if>
					<c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 > pageSearchInfo.totalPageCount}">
						<li class="disabled"><a href="#">»</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div> 
</body>
</html>