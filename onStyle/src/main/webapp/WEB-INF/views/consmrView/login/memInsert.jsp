//memInsert
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 달력--------------- -->
<script src="/resources/consmr/login/calendar/flatpickr.js"></script>
<script type="text/javascript" src="/resources/consmr/login/calendar/flatpickr.min.js"></script>
<link rel="stylesheet" href="/resources/consmr/login/calendar/flatpickr.css">
<link rel="stylesheet" href="/resources/consmr/login/calendar/flatpickr.min.css">
<link rel="stylesheet" href="/resources/consmr/login/calendar/ie.css">
<!-- ------------------ -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/consmr/login/js/memlogin.js"></script>
<title>Insert title here</title>
</head>
<style>
.fileContainer {
    overflow: hidden;
    position: relative;
}

.fileContainer [type=file] {
    cursor: inherit;
    display: block;
    font-size: 15px;
    filter: alpha(opacity=0);
    height: 100%;
    width: 87.72px;
    opacity: 0;
    position: absolute;
    left: 0;
    text-align: right;
    top: 0;
}
 </style>
<body>
   <div>
      <c:import url="/menu.do"/>
   </div>
      <div class="mainContainer">
      <div>
         <H3 align="center">JOIN US</H3>
      </div>
       
      <div style="height:30px;width:87%;">
         <font style="font-size:10pt;color:black; float:right;">필수입력사항</font>
         <font style="font-size:10pt;color:red; float:right;">*</font>
         </div>
         <div align="center">
            <form id="meminsert" name="meminsert" method="post" enctype="multipart/form-data">
               <table  class="table table-bordered"  style="width:80%;font-size:11pt;">
                  <tr>
                     <th rowspan="3" style="width:190px">
                     프로필
                        <div id="imgPreview" style="width:140px;height:140px;margin:0 auto;">
                        </div>
                        <div align="center">
                        <label class="fileContainer">
                      <a href="#" class="btn btn-info">파일 선택</a>
                           <input type="file" name="memimg_src" id="memimg_src" accept="image/*">
                        </label>
                        </div>
                     </th>
                     <td>
                        이름
                         <font style="font-size:small;color:red;">*</font>
                        <input type="text" id="mem_name" name="mem_name" style="border: 1px solid #BDBDBD;width:250px;height:30px; margin-left:11px;" autofocus>
                     </td>
                  </tr>
                  <tr>
                     <td>
                       <div style="float:left;">닉네임</div>
                         <font style="font-size:small;color:red; float:left;">*</font>
                        <input type="text" style="border: 1px solid #BDBDBD;width:250px;float:left;height:30px;margin-left:2px;" id="mem_nicknme" name="mem_nicknme">
                         <div id="nicnmecheck" style="float:left;margin-left:10px; margin-top:3px;"></div>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <div style="float:left;">아이디</div>
                         <font style="font-size:small;color:red;float:left;">*</font>
                        <input type="text" style="border: 1px solid #BDBDBD;width:250px;height:30px;float:left;margin-left:2px;" id="mem_id" name="mem_id" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');">
                        <div id="idcheck" style="float:left;margin-left:10px;"></div>
                 </td>               
                  </tr>
                  <tr>
                     <th>
                        비밀번호
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <input type="password" style="border: 1px solid #BDBDBD;width:250px;height:30px;" id="mem_pw" name="mem_pw">
                     </td>
                  </tr>
                  <tr>
                     <th>
                        비밀번호 확인
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <input type="password" style="border: 1px solid #BDBDBD;width:250px;height:30px; float:left;" id="pwcheck">
                        <div id="pwcheckresult" style="float:left;margin-left:10px;"></div>
                     </td>
                  </tr>
                  <tr>
                     <th>
                        휴대전화
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <select style="border: 1px solid #BDBDBD;height:30px; width:80px;" id="mem_ph" name="mem_ph">
                        <option value="010" selected>010</option>               
                        <option value="011">011</option>
                        <option value="016">016</option>             
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>                  
                     </select>
                          ㅡ
                        <input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px;" id="mem_ph2" name="mem_ph2" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">
                                        ㅡ
                        <input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px;" id="mem_ph3" name="mem_ph3" maxlength="4" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">
                     </td>
                  </tr>
                  <tr>
                     <th>
                        주소
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <input type="text" style="border: 1px solid #BDBDBD;width:200px;height:30px;" id="mem_postcd" name="mem_postcd" onKeydown="this.value=this.value.replace(/[^0-9]/g,'');">
                         <button type="button" style="margin-left:5px;" class="btn btn-default btn-sm" onclick="javascript:sample6_execDaumPostcode();" >우편번호</button>
                        <br></br>
                        <input type="text"style="border: 1px solid #BDBDBD;width:350px;height:30px;" id="mem_adrs" name="mem_adrs">기본주소
                        <br></br>
                        <input type="text"style="border: 1px solid #BDBDBD;width:350px;height:30px;" id="mem_detail_adrs" name="mem_detail_adrs">상세 주소
                     </td>
                  </tr>
                  <tr>
                     <th>
                        생년월일
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <input type="text" class="flatpickr flatpickr-input" id="mem_birth" name="mem_birth" style="border: 1px solid #BDBDBD;height:30px;">
                        <script>
                           flatpickr("#mem_birth", {});
                        </script>
                        
                     </td>
                  </tr>
                  <tr>
                     <th>
                        이메일
                         <font style="font-size:small;color:red;">*</font>
                     </th>
                     <td>
                        <input type="text"style="border: 1px solid #BDBDBD;height:30px;" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9,.]/g,'');" id="mem_email" name="mem_email">
                        @
                        <input type="text"style="border: 1px solid #BDBDBD;height:30px;" onkeyup="this.value=this.value.replace(/[^a-zA-Z,.]/g,'');" id="mem_email2" name="mem_email2">
                        <select style="border: 1px solid #BDBDBD;height:30px; width:130px;" id="mem_email3" onchange="insertEmail()">
                        <option value="직접입력" selected>직접입력</option>               
                        <option value="naver.com">naver.com</option>
                        <option value="daum.net">daum.net</option>             
                        <option value="nate.com">nate.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="gamil.com">gmail.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="lycos.co.kr">lycos.co.kr</option>
                        <option value="empal.com">empal.com</option>
                        <option value="dreamwiz.com">dreamwiz.com</option>
                        <option value="korea.com">korea.com</option>                   
                     </select>
                     </td>
                  </tr>
                  <tr>
                <th>
                   옷 치수(선택사항)<a href="javascript:size()"><font id="sizeTap">펼치기</font></a>
                </th>
                <td>
                   <p>옷 치수 입력은 선택사항입니다. 하지만 이를 통해 맞춤형 서비를 제공합니다.</p>
                </td>             
                  </tr>
                  </table>

                  <table class="hide table table-bordered" id="size" style="margin-top:-23px;width:80%;font-size:11pt">
                   <tr>
                  	<td align="center" colspan="3">
                  		<img src="/resources/consmr/mem/img/a.PNG">
                  	</td>
                  	<td align="center" colspan="3">
                  		<img src="/resources/consmr/mem/img/b.PNG">
                  	</td>
                  </tr>
                  <tr>
                        <th style="width:190px;">
                           A 상의 총기장(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center""id="mem_top_length" name="mem_top_length" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
							</div>                        
                        </td>
                        <th>
                           B 상의 어깨넓이(cm)
                        </th>
                        <td>
                        	<div align="center">
                          		 <input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_top_shouldr" name="mem_top_shouldr" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                       		</div>
                        </td>
                        <th>
                          C 상의 가슴둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center" " id="mem_top_bust" name="mem_top_bust" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                         D 상의 밑단둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_top_tail_girth" name="mem_top_tail_girth" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                          E 상의 소매길이(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_top_slv_length" name="mem_top_slv_length" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           F 상의 소매통(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_top_slv_opening" name="mem_top_slv_opening" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           G 상의 소매선절개둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_top_slv_bill" name="mem_top_slv_bill" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');" >
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                        A 하의 총기장(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_bottom_length" name="mem_bottom_length" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                          B 하의 허리둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_bottom_waist" name="mem_bottom_waist" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');" >
                        	</div>
                        </td>
                        <th>
                        C 하의 엉덩이둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_bottom_hip" name="mem_bottom_hip" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           D 하의 허벅지둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_thigh" name="mem_bottom_thigh" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                         E 하의 밑단둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_tail_girth" name="mem_bottom_tail_girth" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                          F 하의 앞 밑위 둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_bottom_front_width" name="mem_bottom_front_width" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                       G 하의 뒷 밑위 둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; text-align:center"" id="mem_bottom_back_width" name="mem_bottom_back_width" maxlength="5" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
               </table>
           </form>
           <div style="margin-top:20px;">
              <input type="button" class="btn btn-info" value="회원가입" onclick="insertmem()">
              <input type="button" class="btn btn-info"  onclick="window.location='/login.do'" value="취소">    
            </div>
         </div>
      </div>

</body>
</html>