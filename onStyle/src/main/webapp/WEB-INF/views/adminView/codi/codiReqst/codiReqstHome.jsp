<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>	
<title>코디요청관리 - 온스타일</title>

<!-- 달력관련 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src=/resources/admin/calendar.js></script>

<script src=/resources/admin/codi/codiReqst/js/codiReqst.js></script>

</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=3"/>
	</div>
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
	<div class="col-md-12">
		<h4>코디 요청 관리</h4>
		<hr>
	</div>
		<form name="reqstFrm" id="reqstFrm">
			<input type="hidden" id="currentPageNo" name="currentPageNo"value="${pageSearchInfo.currentPageNo}">
			<input type="hidden" id="searchCondition1" name="searchCondition1" value="${pageSearchInfo.searchCondition1}">
			<input type="hidden" id="checkedRadioValue" value="${pageSearchInfo.radioValue}">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="active">
								<h6 class="text-center">요청상태</h6>
							</th>
						<td>
							<div class="col-lg-10">
								<div class="radio" style="float:left">
									<label> <input type="radio" name="radioValue" id="radioValue1" value="1" checked="checked">
										전체
									</label>
								</div>
								<div class="radio" style="float:left; margin-top: 10px; margin-left: 10px;">
									<label> <input type="radio" name="radioValue" id="radioValue2" value="2"> 
										요청
									</label>
								</div>
								<div class="radio" style="float:left; margin-top: 10px; margin-left: 10px;">
									<label> 
										<input type="radio" name="radioValue" id="radioValue3" value="3"> 
										완료
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="active">
								<h6 class="text-center">코디 요청 날짜</h6>
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
								<h6 class="text-center">요청사항</h6>
							</th>
						<td>
						<div class="btn-group">
							<a href="#" id="search_category" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> 
							회원 ID 
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="javascript:selectCategory('mem_id')" id="1">회원 ID</a></li>
								<li><a href="javascript:selectCategory('mem_name')" id="2">회원이름</a></li>
								<li><a href="javascript:selectCategory('mem_nicknme')" id="3">닉네임</a></li>
								<li><a href="javascript:selectCategory('rq.codi_reqst_seq')" id="4">요청번호</a></li>
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
		
		<div id="adminReqstList" class="col-lg-12">
			<c:import url="/adminCodiReqstList.do"/>
		</div>
	</div>
</body>
</html>