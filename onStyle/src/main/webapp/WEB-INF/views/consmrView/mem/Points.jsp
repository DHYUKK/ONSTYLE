<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!-- 내가 만든 다양한 꾸밈요소들 불러오기 ㅇㅅㅇ -->
	<link rel="stylesheet" href="/resources/consmr/mem/css/OrderList.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Point Views</title>
</head>
<body>
	<div>
		<c:import url="/menu.do"/>
	</div>
	<div class="mainContainer">
		<div style="width:1150px; height:50px; text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
			<font style="font-weight:bold; font-size:x-large;"> POINT </font>
		</div>
		<div style="width:1150px; height:20px;" class="center-block"><!-- 빈얖 --></div>
		<div style="border:2px solid #ABABAB; width:100%; height:120px; padding-top:10px;">
			<div style="border-right:1px solid #BDBDBD; width:50%; height:50px; float:left; padding-top:13px;"> 
				<span class="glyphicon glyphicon-play" style="padding-left:10px;"></span> 
				<font><b>총 적립금</b></font>
				<font style="float:right; padding-right:10px"><b>0</b>&nbsp;<b style="color: #999999; ">원</b></font>
			</div>
			<div style="width:50%; height:50px; float:left; padding-top:13px;"> 
				<span class="glyphicon glyphicon-play" style="padding-left:10px;"></span> 
				<font><b> 사용 가능 적립금</b></font>
				<font style="float:right; padding-right:10px"><b>0</b>&nbsp;<b style="color: #999999; ">원</b></font>
			</div>
			<br>
			<div style="border-right:1px solid #BDBDBD; width:50%; height:50px; float:left; padding-top:13px;"> 
				<span class="glyphicon glyphicon-play" style="padding-left:10px;"></span> 
				<font><b> 사용된 적립금</b></font>
				<font style="float:right; padding-right:10px"><b>0</b>&nbsp;<b style="color: #999999;">원</b></font>
			</div>
		</div>
		<div style="width:100%; height:20px;" class="center-block"></div>
		<div class="center-block" >
			<ul id="ulMain" style="list-style: none; font-weight: bold; font-size : medium;">
				<li style="float:left; margin: 0px 20px;"><a href="" style="color: black; hover-color: #3A3A3A;">적립내역보기</a></li>
<!-- 				<li><a href="" style="color: #C3C3C3; hover-color: #3A3A3A;">취소/반품/교환 내역</a></li> -->
			</ul>
		</div>
		<div style="width:100%; height:20px;" class="center-block"></div>
		<div>
            <table class="table">
               <tr >
                  <th style="background-color: #E1E1E1; text-align: center;">주문날짜</th>
                  <th style="background-color: #E1E1E1; text-align: center;">적립금</th>
                  <th style="background-color: #E1E1E1; text-align: center;">관련주문</th>
                  <th style="background-color: #E1E1E1; text-align: center;">적립내용</th>
               </tr>
               <c:forEach var ="hi" items="${pointList}" varStatus="status">
               <tr>
                  <td style="text-align: center;">${hi.order_date}</td>
                  <td style="text-align: right;"><b>${hi.ecash_acc}</b> <b style="color: #999999;">원</b></td>
                  <td style="text-align: center;">${hi.order_seq}</td>
                  <td style="text-align: left;">${hi.ecash_msg}</td>
               </tr>
			   </c:forEach>
            </table>
      </div>
	</div>
</body>
</html>