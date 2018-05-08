$(document).ready(function(){
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
});
function shrDelete(seq){
	var wheather = confirm("해당 게시물을 삭제하시겠습니까?");
	if(wheather == true){
		$("#shrReadFrm").attr({action:'/adminShrDelete.do', method:'POST'}).submit();
	}
}
//상품 상세조회
function prodct_read(prodct_seq){
    window.location.href = "/prodctUpdatePage.do?prodct_seq="+prodct_seq;
}

//댓글 삭제
function adminDeleteReply(replySeq){
	var codi_shr_seq = $("input[name=shrCheckGroup]").val();
	window.location.href="/adminDeleteReply.do?codi_reply_seq="+replySeq+"&codi_shr_seq="+codi_shr_seq;
}

//다른 코디 조회
function viewOther(o){
	window.location.href="/codiShrRead.do?codi_shr_seq="+o;
}

//댓글 더보기
function moreReply(){
	var currentPageNo = Number($("#currentPageNo").val());					//현재 페이지
	var totalPageCount = Number($("#totalPageCount").val());				//총 페이지 수
	
	$("#currentPageNo").val(currentPageNo+1);								
	$("#firstRecordIndex").val(Number($("#firstRecordIndex").val())+5);
	
	var totalRecordCount = $("#totalRecordCount").val();
	var firstRecordIndex = Number($("#firstRecordIndex").val());
	
	var formData = $("#replyFrm").serialize();
	formData += "&codi_shr_seq="+$("input[name=shrCheckGroup]").val();
	if(firstRecordIndex < totalRecordCount){
	$.ajax({
		type : "POST",
		url : "/moreReply.do",
		data : formData,
		success : function(data){

			$.each(data, function(i, vo){
				var output = '';
				output += '<tr>'; 
				output += '<td style="padding:5px 5px; width: 10%;"><img class="mem_profile" src="'+ vo.mem_img_route +'" data-toggle="tooltip" data-placement="bottom" title="'+vo.mem_nicknme+'" style="width: 50px; height: 50px;"></td>';
				output += '<td style="vertical-align: middle; text-align: left; font-size:17px; width: 85%;">'+ vo.codi_reply_contnt+'</td>';
				output += '<td style="vertical-align: middle; width: 5%">';
				output += '<input type="hidden" value="'+vo.mem_seq+'" id="mem_seq">';
				output += '<button class="btn btn-default" onclick="adminDeleteReply('+vo.codi_reply_seq+')">삭제</button></td>';
				output += '</tr>';
 				$("#replyList").append(output);
			})
			
			$("#replyInfo").html("<b>댓글 더보기("+(currentPageNo+1)+"/"+totalPageCount+")</b>");
			$(function () {
				$('[data-toggle="tooltip"]').tooltip()
			})
		},
		error:function(xhr,status,error)
		    { //ajax 오류인경우  
		      alert("error");
		      alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		   }
	});
	} else {
		alert("조회할 댓글이 없습니다.")
	}
}

function back(){
	$("#pageSearchFrm").attr({action:'/adminCodiShr.do', method:'post'}).submit();
}