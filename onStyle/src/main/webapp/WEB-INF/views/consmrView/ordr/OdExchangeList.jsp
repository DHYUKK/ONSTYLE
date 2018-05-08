<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- 내가 만든 다양한 꾸밈요소들 불러오기 ㅇㅅㅇ -->
	<link rel="stylesheet" href="/resources/consmr/mem/css/OrderList.css">
	<link rel="stylesheet" href="/resources/consmr/mem/css/selectView.css">
<!--  jQuery UI 라이브러리 js파일 -->
	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
<!-- 내가 만든 달력 제이쿼리 불러오기 ㅇㅅㅇ -->   
	<script src=/resources/consmr/mem/js/orderList.js></script> 
<title>취소/ 교환/ 환불 조회화면 </title>
</head>
<body>
   <div>
      <c:import url="/menu.do"/>
   </div>
   <div class="mainContainer">
      <div style="width:1150px; height:50px; text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
         <font style="font-weight:bold; font-size:x-large; "> ORDER LIST </font>
      </div>
      <div style="width:1150px; height:20px;" class="center-block"><!-- 빈얖 --></div>
      <div class="center-block" >
         <ul id="ulMain" style="list-style: none; font-weight: bold; font-size : medium;">
              <li style="float: left; margin: 0px 20px;"><a href="/orderlist.do" style="color: #C3C3C3; hover-color: #3A3A3A;">주문내역조회</a></li>
              <li><a href="/odexchangelist.do" style="color: black; hover-color: #3A3A3A; ">취소/반품/교환 내역</a></li>
          </ul>
       </div>
       <div style="height:20px;"><!-- 빈얖 --></div>
      <div style="border:1px solid #3A3A3A; width:100%; height:50px; padding-top:7px; ">
          <div style="width:20px; height:25px; float:left;"><!-- 빈여백 --></div>
          <input class="btn btn-default" type="button" value="오늘" id="today">&nbsp;
          <input class="btn btn-default" type="button" value="1주일" id="oneweek">&nbsp;
          <input class="btn btn-default" type="button" value="1개월" id="month">&nbsp;
          <input class="btn btn-default" type="button" value="3개월" id="trimester">&nbsp;
          <input class="btn btn-default" type="button" value="6개월" id="halfyear">&nbsp;&nbsp;
         <input type="text" id="oneDatepicker"> &nbsp;&nbsp; ~ &nbsp;&nbsp;
         <input type="text" id="twoDatepicker">
         <button type="button" class="btn btn-info" style="margin-left:20px;">조회</button>
       </div>
       <div style="height:50px; padding-top:5px; ">
          <font style="color:#8C8C8C;">
             º&nbsp; 기본적으로 최근3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다. <br>
             º&nbsp; 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.
          </font>
       </div>
       <div style="width:1150px; height:50px; padding-top:20px;">
         <font style="font-weight:bold;"> 취소/반품/교환 </font>
      </div>
       <div class="board view view_v2">
         <form name="order" id="order" method="POST">
            <table class="basicT" id="" >
               <tr>
                  <th style="text-align: center; ">주문일자</th>
                  <th style="text-align: center;">이미지</th>
                  <th style="text-align: center;">상품정보</th>
                  <th style="text-align: center;">수량</th>
                  <th style="text-align: center;">상품 구매 금액</th>
                  <th style="text-align: center;">주문 처리 상태</th>
                  <th style="text-align: center;">취소 /교환/반품</th>
               </tr>
               <c:forEach var ="ordrVo" items="${odexchangeList}">
            <tr>
               <td style="text-align: center;">
	               ${ordrVo.order_date}
	               <br>
	               <a href="/orderetail.do?order_seq=${ordrVo.order_seq}">[${ordrVo.order_seq}]</a> <!-- 주소옆의 ?order_seq= 부분은 VO이름과 같게 해야됨  -->
               </td>
               <td style="text-align: center; "><img src="${ordrVo.prodct_img_route1}" style="width:70px; height:90px;"></td>
               <td style="font-size:inherit;"><b><a href="#" style="font-color:#oooooo;">${ordrVo.prodct_nme}</a></b></td>
               <td style="text-align: center; ">${ordrVo.order_breakdwn_prodct_quanty}</td>
               <td style="text-align: center;  font-size:inherit;"><b>${ordrVo.order_sum}원</b></td>
               <td style="text-align: center; ">${ordrVo.order_state}</td>
               <td style="text-align: center; "> ${ordrVo.order_state} </td>
            </tr>
            </c:forEach>
         </table>
         </form>
      </div>
   </div><!-- 없어지면 안됨ㅇㅅㅇ -->
</body>
</html>