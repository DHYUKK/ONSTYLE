<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>송장번호 추가 </title>
<!-- js쓰기  -->
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<!-- 내가 쓰는 꾸밈요소 -->
	<link rel="stylesheet" href="/resources/consmr/mem/css/selectView.css?ver=2">
	<link rel="stylesheet" href="/resources/consmr/mem/css/OrderList.css">
</head>
<script> 
function ordrInUpdete(orseq) {
	var order_dlivy_num = $("#order_dlivy_num").val();
	var shipping_date = $("#shipping_date").val();
	var formData = 'order_seq='+orseq + '&order_dlivy_num='+order_dlivy_num + '&shipping_date='+shipping_date;
	$.ajax({
		url: "/ordrInUpdete.do",
		data: formData,
		type: "post",
		success: function(){
			window.location.href="/orderInforSelect.do?order_seq=${ordrVO.order_seq}";
		},
		error:function(xhr,status,error){ //ajax 오류인경우  
// 		      alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		}
	});
}
</script>
<body>
<!-- 상단바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<div class="mainContainer">
	  <div style="width:1150px; height:50px;  text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
	     <font style="font-weight:bold; font-size:x-large; "> ORDER INFORMATION </font>
	  </div>
	  <div style="border:1px solid #BDBDBD; width:100%; height:40px; padding-top:10px; padding-left:10px;">
	  <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	     <font style="font-weight:bold;"> [ ${ordrVO.mem_name} ] <!-- 로그인한 사람의 이름 표시해야됨 --> </font>
	     <font style=""> 님 께서 ${ordrVO.order_date}에 주문하신 내역입니다. </font>
	  </c:forEach>
	  </div>
	  <div style="height:15px;"> <!-- 빈얖 --> </div>
	  <div>
	     <font style="font-weight:bold;"> 주문자 정보 </font>
	  </div>
	  <div class="board view view_v2"><!--view_v2-->
	     <table class="basicT" summary="고객 주문 주문자정보">
	        <thead></thead>
	        <tbody>
	           <tr>
	              <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	                 <th scope="row">주문번호</th>
	                 <td colspan="2" >${ordrVO.order_seq} </td>
	                 <th scope="row">주문일자</th>
	                 <td colspan="3" headers="date" style="word-break:break-all">${ordrVO.order_date} </td>
	              </c:forEach>
	           </tr>
	           <tr>
	              <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	                 <th scope="row" id="allow">주문자</th>
	                 <td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${ordrVO.mem_name}</td>
	              </c:forEach>
	           </tr>
	        </tbody>
	     </table>
	  </div>
	  <br>
	  <div>
	     <font style="font-weight:bold;"> 배송지 정보 </font>
	     <font style="float:right;">
	     	<span class="glyphicon glyphicon-ok"> </span>
	     	송장번호 입력날짜는 
	     	<b style="color:red;"> ▼ 버튼을 누르시면 달력</b> 
	     	이 나옵니다. 
	     </font>
	  </div>
	  <div class="board view view_v2"><!--view_v2-->
	     <table class="basicT" summary="고객 주문 배송지정보">
	        <thead></thead>
	        <tbody>
	           <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	              <tr>
	                 <th scope="row" >송장번호</th>
	                 <td colspan="2" headers="allow" class="copyT">
	                 	<input type="text" class="textbox" id="order_dlivy_num" name="" value= "${ordrVO.order_dlivy_num}" style="width:40%; height: 37px; padding-left:10px; margin-left:15px; float:left;"> 
	                 </td>
	                 <th scope="row">송장번호 입력날짜 </th>
	                 <td colspan="3"  style="text-align:left; padding-left:10px;">
	                 	<input type="date" class="textbox" id="shipping_date" name="" value= "${ordrVO.shipping_date}" style="width:30%; height: 37px; padding-left:10px; margin-left:15px; float:left;"> 
	                 	
	                 </td>
	              </tr>
	           </c:forEach>
	           <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	              <tr>
	                 <th scope="row">수취인</th>
	                 <td colspan="2" style="text-align:left; padding-left:10px;">${ordrVO.order_paree} </td>
	                 <th scope="row">연락처</th>
	                 <td colspan="3"  style="text-align:left; padding-left:10px;">${ordrVO.mem_ph}</td>
	              </tr>
	           </c:forEach>
	           <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	               <tr>
	                 <th scope="row" id="allow">주소</th>
	                 <td colspan="6" headers="post" class="copyT" style="text-align:left; padding-left:10px;">${ordrVO.mem_adrs} </td>
	              </tr>
	           </c:forEach>
	           <c:forEach var ="ordrVO" items="${orderInforSeList}" begin="0" end="0">
	               <tr>
	                 <th scope="row" id="allow">배송 메세지</th>
	                 <td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${ordrVO.order_msg} </td>
	              </tr>
	           </c:forEach>
	        </tbody>
	     </table>
	  </div>
	  <br>
	  <div>
	     <font style="font-weight:bold;"> 주문 상품 정보 </font>
	  </div>
	  <div class="board view view_v2">
	     <table class="basicT" summary="고객 주문 상품 정보">
	        <thead></thead>
	        <tr>
	              <th style="background:#F6F6F6; width:20%; text-align:center;">상품정보</th>
	              <th style="background:#F6F6F6; width:20%; text-align:center;">주문번호</th>
	              <th style="background:#F6F6F6; width:10%; text-align:center;">수량</th>
	              <th style="background:#F6F6F6; width:10%; text-align:center;">가격</th>
	              <th style="background:#F6F6F6; width:10%; text-align:center;">적립</th>
	              <th style="background:#F6F6F6; width:10%; text-align:center;">주문상태</th>
	        </tr>
	         <c:forEach var ="ordrVO" items="${orderInforSeList}">
	           <tr>
	              <td style="text-align:center;">${ordrVO.prodct_nme} </td>
	              <td style="text-align:center;">${ordrVO.order_seq}</td>
	              <td style="text-align:center;">${ordrVO.order_breakdwn_prodct_quanty}</td>
	              <td style="text-align:center;">${ordrVO.prodct_price} 원</td>
	              <td style="text-align:center;">-</td>
	              <td style="text-align:center;">${ordrVO.order_state}</td>
	           </tr>
	        </c:forEach>
	     </table>
	  </div>
	  <br>
	  <div style="float:right;">
	  	<a class="btn btn-default" href="javascript:ordrInUpdete(${ordrVO.order_seq})" role="button">저장</a>
	    <a class="btn btn-default" href="/shippingReady.do" role="button">배송준비중 관리 로 </a>
	  </div>
	</div> <!-- 없어지면 안됨 -->
</body>
</html>