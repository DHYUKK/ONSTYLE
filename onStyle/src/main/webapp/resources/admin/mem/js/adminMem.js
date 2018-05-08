function searchPaging(page){
	var formData = $("#reqstFrm").serialize();
	formData += "&currentPageNo="+page;
	$.ajax({
		type : "POST",
		url : "/adminMemList.do",
		data : formData,
		success : function(data){
			$("#memtList").html(data);
		},
		error:function(xhr,status,error){ 
			alert("$");
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	});
}

function adminMemRead(mseq,page){
	$("#reqstFrm").append("<input type='hidden' name='mem_seq' id='mem_seq' value='"+mseq+"'>");
	$("#reqstFrm").append("<input type='hidden' name='currentPageNo' id='currentPageNo' value='"+page+"'>");
	document.reqstFrm.action="/adminMemRead.do";
	document.reqstFrm.submit();
		
	
}

function reset(){
	$("#searchCondition1").val('mem_id');
	$("#searchContent").val('');
	
	var formData = $("#reqstFrm").serialize();
	formData += "&currentPageNo=1";
	$.ajax({
		type : "POST",
		url : "/adminMemList.do",
		data : formData,
		success : function(data){
			$("#memtList").html(data);
		},
		error:function(xhr,status,error){ 
			alert("$");
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
		}
	});
}
function size(){
 	$('#size').toggleClass("hide");
 		
	if($('#sizeTap').text() == "펼치기"){
		$('#sizeTap').text("접기");
	}
	else {
		$('#sizeTap').text("펼치기");
	}				
 }

function returnList(){
	$("#reqstFrm").attr({action:'/adminMem.do', method:'post'}).submit();
}