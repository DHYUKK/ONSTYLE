<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객관리</title>
<script type="text/javascript" src="/resources/admin/mem/js/adminMem.js"></script>
</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=6"/>
	</div>
	<div class="mainContainer">
		<div class="col-md-12">
		<h4>고객 전체 조회</h4>
		<hr>
	</div>
		<form name="reqstFrm" id="reqstFrm">
<%-- 			<input type="hidden" id="currentPageNo" name="currentPageNo"value="${pageSearchInfo.currentPageNo}"> --%>
<%-- 			<input type="hidden" id="searchCondition1" name="searchCondition1" value="${pageSearchInfo.searchCondition1}"> --%>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="active">
								<h6 class="text-center">검색조건</h6>
							</th>
						<td>
						<div class="btn-group">
							<select id="searchCondition1" name="searchCondition1" class="form-control" style="float:left;border: 1px solid #BDBDBD;">
								<option value="mem_id" ${pageSearchInfo.searchCondition1 eq "mem_id" ? "selected" : ""}>회원 ID</option>
								<option value="mem_name" ${pageSearchInfo.searchCondition1 eq "mem_name" ? "selected" : ""}>회원이름</option>
								<option value="mem_nicknme" ${pageSearchInfo.searchCondition1 eq "mem_nicknme" ? "selected" : ""}>닉네임</option>
								<option value="mem_ph" ${pageSearchInfo.searchCondition1 eq "mem_ph" ? "selected" : ""}>휴대폰</option>
								<option value="mem_email" ${pageSearchInfo.searchCondition1 eq "mem_email" ? "selected" : ""}>이메일</option>
							</select>
						</div>
							<input type="text" id="searchContent" name="searchContent" value="${pageSearchInfo.searchContent}"class="form-control" style="width:30%">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div class="col-lg-12" style="text-align:center;">
			<button type="button" onclick="searchPaging(1)" class="btn btn-info">검색</button>
			<button type="button" onclick="reset()" class="btn btn-default">초기화</button>	
		</div>
		<div id="memtList" class="col-lg-12">
			<c:import url="/adminMemList.do"/>
		</div>
	</div>

</body>
</html>