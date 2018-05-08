<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>헹사 관리</title>

<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- JSTree 관련 파일들 -->
<script src="/resources/admin/prodct/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/admin/prodct/js/jstree/themes/proton/style.min.css">
<script src="/resources/admin/prodct/js/jstree/jstree.min.js" charset="utf-8"></script>

<!-- 달력관련 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src=/resources/admin/calendar.js></script>

<!-- Table 행 바꾸는 JS -->
<script src="/resources/admin/prodct/js/jquery-tablednd.js" type="text/javascript" charset="utf-8"></script>

<script>
$(document).ready(function(){
	event_List();
})

function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}

function getTimeStamp() {
	  var d = new Date();

	  var s =
	    leadingZeros(d.getFullYear(), 4) + '-' +
	    leadingZeros(d.getMonth() + 1, 2) + '-' +
	    leadingZeros(d.getDate(), 2) + ' '

// 	    leadingZeros(d.getHours(), 2) + ':' +
// 	    leadingZeros(d.getMinutes(), 2) + ':' +
// 	    leadingZeros(d.getSeconds(), 2);

	  return s;
}

function event_List(){
	$.ajax({
		url:"/select_event.do",
		type: "POST",
		success: function(List){
			var time_d = getTimeStamp() + "00:00:00.0";
			var status = "";
			$("#event_List tr:not(:first)").remove();
			$.each(List, function(i, vo){
				var sale_seq = vo.sale_seq;
				var sale_nme = vo.sale_nme;
				var sale_start_date=  vo.sale_start_date;
				var sale_end_date = vo.sale_end_date;
				var count_prodct = vo.count_prodct;
				if(sale_start_date <= time_d && sale_end_date >= time_d ){
					status = "진행중"
				}else if( sale_start_date > time_d ){
					status = "대기"
				}else if( sale_end_date < time_d){
					status = "종료"
				}
				
				$("#event_List").append(
					"<tr>"
						+"<td><input type='checkbox' value="+sale_seq+"></td>"
						+"<td>"+sale_seq+"</td>"
						+"<td>"+sale_nme+"</td>"
						+"<td>"+sale_start_date+"</td>"
						+"<td>"+sale_end_date+"</td>"
						+"<td>"+count_prodct+"</td>"
						+"<td>"+status+"</td>"
					+"</tr>"		
				)
			})
		},
		error:function(xhr,status,error){ 
			alert("팝업 닫을 시 오류")
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		}
	});
}

function eventInsert(){
	window.location = "/eventInsert.do"
}
</script>

</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=5"/>
	</div>
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
		
      <div class="row">
         <div class="col-md-12">
            <h4>행사 관리</h4>
            <br>         
         </div>
   
         <div class="col-md-12" style="height:153px;">
            <form name="searchDisplyProdct">
               <table class="table" id="searchTable" style="border:1px solid #e0e0e0; text-align:center; width:100%;">
                  <tr>
                     <td class="active" style="width:15%;"><h6>기간</h6></td>
                     <td align=left>
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
                     <td class="active">행사명</td>
                     <td colspan=3 align=left>
                     	<input type="text" class="form-control" style="width:70%">
                     </td>
                  </tr>
                  <tr>
                     <td class="active" style="height:100%">적용 상태</td>
                     <td align=left>
                        <input type="radio" name="search_disply_state" value="1">진행중
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_disply_state" value="Y">대기중
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_disply_state" value="N">종료
                     </td>
                  </tr>
               </table>
            </form>
         </div>
         
         <!-- 버튼들 -->
         <div class="col-md-12" style="text-align:center; padding-top:1%;">
            <input type="button" class="btn btn-info" value="검색" onclick="searchProdct()">
            <input type="button" class="btn btn-default" style="margin-left:1%;" value="초기화" onclick="resetSearch()">
         </div>
         
		<!--          표를 만들어야 해요~~~~~~ -->
        <div class="col-md-12">
         	<table id="event_List" class="table" style="margin-top:3%;text-align:center;">
         		<tr>
         			<td class="active"> <input type="checkbox"> </td>
         			<td class="active"> 행사번호 </td>
         			<td class="active"> 행사명 </td>
         			<td class="active"> 시작 기간 </td>
         			<td class="active"> 종료 기간 </td>
         			<td class="active"> 상품 수 </td>
         			<td class="active"> 적용상태 </td>
         		</tr>
         		
         	</table>
         </div>
         
         <!-- 버튼들 -->
         <div class="col-md-12">
            <div style="float:right;">
               <input type="button" class="btn btn-default" id="orderConfirm" onclick="eventInsert()" value="행사 등록">
               <input type="button" class="btn btn-default" id="deleteProdct" onclick="deleteDisplyProdct()" value="행사 삭제">
               <input type="button" class="btn btn-default" id="updateProdct" onclick="javascript:categoryUpdatePopUp()" value="분류수정">
            </div>
         </div>
                  
      </div>
	</div>
</body>
</html>