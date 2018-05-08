<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPageMainHome</title>

<style type="text/css">
/* div그림자 만들기 = box-shadow: X오프셋 Y오프셋 블러반경 퍼짐반경 색상(기본 검정); */
   .box1 { box-shadow: 5px 5px 2px #aaaaaa;}
</style>
<script>
//    function member(){
//       window.location.href = "";
//    }
</script>
</head> 
<body>
   <div>
      <c:import url="/menu.do"/>
   </div>
   <div class="mainContainer">
      <div style="width:1050px; height:210px;" class="center-block"><!-- 빈얖 --></div>
      <div style="width:1150px; height:250px;" class="center-block">
         <div style="border:1px solid #CBCACA; width:200px; height:200px; float:left; margin-top:20px; margin-left:20px;" class='box1'>
            <a href="/password.do"><img src="/resources/consmr/mem/img/membership.PNG" style="float:left; margin-top:35px; margin-left:45px;"></a>
         </div>
         <div style="border:1px solid #CBCACA; width:200px; height:200px; float:left; margin-top:20px; margin-left:20px;" class='box1'>
            <a href="/orderlist.do"><img src="/resources/consmr/mem/img/orderlist.PNG" style="float:left; margin-top:38px; margin-left:50px;"></a>
         </div>
         <div style="border:1px solid #CBCACA; width:200px; height:200px; float:left; margin-top:20px; margin-left:20px;" class='box1' >
            <a href="/cart.do"><img src="/resources/consmr/mem/img/cart.PNG" style="float:left; margin-top:31px; margin-left:50px;"></a>
         </div>
         <div style="border:1px solid #CBCACA; width:200px; height:200px; float:left; margin-top:20px; margin-left:20px;" class='box1'>
            <a href="https://www.doortodoor.co.kr/main/index.jsp" target='newWindow'> <!-- target='newWindow' 새창으로열기  -->
               <img src="/resources/consmr/mem/img/shippinplist.PNG" style="float:left; margin-top:38px; margin-left:50px;">
            </a>
         </div>
         <div style="border:1px solid #CBCACA; width:200px; height:200px; float:left; margin-top:20px; margin-left:20px;" class='box1'>
             <a href="/point.do"><img src="/resources/consmr/mem/img/point.PNG" style="float:left; margin-top:38px; margin-left:50px;"></a>
         </div>
      </div>
   </div>
</body>
</html>