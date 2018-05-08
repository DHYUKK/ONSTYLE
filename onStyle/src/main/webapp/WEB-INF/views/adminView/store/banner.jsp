<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>	
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>배너관리 - 온스타일</title>
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
		<div class="col-md-12">
			<h4>배너 관리</h4>
			<hr>
		</div>
		<div class="col-xs-12">
			<div class="col-xs-12" style="text-align:center; font-size: 40px;">
				Banner1
			</div>
			<div class="col-xs-12" style="text-align:center">
					<img src="/resources/admin/store/img/banner1.png" style="height: 650px; width: 1170px;" alt="First slide">
			</div>
			<div class="col-xs-12" style="text-align:center;">
				<input type="file" style="margin: 25px auto;">
			</div>
			
			<div class="col-xs-12" style="text-align:center; font-size: 40px;">
				Banner2
			</div>
			<div class="col-xs-12" style="text-align:center">
					<img src="/resources/admin/store/img/banner2.png" style="height: 650px; width: 1170px;" alt="First slide">
			</div>
			<div class="col-xs-12" style="text-align:center;">
				<input type="file" style="margin: 25px auto;">
			</div>
			
			<div class="col-xs-12" style="text-align:center; font-size: 40px;">
				Banner3
			</div>
			<div class="col-xs-12" style="text-align:center">
					<img src="/resources/admin/store/img/banner3.png" style="height: 650px; width: 1170px;" alt="First slide">
			</div>
			<div class="col-xs-12" style="float:left">
				<input type="file" style="margin: 25px auto;">
			</div>
		</div>
		
	</div>

</body>
</html>