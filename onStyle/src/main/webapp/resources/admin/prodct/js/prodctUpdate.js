/**
 * 
 */
	$(document).ready(function() {
	//미리보기 파일 선택
		$("#prodct_img1").on('change', function(){
	   		readURL(this, 1);
		});
		$("#prodct_img2").on('change', function(){
	   		readURL(this, 2);
		});
		$("#prodct_img3").on('change', function(){
	   		readURL(this, 3);
		});
		$("#prodct_img4").on('change', function(){
	   		readURL(this, 4);
		});
		//사이즈 전체 선택
		$("#selectAll").click(function(){
			 var check = $("#selectAll").is(":checked");
		    if(check == true){
		   	 	$("input[name=checkTemp]:checkbox").prop("checked", true);
		    }
		    else{
		   	 	$("input[name=checkTemp]:checkbox").prop("checked", false);
		    }
		});
		
	});
	//임시 색상 화면 띄우기
	function insertImsiColor(colorList){
		for(var i=0; i<colorList.length; i++){
			$("#colorInfo").append("<input type='text' id='tempColor"+i+"' name='tempColor' class='form-control' style='width:10%; float:left; margin-left:5px;' value='"+colorList[i]+"' readonly>"
									+ "<button type='button' id='tempColorDeleteBtn"+i+"' class='btn btn-danger' style='width:5%; float:left;' onclick='tempColorDelete("+i+")'>-</button>");
		}
	}
	function tempColorDelete(i){
		$("#tempColor"+i).remove();
		$("#tempColorDeleteBtn"+i).remove();
	}
	function prodctColorDelete(prodct_color_seq, prodct_seq){
		var formData ="prodct_color_seq="+prodct_color_seq+"&prodct_seq="+prodct_seq;
		$.ajax({
			type : "POST",
			url : "/prodctColorDelete.do",
			data : formData,
			success:function(data){
				$("#colorZone").html(data);	
			},
			error:function(xhr,status,error){ 
	            alert("$");
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	        }
		});
	}
	
	//사이즈 임시등록및 조회
	function abc(formData){
		var category_seq = $("")
 		var prodct_seq = $("#prodct_seq").val();
 		formData += "&prodct_seq="+prodct_seq;
		$.ajax({
			type : "POST",
			url : "/ImsiInsertProdctSize.do",
			data : formData,
			success:function(data){
				$("#sizeFrame").html(data);	
			},
			error:function(xhr,status,error){ 
	            alert("$");
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
	        }
		});
		
	}
	//임시 사이즈 삭제
	function sizeDelete(){
		var sizeGroup =[];
		$("input:checkbox[name=checkTemp]:checked").each(function(i, elements){
			sizeGroup.push($(this).val());
		});
		if(sizeGroup.length == 0){
			alert("1개이상 체크해 주세요");
			return;
		}
		var category_seq = $("#bigCategory").val()
		var prodct_seq = $("#prodct_seq").val();
		var formData = "sizeGroup="+sizeGroup+"&prodct_seq="+prodct_seq+"&category_seq="+category_seq;
		var count = confirm(sizeGroup.length+"개를 삭지하시겠습니까?");
		
		if(count == true){
			$.ajax({
				type : "POST",
				url :  "deleteTempSize.do",
				data : formData,
				success : function(data){
					$("#sizeFrame").html(data);
				}
			});
		}
	}
	//상품 등록
	$(function(){
		   //네이버 에디터 적용
		   var oEditors2 =[];
		   nhn.husky.EZCreator.createInIFrame({
		       oAppRef: oEditors2,
		        elPlaceHolder: "editor2",
		        sSkinURI: "/resources/admin/prodct/NaverEditer/SmartEditor2Skin.html",
		        fCreator: "createSEditor2"
	    });
		
		$("#prodctUpdateBtn").click(function(){
			$("input[name=prodct_seq]").val($("#prodct_seq").val());
			var imgFrm = new FormData(document.getElementById('prodctImgFrm'));
			$.ajax({
				url: "/adminProdctImgCreate.do",
				data: imgFrm,
				processData: false,
				contentType: false,
				type: 'POST',
				success:function(data){
					var prodct_seq =$("#prodct_seq").val();
					oEditors2.getById["editor2"].exec("UPDATE_CONTENTS_FIELD",[]);
					$("#prodct_detail").val($("#editor2").val());
					
					var formData=$("#prodctInfo").serialize();
					formData += "&prodct_seq="+prodct_seq;
					$.ajax({
					      type: "POST",
					      url: "/prodctUpdate.do",
					      data : formData,
					      success: function(data){
					    	//색상
								var colFrm='';
								$("input[name=tempColor]").each(function(i, elements){
									colFrm += "colorGroup="+$(this).val()+"&";
								});
								colFrm += "prodct_seq="+prodct_seq;
								$.ajax({
								      type: "POST",
								      url: "/adminProdctColorInsert.do",
								      data : colFrm,
								      success: function(data){
								    	  location.reload();
								      },
								      error:function(xhr,status,error)
								          { //ajax 오류인경우  
								         alert("error");
								         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
								          }
								   });
					      		},
					      error:function(xhr,status,error)
					          { //ajax 오류인경우  
					         alert("error");
					         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
					          }
					   }); 
				},
				error:function(xhr,status,error)
				{ //ajax 오류인경우  
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
				}
			});
		});
	})
          
	   // 상품 색상 팝업
   function prodctColorPopUp() {
      var defH, defW, sTop, sLeft, url;
      defW = 400;
      defH = 300;
      sTop = (screen.height - defH)/2;
      sLeft= (screen.width  - defW)/2;
      url = "/adminProdctColorPopUp.do"
      popWin = window.open(url, "", "width="+defW+", height="+defH+", top="+sTop+",left="+sLeft+", scrollbars=yes, marginwidth=0, marginheight=0");
      popWin.focus();
   };
   //상품 사이즈 팝업
   function prodctSizePopUp() {
	   	  var category_seq= $("#bigCategory").val()
	      var defH, defW, sTop, sLeft, url;
	      defW = 900;
	      defH = 300;
	      sTop = (screen.height - defH)/2;
	      sLeft= (screen.width  - defW)/2;
	      url = "/adminProdctSizePopUp.do?category_seq="+category_seq;
	      popWin = window.open(url, "", "width="+defW+", height="+defH+", top="+sTop+",left="+sLeft+", scrollbars=yes, marginwidth=0, marginheight=0");
	      popWin.focus();
   };

	//대분류 선택하면 중분류 변경
	function selectCategory(){
	   
	   var category_seq = $("#bigCategory").val();
	   selectSizeTable(category_seq)
	   formData = "category_seq="+category_seq;
	   $("#midCategory").append('');
	   $.ajax({
	      type: "POST",
	      url: "/selectCategory.do",
	      data : formData,
	      success: function(data){
	         $("#midCategory").html("");
	         $.each(data, function(i, vo){
	            var output = '';
	            output += '<option value="'+ vo.category_seq +'" selected="selected">'+vo.category_nme+'</option>';
	            $("#midCategory").append(output);
	         })
	      },
	      error:function(xhr,status,error)
	          { //ajax 오류인경우  
	         alert("error");
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	          }
	   }); 
	}
	//사이즈 테이블 선택
	function selectSizeTable(category_seq){
		var prodct_seq = $("#prodct_seq").val();
		var formData="category_seq="+category_seq+"&prodct_seq="+prodct_seq;
	   $.ajax({
		      type: "POST",
		      url: "/ImsiInsertProdctSize.do",
		      data : formData,
		      success: function(data){
		         $("#sizeFrame").html(data);
		      },
		      error:function(xhr,status,error)
		          { //ajax 오류인경우  
		         alert("error");
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		          }
	   });
	}
 	//이미지 file 경로 가져와서 div src시킴
	function readURL(input, id) {
	    if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $("#prodct_img_preview"+id).html("<img src='"+e.target.result+"' style='width:100%; height:400px' alt='First slide'>");
	    }
	     reader.readAsDataURL(input.files[0]);
	    }
	}
	//취소 클릭시
	function cancel(){
		var prodct_seq = $("#prodct_seq").val()
		window.location.href="/adminSizeDeleteAll.do?prodct_seq="+prodct_seq
	}