/**
 * 
 */

//검색 조건 초기화
function resetSearch(){
	alert("씨발");
	document.searchDisplyProdct.reset();
	//중분류가 초기화 안되서 강제로
	formData = "category_seq=1";
	$("#search_mid_category").append('');
	$.ajax({
	   type: "POST",
	   url: "/selectCategory.do",
	   data : formData,
	   success: function(data){
			$("#search_mid_category").html("");
			//중분류 초기 값
			var firstOutput = '';
// 			firstOutput += '<option value="5" selected="selected"> T-shirts </option>';
// 			firstOutput += '<option value="6" selected="selected"> blouse&shirts </option>';
// 			firstOutput += '<option value="7" selected="selected"> knit </option>';

			$("#search_mid_category").append(firstOutput);
	   },
	   error:function(xhr,status,error)
       { //ajax 오류인경우  
		   alert("error");
		   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
       }
	})
}

//대분류 선택하면 중분류 변경
function selectCategory(){
	alert("시발 ");
	
	var category_seq = $("#search_category option:selected").val();
	formData = "category_seq="+category_seq;
	$("#search_mid_category").append('');
	$.ajax({
	   type: "POST",
	   url: "/selectCategory.do",
	   data : formData,
	   success: function(data){
		   $("#search_mid_category").html("");
		   
		   $.each(data, function(i, vo){
				var output = '';
				output += '<option value="'+ vo.category_seq +'selected="selected">'+vo.category_nme+'</option>';
				$("#search_mid_category").append(output);
			})
		},
	   error:function(xhr,status,error)
	       { //ajax 오류인경우  
			alert("error");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	       }
	}); 
	
}

//상품 검색
function searchProdct(){
	var searchOption = $("form[name=searchDisplyProdct]").serialize();
// 	alert(searchOption);
	
	$.ajax({
		type: "POST",
		url: "/searchMainDisply.do",
		data : searchOption,
		success: function(data){
			alert("돈다");
			$.each(data, function(i, vo){
				var searchOutput = '';
				
				searchOutput += '<tr id="${adminProdctVo.prodct_seq}" onmouseover="this.style.backgroundColor=#F4FFFD" onmouseout="this.style.backgroundColor=#ffffff">';
				searchOutput += '<td style="vertical-align:middle;">' + vo.main_disply + '</td>';
				searchOutput += '<td><img style="width:100px; height:100px;" src="' + vo.prodct_img_route1 + '"></td>';
				searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_seq + '</td>';
				searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_nme + '</td>';
				searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_price + '</td>';
				searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_disply_state + '</td>';
				searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_sell_state + '</td>';
				searchOutput += '</tr>';
				
				$("#disply").append(searchOutput);
			});
			
			$("#disply").append(firstOutput);
		},
		error:function(xhr,status,error)
		{ //ajax 오류인경우  
			alert("error");
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		}
	}); 
}

//팝업 창
function categoryUpdatePopUp(){
	var childWindow;
	
	var popUrl = "/categoryUpdatePopUp.do";
    var popupName= "상품 분류 수정";
    var width = 1000;
    var height = 700;
    var leftPosition = (screen.width/2) - (width/2);
    leftPosition += window.screenLeft;//듀얼 모니터일때
 	var topPosition = (screen.height/2) - (height/2);

    childWindow = window.open(popUrl, popupName, "left="+leftPosition+", top="+topPosition+", toolbar=no, location=no, directories=no, scrollbars=no, resizable=no, width="+width+", height="+height);
    
    if(childWindow == null) {//만약 팝업 차단으로 팝업창이 나타나지 않을 경우
       alert("팝업차단을 해제해주세요!");
    }
    else{
    	childWindow.focus();            
    }
 };
