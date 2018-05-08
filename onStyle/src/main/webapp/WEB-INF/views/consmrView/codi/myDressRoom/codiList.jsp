<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<form id="codiListForm">
		<input type="hidden" name="pageCode" value="${pageInfo.pageCode}">
		<input type="hidden" name="sortType" value="${pageInfo.sortType}">
		<input type="hidden" name="currentPageNo" value="${pageInfo.currentPageNo}">
		<input type="hidden" name="totalPageCount" value="${pageInfo.totalPageCount}">
		<input type="hidden" name="selectRecordCount" value="${pageInfo.selectRecordCount}">
		<input type="hidden" name="totalRecordCount" value="${pageInfo.totalRecordCount}">
	</form>
	
	<c:forEach var="codiList" items="${codiList}" varStatus="status">
		<div class="col-xs-3 outer" id="codiFrame${codiList.codi_seq}" style="height:410px; border:1px solid #e0e0e0; padding:0px 0px; margin:50px 60px">
			<div class="set codi" style="width:100%; position: absolute;">
				<div class="thumb_wrapper">
					<img class="codi" 
							id="codi_img${codiList.codi_seq}"
					 <c:if test="${empty codiList.codi_shr_seq}">
							onclick="codi_click(${codiList.codi_seq}, ${codiList.codi_seq}, 'n')" 
					 </c:if>
					 <c:if test="${!empty codiList.codi_shr_seq}">
							onclick="codi_click(${codiList.codi_shr_seq}, ${codiList.codi_seq}, 'y')" 
					 </c:if>
							src="${codiList.codi_img_route}" 
							style="cursor:pointer; margin-top:20px; max-width:50%; max-height:50%;"
						>
				</div>
				<div class="profile_wrapper" style="margin:0px 15px">
				<table style="width:100%">
					<tr>
						<td>
							<img class="mem_profile" src="${codiList.mem_img_route}">
							<br>
							<font size=4>${codiList.mem_nicknme}</font>
						</td>
						<!-- 공유되지 않은 코디 -->
						<c:if test="${empty codiList.codi_shr_seq}">
							<td>
								<span style="font-weight:bold; font-size:15px">공유되지 않은 코디 입니다.</span>
							</td>
						</c:if>
						
						<!-- 공유된 코디 -->
						<c:if test="${!empty codiList.codi_shr_seq}">
							<td id="like">
						<input type="hidden" value = "" id="like_seq">
						  	받은 좋아요 &nbsp;
							 <span id="countLike${codiList.codi_shr_seq}" style="font-weight:bold;">${codiList.liked}</span>
							</td>
							<td>
							 	댓글 수 &nbsp;
							 	<span style="font-weight:bold;">${codiList.reply}개</span>
							</td>
							<td class="likeButton">
								<input type="hidden" value="${codiList.codi_shr_seq}">
								<div id="like${codiList.codi_shr_seq}">
									<c:if test="${codiList.likeState==0}">
										<img onclick="like_click(${codiList.codi_shr_seq})" class="like" src="/resources/consmr/codi/codiShr/img/like/liking.png" style="cursor:pointer">
									</c:if>
									<c:if test="${codiList.likeState==1}">
										<img onclick="like_click(${codiList.codi_shr_seq})" class="like" src="resources/consmr/codi/codiShr/img/like/liked.png" style="cursor:pointer">
									</c:if>
								</div>
							</td>
						</c:if>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<div class="col-lg-12" style="border-top:1px solid #e5e5e5; border-bottom:1px solid #e5e5e5; text-align:center; padding:0px 0px;">
		<a href="javascript:addCodiList()" class="list-group-item">
			<h5 id="page" class="list-group-item-heading" style="margin-bottom: 0px;">+ 더 보기(${pageInfo.currentPageNo-1}/${pageInfo.totalPageCount-1})</h5>
		</a>
	</div> 