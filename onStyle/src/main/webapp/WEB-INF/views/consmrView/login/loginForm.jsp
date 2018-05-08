<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script>
   function memLogin(){
      var loginFrm = $("#loginFrm").serialize();
      $.ajax({
         type:"POST",
         url: "/memLoginCheck.do", // 회원 로그인
         data: loginFrm,
         success:function(memVO){
               if(memVO == ''){
                  $("#loginUl").html("<font color='red'><li>ID / PW를 확인해주세요.</li></font>");
               }
               else if(memVO.mem_seq == 6){
            	   window.location.href="/adminMain.do"
               }
               else{
                  window.location.href="/";
                  alert(loginInfo.mem_name + "님 환영합니다.");
         
//                   if(loginInfo==0){}
//                   $.ajax({
//                      type:"POST",
//                      url: "/memLogin.do", // 회원 로그인 세션설정
//                      data: memLoginInfo,
//                      success:function(){
//                         window.location.href="/";               
                        
//                      },
//                       error:function(xhr,status,error)
//                       { //ajax 오류인경우  
//                          alert("잘못된 입력입니다.");
//                            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
//                         }
//                   });            
               }
            },
             error:function(xhr,status,error)
             { //ajax 오류인경우  
                alert("잘못된 입력입니다.");
//                   alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error); 
               }
         });
   }
   
   
//패스워드 입력 필드에서 엔터키를 누르면 로그인 되도록 키 이벤트 처리
// $("#login_passwd").on("keypress", function(event){
//     if(event.keyCode == 13) {
//         login_proc();
//     }
// });

</script>
</head>
<style>
.button4 {
   background-color: black;
   color: white;
}

.button38 {
   background-color: white;
   color: black;
}

.loginBox {
   margin: 0 auto;
}
</style>
<body>
   <div>
      <c:import url="/menu.do" />
   </div>
   <div class="mainContainer" >
      <div class ="loginBox" style="width: 450px;">
         <div>
            <H3 align="center">LOGIN</H3>
            <H6 align="center">welcome to missbom</H6>
         </div>
         
         <div>
            <div class="col-md-12" style="height: 10px;"></div>
         </div>
         <form name="loginFrm" id="loginFrm" method="post">
            <div>
               <table class="loginBox" style="border-seacing: 60px; ">
                  <tr>
                     <td style="padding-bottom:3px;">
                        <input type="text" class="form-control" name="mem_id"  style="border: 1px solid black; width: 302px; height: 40px;">
                     </td>
                     <td rowspan="2" style="padding-left:10px;">
                        <input type="button" class="button4" style="width: 106px; height: 81px;" value="LOGIN" onclick="javascript:memLogin();">
                     </td>
                  </tr>
                  <tr>
                     <td style="padding-top:2px;">
                        <input  type="password" name="mem_pw" class="form-control" style="border: 1px solid black; width: 302px; height: 40px;">
                     </td>
                  </tr>
               </table>
            </div>
         </form>
         <div>
            <table class="loginBox" style="width:420px; border-seacing: 60px; ">
               <tr>
               	<td id="loginUl">
               		
               	</td>
               </tr>
            </table>
         </div>
         <div>
            <div class="col-md-12" style="height: 10px;"></div>
         </div>
         <hr>
         <div class="loginBox" style="width:420px;">
            <table >
               <tr>
                  <td style="width:240px;"> 
                     회원가입을 하시면 다양하고 특별한 
                  </td>
                  <td rowspan="2" style="width:50px;">
                  </td>
                  <td rowspan="2"><a href="/insertView.do"class="btn btn-default btn-lg btn-block"> Join us </a>
                  </td>
               </tr>
               <tr>
                  <td>
                  혜택이 준비되어 있습니다.
                  </td>
               </tr>
            </table>
         </div>
         
      </div>
   </div>
</body>
</html>