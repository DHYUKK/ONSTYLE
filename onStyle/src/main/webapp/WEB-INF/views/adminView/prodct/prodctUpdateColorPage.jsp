<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="colorInfo" class="col-md-10" style="padding-top:6px; height:100%">
		<c:forEach var="prodctColorList" items="${prodctColorList}" varStatus="status">
			<input type='text' name="tempColor" class='form-control' style='width:10%; height:34px; float:left; margin-left:5px;' value="${prodctColorList.prodct_color_nme}" readonly>
			<button type="button" class="btn btn-danger" style="width:34px;height:34px;font-weight: bold;float:left;font-size: large;padding-top: 1px;padding-left: 13px;" onclick="prodctColorDelete(${prodctColorList.prodct_color_seq}, ${prodctVO.prodct_seq})">-</button>
		</c:forEach>
	</div>
	<div class="col-md-2" style="height:100%">
		<div style="margin-right:49px">
			<button type="button" class="btn btn-primary" onclick="prodctColorPopUp()" style="width:45px;height:45px;float:right;font-size:large;padding-left: 13px;">
			<span class="glyphicon glyphicon-arrow-up">
			</span>
		</button>
	</div>
</div>
</body>
</html>