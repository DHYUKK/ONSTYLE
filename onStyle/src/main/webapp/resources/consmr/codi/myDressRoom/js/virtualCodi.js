	var leftIdCheck = new Array();

	function create_id_code(img_src, cloth_seq){
		var bigGroup=$("input[name=bigGroup]").val();	//나의옷인지 미스봄상품인지 구별하기 위함
		var bigCode = bigGroup.substring(0,1)
		var id_code = bigCode+cloth_seq;

		//중복선택 막기 위한 조건
		for(i=0;i<leftIdCheck.length;i++){
			if (leftIdCheck[i]==id_code){
				return false;
			}
		}
		leftIdCheck.push(id_code);		//중복선택을 막기위해 선택한 옷 배열에 추가
		item_info_display_on(bigCode, cloth_seq);
		img_click(img_src, cloth_seq, id_code);
	}

	var idCheck = new Array();
	var shoesBagOffset = 0;
	// 상품 리스트에서 상품 클릭시 캔버스에 상품 생성 
	function img_click(img_src, cloth_seq, id_code){
		var cloth_id = "cloth_id"+id_code;
		//중복선택 막기 위한 조건
		for(i=0;i<idCheck.length;i++){
			if (idCheck[i]==cloth_id){
				return false;
			}
		}
		idCheck.push(cloth_id);		//중복선택을 막기위해 선택한 옷 배열에 추가
		//카테고리별 옷 위치
		if(id_code.substring(0,1)=="m"){
			var myCategory = $("#myCategory").val();
			switch (myCategory){
			case '1'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");
							break;
			
			case '2'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:265px; left:304px;'>"
							+"");
							break;
						
			case '3'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");
							break;
						
			case '4'  : 	if(shoesBagOffset==0){
								$('#canvas').append(""
								+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:125px; position:absolute; overflow:hidden; top:260px; left:450px;'>"
								+"");
								shoesBagOffset = 1;
							} else {
								$('#canvas').append(""
								+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:125px; position:absolute; overflow:hidden; top:330px; left:450px;'>"
								+"");
								shoesBagOffset = 0;
							}
							break;
							
			case '5'  : 	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");
							break;
			}
		} else{
			var prodctCategory = $("#prodctCategory").val();
			switch (prodctCategory){
			case '1'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");	
							break;
			
			case '2'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:265px; left:304px;'>"
							+"");
							break;
						
			case '3'	:	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");
							break;
						
			case '4'  : 	if(shoesBagOffset==0){
								$('#canvas').append(""
								+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:125px; position:absolute; overflow:hidden; top:260px; left:450px;'>"
								+"");
								shoesBagOffset = 1;
							} else {
								$('#canvas').append(""
								+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:125px; position:absolute; overflow:hidden; top:330px; left:450px;'>"
								+"");
								shoesBagOffset = 0;
							}
							break;
							
			case '5'  : 	$('#canvas').append(""
							+"<img class='in_canvas' id='"+cloth_id+"' src='"+img_src+"' style='width:200px; position:absolute; overflow:hidden; top:130px; left:312px;'>"
							+"");
							break;
			}
		}
		
		
		canvas_in_product(cloth_id, cloth_seq, img_src);		
	}
	
	var index = 0;				//배열 index
	var canvas_img_seq = [];	//옷 seq
	var canvas_img_src = [];	//옷 이미지 경로
	var preSelectedCloth = null;		//좌측의 선택된 옷 구분
	// 캔버스 안에서 상품 이동
	function canvas_in_product(id, seq, img_src){
		
		canvas_img_seq[index] = id.substring(8);
		canvas_img_src[index] = img_src;
		index++
		$("#"+id).on('click', function(e) {
			//좌측에 선택한 옷 리스트 흰배경으로 나타내기 위함
			var selectedCloth = id.substring(8);
			$("#"+preSelectedCloth).removeAttr("class");
			$("#"+selectedCloth).attr("class","item_info");
			preSelectedCloth = selectedCloth;
			
			$("#layer_down").attr('onclick', 'javascript:layer_down("'+id+'", "'+img_src+'", "'+seq+'")');
			$("#layer_up").attr('onclick', 'javascript:layer_up("'+id+'", "'+img_src+'", "'+seq+'")');
			$("#layer_plus").attr('onclick', 'javascript:layer_plus("'+id+'")');
			$("#layer_minus").attr('onclick', 'javascript:layer_minus("'+id+'")');
			$("#layer_delete").attr('onclick', 'javascript:layer_delete("'+id+'", "'+img_src+'")');
		});
		 
		$("#"+id).draggable({
			 containment : 'parent' // 부모요소 안에 종속
		});
	}
	
	// 캔버스에서 상품 클릭시 상품 상세정보, 확대,축소,삭제 디스플레이
	function item_info_display_on(bigGroup, seq){
		if(bigGroup=="m"){
			formData = "myCloth_seq="+seq+"&bigGroup=myCloth";
		} else if(bigGroup=="p"){
			formData = "prodct_seq="+seq+"&bigGroup=prodct";	
		}

		$.ajax({
			type : "POST",
			url : "/selectedClothRead.do", 
			data : formData,	  
			success : function(data){	
				var bigGroup = data.bigGroup.substring(0,1);
				if(bigGroup=="m"){
					var myClothInfo = "<tbody id='"+(bigGroup+seq)+"'>"
					myClothInfo		+= "<tr>"
					myClothInfo		+= "<td><img style='max-width: 70%;' src="+data.myCloth_img_route+"></td>"
					myClothInfo		+= "</tr>"
					myClothInfo		+= "</tbody>";
					$("#item_thumb").append(myClothInfo);
					
				} else if(bigGroup=="p"){
					var prodctInfo =	"<tbody id='"+(bigGroup+seq)+"' onclick='prodct_read("+data.prodct_seq+")' style='cursor:pointer'>"
					prodctInfo		+= "<tr>"
					prodctInfo		+= "<td><img style='max-width: 70%;' src="+data.transparent_img_route+"></td>"
					prodctInfo		+= "</tr>";
					prodctInfo		+= "<tr>"
					prodctInfo		+= "<td>"+data.prodct_nme+"</td>"
					prodctInfo		+= "</tr>";
					prodctInfo		+= "<tr>"
					prodctInfo		+= "<td>"+data.prodct_price+"</td>"
					prodctInfo		+= "</tr>"
					prodctInfo		+= "</tbody>";
				
				$("#item_thumb").append(prodctInfo);
				}
			},
			error:function(xhr,status,error){ 
				 alert("$");
				 alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
			}
		});
	}
	
	//맨 아래로
	function layer_down(id, img_src, seq){
		var finalSeq = new Array();
		var finalSrc = new Array();
		var selectedSeq = new Array();
		var selectedSrc = new Array();
		var elseSeq = new Array();
		var elseSrc= new Array();
		var top = new Array();
		var left = new Array();
		var width = new Array();
		
		//선택한 옷과 나머지 옷을 순서대로 배열에 나눠 담기
		for(var i=0 ; i<canvas_img_seq.length; i++){
			if(id.substring(8) == canvas_img_seq[i])
			{
				selectedSeq.push(canvas_img_seq[i]);
				selectedSrc.push(canvas_img_src[i]);
			}
			else{
				elseSeq.push(canvas_img_seq[i]);
				elseSrc.push(canvas_img_src[i]);
				
			}
		}
		finalSeq = selectedSeq.concat(elseSeq); // 선택한 옷 >> 나머지 옷 순서로 옷 seq 담기
		finalSrc = selectedSrc.concat(elseSrc); // 선택한 옷 >> 나머지 옷 순서로 이미지 src 담기
		

		//변경 전 위치 값 가져오기		
		for (var i=0; i<finalSeq.length; i++){
			top.push($("#cloth_id"+finalSeq[i]).css('top'));
			left.push($("#cloth_id"+finalSeq[i]).css('left'));
			width.push($("#cloth_id"+finalSeq[i]).css('width'));
		}
		
		$(".in_canvas").remove();
		for(var i=0 ; i<finalSeq.length; i++)
		{
			if(i == 0)
			{
				index = 0;
				canvas_img_seq = [];
				canvas_img_src = [];
				idCheck = [];
			}
			
			var id_code = finalSeq[i];
			var cloth_seq = finalSeq[i].substring(1);
			var img_src = finalSrc[i];
			
			img_click(img_src, cloth_seq, id_code);
			
			$("#cloth_id"+finalSeq[i]).css('top',top[i]);
			$("#cloth_id"+finalSeq[i]).css('left',left[i]);
			$("#cloth_id"+finalSeq[i]).css('width',width[i]);
		}						
	}
	
	//맨 위로
	function layer_up(id, img_src, seq){
		var finalSeq = new Array();
		var finalSrc = new Array();
		var selectedSeq = new Array();
		var selectedSrc = new Array();
		var elseSeq = new Array();
		var elseSrc= new Array();
		var top = new Array();
		var left = new Array();
		var width = new Array();
		
		//선택한 옷과 나머지 옷을 순서대로 배열에 나눠 담기
		for(var i=0 ; i<canvas_img_seq.length; i++){
			if(id.substring(8) == canvas_img_seq[i]){
				selectedSeq.push(canvas_img_seq[i]);
				selectedSrc.push(canvas_img_src[i]);
			}
			else{
				elseSeq.push(canvas_img_seq[i]);
				elseSrc.push(canvas_img_src[i]);
			}
		}
		finalSeq = elseSeq.concat(selectedSeq); // 나머지 옷 >> 선택한 옷 순서로 옷 seq 담기
		finalSrc = elseSrc.concat(selectedSrc); // 나머지 옷 >> 선택한 옷 순서로 이미지 src 담기
		
		//변경 전 위치 값 가져오기		
		for (var i=0; i<finalSeq.length; i++){
			top.push($("#cloth_id"+finalSeq[i]).css('top'));
			left.push($("#cloth_id"+finalSeq[i]).css('left'));
			width.push($("#cloth_id"+finalSeq[i]).css('width'));
		}
		
		$(".in_canvas").remove();
		for(var i=0 ; i<finalSeq.length; i++)
		{
			if(i == 0)
			{
				index = 0;
				canvas_img_seq = [];
				canvas_img_src = [];
				idCheck = [];
			}
			
			var id_code = finalSeq[i];
			var cloth_seq = finalSeq[i].substring(1);
			var img_src = finalSrc[i];
			
			img_click(img_src, cloth_seq, id_code);
			
			$("#cloth_id"+finalSeq[i]).css('top',top[i]);
			$("#cloth_id"+finalSeq[i]).css('left',left[i]);
			$("#cloth_id"+finalSeq[i]).css('width',width[i]);
		}
		
	}
	function layer_plus(id){
		$("#"+id).width($("#"+id).width()*(1 + 5 / 100)); // width나 height 중에 하나만 건드려야 비율에 맞게 확대 or 축소 됨
		$("#"+id).height($("#"+id).height()*(1 + 5 / 100)); // width나 height 중에 하나만 건드려야 비율에 맞게 확대 or 축소 됨
		
	}
	function layer_minus(id){
		$("#"+id).width($("#"+id).width()*(1 - 5 / 100)); // width나 height 중에 하나만 건드려야 비율에 맞게 확대 or 축소 됨
		$("#"+id).height($("#"+id).height()*(1 - 5 / 100));
	}
	function layer_delete(id, img_src){
		var id_code=id.substring(8);
		idCheck.splice(idCheck.indexOf(id),1);
		leftIdCheck.splice(leftIdCheck.indexOf(id_code),1);
		canvas_img_seq.splice(canvas_img_seq.indexOf(id_code),1);
		canvas_img_src.splice(canvas_img_src.indexOf(img_src),1);
		index--;
		$("#"+id).remove();			//캔버스에서 제거
		$("#"+id_code).remove();	//선택했던 옷 정보에서 제거
	}
	function layer_allDelete(){
		$("#item_thumb").empty();
		$(".in_canvas").remove();
		leftIdCheck = [];
		idCheck = [];
		index = 0;
		shoesBagOffset = 0;
		canvas_img_seq = [];
		canvas_img_src = [];
	}
	
	//코디저장
	function  saveCodi(type){
		var canvas ="";
		var canvas_top = 0;
		var canvas_left = 0;
		var canvas_right = 0;
		var canvas_bottom = 0;
		var x = new Array();
		var y = new Array();
		var width = new Array();
		var canvasStyle;
		
		//완성된 코디 가로,세로 길이 구하기
		for(i=0;i<canvas_img_seq.length;i++){
			var id_code = canvas_img_seq[i]
			var position = $("#cloth_id"+id_code).position();
			x.push($("#cloth_id"+id_code).css('top'));
			y.push($("#cloth_id"+id_code).css('left'));
			width.push($("#cloth_id"+id_code).css('width')); 
			
			if(canvas_top >= position.top || canvas_top==0){
				canvas_top = position.top;
			}
			if(canvas_left >= position.left || canvas_left==0){
				canvas_left = position.left;
			}
			if(canvas_bottom <= (position.top+$("#cloth_id"+id_code).height())){
				canvas_bottom = (position.top+$("#cloth_id"+id_code).height())
			}
			if(canvas_right <= (position.left+$("#cloth_id"+id_code).width())){
				canvas_right = (position.left+$("#cloth_id"+id_code).width())
			}
		}
		var canvas_width = (canvas_right - canvas_left);
		var canvas_height = (canvas_bottom - canvas_top);
		
		//id=canvas인 DIV를 코디 크기에 맞게 가로,세로,높이 설정
		canvasStyle=$("#canvas").attr('style');
		$("#canvas").attr('style','position:absolute; width:'+canvas_width+'px; height:'+canvas_height+'px;');
		//멘트 입력란이 함께 캡쳐되길래 #canvas에서 잠시 삭제
		$("#mentBox").css("display","none");
		//코디를 canvas가 위치한 곳으로 잠시 이동
		for(i=0;i<canvas_img_seq.length;i++){
			var id = canvas_img_seq[i];
			
			var position_top = $("#cloth_id"+id).position().top;
			var position_left = $("#cloth_id"+id).position().left;
			var ceilTop = Math.ceil(position_top);
			var ceilLeft = Math.ceil(position_left);
			var ceilCanvas_top= Math.ceil(canvas_top);
			var ceilCanvas_left= Math.ceil(canvas_left);
			
			var top = ((ceilTop)-(ceilCanvas_top));
			var left = ((ceilLeft)-(ceilCanvas_left));
			
			$("#cloth_id"+id).css('top',top);
			$("#cloth_id"+id).css('left',left);
		}
		html2canvas($("#canvas"), {
		onrendered: function(canvas) {
			$("input[type=hidden][name=codi_img_route]").val(canvas.toDataURL("image/png"));
			var formData = $("#codiInsertForm").serialize();
			$("#canvas").attr('style',canvasStyle);
			
			//잠시 이동했던 옷들 원위치
			for(i=0;i<canvas_img_seq.length;i++){
				var id_code = canvas_img_seq[i]
				$("#cloth_id"+id_code).css('top',x[i]);
				$("#cloth_id"+id_code).css('left',y[i]);
				$("#cloth_id"+id_code).css('width',width[i]);
			}
			formData += "&xpoint_list="+x+"&ypoint_list="+y+"&width_list="+width+"&canvas_img_seq="+canvas_img_seq+"&codiSaveType="+type;
			$.ajax({
					type : "POST",
					url : "/insertCodi.do",
					data : formData,		
					success : function(codi_seq){
						//type >> 0:사용자가 코디 요청, 1:내가 직접 만든 코디 , 2:답변받은 코디, 3:내가 만든 코디 수정, 4:관리자 코디 답변
						switch (type) {
							case 1	:	alert("코디가 저장 되었습니다.");
										break;
							
							case 3	:	alert("수정이 완료 되었습니다.");
										
										if($("input[name=readPageNme]").val()=="mycloth"){
											$("#codiInsertForm").attr({action:'/codiRead.do', method:'post'}).submit();
										} else if($("input[name=readPageNme]").val()=="reqst"){
											location.href = '/reqstRead.do?codi_reqst_seq='+$("input[name=codi_reqst_seq]").val();
										} else if($("input[name=readPageNme]").val()=="answr"){
											location.href = '/adminCodiReqstRead.do?codi_reqst_seq='+$("input[name=codi_reqst_seq]").val();
										}
										
										break;
										
							case 4	:	alert("답변완료");
										location.href = '/adminCodiReqst.do';
										break;
										
							case 0  : 	alert("코디요청이 접수 되었습니다.");
										location.href = '/reqstbreakdwn.do';
										break;
						}
					},
					error:function(xhr,status,error){ 
						 alert("$");
						 alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
					}
			  });
	  
		}
		});
	}

	//마우스 휠
	// onmousewheel='clothSize(this)'
//	function clothSize(id){
//		event.stopPropagation();
//		var zoom=parseInt(id.style.zoom,10)||100;
//		zoom+=event.wheelDelta/12;
//		if (zoom>0) id.style.zoom=zoom+'%';
//		return false;
//	}