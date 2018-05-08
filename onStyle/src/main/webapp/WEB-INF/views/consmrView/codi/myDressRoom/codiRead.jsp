<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>나의코디 - 온스타일</title>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script src="/resources/consmr/codi/myDressRoom/js/codiRead.js?12"></script>   
<style>
.mem_profile{
   width: 50px; height: 50px;
   object-fit: cover;
   object-position: top;
   border-radius: 50%;
}
#wrapper {
  display: table;
}
#cell {
  display: table-cell; 
  vertical-align: middle;
}
</style>
</head>
<body>
	<div>
		<c:import url="/menu.do"/>
	</div>
	<div class="mainContainer">
		<form id="codiReadFrm">
			<input type="hidden" name="pageCode" value="${myDrsRmVO.pageCode}">
			<input type="hidden" name="sortType" value="${myDrsRmVO.sortType}">
			<input type="hidden" name="selectRecordCount" value="${myDrsRmVO.selectRecordCount}">
			<input type="hidden" name="currentPageNo" value="${myDrsRmVO.currentPageNo}">
			
			<input type="hidden" name="selectedCodiSeq" value="${codiInfo.codi_seq}">
		</form>
		<div class="contiainer" style="width:70%; height:700px; margin:0px auto;">
			<a href="#" onclick="back()" class="btn btn-info" style = "float:left">목록</a>
			<div class="btn-group" style = "float:right">
	 			<a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
					<span style="width:30px; height:30px;">▼</span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#" onclick="javascript:shareCodi(${codiInfo.codi_seq});">공유</a></li>
					<c:if test="${myDrsRmVO.pageCode==1}">
						<li><a href="#" onclick="javascript:myCodiUpdate(${codiInfo.codi_seq});">수정</a></li>
					</c:if>
					<li><a href="#" onclick="javascript:deleteCodi();">삭제</a></li>
				</ul>
				</div>
				<div class="col-xs-12"style="border:1px solid #e0e0e0; margin-top:10px; padding:0px 0px">
				<div class="col-xs-6" style ="border-right: 1px solid #e5e5e5; height:100%; padding:0px 0px">
				<div class="col-xs-12" style="position:absolute; padding-top:3%">
					<img class="mem_profile" src="${codiInfo.mem_img_route}">
					<br>
					<font size=4>${codiInfo.mem_nicknme}</font>
				</div>
				<div class="col-xs-12" style="text-align:center; margin:25% 0 25% 0">
					<img src="${codiInfo.codi_img_route}" style="max-height: 100%; max-width: 100%;">
				</div>
				<div class="col-xs-12" style="border-top:1px solid #e5e5e5; text-align:center">
					<font size=4 style="font-weight: bold;">공유되지 않은 코디입니다.</font>
				</div>
				</div>
				<div class="col-xs-6">
				<div class="col-xs-12" style ="padding: 30px 40px; font-size:17px; font-weight:bold;">
					<font size=4 style="font-weight: bold;">코디에 사용된 미스봄 상품</font>		 
				</div>
				<div class="col-xs-12" style ="height:100%; text-align:center">
					<c:import url="/codiUsedPordct.do?pageCode=1"/>
				</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>