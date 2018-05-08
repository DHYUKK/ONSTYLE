$(document).ready(function() {
	var radio_val = $("#checkedRadioValue").val();
	$("#radioValue"+radio_val).prop("checked", true);
	selectCategory($("input[name=searchCondition1]").val());
});

function selectCategory(category){
	
	if(category=="mem_id"){
		$("#search_category").html("회원 ID <span class='caret'></span>");
	} else if(category=="mem_name"){
		$("#search_category").html("회원이름 <span class='caret'></span>");
	} else if(category=="mem_nicknme"){
		$("#search_category").html("닉네임 <span class='caret'></span>");
	} else{
		$("#search_category").html("요청번호 <span class='caret'></span>");
	}
	
	$("input[name=searchCondition1]").val(category);
}

//체크박스 전체선택, 해제
$(function(){
	$("#chk_all").click(function(){
		var chk = $(this).is(":checked");
		if(chk) $("input:checkbox[name='chk']").prop("checked", true);
		else  $("input:checkbox[name='chk']").prop("checked", false);
	});
});

function checkReqstDelete(){
	var reqstCheckGroup=[];
	//체크박스 중 체크된 체크박스만 가져와서 Loop
	$("input:checkbox[name=chk]:checked").each(function(i,elements){
		reqstCheckGroup.push($(this).val());
	});
	if(reqstCheckGroup.length==0){
		alert("1개 이상 체크해주세요.");
		return;
	}
	var formData = "reqstCheckGroup="+reqstCheckGroup+"&location=0";
	var wheather = confirm(reqstCheckGroup.length+"개 코디요청을 삭제하시겠습니까?");
	if(wheather == true){
		$.ajax({
			type : "POST",
			url : "/adminReqstDelete.do", 
			data : formData,	 
			success : function(data){
				$("#adminReqstList").html(data);
			},
			error:function(xhr,status,error){ 
				alert("$");
				alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
	 }
	 else {
		 return;
	 }
}

//검색 및 페이징
function searchPaging(page){
	var formData = $("#reqstFrm").serialize();
	formData += "&currentPageNo="+page;
	$.ajax({
		type : "POST",
		url : "/adminCodiReqstList.do",
		data : formData,
		success : function(data){
			$("#adminReqstList").html(data);
		},
		error:function(xhr,status,error){ 
			alert("$");
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	});
}

function adminCodiReqstRead(reqstSeq){
	$("#reqstFrm").append("<input type='hidden' name='codi_reqst_seq' id='codi_reqst_seq' value='"+reqstSeq+"'>");
	$("#reqstFrm").attr({action:'/adminCodiReqstRead.do', method:'post'}).submit();
}

//초기화
function reset(){
	$("#radioValue1").prop("checked", true);
	$("#oneDatepicker").val('');
	$("#twoDatepicker").val('');
	$("#searchContent").val('');
	$("#search_category").html("회원 ID <span class='caret'></span>");
	$("input[name=searchCondition1]").val("mem_id");
	
}