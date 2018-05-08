<%@ page language="java" contentType="text/html; charset=UTF-8"
	 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:set var="myCloth" value="myCloth"/>
<c:set var="prodct" value="prodct"/>	
		<c:if test="${bigGroup==myCloth}">
			<c:forEach var="cloth" items="${clothSelect}" varStatus="status">
				 <div class="item published" style="cursor:pointer;">
					<div class="thumb ui-draggable">
						<img	onclick="javascript:create_id_code('${cloth.myCloth_img_route}','${cloth.myCloth_seq}')"
								src="${cloth.myCloth_img_route}"
								data-origin="${cloth.myCloth_img_route}"
								class="data"
								style="position: relative;"
						>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${bigGroup==prodct}">
			<c:forEach var="cloth" items="${clothSelect}" varStatus="status">
				<div class="item published" style="cursor:pointer;">
					<div class="thumb ui-draggable">
						<img	onclick="javascript:create_id_code('${cloth.transparent_img_route}','${cloth.prodct_seq}')"
								src="${cloth.transparent_img_route}"
								data-origin="${cloth.transparent_img_route}"
								data-title="${cloth.prodct_nme}"
								class="data"
								style=" position: relative;"
						>
					</div>
					<div class="price">${cloth.prodct_price}</div>
				</div>
			</c:forEach>
		</c:if>
	
	<!-- 페이징 -->
	<div class="pagination_wrapper">
		<div class="bs-component" style="text-align: center;">
			<ul class="pagination" style="margin:0px 0px">
			
				<!-- 무조건 1페이지로 << 버튼 -->
				<c:if test = "${pageSearchInfo.currentPageNo>10}">
					<li><a href="javascript:paging(1)">«</a></li>
				</c:if>
				<c:if test = "${pageSearchInfo.currentPageNo<=10}">
					<li class="disabled"><a href="#">«</a></li>
				</c:if>
				
				<!-- 한 단위 앞으로 < 버튼 -->
	            <c:if test = "${pageSearchInfo.currentPageNo>5}">
					<li><a href="javascript:paging(1)">‹</a></li>
				</c:if>
				<c:if test = "${pageSearchInfo.currentPageNo<=5}">
					<li class="disabled"><a href="#">‹</a></li>
				</c:if>
				
				<!-- 페이지 리스트 -->
				<c:forEach varStatus="status" begin="${pageSearchInfo.firstPageNoOnPageList}" end="${pageSearchInfo.lastPageNoOnPageList}">
					<li ${pageSearchInfo.currentPageNo==status.current ? "class='active'" : ""} >
						<a href="javascript:paging(${status.current})">${status.current}</a>
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
					<li><a href="javascript:paging(${pageSearchInfo.totalPageCount})">»</a></li>
				</c:if>
				<c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 > pageSearchInfo.totalPageCount}">
					<li class="disabled"><a href="#">»</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</html>