var delMode = 0;	//1 = 삭제 모드
var shrMode = 0;	//1 = 공유 모드
var selectedCodiSeq = new Array();	//코디seq
var arSeq = new Array();				//코디seq 또는 코디공유seq
var arShr_state = new Array();		//공유코디인지 아닌지 y or n
var title = "";						//페이지 이름
$(document).ready(function() {

	//삭제버튼
	$("#delete").on('click', function(e) {
		delMode=1;	
		title = $("#title").text();
		$("#title").text("삭제할 코디를 선택해 주세요.");
		$(".codi").closest("a").removeAttr('href');
		$("#share").css('display','none');
		$("#delete").css('display','none');
		$("#deleteCodi").css('display','block');
		$("#cancel").css('display','block');
		
	});	
	
	//공유버튼
	$("#share").on('click', function(e) {	
		shrMode=1;
		title = $("#title").text();
		$("#title").text("공유할 코디를 선택해 주세요.");
		$(".codi").closest("a").removeAttr('href');
		$("#share").css('display','none');
		$("#delete").css('display','none');
		$("#insertShare").css('display','block');
		$("#cancel").css('display','block');
	});	
	
	//스크랩취소 버튼
	$("#scrapCancel").on('click', function(e) {	
		delMode=1;
		title = $("#title").text();
		$("#title").text("삭제할 코디를 선택해 주세요.");
		$(".codi").closest("a").removeAttr('href');
		$("#scrapCancel").css('display','none');
		$("#ClearScrapCancel").css('display','block');
		$("#cancel").css('display','block');
	}); 
	
	
	//공유완료버튼
	$("#insertShare").on('click', function(e) {
		if(selectedCodiSeq.length==0){
				alert("1개 이상 체크해주세요.");
				return;
		}
		var formData = $("#codiListForm").serialize();
		formData += "&selectedCodiSeq="+selectedCodiSeq; //페이징 정보도 포함해서 보내기
		var wheather = confirm(selectedCodiSeq.length+"개의 코디를 공유하시겠습니까?");
		if(wheather==true){
		$.ajax({
				type : "POST",
				url : "/shrCodi.do", 
				data : formData,	
				success : function(data){
					$("#codiList").html(data);
					
					$("#title").text(title);
					$("#deleteCodi").css('display','none');
					$("#insertShare").css('display','none');
					$("#cancel").css('display','none');
					$("#share").css('display','block');
					$("#delete").css('display','block');
					$(".codi").closest('a').attr('href','#');
					shrMode=0;
					selectedCodiSeq = [];
					arSeq = [];
					arShr_state = [];
				},
				error:function(xhr,status,error){ 
					 alert("$");
					 alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
		});
		} else{
			return;
		}
	});	
	
	//삭제완료버튼
	$("#deleteCodi").on('click', function(e) {
		if(selectedCodiSeq.length==0){
			alert("1개 이상 체크해주세요.");
			return;
		}
		var formData = $("#codiListForm").serialize();
		formData += "&selectedCodiSeq="+selectedCodiSeq; //페이징 정보도 포함해서 보내기, pageCode도
		var wheather = confirm(selectedCodiSeq.length+"개의 코디를 삭제하시겠습니까?");
		if(wheather==true){
		$.ajax({
			type : "POST",
			url : "/deleteCodi.do", 
			data : formData,	
			success : function(data){
				$("#codiList").html(data);
					
				$("#title").text(title);
				$("#deleteCodi").css('display','none');
				$("#insertShare").css('display','none');
				$("#cancel").css('display','none');
				$("#share").css('display','block');
				$("#delete").css('display','block');
				$(".codi").closest('a').attr('href','#');
				delMode=0;
				selectedCodiSeq = [];
				arSeq = [];
				arShr_state = [];
			},
			error:function(xhr,status,error){ 
				alert("$");
				alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
		} else{
			return;
		}
		
	});	
	
	//스크랩 취소 완료 버튼
	$("#ClearScrapCancel").on('click', function(e) {
		if(selectedCodiSeq.length==0){
				alert("1개 이상 체크해주세요.");
				return;
		}
		var formData = $("#codiListForm").serialize();
		formData += "&selectedCodiSeq="+selectedCodiSeq; //페이징 정보도 포함해서 보내기
		var wheather = confirm(selectedCodiSeq.length+"개의 스크랩 코디를 삭제하시겠습니까?");
		if(wheather==true){
		$.ajax({
				type : "POST",
				url : "/scrapCancel.do", 
				data : formData,	
				success : function(data){
					$("#codiList").html(data);

					$("#title").text(title);
					$(".codi").closest("a").removeAttr('href');
					$("#scrapCancel").css('display','block');
					$("#ClearScrapCancel").css('display','none');
					$("#cancel").css('display','none');
					
					delMode=0;
					selectedCodiSeq = [];
					arSeq = [];
					arShr_state = [];
				},
				error:function(xhr,status,error){ 
					 alert("$");
					 alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
		});
		} else{
			return;
		}
		
	});	
	//취소버튼
	$("#cancel").on('click', function(e) {	 
		//선택했던 코디의 onclick 속성을 원래대로 돌림
		for(var i=0;i<selectedCodiSeq.length; i++){
			$("#codi_img"+selectedCodiSeq[i]).attr('onclick','codi_click('+arSeq[i]+','+selectedCodiSeq[i]+',"'+arShr_state[i]+'")');	
		}
		
		$(".selected").remove();
		$("#title").text(title);
		$("#ClearScrapCancel").css('display','none');
		$("#deleteCodi").css('display','none');
		$("#insertShare").css('display','none');
		$("#cancel").css('display','none');
		$("#scrapCancel").css('display','block');
		$("#share").css('display','block');
		$("#delete").css('display','block');
		$(".codi").closest('a').attr('href','#');
		delMode=0;
		shrMode=0;
		arSeq = [];
		selectedCodiSeq = [];
		arShr_state = [];
	});	
});
	
	function like_click(codi_shr_seq){
		formData = "codi_shr_seq="+codi_shr_seq;
		$.ajax({
			type: "POST",
			url: "/like.do",
			data : formData,
			success: function(data){
				if(data.liked == 1){
					$("#like"+codi_shr_seq).html("<img onclick='like_click("+codi_shr_seq+")' class='like' src='resources/consmr/codi/codiShr/img/like/liked.png'>");
				}
				else {
					$("#like"+codi_shr_seq).html("<img onclick='like_click("+codi_shr_seq+")' class='like' src='resources/consmr/codi/codiShr/img/like/liking.png'>");
				}
				$.ajax({
					type: "POST",
					url: "/countLike.do",
					data: formData,
					success: function(data){
						$("#countLike"+data.codi_shr_seq).html(data.liked)	
					}
				})
			},
			error:function(xhr,status,error)
				{ //ajax 오류인경우
					alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);	 
				}
		}); 
	}
	
	function codi_click(seq, codi_seq, shr_state){
		if(delMode==0 && shrMode==0){
			var data = $("#codiListForm").serialize();
			if(shr_state=='n'){
				window.location.href = "/codiRead.do?"+data+"&codi_seq="+seq;
			} else{
				window.location.href = "/codiView.do?"+data+"&codi_shr_seq="+seq;
			}
		} else{
			
			if(shrMode==1 && shr_state=='y'){
				alert("이미 공유된 코디 입니다.");
				return;
			}
			
			selectedCodiSeq.push(codi_seq);
			arSeq.push(seq);
			arShr_state.push(shr_state);
			$("#codiFrame"+codi_seq).append("<div id='selected"+codi_seq+"' class='selected' onclick='click_cancel("+codi_seq+")'></div>")
		}
	}
	
	function click_cancel(codiseq){
		selectedCodiSeq.splice(selectedCodiSeq.indexOf(codiseq),1);
		$("#selected"+codiseq).remove();
	}
	
	
	function sort(sortType){
		$("input[name=selectRecordCount]").val("6");
		$("input[name=sortType]").val(sortType);
		$("input[name=currentPageNo]").val("1");
		var formData = $("#codiListForm").serialize();
		$.ajax({
			type : "POST",
			url : "/codiList.do", 
			data : formData,	
			success : function(data){
				$("#codiList").html(data);
				
				//삭제 또는 공유 중 정렬할 경우 대비 버튼 원상태로..
				$("#deleteCodi").css('display','none');
				$("#insertShare").css('display','none');
				$("#cancel").css('display','none');
				$("#share").css('display','block');
				$("#delete").css('display','block');
				$(".codi").closest('a').attr('href','#');
				delMode=0;
				shrMode=0;
				selectedCodiSeq = [];
				arSeq = [];
				arShr_state = [];
			},
			error:function(xhr,status,error){ 
					alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
	}
	
	function addCodiList(){
		var totalRecordCount = $("input[name=totalRecordCount]").val();
		var selectRecordCount = Number($("input[name=selectRecordCount]").val());
		
		
		
		if(selectRecordCount < totalRecordCount){
			$("input[name=selectRecordCount]").val(selectRecordCount+6);
			nextPage = Number($("input[name=currentPageNo]").val())+1;
			$("input[name=currentPageNo]").val(nextPage);
			var formData = $("#codiListForm").serialize();
			$.ajax({
				type : "POST",
				url : "/codiList.do", 
				data : formData,	
				success : function(data){
					$("#codiList").html(data);
				},
				error:function(xhr,status,error){ 
					alert("$");
					alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
				}
			});
		}else {
			alert("조회할 코디가 없습니다.")
		}
	}