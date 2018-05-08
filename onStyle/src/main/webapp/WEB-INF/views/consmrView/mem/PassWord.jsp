<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- 내가 만든 다양한 꾸밈요소들 불러오기 ㅇㅅㅇ -->
<link rel="stylesheet" href="/resources/consmr/mem/css/PasswordJoin.css">
<title> 비밀번호 확인  </title> 
<!-- border:1px solid red; width:px; height:px; /class="center-block" 중앙정렬 -->
<!-- <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="/bootstrap/css/bootstrap.css" rel="stylesheet"> 맨앞과 부트파일의 이름이 동일해야됨 부트스트랩을 사용하겠다는 링크 -->

<script>
   function joinUp(){
      var formData = $("#pa").serialize();
      $.ajax({
         url: "/passCheck.do",
         data: formData,
         type: 'POST',
         success:function(data){
            seq = data.mem_seq;
            if(seq == undefined){
               $("#pwCheck").html("다시 확인 하세요.");
            }
            else{
//                  document.pa.action="/join.do";
//                  document.pa.submit();
                  window.location.href="/join.do?mem_seq="+seq;
            }
         },
         error:function(xhr,status,error){ //ajax 오류인경우  
//             alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
         }
      });
   }
</script>
</head>
<body>
   <div>
      <c:import url="/menu.do"/>
   </div>
   <div class="mainContainer">
      <div style="width:1150px; height:50px; padding-top:19px; text-align: center;" class="center-block"> <!-- padding-top:19px;을 해서 위아래 간격줌 -->
         <font style="font-weight:bold; font-size:x-large; "> PASSWORD CHECK </font>
      </div>
      <div style="width:1150px; height:50px; padding-top:19px; text-align: center;" class="center-block"> 
         <font style="font-size:medium;">회원 정보 수정을 위해 본인확인 절차를 하겠습니다.</font>
      </div>
      <div style="width:1150px; height:50px; text-align: center;" class="center-block"> 
         <font style="font-size:small; color:#DE4F4F; ">★비회원이신분들은 회원가입후 이용해 주세요!★ </font>
      </div>
      <div style="width:1150px; height:100px;" class="center-block"><!-- 빈여백 --></div>
      <div style="width:650px; height:80px; padding-left:30px; padding-top:20px; " class="center-block">
         <form name="pa" id="pa" method="post" >
            <table style="text-align:center; " class="center-block">
               <tr>
                  <td>
                     <font style="font-size:x-large; "> 비밀번호확인 </font>
                     <input type="password" class="pwdizain" name="mem_pw" id="" placeholder="Password">
                     <input class="btn btn-default" type="button" value="확인" onclick="joinUp()">
                  </td>
                  <td><font style="color: red;" id="pwCheck"> </font></td>
               </tr>
            </table>
         </form>
      </div>
   </div>
</body>
</html>