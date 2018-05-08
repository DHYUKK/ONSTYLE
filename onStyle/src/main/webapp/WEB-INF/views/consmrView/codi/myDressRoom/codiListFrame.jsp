<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>나의 코디 - 온스타일</title>
<%@ include file="/WEB-INF/include/include-header.jspf" %>   

<script src="/resources/consmr/codi/myDressRoom/js/codiListFrame.js"></script> 
<style>
.codi{
	align:center;
	height:300px;
/* 	width:300px; */
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
	background-size: 22px
}

.scrap{
	width: 20px; 
	height: 20px;
}
.selected{
	width:100%; 
	height:100%; 
	position: absolute; 
	background-color: black; 
	opacity: 0.5;
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
  
</head>
<body>
	<div>
		<c:import url="/menu.do"/>
	</div>
	
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer" style="margin: 6% 12% 0% 12%;">
		<div class="container" style="width:100%;">
			<h4 id="title" style = "font-size:30px; font-weight:bold; color:#4e4e4e;">
				<c:if test="${myDrsRmVO.pageCode eq 1}">나의 코디</c:if>
				<c:if test="${myDrsRmVO.pageCode eq 2}">답변받은 코디</c:if>
				<c:if test="${myDrsRmVO.pageCode eq 3}">스크랩 코디</c:if>
			</h4>
			<hr style = "border : 1px solid #e0e0e0; margin-top:0px; margin-bottom:0px"></hr>
			<div class="col-lg-12" style="float:right; padding:0px 0px">
				<c:if test="${myDrsRmVO.pageCode ne 3}">
				<div class="bs-component" style="float:right;">
					<ul class="nav nav-tabs">
						<li onclick="sort(0)"><a href="" data-toggle="tab">전체</a></li>
						<li onclick="sort(1)"><a href="" data-toggle="tab">공유 코디</a></li>
						<li onclick="sort(2)"><a href="" data-toggle="tab">미공유 코디</a></li>
					</ul>
				</div>
				</c:if>
			</div>
			            
			<div id="codiList" class="row" style="padding-top:5%">
				<c:import url="/codiList.do?pageCode=${myDrsRmVO.pageCode}"/>
			</div>
			<div class="col-lg-12">
				<c:if test="${myDrsRmVO.pageCode ne 3}">
					<a href="#" id="delete" class="btn btn-danger" style="font-size: 16px; float:right; margin:30px 10px">삭제</a>
					<a href="#" id="share" class="btn btn-default" style="font-size: 16px; float:right; margin:30px 10px">공유</a>
				</c:if>	
				<c:if test="${myDrsRmVO.pageCode eq 3}">
					<a href="#" id="scrapCancel" class="btn btn-danger" style="font-size: 16px; float:right; margin:30px 10px">스크랩 취소</a>
				</c:if>
				<a href="#" id="cancel" class="btn btn-default" style="display:none; font-size: 16px; float:right; margin:30px 10px">취소</a>
				<a href="#" id="ClearScrapCancel" class="btn btn-danger" style="display:none; font-size: 16px; float:right; margin:30px 10px">취소완료</a>
				<a href="#" id="insertShare" class="btn btn-info" style="display:none; font-size: 16px; float:right; margin:30px 10px">공유완료</a>
				<a href="#" id="deleteCodi" class="btn btn-danger" style="display:none; font-size: 16px; float:right; margin:30px 10px">삭제완료</a>
			</div>
		</div>
	</div>
</body>
</html>