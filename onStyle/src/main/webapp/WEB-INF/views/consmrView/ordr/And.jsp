<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 취소 알림 화면 ㅇㅅㅇ</title>
</head>
<body>
	<div>
		<c:import url="/menu.do"/>
	</div>
	<div class="mainContainer">
		<div style="width:100%; height:80px;"> </div>
		<div style=" border-bottom: 2px dotted #CACACA; width:100%; height:150px;">
			<div style="width:30%; height:200px; float:left"> </div>
			<span class="glyphicon glyphicon-scissors" aria-hidden="true" style="font-size:60px; color:red; margin-top:45px; float:left"></span>
			<div style="width:25px; height:200px; float:left"> </div>
			<span style="font-weight: bold; font-size:x-large; line-height: 6em; color: navy; "> 거래취소가 완료 되었습니다. </span>
		</div>
		<div style="width:100%; height:20px;"> </div>
		<a class="btn btn-info" href="/">쇼핑하러가기</a>
		<a class="btn btn-info" href="/cart.do">장바구니로</a>
	</div><!-- 없애기 ㄴ -->
</body>
</html>