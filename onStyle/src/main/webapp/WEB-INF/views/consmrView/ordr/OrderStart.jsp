<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html><!-- 바꾸지마용 -->
<html>
<head>
	<!-- consmrMenu css, js 링크 모아 놓은곳 -->
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!-- 필수 -->
	<script language="javascript" type="text/javascript" src="https://stgstdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script><!-- 필수 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- 필수 -->
   <!-- 내가 만든 다양한 꾸밈요소들 불러오기 ㅇㅅㅇ -->
	<link rel="stylesheet" href="/resources/consmr/mem/css/OrderList.css">
	<link rel="stylesheet" href="/resources/consmr/mem/css/selectView.css">
	<link rel="stylesheet" href="/resources/consmr/mem/css/PasswordJoin.css">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/consmr/login/js/memlogin.js"></script>
	<script type="text/javascript">
	var point;
	var total; // 상품 총 금액
	var totalWon; //총 결제 금액
	var mem_seq;//로그인한 회원 seq
	var userInfo; //회원 VO정보
	var chk_info; //수령자 본인 or 다른 사람
	var order_methd;//결제 수단
	//적립금
	$(document).ready(function(){
		point = $("#mem_ecash").val();
		
	    mem_seq = $("#mem_seq").val();
	    $.ajax({//주문자 정보 가지고오기
	    	url: "/orderMemInfo.do",
	    	data: {"mem_seq" : mem_seq},
	    	type: "post",
	    	success: function(vo){
// 	    		var userInfo = vo;
	    	},
	        error:function(xhr,status,error){ //ajax 오류인경우  
// 	           alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
	        }
	    });
	    
	    
	    total = $("#prodct_total_price").val();//계산된 총 결제 금액을    prodct_total_price이란 id를 가진요소에서 가지고옴
	    $("#total").html(numberWithCommas(total));//총 상품 금액 표시
		$("#point").html(numberWithCommas(point));//포인트 표시
	// 	totalWon = Number(total) - Number(point);//총 결제 금액 계산
		$(".totalWon").html(numberWithCommas(total));//결제 금액 표시
		
	    $("#mile").keyup(function(){
	       //결제예정금액
	       var mile = $(this).val();
	       mile = mile.replace(/[^0-9]/g,'');//문자중 숫자만 남기고 모두 제거
	       $(this).val(mile);
	       
	       if(mile > point){
	    	   $(this).val(point);
	    	   mile = $(this).val();
	    	   alert(numberWithCommas(point)+" 원을 넘길 수 없습니다.");
	       }
	       
	       
	       totalWon = Number(total) - Number(mile);
	       
    	   $(".totalWon").html(numberWithCommas(totalWon));
	       $("#price").val(totalWon);
	       
	       //총 할인금액
	       $(".sale").html(numberWithCommas(mile));
	       
	       //사용한 포인트
	       var pointValue = Number(point) - Number(mile);
	       $("#point").html(numberWithCommas(pointValue));
	       
	       $.ajax({
	    	   url:"/orderSetSignature.do",
	    	   data:{"order_price": totalWon},
	    	   type:"post",
	    	   success:function(vo){
	    		   $("#signature").val(vo.signature);
	    		   $("#oid").val(vo.oid);
	    		   $("#timestamp").val(vo.timestamp);
	    	   },
		       error:function(xhr,status,error){ //ajax 오류인경우  
// 		          alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		       }
	       });
	    });
		
	    $("input[name=chk_info]").click(function(){//배송지 선택
	    	chk_info = $(this).val();
			if($(this).val() == 'equer'){//주문자와 같을 때
				$("#order_paree").val($("#my_name").html());
				$("#mem_postcd").val($("#my_postcd").val());
				$("#mem_adrs").val($("#my_adrs").val());
				$("#mem_detail_adrs").val($("#my_detail_adrs").val());
				
				var my_ph = $("#my_ph").html();
				
				my_ph = my_ph.split("-");
				$("#order_paree_ph").val(my_ph[0]);
				$("#mem_ph2").val(my_ph[1]);
				$("#mem_ph3").val(my_ph[2]);
				
				var my_email = $("#my_email").html();
				my_email = my_email.split("@");
				$("#mem_email").val(my_email[0]);
				$("#mem_email2").val(my_email[1]);
			}else{//새로운 배송지
				$("#order_paree").val('');
				$("#mem_postcd").val('');
				$("#mem_adrs").val('');
				$("#mem_detail_adrs").val('');
				$("#order_paree_ph").val('');
				$("#mem_ph2").val('');
				$("#mem_ph3").val('');
				$("#mem_email").val('');
				$("#mem_email2").val('');
			}
		});
	    
	    $("input[name=order_methd]").click(function(){//결제수단 선택
	    	order_methd = $(this).val();
	    	if(order_methd == '카드결제'){
	    		$("#gopaymethod").val("Card");
	    	}else if(order_methd == '계좌이체'){
	    		$("#gopaymethod").val("DirectBank");
	    	}else if(order_methd == '무통장'){
	    		$("#gopaymethod").val("Vbank");
	    	}else if(order_methd == '폰결제'){
	    		$("#gopaymethod").val("HPP");
	    	}
	    })
	})
	
	//이메일 선택
	function insertEmail(url){
		$("#mem_email2").val(url);
	}
	
	//콤마 찍는거 
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//주문하기
	function payment(form_id){
		var order_paree = "";
		var mem_postcd = "";
		var mem_adrs = "";
		var mem_detail_adrs = "";
		var order_paree_ph = "";
		var order_paree_email = "";
		
		if($("#order_paree").val() == ''){
			$("#order_paree").focus();
			return;
		}else{
			order_paree = $("#order_paree").val();
		}
		if($("#mem_postcd").val() == ''){
			$("#mem_postcd").focus();
			return;
		}else{
			mem_postcd = $("#mem_postcd").val();
		}
		if($("#mem_adrs").val() == ''){
			$("#mem_adrs").focus();
			return;
		}else{
			mem_adrs = $("#mem_adrs").val();
		}
		if($("#mem_detail_adrs").val() == ''){
			$("#mem_detail_adrs").focus();
			return;
		}else{
			mem_detail_adrs = $("#mem_detail_adrs").val();
		}
		if($("#order_paree_ph").val() == ''){
			$("#order_paree_ph").focus();
			return;
		}
		if($("#mem_ph2").val() == ''){
			$("#mem_ph2").focus();
			return;
		}
		if($("#mem_ph3").val() == ''){
			$("#mem_ph3").focus();
			return;
		}else{
			order_paree_ph = $("#order_paree_ph").val()+"-"+$("#mem_ph2").val()+"-"+$("#mem_ph3").val();
		}
		if($("#mem_email").val() == ''){
			$("#mem_email").focus();
			return;
		}
		if($("#mem_email2").val() == ''){
			$("#mem_email2").focus();
			return;
		}else{
			order_paree_email = $("#mem_email").val()+"@"+$("#mem_email2").val();
		}
		var order_flag = $("#order_flag").val();
		
		var formData = "order_paree="+order_paree+"&mem_postcd="+mem_postcd+"&mem_adrs="+mem_adrs+"&mem_detail_adrs="+mem_detail_adrs+"&order_paree_ph="+order_paree_ph+"&order_paree_email="+order_paree_email+"&mem_seq="+mem_seq+"&order_flag="+order_flag;
		if(order_flag == 'one'){
			formData += "&order_breakdwn_prodct_quanty="+$("#order_breakdwn_prodct_quanty").val()+"&order_breakdwn_prodct_size="+$("#order_breakdwn_prodct_size").val()+"&prodct_color_nme="+$("#prodct_color_nme").val()+"&prodct_seq="+$("#prodct_seq").val()+"&prodct_price="+$("#prodct_price").val();
		}
		$.ajax({//결제 정보 저장
			url:"/orderInfo.do",
			data:formData,
			type:"post",
			success:function(){
				INIStdPay.pay(form_id);//결제 시작
			},
			error:function(xhr,status,error){ //ajax 오류인경우  
// 		          alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		    }
		});
		
// 		INIStdPay.pay(form_id);
	}
	</script>
	<title> ORDER 화면</title>

</head>
<body>
   <input type="hidden" id="mem_seq" value="${userInfo.mem_seq}">
   <input type="hidden" id="mem_ecash" value="${userInfo.mem_ecash}">
   <input type="hidden" id="siteDomain" value="${payInfo.siteDomain}"><!-- 사이트 주소 -->
   <input type="hidden" id="order_flag" value="${payInfo.order_flag}"><!-- 개별 결제인지 전체 결제인지 -->
   
   <div>
      <c:import url="/menu.do"/>
   </div>
   
   <div class="mainContainer">
   <form id="orderInfo" method="POST" >
		<!-- ***** 1. 필 수 ***** -->
		<input type="hidden"  	name="version" 				value="1.0" >									<!-- 버전 1.0 고정 -->
		<input type="hidden"  	name="mid" 					value="${payInfo.mid}" >					<!-- 가맹점 ID -->
		<input type="hidden"  	name="goodname" 			value="${payInfo.order_title}" >								<!-- 주문 상품 이름  -->
		<input type="hidden"  	name="oid" 	id="oid"				value="${payInfo.oid}" >					<!-- 가맹점 주문번호 -->
		<input type="hidden"  	name="price" id="price"		value="${payInfo.order_price}" >			<!-- 주문(결제) 가격 -->
		<input type="hidden"  	name="currency" 			value="WON" >								<!-- 거래(돈) 단위 -->
		<input type="hidden"  	name="buyername" 			value="${userInfo.mem_name}" >				<!-- 결제자 이름 -->
		<input type="hidden"  	name="buyertel" 			value="${userInfo.mem_ph}" >			<!-- 결제자 전화 번호 -->
		<input type="hidden"  	name="buyeremail" 			value="${userInfo.mem_email}" >			   <!-- 결제자 E-mail --> 
		<input type="hidden"  	name="timestamp" id="timestamp"			value="${payInfo.timestamp}" >			<!-- 결제 시간  -->
		<input type="hidden"  	name="signature" id="signature"			value="${payInfo.signature}" >			<!-- ???? 뭔진 모르지만 필수 아마 결제시 암호화 관련  -->
		<input type="hidden"  	name="mKey" 					value="${payInfo.mKey}" >				<!-- 가맹점 key  -->
		<input type="hidden"  	name="returnUrl" 	id="returnUrl"		value="${payInfo.siteDomain}/OrderReturn.do" ><!-- 결제 후 결제 성공 or 실패 여부를 리턴해주는 주소  -->
		
		<!-- ***** 2. 기본 옵션 ***** -->
		<input type="hidden"  	name="gopaymethod"	id="gopaymethod"	value="Card" >				<!-- 결제 수단 선택 --><!-- Card - 신용카드, DirectBank - 계좌이체, HPP - 휴대폰 결제, Vbank - 무통장입금   (4가지만)  --> <!-- Card, DirectBank, HPP, Vbank, kpay, Swallet, Paypin, EasyPay, PhoneBill, GiftCard, EWallet, onlypoint, onlyocb, onyocbplus, onlygspt, onlygsptplus, onlyupnt, onlyupntplus -->
		<input type="hidden"  	name="offerPeriod" 			value="20171001-20171231" >			<!-- 제공기간 -->
		<input type="hidden"  	name="acceptmethod"		value="CARDPOINT:HPP(1):no_receipt:va_receipt:vbanknoreg(0):below1000" ><!-- acceptmethod -->
		
		<!-- ***** 3. 표시 옵션 ***** -->
		<input type="hidden"  	name="languageView" 		value="" >										<!-- [ko|en] (default:ko) 초기 표시 언어 -->
		<input type="hidden"  	name="charset" 				value="" >										<!-- [UTF-8|EUC-KR] (default:UTF-8) 리턴 인코딩 -->
		<input type="hidden"  	name="payViewType" 		value="" >										<!-- [overlay] (default:overlay) 결제창 표시방법 -->
		<input type="hidden"  	name="closeUrl" 				value="${payInfo.siteDomain}/OrderClose.do" ><!-- payViewType='overlay','popup'시 취소버튼 클릭시 창닥기 처리 URL(가맹점에 맞게 설정),  close.jsp 샘플사용(생략가능, 미설정시 사용자에 의해 취소 버튼 클릭시 인증결과 페이지로 취소 결과를 보냅니다.) -->
		<input type="hidden"  	name="popupUrl" 				value="${payInfo.siteDomain}/OrderPopup.do" ><!-- payViewType='popup'시 팝업을 띄울수 있도록 처리해주는 URL(가맹점에 맞게 설정), popup.jsp 샘플사용(생략가능,payViewType='popup'으로 사용시에는 반드시 설정) -->
	
		<!-- ***** 4. 결제 수단별 옵션 ***** -->
			<!-- -- 카드(간편결제도 사용) -- -->
		<input type="hidden"   	name="quotabase" 			value="${payInfo.cardQuotaBase}" >	<!-- 할부 개월 설정 ex) 2:3:4 -->
		<input type="hidden"  	name="ini_onlycardcode" 	value="" >										<!-- 중복 카드 코드 ex) 01:03:04:11 -->
		<input type="hidden"   	name="ini_cardcode" 		value="" >										<!-- 카드 코드 ex) 2:3:4 -->
		<input type="hidden"   	name="ansim_quota" 		value="" >										<!-- 할부 선택 ex) 2:3:4 -->
			<!-- -- 가상계좌 -- -->
		<input type="hidden"   	name="vbankRegNo" 		value="" >										<!-- 주민번호 설정 기능 -> 13자리(주민번호),10자리(사업자번호),미입력시(화면에서입력가능) -->
		
		<!-- ***** 5. 추가 옵션 ***** -->
		<input type="hidden"  	name="merchantData"		value="" >										<!-- 가맹점 관리데이터(2000byte) : 인증결과 리턴시 함께 전달됨 -->		
	</form>
      <div style="width:1150px; height:50px; text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
         <font style="font-weight:bold; font-size:x-large; "> ORDER </font>
      </div>
      <div style="width:1150px; height:20px;" class="center-block"><!-- 빈얖 --></div>
      <div style="border:1px solid #CBCACA; width:10%; height:46px; padding-top:10px; float:left; font-weight:bold; text-align:center;">혜택 정보</div>
      <div style="border:1px solid #CBCACA; width:90%; height:23px; float:left;">
      <c:forEach var ="shpbagVo" items="${shpbagList}" begin="1" end="1">
         <font style="font-weight:bold;">&nbsp;&nbsp;[${shpbagVo.mem_name} ]<!-- 로그인한 사람의 이름 표시해야됨 --> </font>
         <font style="">님은, [미스봄,missbom]회원이십니다. </font>
      </c:forEach>
      </div>
      <div style="border:1px solid #CBCACA; width:90%; height:23px; float:left;">
         <font style="">&nbsp;&nbsp;가용적립금 : &nbsp;</font>
         <font style="font-weight:bold;">원 <!-- 로그인한 사람의 이름 표시해야됨 --> </font>
      </div>
      <div style="height:60px;"><!-- 빈얖 --></div>
      <div style="width:1150px; height:50px; padding-top:20px;">
         <font style="font-weight:bold;"> 배송 상품 주문 내역</font>
      </div>
      <div class="board view view_v2">
         <table class="table">
            <tr>
               <td style="text-align: center;">이미지</td>
               <td style="text-align: center;">상품정보</td>
               <td style="text-align: center;">판매가</td>
               <td style="text-align: center;">수량</td>
               <td style="text-align: center;">적립금</td>
               <td style="text-align: center;">합계</td>
            </tr>
            <c:forEach var="shpbagVo" items="${shpbagList}" varStatus="status">
            <tr>
               <td style="text-align: center; padding-top:25px;"><img src="${shpbagVo.prodct_img_route1}" style="width:70px; height:90px;"></td>
               <td style="text-align: center; padding-top:25px; font-size:inherit;">${shpbagVo.prodct_nme}</td>
               <td style="text-align: center; padding-top:25px; font-size:inherit;">${shpbagVo.prodct_price} 원</td>
               <td style="text-align: center; padding-top:25px; font-size:inherit;">${shpbagVo.shpbag_quanty} 개</td>
               <td style="text-align: center; padding-top:25px;">-
	               <!-- 개별일 때만 사용 -->
				   <input type="hidden" id="order_breakdwn_prodct_quanty" value="${shpbagVo.shpbag_quanty}"><!-- 상품 수량 -->
				   <input type="hidden" id="order_breakdwn_prodct_size" value="${shpbagVo.shpbag_size}"><!-- 상품 크기 -->
				   <input type="hidden" id="prodct_color_nme" value="${shpbagVo.shpbag_color}"><!-- 상품 색상 -->
				   <input type="hidden" id="prodct_seq" value="${shpbagVo.prodct_seq}"><!-- 상품 seq -->
				   <input type="hidden" id="prodct_price" value="${shpbagVo.prodct_price}"><!-- 상품 가격 -->
               </td>
               <td style="text-align: center; padding-top:25px;">${shpbagVo.prodct_price*shpbagVo.shpbag_quanty} 원</td>
               
            </tr>
            <c:set var="prodct_quanty_price" value="${shpbagVo.prodct_price*shpbagVo.shpbag_quanty}"/><!-- 수량X가격 (c:forEach문장안에 있어야함)-->
            <c:set var="prodct_total_price" value="${prodct_total_price+prodct_quanty_price}"/><!-- 모든 상품 가격 더함 (c:forEach문장안에 있어야함)-->
            </c:forEach>
         </table>
      </div>
      <br>
      <div class="board view view_v2">
         <table class="basicT" summary="합계나타나기" >
         <thead></thead>
            <tr>
               <td style="width:30%; text-align: rigth;"></td>
               <td style="width:10%; text-align: rigth;">
                  <font size="xx-large"> 상품구매금액:&nbsp;
                     <b><c:out value="${prodct_total_price}"/></b>&nbsp;&nbsp;+&nbsp;&nbsp;&nbsp;배송비:&nbsp;
                     	<c:if test="${prodct_total_price < 50000}">2500</c:if><!-- 50000원 보다 작을 때 -->
                     	<c:if test="${prodct_total_price >= 50000}">0</c:if><!-- 50000원 보다 클때 때 -->
                     	 &nbsp; = &nbsp; 합계: &nbsp; 
                     <b>
                     	<c:if test="${prodct_total_price < 50000}">
                     		<c:set var="prodct_total_price" value="${prodct_total_price+2500}"/><!-- 모든 상품 가격 더함 (c:forEach문장안에 있어야함)-->
                     		<c:out value="${prodct_total_price+2500}"/>
                     		<input type="hidden" id="prodct_total_price" value="${prodct_total_price}">
                     	</c:if><!-- 50000원 보다 작을 때 -->
                     	<c:if test="${prodct_total_price >= 50000}">
                     		<c:out value="${prodct_total_price}"/>
                     		<input type="hidden" id="prodct_total_price" value="${prodct_total_price}">
                     	</c:if><!-- 50000원 보다 클때 때 -->
                     </b>
                  </font>
                  <font size="small">
                     <b>원</b>
                  </font>
               </td>
            </tr>
         </table>
      </div>
      <div style="width:100%; height:50px; padding-top:20px;">
         <font style="font-weight:bold;"> 주문자 정보</font>
         <font style="font-size:small; float:right;">필수입력사항 </font>
         <font style="font-size:small; float:right; color:red;">*</font>
      </div>
      <div class="board view view_v2"><!--view_v2-->
		<input type="hidden" name="mem_seq" value="">
		<table class="basicT" summary="회원정보">
			<thead></thead>
			<tbody>
			<tr>
				<th scope="row" id="allow">
					주문하시는분
<!-- 					<font style="font-size:small;color:red;">*</font> -->
				</th>
				<td colspan="6" id="my_name" style="text-align:left; padding: 0 0 0 20px">${userInfo.mem_name}</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					주소
<!-- 					<font style="font-size:small;color:red;">*</font> -->
				</th>
				<td colspan="6" headers="allow" class="copyT" id="my_address" style="text-align:left; padding: 0 0 0 20px">
					(우편주소 : ${userInfo.mem_postcd}) ${userInfo.mem_adrs} ${userInfo.mem_detail_adrs}<!-- 주문자 주소 -->
					<input type="hidden" id="my_postcd" value="${userInfo.mem_postcd}">
					<input type="hidden" id="my_adrs" value="${userInfo.mem_adrs}">
					<input type="hidden" id="my_detail_adrs" value="${userInfo.mem_detail_adrs}">
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					휴대전화
<!-- 					<font style="font-size:small;color:red;">*</font> -->
				</th>
				<td colspan="6" headers="allow" class="copyT" id="my_ph" style="text-align:left; padding: 0 0 0 20px">${userInfo.mem_ph}</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					이메일 
<!-- 					<font style="font-size:small;color:red;">*</font> -->
				</th>
				<td colspan="6" headers="allow" class="copyT" id="my_email" style="text-align:left; padding: 0 0 0 20px">${userInfo.mem_email}</td>
			</tr>
		</tbody>
		</table>
	</div>
	<div style="width:100%; height:50px; padding-top:20px;">
         <font style="font-weight:bold;"> 배송지 정보</font>
         <font style="font-size:small; float:right;">필수입력사항 </font>
         <font style="font-size:small; float:right; color:red;">*</font>
      </div>
      <div class="board view view_v2"><!--view_v2-->
		<input type="hidden" name="mem_seq" value="">
		<table class="basicT" summary="회원정보">
			<thead></thead>
			<tbody>
			<tr>
				<th scope="row" id="allow">
					배송지선택
				</th>
				<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">
					<input type="radio" name="chk_info" value="equer">주문자 정보와 동일  &nbsp;
					<input type="radio" name="chk_info" value="new">새로운 배송지 
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					받으시는분
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td>
					<input type="text" id="order_paree" name="order_paree" style="border: 1px solid #BDBDBD;width:250px;height:30px; margin-left:11px;" >
				</td>
			</tr>
			<tr>
				<th style="height:150px;" scope="row" id="allow">
					주소
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td colspan="6" headers="allow" class="copyT">
					<input type="text" style="border: 1px solid #BDBDBD;width:200px;height:30px; float:left; margin-left:11px;" id="mem_postcd" name="mem_postcd" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">
					<button type="button" style="margin-left:5px; margin-left:11px; float:left;" class="btn btn-default btn-sm" onclick="javascript:sample6_execDaumPostcode();" >우편번호</button>
					<br></br>
					<input type="text"style="border: 1px solid #BDBDBD;width:350px;height:30px; margin-left:11px; float:left;" id="mem_adrs" name="mem_adrs"> <font style="margin-left:5px; float:left;">기본주소</font>
					<br></br>
					<input type="text"style="border: 1px solid #BDBDBD;width:350px;height:30px;margin-left:11px; float:left;" id="mem_detail_adrs" name="mem_detail_adrs"><font style="margin-left:5px;float:left;">상세주소</font>
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					휴대전화
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td colspan="6" headers="allow" class="copyT">
					<select style="border: 1px solid #BDBDBD;height:30px; width:80px; margin-left:11px; float:left;" id="order_paree_ph" name="order_paree_ph">
						<option value="010" selected>010</option>               
						<option value="011">011</option>
						<option value="016">016</option>             
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>            
					</select>
					<font style="margin-left:5px; float:left;">ㅡ</font>
					<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; margin-left:5px; float:left;" id="mem_ph2" name="mem_ph2" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">
					<font style="margin-left:5px; float:left;">ㅡ</font>
					<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; margin-left:5px; float:left;" id="mem_ph3" name="mem_ph3" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">  
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					이메일 
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td colspan="6" headers="allow" class="copyT">
					 <input type="text"style="border: 1px solid #BDBDBD;height:30px; margin-left:11px; float:left;" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');" id="mem_email" name="mem_email">
                       <font style="margin-left:5px; float:left;">@</font>
                        <input type="text"style="border: 1px solid #BDBDBD;height:30px; margin-left:5px; float:left;" onkeyup="this.value=this.value.replace(/[^a-zA-Z,.]/g,'');" id="mem_email2" name="mem_email2">
                        <select style="border: 1px solid #BDBDBD;height:30px; width:130px; margin-left:5px; float:left;" id="mem_email3" onchange="insertEmail(this.value)">
                        <option value="직접입력" selected>직접입력</option>               
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>             
                        <option value="nate.com">nate.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gamil.com">gmail.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="lycos.co.kr">lycos.co.kr</option>
                        <option value="empal.com">empal.com</option>
                        <option value="dreamwiz.com">dreamwiz.com</option>
                        <option value="korea.com">korea.com</option>                   
                     </select>

				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">배송메시지 </th>
				<td colspan="6" headers="allow" class="copyT">
					<input type="text" class="ttalk" id="order_msg" name="order_msg" style="padding-left:10px;" value="">
				</td>
			</tr>
		</tbody>
		</table>
	</div> <br><br>
	<div style="float:left;">
		<font style="font-weight:bold;">결제 예정 금액</font>
	</div>
	<br>
	<div style="height:10px;"></div>
	<div class="board view view_v2">
		<table class="basicT" summary="결제정보">
			<thead></thead>
			<tr>
				<th style="width:30%;"><b>총 상품금액</b></th>
				<th style="background:#F6F6F6; width:30%; text-align:center;"><b>총 할인 + 부가결제 금액</b></th>
				<th style="background:#F6F6F6; width:30%; text-align:center;"><b>결제예정금액</b></th>
			</tr>
			<tr>
				<td style="text-align:center; height:100px; ">
					<font>
						<font class="border">
		                  <b id="total"><!-- 총 상품 금액 들어가는 곳 --></b><!-- <font style="color:#5CD1E5"> -->
		               </font>
						<font color="#000000">원</font>
					</font>
				</td>
				<td style="text-align:center; "> - <b class="sale">0</b></td>
				<td style="text-align:center;">
					<font>
						<font class="border">
		                  <b class="totalWon"><!-- 결제 예정 금액 들어가는 곳 --></b><!-- <font style="color:#5CD1E5"> -->
		               </font>
						<font color="#000000">원</font>
					</font>
				</td>
			</tr>
		</table>
	</div><br>
	<div class="board view view_v2">
		<table class="basicT" summary="결제정보">
			<thead></thead>
			<tr>
				<th scope="row">
					총 할인금액
				</th>
				<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">
					<font class="border">
		                  <b class="sale"><!-- 총 할인 금액 들어가는곳 -->0</b><!-- <font style="color:#5CD1E5"> -->
		            </font>원
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					총 부가결제금액
				</th>
				<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">
					<font><b><!-- 총 부가결제금액 들어가는 곳 --></b></font>원
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow" >
					적립금
				</th>
				<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">
				<div style="padding-left:10px; padding-top:15px;">
					<input type="text" class="pointtb" id="mile" name="mile"  style="padding-left:10px; float:left; padding-top:10px;" value="">
					<font style="float:left; padding-left:10px; padding-left:10px;"> 
						원 (총 사용가능 적립금 : 
						<font color="red"><b id="point"><!-- 총 사용가능 적립금 들어가는 곳 --></b></font>
						 원)
					</font>
				</div>
				<div style="width:200px; height:20px;"><!-- 빈얖 --></div>
				<div>
					<font size="2"><br>
						<p>º&nbsp;적립금은 최소 0이상일때 결제가 가능합니다.<br>
						º&nbsp;최대 사용 금액은 제한이 없습니다.<br>
						º&nbsp;적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며, [결제하기]버튼을 누르면 주문이 완료 됩니다.<br></p>
					</font>
				</div>
				</td>
			</tr>
		</table>
	</div><br>
	<div style="float:left;">
		<font style="font-weight:bold;">결제 수단</font>
	</div>
	<br>
	<div style="height:10px;"></div>
	<div class="board view view_v2">
		<table class="basicT" summary="결제정보">
			<thead></thead>
			<tr>
				<th style="background-color: #ffffff; text-align:left; padding-left:15px; width:70%;">
					<input type="radio" name="order_methd" value="카드결제" checked="checked">카드결제 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="order_methd" value="계좌이체" >실시간 계좌이체 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="order_methd" value="무통장" >무통장 입금 &nbsp;&nbsp;&nbsp;
					<input type="radio" name="order_methd" value="폰결제" >휴대폰 결제 
				</th>
				<th style="background-color: #E7E7E7; text-align:right; padding-right:15px; width:30%;">
					<font style="color: #000000;"><b>최종결제금액</b></font><br>
					<font>
						<font size=4 style="font-weight:bold;" class="totalWon"></font> 
						<font size=3 color="#AAAAAA">원 </font><br>
					</font>
				</th>
			</tr>
			<tr>
				<td style="text-align:center; height:100px; ">
					<font size=3>
						<font color="red">※</font> 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br>
						<font color="red">※</font> 소액 결제의 경우에서 정책에 따라 결제 금액 제한이 있을 수 있습니다.<br>
					</font>
				</td>
				<td style="background-color: #E7E7E7; text-align:center; height:100px; ">
					<button type="button" class="btn btn-info" onclick="payment('orderInfo')" style="width:90%;">결제하기</button>
					<br><br>
					<font>
						<font style="font-weight:bold; float:left; padding-left:15px; color: #000000;">총 적립예정금액 : </font> 
						<font style="float:right; padding-right:15px; color: #000000;"> <b>0</b> 원 </font><br>
					</font>
				</td>
			</tr>
		</table>
	</div><br><br>
	<div class="board view view_v2">
		<table class="basicT" summary="결제정보">
			<thead></thead>
			<tr>
				<th style="background-color: #ffffff; border-bottom:2px solid #E0E0E0;  text-align:left; padding-left:15px; width:70%;">
					<font style="color: #000000;"><b>무이자 할부 이용안내</b></font><br>
					<font>
						<font size=2 color="#AAAAAA">
							무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상춤 금액에 대해 무이자할부가 적용되지 않습니다.<br>
							무이자할부를 원하시는 경우 장부구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
						</font>
					</font>
				</th>
			<tr>
		</table>
	</div><br><br><br>
	</div><!-- 없어지면안됨 -->
</body>
</html>