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

<title>ORDER INFORMATION 화면</title>
</head>
<body>
   <div>
      <c:import url="/menu.do"/>
   </div>
   <div class="mainContainer">
   <div style="width:1150px; height:50px;  text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
      <font style="font-weight:bold; font-size:x-large; "> ORDER INFORMATION </font>
   </div>
   <div style="border:1px solid #BDBDBD; width:100%; height:40px; padding-top:10px; padding-left:10px;">
   <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
      <font style="font-weight:bold;"> [${odBerkvo.mem_name} ] <!-- 로그인한 사람의 이름 표시해야됨 --> </font>
      <font style=""> 님 께서 ${odBerkvo.order_date}에 주문하신 내역입니다. </font>
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
               <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
                  <th scope="row">주문번호</th>
                  <td colspan="2" >${odBerkvo.order_seq} </td>
                  <th scope="row">주문일자</th>
                  <td colspan="3" headers="date" style="word-break:break-all">${odBerkvo.order_date} </td>
               </c:forEach>
            </tr>
            <tr>
               <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
                  <th scope="row" id="allow">주문자</th>
                  <td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${odBerkvo.mem_name}</td>
               </c:forEach>
            </tr>
         </tbody>
      </table>
   </div>
   <br>
   <div>
      <font style="font-weight:bold;"> 배송지 정보 </font>
   </div>
   <div class="board view view_v2"><!--view_v2-->
      <table class="basicT" summary="고객 주문 배송지정보">
         <thead></thead>
         <tbody>
            <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
               <tr>
                  <th scope="row" >송장번호</th>
                  <td colspan="6" headers="allow" class="copyT"> <b>${odBerkvo.order_dlivy_num}</b> </td>
               </tr>
            </c:forEach>
            <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
               <tr>
                  <th scope="row">수취인</th>
                  <td colspan="2" style="text-align:left; padding-left:10px;">${odBerkvo.order_paree} </td>
                  <th scope="row">연락처</th>
                  <td colspan="3"  style="text-align:left; padding-left:10px;">${odBerkvo.mem_ph}</td>
               </tr>
            </c:forEach>
            <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
                <tr>
                  <th scope="row" id="allow">주소</th>
                  <td colspan="6" headers="post" class="copyT" style="text-align:left; padding-left:10px;">${odBerkvo.mem_adrs} </td>
               </tr>
            </c:forEach>
            <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
                <tr>
                  <th scope="row" id="allow">배송 메세지</th>
                  <td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${odBerkvo.order_msg} </td>
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
         <c:forEach var ="odBerkvo" items="${odbdetail}" >
            <tr>
               <td style="text-align:center;">${odBerkvo.prodct_nme} </td>
               <td style="text-align:center;">${odBerkvo.order_seq}</td>
               <td style="text-align:center;">${odBerkvo.order_breakdwn_prodct_quanty}</td>
               <td style="text-align:center;">${odBerkvo.prodct_price} 원</td>
               <td style="text-align:center;">-</td>
               <td style="text-align:center;">${odBerkvo.order_state}</td>
            </tr>
         </c:forEach>
      </table>
   </div>
   <br>
   <div>
      <font style="font-weight:bold;"> 결제정보 </font>
   </div>
   <div class="board view view_v2">
      <table class="basicT" summary="고객 주문 결제 정보">
      <thead></thead>
         <tr>
            <th style="background:#F6F6F6; width:10%; text-align:center;">결제방법</th>
            <th style="background:#F6F6F6; width:10%; text-align:center;">결제금액</th>
            <th style="background:#F6F6F6; width:40%; text-align:center;">세부내역</th>
         </tr>
         <c:forEach var ="odBerkvo" items="${odbdetail}" begin="1" end="1">
            <tr>
               <td style="text-align:center;" class="copyT" >사용한적립금</td>
               <td style="text-align:center;" class="copyT"></td>
               <td style="text-align:center;" class="copyT"></td>
            </tr>
         </c:forEach>
         <c:forEach var ="odBerkvo" items="${odbdetail}"  begin="1" end="1">
            <tr>
               <td style="text-align:center; font-weight:bold;" class="copyT">${odBerkvo.order_methd}</td>
               <td style="text-align:center; font-weight:bold;" class="copyT" scope="row">${odBerkvo.order_sum}원</td>
               <td style="text-align:center; font-weight:bold;" class="copyT" scope="row"> - </td>
            </tr>
         </c:forEach>
      </table>
   </div>
   <br>
   <div style="float:right;">
      <a class="btn btn-default" href="/orderlist.do" role="button">주문 목록 보기</a>
   </div>
   </div><!-- 지워지면 안됨 -->
</body>
</html>