<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.inicis.std.util.ParseUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.HttpUtil"%>
<%@ page import ="com.inicis.inipay.*" %>
<%@ page import="java.util.*"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script>
		$(document).ready(function(){//시작하자마자 실행 되어야 하는 것들 (결제 가격, 결제 방법, 상단 타이틀, 결제 완료 등록)
			
// 			//결제 가격
// 			$("#order_sum_html").html(numberWithCommas($("#TotPrice").val()));	
			$("#order_sum").val($("#TotPrice").val());
			
			//결제 방법
			var payMethod = $("#payMethod").val();//결제 방법
			if(payMethod == 'Card'){//카드 결제
// 				$("#order_methd_html").html('<th scope="row">결제 방법</th>'
// 											   +'<td>카드  결제</td>'
// 											   +'<th scope="row" style="text-align:center;">카드 발급사</th>'
// 											   +'<td colspan=3>'+$("#CARD_BankCode").val()+'</td>');
				$("#order_methd").val('카드');
				$("#order_state").val('상품준비중');
			}
			else if(payMethod == 'HPP'){//휴대폰 결제
// 				$("#order_methd_html").html('<th scope="row">결제 방법</th>'
// 											   +'<td>휴대폰 결제</td>'
// 											   +'<th scope="row" style="text-align:center;">휴대 번호</th>'
// 											   +'<td colspan=3>'+$("#HPP_Num").val()+'</td>');
				$("#order_methd").val('휴대폰');
				$("#order_state").val('상품준비중');
			}
			else if(payMethod == 'VBank'){//무통장 입금
// 				$("#order_methd_html").html('<th scope="row">결제 방법</th>'
// 											   +'<td>무통장 입금</td>'
// 											   +'<th scope="row" style="text-align:center;">계좌 번호</th>'
// 											   +'<td colspan=3>'+$("#VACT_Num").val()+'('+$("#vactBankName").val()+' 예금주 : '+$("#VACT_Name").val()+')</td>');
				$("#order_methd").val('무통장');
				$("#order_state").val('입금전');
			}
			else if(payMethod == 'DirectBank'){//계좌 이체
// 				$("#order_methd_html").html("계좌 이체");
				$("#order_methd").val('계좌이체');
				$("#order_state").val('상품준비중');
			}
			
			//상단 타이틀
			var payResult = $("#payResult").val();//결제 결과
// 			$("#result").html(payResult);
			if(payResult == '결제실패'){//결제 실패시
				$("#result").css("color", "#c9272c");
				$("#result_coment").html(": "+$("#payResult_coment").val());
			}
			else {						  //결제 성공시
// 				$("#result").css("color", "#3162C7");//파란색으로 글자색 바꿈
				
				var applDate = $("#applDate").val();
				var applTime = $("#applTime").val();
				$("#order_date").val(applDate+applTime); //결제 승인 날짜+시간 넣기
				
				
				
				var orderForm = $("#orderForm").serialize();
				orderForm = decodeURIComponent(orderForm);
// 				alert(orderForm);
	 			$.ajax({//결제 완료 등록
	 				url: "/orderSuccess.do",
	 				data: orderForm,
	 				type: "POST",
	 				success:function(){
						alert("결제 성공!");
					},
	 				error:function(xhr,status,error){ //ajax 오류인경우  
// 	 					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
// 	 					alert("결제 실패");
	 				}
	 			});
			}
		})
	</script>
</head>
<body>
	<div>
      <c:import url="/menu.do"/>
   	</div>
   	<form id="orderForm">
<%-- 	    <input type="text" id="mem_seq" name="mem_seq" value="${userInfo.mem_seq}"><!-- 로그인한 회원 seq--> --%>
	    <input type="text" id="order_date" name="order_date" value=""><!-- 결제 승인 날짜-->
	    <input type="text" id="order_methd" name="order_methd" value=""><!-- 거래 방법-->
	    <input type="text" id="order_sum" name="order_sum" value=""><!-- 결제 가격 -->
	    <input type="hidden" id="order_state" name="order_state" value=""><!-- 결제 상태 -->
<!-- 	    <input type="text" id="tid" name="tid" value="">이니시스의 결제 코드(번호) -->
    </form>
    <div>
	   <c:import url="/menu.do"/>
	</div>
	<div class="mainContainer">
		<div style="width:100%; height:80px;"> </div>
		<div style=" border-bottom: 2px dotted #CACACA; width:100%; height:150px;">
			<div style="width:30%; height:200px; float:left"> </div>
			<span class="glyphicon glyphicon-ok" aria-hidden="true" style="font-size:40px; color:red; margin-top:65px; float:left"></span>
			<div style="width:20px; height:200px; float:left"> </div>
			<font style="font-weight: bold; font-size:large; line-height: 10em; color: navy; ">거래가 완료 되었습니다. </font>
		</div>
		<div style="width:100%; height:50px;"> </div>
<!-- 		<font style="font-weight: bold;"> 주문자 확인 </font> -->
<!-- 		<table class="table"> -->
<!-- 			<tr class="active" > -->
<!-- 				<th> 주문날짜 </th> -->
<!-- 				<th> 주문자 </th> -->
<!-- 				<th> 이메일 </th> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td> 09.14 </td> -->
<!-- 				<td> 홍길동 </td> -->
<!-- 				<td> qweqweqwe@naver.com </td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<font style="font-weight: bold;"> 배송지 확인 </font> -->
<!-- 		<table class="table"> -->
<!-- 			<tr> -->
<!-- 				<th class="active" style="width:20%;"> 받는이 </th> -->
<!-- 				<td> 성춘향 </td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th class="active"> 주소 </th> -->
<!-- 				<td> 대구</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th class="active"> 전화번호 </th> -->
<!-- 				<td> 123456789</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<font style="font-weight: bold;"> 주문내역 확인 </font> -->
<!-- 		<table class="table"> -->
<!-- 			<tr class="active" > -->
<!-- 				<th> 상품명 / 옵션 </th> -->
<!-- 				<th> 사이즈 </th> -->
<!-- 				<th> 수량 </th> -->
<!-- 				<th> 가격 </th> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th> 상품명 / 옵션 </th> -->
<!-- 				<th> 사이즈 </th> -->
<!-- 				<th> 수량 </th> -->
<!-- 				<th> 가격 </th> -->
<!-- 			</tr> -->
<!-- 		</table> -->
		
<!-- 		<div style="float:right"> -->
<!-- 			<button type="button" class="btn btn-default"> 쇼핑하기 </button> -->
<!-- 			<button type="button" class="btn btn-info"> 장바구니 </button> -->
<!-- 		</div> -->
	</div>






















































	<% 

	try{

		//#############################
		// 인증결과 파라미터 일괄 수신
		//#############################
		request.setCharacterEncoding("UTF-8");

		Map<String,String> paramMap = new Hashtable<String,String>();

		Enumeration elems = request.getParameterNames();

		String temp = "";

		while(elems.hasMoreElements())
		{
			temp = (String) elems.nextElement();
			paramMap.put(temp, request.getParameter(temp));
		}
		
		System.out.println("paramMap : "+ paramMap.toString());
		
		//#####################
		// 인증이 성공일 경우만
		//#####################
		if("0000".equals(paramMap.get("resultCode"))){
			System.out.println("####인증성공/승인요청####");

			//############################################
			// 1.전문 필드 값 설정(***가맹점 개발수정***)
			//############################################
			
			String mid 		= paramMap.get("mid");					        // 가맹점 ID 수신 받은 데이터로 설정
			
			String signKey	= "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 키(이니라이트키) (가맹점 수정후 고정) !!!절대!! 전문 데이터로 설정금지
			
			String timestamp= SignatureUtil.getTimestamp();			  // util에 의해서 자동생성

			String charset 	= "UTF-8";								            // 리턴형식[UTF-8,EUC-KR](가맹점 수정후 고정)
			
			String format 	= "JSON";								              // 리턴형식[XML,JSON,NVP](가맹점 수정후 고정)
			
			String authToken= paramMap.get("authToken");			    // 취소 요청 tid에 따라서 유동적(가맹점 수정후 고정)

			String authUrl	= paramMap.get("authUrl");				    // 승인요청 API url(수신 받은 값으로 설정, 임의 세팅 금지)

			String netCancel= paramMap.get("netCancelUrl");			  // 망취소 API url(수신 받은 값으로 설정, 임의 세팅 금지)

			String ackUrl = paramMap.get("checkAckUrl");			    // 가맹점 내부 로직 처리후 최종 확인 API URL(수신 받은 값으로 설정, 임의 세팅 금지)		
			
			String cardnum = paramMap.get("cardnum");				      //갤러리아 카드번호(카드끝자리 '*' 처리) 2016-01-12
						
			//#####################
			// 2.signature 생성
			//#####################
			Map<String, String> signParam = new HashMap<String, String>();

			signParam.put("authToken",	authToken);		// 필수
			signParam.put("timestamp",	timestamp);		// 필수

			// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
			String signature = SignatureUtil.makeSignature(signParam);

      String price = "";  // 가맹점에서 최종 결제 가격 표기 (필수입력아님)
      		
      // 1. 가맹점에서 승인시 주문번호가 변경될 경우 (선택입력) 하위 연결.  
      // String oid = "";             
      
			//#####################
			// 3.API 요청 전문 생성
			//#####################
			Map<String, String> authMap = new Hashtable<String, String>();

			authMap.put("mid"			    ,mid);			  // 필수
			authMap.put("authToken"		,authToken);	// 필수
			authMap.put("signature"		,signature);	// 필수
			authMap.put("timestamp"		,timestamp);	// 필수
			authMap.put("charset"		  ,charset);		// default=UTF-8
			authMap.put("format"		  ,format);		  // default=XML
      //authMap.put("price" 		,price);		    // 가격위변조체크기능 (선택사용)
      
			System.out.println("##승인요청 API 요청##");

			HttpUtil httpUtil = new HttpUtil();

			try{
				//#####################
				// 4.API 통신 시작
				//#####################

				String authResultString = "";

				authResultString = httpUtil.processHTTP(authMap, authUrl);
				
				//############################################################
				//5.API 통신결과 처리(***가맹점 개발수정***)
				//############################################################
				System.out.println("## 승인 API 결과 ##");
				
				String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");
				
// 				out.println("<pre>"+authResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</pre>");
				
				Map<String, String> resultMap = new HashMap<String, String>();
				
				resultMap = ParseUtil.parseStringToMap(test); //문자열을 MAP형식으로 파싱
								
				System.out.println("resultMap == " + resultMap);
				
				/*************************  결제보안 강화 2016-05-18 START ****************************/ 
				Map<String , String> secureMap = new HashMap<String, String>();
				secureMap.put("mid"			, mid);								//mid
				secureMap.put("tstamp"		, timestamp);						//timestemp
				secureMap.put("MOID"		, resultMap.get("MOID"));			//MOID
				secureMap.put("TotPrice"	, resultMap.get("TotPrice"));		//TotPrice
				
				// signature 데이터 생성 
				String secureSignature = SignatureUtil.makeSignatureAuth(secureMap);
				/*************************  결제보안 강화 2016-05-18 END ****************************/

				if("0000".equals(resultMap.get("resultCode")) && secureSignature.equals(resultMap.get("authSignature")) ){	//결제보안 강화 2016-05-18
				   /*****************************************************************************
			       * 여기에 가맹점 내부 DB에 결제 결과를 반영하는 관련 프로그램 코드를 구현한다.  
				   
					 [중요!] 승인내용에 이상이 없음을 확인한 뒤 가맹점 DB에 해당건이 정상처리 되었음을 반영함
							  처리중 에러 발생시 망취소를 한다.
			       ******************************************************************************/	
					

					out.println("<input type='hidden' id='payResult' value='결제성공'>");//결제 성공여부
					out.println("<input type='hidden' id='payResult_coment' value='"+resultMap.get("resultMsg")+"'>");//결제 내용
						  
				} else {
					out.println("<input type='hidden' id='payResult' value='결제실패'>");//결제 성공여부
					
					//결제보안키가 다른 경우
					if (!secureSignature.equals(resultMap.get("authSignature"))) {
						//결과정보
						out.println("<input type='hidden' id='payResult_coment' value='데이터 위변조 체크 실패'>");//결제 내용
						
						//망취소
						if ("0000".equals(resultMap.get("resultCode"))) {
							throw new Exception("데이터 위변조 체크 실패");
						}
					}
				}
					
				//공통 부분만
				out.println("<input type='hidden' id='payNumber' value='"+resultMap.get("tid")+"'>");//거래 번호
				out.println("<input type='hidden' id='payMethod' value='"+resultMap.get("payMethod")+"'>");//결제방법(지불수단)
				out.println("<input type='hidden' id='resultMsg' value='"+resultMap.get("resultMsg")+"'>");//결제 내용
				out.println("<input type='hidden' id='TotPrice' value='"+resultMap.get("TotPrice")+"'>");//결제 가격
				out.println("<input type='hidden' id='MOID' value='"+resultMap.get("MOID")+"'>");//주문 번호
				out.println("<input type='hidden' id='applDate' value='"+resultMap.get("applDate")+"'>");//승인 날짜
				out.println("<input type='hidden' id='applTime' value='"+resultMap.get("applTime")+"'>");//승인 시간
				
				if("VBank".equals(resultMap.get("payMethod"))){ //가상계좌
					
					out.println("<input type='hidden' id='VACT_Num' value='"+resultMap.get("VACT_Num")+"'>");//입금 계좌번호
					out.println("<input type='hidden' id='VACT_BankCode' value='"+resultMap.get("VACT_BankCode")+"'>");//입금 은행코드
					out.println("<input type='hidden' id='vactBankName' value='"+resultMap.get("vactBankName")+"'>");//입금 은행명
					out.println("<input type='hidden' id='VACT_Name' value='"+resultMap.get("VACT_Name")+"'>");//예금주 명
					out.println("<input type='hidden' id='VACT_InputName' value='"+resultMap.get("VACT_InputName")+"'>");//송금자 명
					out.println("<input type='hidden' id='VACT_Date' value='"+resultMap.get("VACT_Date")+"'>");//송금 일자
					out.println("<input type='hidden' id='VACT_Time' value='"+resultMap.get("VACT_Time")+"'>");//송금 시간
					
				}else if("DirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체
					out.println("<input type='hidden' id='ACCT_BankCode' value='"+resultMap.get("ACCT_BankCode")+"'>");//은행코드
					out.println("<input type='hidden' id='CSHR_ResultCode' value='"+resultMap.get("CSHR_ResultCode")+"'>");//현금영수증 발급결과코드
					out.println("<input type='hidden' id='CSHR_Type' value='"+resultMap.get("CSHR_Type")+"'>");//현금영수증 발급구분코드 : 0 - 소득공제용, 1 - 지출증빙용
					 
				}else if("iDirectBank".equals(resultMap.get("payMethod"))){ //실시간계좌이체
					out.println("<input type='hidden' id='ACCT_BankCode' value='"+resultMap.get("ACCT_BankCode")+"'>");//은행코드
					out.println("<input type='hidden' id='CSHRResultCode' value='"+resultMap.get("CSHRResultCode")+"'>");//현금영수증 발급결과코드
					out.println("<input type='hidden' id='CSHR_Type' value='"+resultMap.get("CSHR_Type")+"'>");//현금영수증 발급구분코드 : 0 - 소득공제용, 1 - 지출증빙용
					 
				}else if("HPP".equals(resultMap.get("payMethod"))){ //휴대폰
					out.println("<input type='hidden' id='HPP_Corp' value='"+resultMap.get("HPP_Corp")+"'>");//통신사
					out.println("<input type='hidden' id='payDevice' value='"+resultMap.get("payDevice")+"'>");//결제장치
					out.println("<input type='hidden' id='HPP_Num' value='"+resultMap.get("HPP_Num")+"'>");//휴대폰번호
					
				///자른 부분////////////////////////////////////////////////////////////////////
					
				}else{//카드
					int  quota=Integer.parseInt(resultMap.get("CARD_Quota"));
					if(resultMap.get("EventCode")!=null){
						out.println("<input type='hidden' id='EventCode' value='"+resultMap.get("EventCode")+"'>");//이벤트 코드
					}
					out.println("<input type='hidden' id='CARD_Num' value='"+resultMap.get("CARD_Num")+"'>");//카드번호
					out.println("<input type='hidden' id='applNum' value='"+resultMap.get("applNum")+"'>");//승인번호
					out.println("<input type='hidden' id='CARD_Quota' value='"+resultMap.get("CARD_Quota")+"'>");//할부기간
					
					if("1".equals(resultMap.get("CARD_Interest")) || "1".equals(resultMap.get("EventCode"))){					
						out.println("<p>할부 유형</p>");
						out.println("<p>무이자</p>");	
					}else if(quota > 0 && !"1".equals(resultMap.get("CARD_Interest"))){
						out.println("<p>할부 유형</p>");
						out.println("<p>유이자 <font color='red'> *유이자로 표시되더라도 EventCode 및 EDI에 따라 무이자 처리가 될 수 있습니다.</font></p>");
					}
						
					if("1".equals(resultMap.get("point"))){
						out.println("<p>포인트 사용 여부</p>");
						out.println("<p>사용</p>");
					}else{
						out.println("<p>포인트 사용 여부</p>");
						out.println("<p>미사용</p>");
					}
					out.println("<input type='hidden' id='CARD_Code' value='"+resultMap.get("CARD_Code")+"'>");//카드 종류
					out.println("<input type='hidden' id='CARD_BankCode' value='"+resultMap.get("CARD_BankCode")+"'>");//카드 발급사
			    }
				out.println("<form name='frm' method='post'>"); 
				out.println("<input type='hidden' name='tid' value='"+resultMap.get("tid")+"'/>");
				out.println("</form>");
				
// 				out.println("</pre>");
				
				// 수신결과를 파싱후 resultCode가 "0000"이면 승인성공 이외 실패
				// 가맹점에서 스스로 파싱후 내부 DB 처리 후 화면에 결과 표시

				// payViewType을 popup으로 해서 결제를 하셨을 경우
				// 내부처리후 스크립트를 이용해 opener의 화면 전환처리를 하세요

				//throw new Exception("강제 Exception");
			} catch (Exception ex) {

				//####################################
				// 실패시 처리(***가맹점 개발수정***)
				//####################################

				//---- db 저장 실패시 등 예외처리----//
				System.out.println(ex);

				//#####################
				// 망취소 API
				//#####################
				String netcancelResultString = httpUtil.processHTTP(authMap, netCancel);	// 망취소 요청 API url(고정, 임의 세팅 금지)
				out.println("<input type='hidden' id='payResult' value='결제실패'>");//결제 성공여부
				out.println("<input type='hidden' id='payResult_coment' value='결제망 취소'>");//결제 내용
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@## 망취소 API 결과 ##");

				// 취소 결과 확인
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<p>"+netcancelResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</p>");
			}

		}else{

			//#############
			// 인증 실패시
			//#############
			out.println("<input type='hidden' id='payResult' value='결제실패'>");//결제 성공여부
			out.println("<input type='hidden' id='payResult_coment' value='인증실패'>");//결제 내용
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@####인증실패####");

			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<p>"+paramMap.toString()+"</p>");

		}

	}catch(Exception e){

		System.out.println(e);
	}
%>
	
</body>
</html>