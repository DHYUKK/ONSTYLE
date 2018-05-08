<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>	
<title>코디공유게시판 관리  - 온스타일</title>

<!-- 달력관련 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src=/resources/admin/calendar.js></script>

<script src=/resources/admin/codi/codiShr/js/codiShr.js?11></script>
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
	<div class="mainContainer">
		<div class="col-md-12">
			<h4>코디 공유 게시판 관리</h4>
			<hr>
		</div>
		<form name="shrFrm" id="shrFrm">
			<input type="hidden" id="currentPageNo" name="currentPageNo"value="${pageSearchInfo.currentPageNo}">
			<input type="hidden" id="searchCondition1" name="searchCondition1" value="${pageSearchInfo.searchCondition1}">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="active">
							<h6 class="text-center">등록일</h6>
						</th>
						<td>
							<input class="btn btn-default" type="button" value="오늘" id="today"> &nbsp;
							<input class="btn btn-default" type="button" value="1주일" id="oneweek">&nbsp;
							<input class="btn btn-default" type="button" value="1개월" id="month">&nbsp;
							<input class="btn btn-default" type="button" value="3개월" id="trimester">&nbsp;
							<input class="btn btn-default" type="button" value="6개월" id="halfyear">&nbsp;&nbsp;
							<input type="text" id="oneDatepicker" name="oneDatepicker" value="${pageSearchInfo.oneDatepicker}"> &nbsp;&nbsp; ~ &nbsp;&nbsp;
							<input type="text" id="twoDatepicker" name="twoDatepicker" value="${pageSearchInfo.twoDatepicker}">
						</td>
					</tr>
					<tr>
						<th class="active">
							<h6 class="text-center">검색어</h6>
						</th>
						<td>
						<div class="btn-group">
							<a href="#" id="search_category" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
							회원 ID 
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:selectCategory('mem_id')">회원 ID</a></li>
								<li><a href="javascript:selectCategory('mem_name')">회원이름</a></li>
								<li><a href="javascript:selectCategory('mem_nicknme')">닉네임</a></li>
								<li><a href="javascript:selectCategory('sh.codi_shr_seq')">번호</a></li>
							</ul>
						</div>
							<input type="text" id="searchContent" name="searchContent" value="${pageSearchInfo.searchContent}"class="form-control" style="width:60%">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="col-lg-12" style="text-align:center;">
			<button type="button" onclick="searchPaging(1)" class="btn btn-info">검색</button>
			<button type="button" onclick="reset()" class="btn btn-default">초기화</button>	
		</div>
		
		<!-- 코디 공유 목록 -->
		<div id="codiShrList" class="col-lg-12">
			<c:import url="/adminCodiShrList.do"/>
		</div>
	</div>
</body>
</html>