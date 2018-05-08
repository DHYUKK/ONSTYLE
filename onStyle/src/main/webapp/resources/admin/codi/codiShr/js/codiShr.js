$(document).ready(function() {

	selectCategory($("input[name=searchCondition1]").val());

});
	
//카테고리 선택
function selectCategory(category){
	
	if(category=="mem_id"){
		$("#search_category").html("회원 ID <span class='caret'></span>");
	} else if(category=="mem_name"){
		$("#search_category").html("회원이름 <span class='caret'></span>");
	} else if(category=="mem_nicknme"){
		$("#search_category").html("닉네임 <span class='caret'></span>");
	} else{
		$("#search_category").html("번호 <span class='caret'></span>");
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

//선택한 게시글 삭제
function checkedDelete(){
	var shrCheckGroup=[];
	//체크박스 중 체크된 체크박스만 가져와서 Loop
	$("input:checkbox[name=chk]:checked").each(function(i,elements){
		shrCheckGroup.push($(this).val());
	});
	if(shrCheckGroup.length==0){
		alert("1개 이상 체크해주세요.");
		return;
	}
	var formData = "shrCheckGroup="+shrCheckGroup+"&location=0";
	var wheather = confirm(shrCheckGroup.length+"개 코디요청을 삭제하시겠습니까?");
	if(wheather == true){
		$.ajax({
			type : "POST",
			url : "/adminShrDelete.do", 
			data : formData,	 
			success : function(data){
				$("#codiShrList").html(data);
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
	$("#currentPageNo").val(page);
	var formData = $("#shrFrm").serialize();
	$.ajax({
		type : "POST",
		url : "/adminCodiShrList.do",
		data : formData,
		success : function(data){
			$("#codiShrList").html(data);
		},
		error:function(xhr,status,error){ 
			alert("$");
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	});
}

function codiShrRead(codi_shr_seq){
	$("#shrFrm").append("<input type='hidden' name='codi_shr_seq' id='codi_shr_seq' value='"+codi_shr_seq+"'>");
	$("#shrFrm").attr({action:'/codiShrRead.do', method:'post'}).submit();
}

//초기화
function reset(){
	$("#oneDatepicker").val('');
	$("#twoDatepicker").val('');
	$("#searchContent").val('');
	$("#search_category").html("회원 ID <span class='caret'></span>");
	$("input[name=searchCondition1]").val("mem_id");
	
}