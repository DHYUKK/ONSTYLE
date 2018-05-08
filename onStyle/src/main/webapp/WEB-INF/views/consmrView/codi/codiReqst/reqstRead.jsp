<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %> 
<title>코디요청 상세조회 - 온스타일</title>
<script>
//선택한 상품 조회
function prodct_read(prodct_seq){
    window.location.href = "/prodctFrameSelect.do?prodct_seq="+prodct_seq;
}

function reqstSave(answr_seq, reqst_seq){
    window.location.href = "/answrSave.do?codi_answr_seq="+answr_seq+"&codi_reqst_seq="+reqst_seq;
    alert("저장이 완료되었습니다! [나의 옷장 > 답변받은 코디]에서 확인하세요.")
}

function reqstUpdate(){
	$("#reqstReadFrm").attr({action:'/myCodiUpdate.do', method:'post'}).submit();
	
}

function back(){
	$("#pageSearchFrm").attr({action:'/reqstbreakdwn.do', method:'post'}).submit();
}
</script>
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
		<form id="reqstReadFrm">
			<input type="hidden" name="codi_seq" value="${reqstVO.reqstCodi_seq}">
			<input type="hidden" name="readPageNme" value="reqst">
			<input type="hidden" name="codi_reqst_seq" value="${reqstVO.codi_reqst_seq}">
		</form>
		<form id="pageSearchFrm">
			<input type="hidden" name="currentPageNo" value="${pageSearchInfo.currentPageNo}">
			<input type="hidden" name="radioValue" value="${pageSearchInfo.radioValue}">
			<input type="hidden" name="oneDatepicker" value="${pageSearchInfo.oneDatepicker}">
			<input type="hidden" name="twoDatepicker" value="${pageSearchInfo.twoDatepicker}">
			<input type="hidden" name="codi_reqst_contnt" value="${pageSearchInfo.codi_reqst_contnt}">
		</form>
		<div class="contiainer" style="width:70%; margin:0px auto;">
				<a href="javascript:back()" class="btn btn-info" style = "float:left">목록</a> 
				<div class="btn-group" style = "float:right">
		 			<a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span style="width:30px; height:30px;">▼</span>
					</a>
					<ul class="dropdown-menu">
					<c:if test="${reqstVO.codi_reqst_state eq 'y'}">
						<li><a href="javascript:reqstSave(${reqstVO.codi_answr_seq}, ${reqstVO.codi_reqst_seq})">답변 저장</a></li>
					</c:if>
					<c:if test="${reqstVO.codi_reqst_state eq 'n'}">
						<li><a href="javascript:reqstUpdate()">수정</a></li>
					</c:if>
						<li><a href="/reqstDelete.do?reqstCheckGroup=${reqstVO.codi_reqst_seq}&location=1">삭제</a></li>
					</ul>
				</div>
				<div class="col-xs-12"style="border:1px solid #e0e0e0; margin-top:10px; padding:0px 0px">
					<div class="col-xs-6" style ="border-right: 1px solid #e5e5e5; height:100%; padding:0px 0px">
						<div class="col-xs-2" style="float:left; padding-top:3%">
							<img class="mem_profile" src="${reqstVO.mem_img_route}">
							<br>
							<font size=4>${reqstVO.mem_nicknme}</font>
						</div>
						<div class="col-xs-10" style="float:left; padding-top:3%"><font size=4>${reqstVO.codi_reqst_contnt}</font></div>
						
						<div class="col-xs-12" style="text-align:center; margin:25% 0 25% 0">
							<img src="${reqstVO.reqst_codi_img_route}" style="max-height: 100%; max-width: 100%;">
						</div>
					</div>
					<div class="col-xs-6" style ="border-left: 1px solid #e5e5e5;">
						<c:if test="${reqstVO.codi_reqst_state eq 'n'}">
							<div class="col-xs-12 text-center" style ="padding: 30px 40px; font-size:17px; font-weight:bold;">
								<font size=4 style="font-weight: bold;">답변을 기다려 주세요^^</font>		 
							</div>
						</c:if>
						<c:if test="${reqstVO.codi_reqst_state eq 'y'}">
							<div class="col-xs-2" style="float:left; padding:15px 0px">
								<img style="max-width:100%"src="/resources/consmr/main/img/missbom.png">
							</div>
							<div class="col-xs-10" style="float:left; padding-top:3%"><font size=4>${reqstVO.answr_contnt}</font></div>
							
							<div class="col-xs-12" style="text-align:center; margin:25% 0 25% 0">
								<img src="${reqstVO.answr_codi_img_route}" style="max-height: 100%; max-width: 100%;">
							</div>
						</c:if>
					</div>
				</div>
				<div class="col-xs-12"style="border:1px solid #e0e0e0; padding:7px 0px; text-align:center;">
					<font size=4 style="font-weight: bold;">코디에 사용된 미스봄 상품</font>
				</div>
				<div class="col-xs-12"style="border:1px solid #e0e0e0; padding:7px 0px; text-align:center;">
					<c:import url="/codiUsedPordct.do?codi_seq=${reqstVO.answrCodi_seq}&pageCode=2"/>
				</div>
		</div>
	</div>
</body>
</html>