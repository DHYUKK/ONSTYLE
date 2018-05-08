$(document).ready(function() {
	$("input[name=category_seq]").val(5);
	//카테고리 선택		
	$("#1").on('click',function() {
	$("#Category").html("TOP <span class='caret'></span>");
	$("input[name=category_seq]").val(1);
	});
	$("#2").on('click',function() {
	$("#Category").html("BOTTOM <span class='caret'></span>");
	$("input[name=category_seq]").val(2);
	});
	$("#3").on('click',function() {
	$("#Category").html("DRESS <span class='caret'></span>");
	$("input[name=category_seq]").val(3);
	});
	$("#4").on('click',function() {
	$("#Category").html("SHOES & BAG <span class='caret'></span>");
	$("input[name=category_seq]").val(4);
	});
	$("#5").on('click',function() {
	$("#Category").html("OUTER <span class='caret'></span>");
	$("input[name=category_seq]").val(5);
	});
	
	
	//미리보기
	$("#myCloth_src").on('change', function(){
			readURL(this);
	});
	
	//이미지 등록
	$("#insertCloth").on('click',function() {
		 if($('#myCloth_src').val() == '')
		 {
			alert('파일을 선택해주세요');
		 }
		 else
		 {
			 var formData = new FormData($("#myClothFrm")[0]);
			$.ajax({
				type : "POST",
				url : "/myClothInsert.do",
				data : formData,	
				processData: false,
				contentType: false,	
				success : function(){	
					alert("등록이 완료 되었습니다.");
					window.close()
					$(opener.location).attr("href","javascript:clothSelectList(5);");
				},
				error:function(xhr,status,error){ 
					alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
		 }
	});
});
	
	
	//미리보기 function
	function readURL(input) {
		if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
		 $("#imgPreview").html("<img src='"+e.target.result+"' style='max-height: 100%; max-width: 100%;'>");
		}
		reader.readAsDataURL(input.files[0]);
		}
	}
	