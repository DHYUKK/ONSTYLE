//회원 정보 수정
function upFinish(){
//	var formData = $("#jo").serialize();
//	alert(formData);
//	$.ajax({
//	   url: "/upFinish.do",
//	   data: formData,
//	   type: 'POST',
//	   success:function(){
//	      alert("수정이완료되었습니다.");
//	      window.location.href='/';
//	   },
//	   error:function(xhr,status,error){ //ajax 오류인경우  
//	      alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
//	   }
//	});
	if($("#mem_pw").val()==''){
		alert("비밀번호를 입력하세요");
		return false;
	}
	if($("#mem_pw").val()!=$("#pwcheck").val()){
		alert("비밀번호를 확인하세요");
		return false;
	}
	else{
	document.updateMemInfo.action="/upFinish.do";
	document.updateMemInfo.submit();
	}
}
   // 이메일 선택, 직접입력
   function insertEmail(){
		if($("#mem_email3").val()== '직접입력'){
			$("#mem_email2").attr("readonly",false);
			$("#mem_email2").val('');
			$("#mem_email2").focus();
		}
		else{
			$("#mem_email2").attr("readonly",true);
			$("#mem_email2").val($("#mem_email3").val());
		}
	}
   
// 중복확인, 닉네임체크
$(document).ready(function(){
	$("#mem_nicknme").keyup(function(){
		
		if($("#mem_nicknme").val().length <2){
			$("#nicnmecheck").css('color','red');
			$("#nicnmecheck").html("닉네임을 2자리 이상 입력하세요.");
			return false;
		}
		else{
			$.ajax({
				type : "get",
				data: $("#mem_nicknme"),
				dataType : "JSON",
				url : "nicknmecheck.do",
				
				success : function(idCheck){
					
					console.log("중복체크 값 : " + idCheck);
					if(idCheck != 0){
						var msg = '<font style="color:red"> 닉네임이 존재합니다.</font>';
						msg += '<input type="hidden" id="nicknmeCheckResult" name="nicknmeCheckResult" value="1">';
						$("#nicnmecheck").html(msg);
					}
					else{
						var	msg = '<font style="color:blue">사용가능한 닉네임입니다.</font>';
						msg += '<input type="hidden" id="nicknmeCheckResult" name="nicknmeCheckResult" value="0">';
						$("#nicnmecheck").html(msg);
					}
				},
				error:function(xhr,status,error){ //ajax 오류인경우  
			    	alert("$");
		            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		   		}
			})
		}
	});
});   
   // 패스워드 체크
   $(document).ready(function(){
	 //미리보기
	   $("#memimg_src").on('change', function(){
	          readURL(this);
	   });
	   
		$("#pwcheck").keyup(function(){
			if($("#mem_pw").val() == $("#pwcheck").val()){
				
				$("#pwcheckresult").html('<font color="blue">비밀번호가 일치합니다.</font>');
			}
			else{
				$("#pwcheckresult").html('<font color="red">비밀번호가 불일치합니다!</font>');
			}
		});
	});
   $(document).ready(function(){
		$("#mem_pw").keyup(function(){
			if($("#mem_pw").val() == $("#pwcheck").val()){
				
				$("#pwcheckresult").html('<font color="blue">비밀번호가 일치합니다.</font>');
			}
			else{
				$("#pwcheckresult").html('<font color="red">비밀번호가 불일치합니다!</font>');
			}
		});
	});
//우편번호 찾기
   function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('mem_postcd').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('mem_adrs').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('mem_detail_adrs').focus();
         }
     }).open();
 }
 //옷 치수 탭 활성화 비활성화 
function size(){
 	$('#size').toggleClass("hide");
 		
	if($('#sizeTap').text() == "펼치기"){
		$('#sizeTap').text("접기");
	}
	else {
		$('#sizeTap').text("펼치기");
	}				
 }



//미리보기 function
function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $("#imgPreview").html("<img src='"+e.target.result+"' class='img-circle' style='height:139px; width:139px;'>");
    }
     reader.readAsDataURL(input.files[0]);
    }
}