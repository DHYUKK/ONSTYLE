<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>취소관리</title>
</head>
<body>
<div class="board view view_v2"><!--view_v2-->
		<form name="jo" id="jo" method="post">
		<input type="hidden" name="mem_seq" value="${memship.mem_seq}">
		<table class="basicT" summary="회원정보">
		<thead></thead>
			<tbody>
				<tr>
				
					<th scope="row" id="allow">아이디</th>
					<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${memship.mem_id}</td>
				</tr>
				<tr>
					<th scope="row" id="allow">
						비밀번호
						<font style="font-size:small;color:red;">*</font>
					</th>
					<td colspan="6" headers="allow" class="copyT">
						<input type="password" id="pw" name="mem_pw" class="textbox" style="padding-left:10px;" value="">  
					</td>
				</tr>
				<tr>
					<th scope="row" id="allow">이름</th>
					<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${memship.mem_name}</td>
				</tr>
				<tr>
					<th scope="row" id="allow">닉네임</th>
					<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:10px;">${memship.mem_nicknme}</td>
				</tr>
				<tr>
					<th scope="row" id="allow">생년월일</th>
					<td colspan="6" headers="allow" class="copyT">
						<input type="text" class="textbox" id="birth" name="mem_birth" style="width:10%; text-align: right; float:left" value="${memship.mem_birth}">
						<font style="margin-top:10px; padding-left:10px; float:left"><b>년</b></font>
						<input type="text" class="textbox" id="birth" name="mem_birth" style="width:10%; text-align: right; float:left" value=""> 
						<font style="margin-top:10px; padding-left:10px; float:left"><b>월</b></font>
						<input type="text" class="textbox" id="birth" name="mem_birth" style="width:10%; text-align: right; float:left" value=""> 
						<font style="margin-top:10px; padding-left:10px; float:left"><b>일</b></font>
					</td>
				</tr>
				<tr>
					<th style="height:150px;" scope="row" id="allow">
						 주소
						<font style="font-size:small;color:red;">*</font>
					</th>
					<td colspan="6" headers="allow" class="copyT">
						<div style=" width:100%; height:40px; padding-left:10px;">
							<input type="text" id="sample6_postcode" class="d_form mini" name="mem_postcd" style="width:10%; padding-left:10px; float:left;" value="${memship.mem_postcd}">
							<div style="border:1px solid #ffffff; width:10px; padding-left:10px; float:left; "><!-- 빈얖 --></div>
							<input type="button" onclick="sample6_execDaumPostcode()" style=" padding-left:10px; float:left;" value="우편번호 찾기" class="btn btn-default">
						</div>
						<div>
							<input type="text" id="sample6_address" class="d_form std" name="mem_adrs" style="width: 30%; float:left; padding-left:10px;" value="${memship.mem_adrs}" >
							<div style="border:1px solid #ffffff; width:10px; padding-left:10px; float:left; "><!-- 빈얖 --></div>
							<input type="text" id="sample6_address2" class="d_form" name="mem_detail_adrs" style=" float:left;  padding-left:10px;" value="${memship.mem_detail_adrs}" >
						</div>
					</td>
				</tr>
			<tr>
				<th>
					휴대전화
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td colspan="6" headers="allow" class="copyT">
					<select style="height: 37px; width:10%; padding-left:10px; float:left;">
						<option value="010" selected>010</option>               
						<option value="011">011</option>
						<option value="016">016</option>             
						<option value="017">017</option>
						<option value="018">018t</option>
						<option value="019">019</option>                  
					</select>
					<font style="margin-top:10px; padding-left:10px; float:left"><b>-</b></font>
					<input type="text" class="textbox" id="" name="" style="width:10%; padding-left:10px; float:left;"> 
					<font style="margin-top:10px; padding-left:10px; float:left"><b>-</b></font>
					<input type="text" class="textbox" id="" name="" style="width:10%; padding-left:10px; float:left;"> 
				</td>
			</tr>
			<tr>
				<th scope="row" id="allow">
					이메일 
					<font style="font-size:small;color:red;">*</font>
				</th>
				<td colspan="6" headers="allow" class="copyT">
					<input type="text" class="textbox" id="email" name="mem_email" style="width:20%; padding-left:10px; float:left;" value="${memship.mem_email}"> 
					<font style="margin-top:10px; padding-left:10px; float:left"><b>@</b></font>
					<input type="text" class="textbox" id="email" name="mem_email" style="width:20%; padding-left:10px; float:left;" value=""> 
					<select style=" height:37px; width:30%; float:left;">
						<option value="이메일선택" selected>- 이메일 선택 -</option>               
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
			</tbody>
		</table>
		</form>
	</div>
</body>
</html>