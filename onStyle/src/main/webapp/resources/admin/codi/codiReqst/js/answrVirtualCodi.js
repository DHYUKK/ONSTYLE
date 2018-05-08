$(document).ready(function() {
	//초기값 설정
	$("input[name=bigGroup]").val("myCloth");	//대분류 초기값(나의 옷 or 미스봄상품)
	$("input[name=myCategory]").val(5);			
	$("input[name=prodctCategory]").val(5);
	$("#myCloth").attr('class', 'btn btn-info');			 
	$("#5").attr('class', 'btn btn-info');
	//옷 조회	
	var category = 5;	 
	clothSelectList(category);
	
	//코디에 사용된 옷 조회
	var codi_seq = $("input[name=codi_seq]").val();
	$.ajax({
		type : "POST",
		url : "/usedClothSelect.do?codi_seq="+codi_seq, 
		data : formData,
		success : function(data){
		$.each(data, function(i, vo){
			var codi_use_img = vo.codi_use_img;
			var codi_use_xpoint = vo.codi_use_xpoint;
			var codi_use_ypoint = vo.codi_use_ypoint;
			var codi_use_width = vo.codi_use_width;
			var id_code = vo.id_code;
			
			if(id_code.substring(0,1)=="m"){
				$("input[name=bigGroup]").val("myCloth");
			} else{
				$("input[name=bigGroup]").val("prodct");
			}
			
			var cloth_seq = id_code.substring(1);
			create_id_code(codi_use_img, cloth_seq);
			
			$("#cloth_id"+id_code).css('top',codi_use_xpoint);
			$("#cloth_id"+id_code).css('left',codi_use_ypoint);
			$("#cloth_id"+id_code).css('width',codi_use_width);
		});
			$("input[name=bigGroup]").val("myCloth");	//대분류 초기값(나의 옷 or 미스봄상품)
		},
		error:function(xhr,status,error){ 
			alert("$");
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	});
});

	function setBigGroup(bigGroup){
		var myCategory = $("input[name=myCategory]").val();
		var prodctCategory = $("input[name=prodctCategory]").val();
		$("input[name=bigGroup]").val(bigGroup);
		
		if(bigGroup=="myCloth"){
			prodctCategory = $("input[name=prodctCategory]").val();
			$("#"+prodctCategory).attr('class', 'btn btn-default');
			$("#myCloth").attr('class', 'btn btn-info');
			$("#prodct").attr('class', 'btn btn-default');
			$("input[name=myCategory]").val(myCategory);
			
			clothSelectList(myCategory);
		}else{
			currentCategory = $("input[name=myCategory]").val();
			$("#"+currentCategory).attr('class', 'btn btn-default');
			$("#myCloth").attr('class', 'btn btn-default');
			$("#prodct").attr('class', 'btn btn-info');
			$("input[name=prodctCategory]").val(1);
			
			clothSelectList(prodctCategory);
		}
		
		
		
	}
	
	//옷 조회
	function clothSelectList(category){
		var bigGroup = $("input[name=bigGroup]").val();
		var mem_seq = $("input[name=mem_seq]").val();
		var PreCategory;
		var currentCategory = category;
		if(bigGroup=="myCloth"){
			PreCategory = $("input[name=myCategory]").val();
			$("#"+PreCategory).attr('class', 'btn btn-default');
			$("#"+currentCategory).attr('class', 'btn btn-info');
			$("input[name=myCategory]").val(currentCategory);
		}else{
			PreCategory = $("input[name=prodctCategory]").val();
			$("#"+PreCategory).attr('class', 'btn btn-default');
			$("#"+currentCategory).attr('class', 'btn btn-info');
			$("input[name=prodctCategory]").val(currentCategory);
		}
		
		formData = "category_seq="+category+"&bigGroup="+bigGroup+"&mem_seq="+mem_seq+"&admin=1";	
		$.ajax({
			type : "POST",
				url : "/clothSelectList.do", 
				data : formData,
				success : function(data){
					$("#clothSelectList").html(data);
					
				},
				error:function(xhr,status,error){ 
					alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
		});
	}

	//페이징
	function paging(page){
		var bigGroup = $("input[name=bigGroup]").val();
		var category;
		if(bigGroup=="myCloth"){
			category = $("input[name=myCategory]").val()
		} else{
			category = $("input[name=prodctCategory]").val()
		}
		
		var formData = $("#codiInsertForm").serialize();
		formData += "&currentPageNo="+page+"&category_seq="+category+"&bigGroup="+bigGroup;
		$.ajax({
			type:"POST",
			url: "/clothSelectList.do", // 테이블 조회
			data: formData ,
			success:function(data){
				$("#clothSelectList").html(data);	
			},
			 error:function(xhr,status,error)
			 { 
			 	alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);		 
				}
		});
	}
