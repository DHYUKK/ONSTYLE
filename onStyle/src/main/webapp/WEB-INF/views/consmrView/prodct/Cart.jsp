<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- 내가 만든 다양한 꾸밈요소들 불러오기 ㅇㅅㅇ -->
<link rel="stylesheet" href="/resources/consmr/mem/css/OrderList.css">
<link rel="stylesheet" href="/resources/consmr/mem/css/selectView.css">
<title>CART 화면</title>
<style type="text/css">
.btnmini {
  color: #000000;
  background-color: #ffffff;
}
</style>
<script type="text/javascript">
var crtList = new Array();
var sum = 0;

$(document).ready(function(){
	bigSum(); //상품구매금액 + 배송비 = 합계
	
	var aa = $("input[name=checkRow]").length; //배송상품 갯수 구하기
	$(".caunts").html(aa); //배송상품갯수 회면에 나타내기
	
// 	<c:forEach items="${crtList}" var="shpbagVo">
// 		var json = new Object();
// 		json.prodct_price = "${shpbagVo.prodct_price}";
// 		json.shpbag_quanty = "${shpbagVo.shpbag_quanty}";
// 		crtList.push(json);
// 	</c:forEach>
	
// 	$.each(crtList, function(i, shpbagVo){
// 		sum += Number(shpbagVo.prodct_price)*Number(shpbagVo.shpbag_quanty);
// 	})
// 	$(".middleSum").html(sum);
	
})

$(function(){
//	수량올리기
	$('.increaseQuantity').click(function(){ //수량올림 버튼을 눌렀을때
		var parent = $(this).parents('td');//클릭한 속성의 상위 요소중 td 요소 선택
		var frend = parent.prev();//선택된 td요소의 이전 동료(td)선택
		var children = frend.children(':first');//td의 자식중 첫번째 요소 선택
		var amount = children.html();//td의 첫번째 요소의 html 가지고옴
		
		if(amount >= 10)
		   alert("더이상 늘릴수 없습니다.");
		else {
			amount++;
			children.html(amount);
			
			var table = $(this).parents('table');//클릭한 속성의 상위 요소중 table 요소 선택
			smallSum(table, amount);
		}
	});
//	수량내리기
	$(".decreaseQuantity").click(function(){ //수량내림 버튼을 눌렀을때
		var parent = $(this).parents('table');//클릭한 속성의 상위 요소중 테이블인 요소 선택
		var children1 = parent.children('tbody');//테이블의 자식요소중 tbody선택
		var children2 = children1.children('tr:eq(0)');//tbody의 자식요소 중 첫번째 tr 선택
		var children3 = children2.children('td:eq(0)');//tr의 td 선택
		var children4 = children3.children(':first');//td의 자식요소 중 첫번째 요소
		var amount = children4.html();//td의 첫번째 요소의 html 가지고옴
		if(amount <= 1)
		   alert("최소 수량입니다.");
		else {
			amount--;
			children4.html(amount);
			
			var table = $(this).parents('table');//클릭한 속성의 상위 요소중 table 요소 선택
			smallSum(table, amount);
		}
	});
});

//체그박스 체크
function check(){
		var middleSum = 0;
		$("input[name=checkRow]:checked").each(function() {
			middleSum += Number($(this).next().val());
		});
		if(middleSum >= 50000){
			$(".car").html(0);
			$(".middleSum").html(middleSum);
			$(".bigSum").html(middleSum + Number($(".car").html()));
		}
		else if(middleSum == 0)
			bigSum();
		else{
			$(".car").html(2500);
			$(".middleSum").html(middleSum);
			$(".bigSum").html(middleSum + Number($(".car").html()));
		}
	}

//수량X가격 = 합계
function smallSum(table, amount){
	var td = table.parents('td');//클릭한 속성의 상위 요소중 table 요소 선택
	var prev = td.prev();//td의 이전요소
	var html = prev.html();//td의 html -> 가격을 가지고옴
	var sum = Number(html)*amount;//수량과 과격을 곱해줌
	var next = td.nextAll().eq(2);// 합계 td를 찾음
	var val = next.html(sum);//함계  td에 수량과 가격을 곱한 값을 넣어줌
	//체크박스에 값(수량과 가격을 곱한 값) 주기
	var tr = td.parents("tr");//tr찾기
	var child = tr.children().eq(0);// tr의 1번째 자식요소 찾기 -> 첫번째 td
	var checkBox = child.children().eq(1);// 즉, 첫번째 td안의 2번째 요소 찾기 -> input type="hidden"
	checkBox.val(sum);//체크박스의 value에 수량과 가격을 곱한 값을 넣어줌
	
	var length = $("input[name=checkRow]:checked").length;
	if(length > 0)
		check();
	else
		bigSum();
}

// 상품구매금액 + 배송비 = 합계
function bigSum(){
	var middleSum = 0;
	for(i=0; i<$(".sum").size(); i++){
		middleSum += Number($(".sum").eq(i).html());
	}
	
	if(middleSum >= 50000){
		$(".car").html(0);
	}
	else
		$(".car").html(2500);
	
	$(".middleSum").html(middleSum);
	$(".bigSum").html(middleSum + Number($(".car").html()));
}

//체크박스 선택하기 
function checkAll(){
	if( $("#th_checkAll").is(':checked') ){
	  $("input[name=checkRow]").prop("checked", true);
	}else{
	  $("input[name=checkRow]").prop("checked", false);
	}
	check();
}
//삭제 버튼
// $(".DEL").CLICK(FUNCTION(){
// 	ALERT("인냥ㄴ");
// 	//체크된 행이 없을 경우.
// 	if($("input[name=checkRow]:checked").length == 0){
// 	      alert("삭제할 행을 선택하여 주십시오.");
// 	}
// 	else {
// 	      $('input[type=checkbox]:checked').each(function(index){     
// 	          if($('table input:checkbox').length == 1){  
// 	             alert("모든 행을 삭제할 수 없습니다.");  
// 	          }
// 	          else {        
// 	             //체크박스를 포함하고 있는 행 제거 
// 	             var clickedRow = $(this).parent().parent();   
// 	             var clickedRowNext = clickedRow.next("tr");                     
// 	             clickedRow.remove();
// 	             clickedRowNext.remove();                        
// 	          }
// 	      }
// 	}
// });

//콤마 찍는거 
function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//주문하러가기 (전체버튼)
function orders(){
	var middleSum = $("#middleSum").html();
   window.location.href = "/orderStart.do?order_price="+middleSum+"&shpbag_color="+$("#shpbag_color").val()+"&prodct_seq="+$("#prodct_seq").val()+"&shpbag_size="+$("#shpbag_size").val();
//    document.ord.submit();
}

//선택 삭제하기
function checkDel(){
	var formData = '';
	$("input[name=checkRow]:checked").each(function() {
		formData += "shpbag_seq_s="+$(this).val()+"&";
	});
	var length = formData.length;
	formData = formData.substr(0, length-1);
	$.ajax({//현재가 가지고 오기
        url: "/deletes.do",
        data: formData,
        type: "POST",
        success:function(){
           alert("삭제가 완료되었습니다.");
           window.location.href="/cart.do";
        },
        error:function(xhr,status,error){ //ajax 오류인경우  
//            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
        }
     });
}
//개별 삭제
function del(seq){
// 	alert(seq);
}

  
</script>
</head>
<body>
	<div>
	   <c:import url="/menu.do"/>
	</div>
	<div class="mainContainer">
		<div style="width:1150px; height:50px; text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
			<font style="font-weight:bold; font-size:x-large; "> CART </font>
		</div>
		<div style="width:1150px; height:20px;" class="center-block"><!-- 빈얖 --></div>
		<div style="border:1px solid #CBCACA; width:10%; height:46px; padding-top:10px; float:left; font-weight:bold; text-align:center;">혜택 정보</div>
		<div style="border:1px solid #CBCACA; width:90%; height:23px; float:left;">
			<c:forEach var ="shpbagVo" items="${crtList}" begin="1" end="1">
				<font style="font-weight:bold;">&nbsp;&nbsp;[ ${shpbagVo.mem_name} ]<!-- 로그인한 사람의 이름 표시해야됨 --> </font>
				<font style="">님은, [미스봄,missbom]회원이십니다. </font>
			</c:forEach>
		</div>
		<div style="border:1px solid #CBCACA; width:90%; height:23px; float:left;">
			<font style="">&nbsp;&nbsp;가용적립금 : &nbsp;</font>
			<font style="font-weight:bold;">원 <!-- 로그인한 사람의 이름 표시해야됨 --> </font>
		</div>
		<div style="height:60px;"><!-- 빈얖 --></div>
		<div style="border:1px solid #CBCACA; height:50px; padding-top:13.5px;">
			<font style="font-weight:bold; ">&nbsp;&nbsp; 
				<b>배송상품</b>
				<b>(</b>&nbsp;
				<b class ="caunts"></b>&nbsp;
				<b>)</b>
			</font>
		</div><br>
		<div class="board view view_v2">
		<table class="basicT" id="store" summary="배송상품">
			<thead></thead>
			<tr>
				<th style="width:10%;"> <input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();"/></th>
				<th style="background:#F6F6F6; width:20%; text-align:center;">이미지</th>
				<th style="background:#F6F6F6; width:20%; text-align:center;">상품정보</th>
				<th style="background:#F6F6F6; width:20%; text-align:center;">size</th>
				<th style="background:#F6F6F6; width:10%; text-align:center;">판매가</th>
				<th style="background:#F6F6F6; width:10%; text-align:center;">수량</th>
				<th style="background:#F6F6F6; width:10%; text-align:center;">적립금</th>
				<th style="background:#F6F6F6; width:10%; text-align:center;">배송비</th>
				<th style="background:#F6F6F6; width:10%; text-align:center;">합계</th>
<!-- 				<th style="background:#F6F6F6; width:10%; text-align:center;">선택</th> -->
			</tr>
			<tbody>
			<c:forEach var="shpbagVo" items="${crtList}" varStatus="status">
			<tr>
				<td>
					<input type="checkbox" name="checkRow" onclick="check()" value="${shpbagVo.shpbag_seq}"/>
					<input type="hidden" value="${shpbagVo.prodct_price * shpbagVo.shpbag_quanty}"/>
					<input type="hidden" id="prodct_seq" value="${shpbagVo.prodct_seq}">
					<input type="hidden" id="shpbag_color" value="${shpbagVo.shpbag_color}">
					<input type="hidden" id="shpbag_size" value="${shpbagVo.shpbag_size}">
				</td>
				<td> <img src="${shpbagVo.prodct_img_route1}" style="width:70px; height:90px;"></td>
				<td style="text-align:center;">${shpbagVo.prodct_nme} </td>
				<td style="text-align:center;">${shpbagVo.shpbag_size} </td>
				<td style="text-align:center;" class="price">${shpbagVo.prodct_price}</td>
				<td style="text-align:center;">
					<div>
						<table style="border: 1px solid #CACACA; width:35px;" id="hi" class="center-block">
							<tr>
							   	<td rowspan="2"><span class="quanty">${shpbagVo.shpbag_quanty}</span></td>	<!-- id="numberUpDown" -->
								<td class="center-block"><img class="increaseQuantity" style="cursor:pointer" src="/resources/consmr/mem/img/up.PNG"></td>
							</tr>
							<tr>
							   <td><img class="decreaseQuantity" style="cursor:pointer" src="/resources/consmr/mem/img/down.PNG"></td>
							</tr>
						</table>
					<div style="width:35px; height:5px;"class="center-block"><!-- 빈얖 --></div>
					   <button class="btn btnmini btn-xs"> 변경</button>
					</div>
				</td>
				<td style="text-align:center;">-</td>
				<td style="text-align:center;"></td>
				<td style="text-align:center;" class="sum">${shpbagVo.prodct_price * shpbagVo.shpbag_quanty}</td>
				
<!-- 				<td style="text-align:center;"> -->
<!-- 				   <button class="btn btn-info">주문하기<span class="glyphicon glyphicon-menu-right"></span></button> -->
<%-- 				   <button class="btn btn-default" onclick="del(${shpbagVo.shpbag_seq})">삭제하기 </button> --%>
<!-- 				</td> -->
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div> <br>
		<div>
			<table class="basicT" summary="합계나타나기" >
			<thead></thead>
				<tr>
					<td style="width:30%; text-align: rigth;"></td>
					<td style="width:10%; text-align: rigth;">
						<font size="xx-large">상품구매금액:&nbsp;
							<b class = "middleSum">0</b>&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;배송비:&nbsp; <b class="car">2500</b> &nbsp; = &nbsp; 합계: &nbsp; 
							<b class = "bigSum">0</b>
						</font>
						<font size="small">
							<b>원</b>
						</font>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div style="float:left;">
			<span class="glyphicon glyphicon-ok"></span><font><b>선택한 상품을</b></font>
			<button class="btn btn-default" onclick="checkDel()"> 삭제하기 </button>
		</div>
		<div style="float:right;">
			<button class="btn btn-default"> 장바구니비우기</button>
		</div>
		<br><br>
		<div style="height:10px;"></div>
		<div class="board view view_v2">
			<table class="basicT" summary="결제정보">
			<thead></thead>
				<tr>
					<th style="width:30%;"><b>총 상품금액</b></th>
					<th style="background:#F6F6F6; width:30%; text-align:center;"><b>총 배송비</b></th>
					<th style="background:#F6F6F6; width:30%; text-align:center;"><b>결제예정금액</b></th>
				</tr>
				<tr>
					<td style="text-align:center; height:100px; ">
						<font>
							<b class = "middleSum" id="middleSum">0</b>
							<font color="green">원</font>
						</font>
					</td>
					<td style="text-align:center;">+ <b class="car">2500</b></td>
					<td style="text-align:center;">
						<font>
							= <b class = "bigSum">0</b>
							<font color="green">원</font>
						</font>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div style="width:40%; float:left; ">&nbsp;<!-- 빈얖 --></div>
		<div style="float:left;">
<!-- 			<a href="#" class="btn btn-info">전체상품주문 </a> -->
			<button class="btn btn-info" onclick="orders()">상품주문하기 > </button>
<!-- 			<a href="#" class="btn btn-default">선택상품주문 </a> -->
		</div>
		<div style="float:right;">
			<a href="/" class="btn btn-default">쇼핑계속하기 </a>
		</div>
		<br><br><br><br><br><br><br>
		<div class="board view view_v2">
		<table class="basicT" summary="결제정보">
			<thead></thead>
			<tr>
				<th style="width:30%; text-align:left;"><b>총 상품금액</b></th>
			</tr>
			<tr>
				<td style="text-align:left;">
					<font><b>&nbsp;장바구니 이용안내</b></font>
					<br><br>
					<font>
						<span class="label label-default">1</span>&nbsp;선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경]버튼을 누르시면 됩니다. <br>
						<span class="label label-default">2</span>&nbsp;[쇼핑계속하기]버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.<br><br>
					</font>
				</td>
			</tr>
			<tr>
				<td style="text-align:left;">
					<font><b>&nbsp;무이자 할부 이용안내</b></font>
					<br><br>
					<font>
						<span class="label label-default">1</span>&nbsp;상품별 무이자할부 혜택을 받으시려면ㄴ 무이자할부 상품만 선택하여 [주문하기]버튼을 눌러 주문/결제 하시면 됩니다. <br>
						<span class="label label-default">2</span>&nbsp;[전체 상품 주문]버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.<br>
						<span class="label label-default">3</span>&nbsp;단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.
						<br><br>
					</font>
				</td>
			</tr>
		</table>
		</div><br>
	</div><!-- 없어지면안됨 -->
</body>
</html>