<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>행사 등록</title>

<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- JSTree 관련 파일들 -->
<script src="/resources/admin/prodct/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/admin/prodct/js/jstree/themes/proton/style.min.css">
<script src="/resources/admin/prodct/js/jstree/jstree.min.js" charset="utf-8"></script>

<!-- 달력관련 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />
<script src=/resources/admin/calendar.js></script>

<!-- Table 행 바꾸는 JS -->
<script src="/resources/admin/prodct/js/jquery-tablednd.js" type="text/javascript" charset="utf-8"></script>

<script>

$(document).ready(function(){
	var display_c = "";
	p_selectList();
	
	//체크박스 전체선택
   $("#check").click(function(){ 
	     var check = $("#check").is(":checked");
	         if(check == true){
	           $("input[name=check]:checkbox").prop("checked", true);
	        }
	        else{
	           $("input[name=check]:checkbox").prop("checked", false);
	        }
   });
	
   $(window).bind('beforeunload', function(){
		$.ajax({
		url: "/delete_yet_sale.do",
		data: "sale_true=P",
		cache:"false",
		type: "POST",
		async:false,
		error:function(xhr,status,error){ 
			alert("팝업 닫을 시 오류")
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		}
		})
	})
})

	function backHome(){
		window.location = "/store.do"
	}
	
	function plusProduct(){
		
		if($("#oneDatepicker").val()==""){
			$("#oneDatepicker").focus();
			alert("시작 날짜를 선택해주세요.");
			return
		}else if($("#twoDatepicker").val()==""){
			$("#twoDatepicker").focus();
			alert("종료 날짜를 선택해주세요.");
			return
		}
		
		var childWindow;
		var popUrl = "/popUp_product.do?sale_start_date="+$("#oneDatepicker").val()+"&sale_end_date="+$("#twoDatepicker").val();
		var popupName= "상품 분류 수정";
		var width = 1000;
		var height = 500;
		var leftPosition = (screen.width/2) - (width/2);
		leftPosition += window.screenLeft;//듀얼 모니터일때
		var topPosition = (screen.height/2) - (height/2);
		childWindow = window.open(popUrl, popupName, "left="+leftPosition+", top="+topPosition+", toolbar=no, scrollbars=yes, location=no, directories=no, scrollbars=no, resizable=no, width="+width+", height="+height);
		  
		if(childWindow == null) {//만약 팝업 차단으로 팝업창이 나타나지 않을 경우
			alert("팝업차단을 해제해주세요!");
		}
		else{
		    childWindow.focus();
		}
	}
	
	function if_zero(a){
		if(a > 0){
			display_c = "O";
		}
		if(a < 1){
			display_c = "X";
		}
		return display_c;
	}
	
	function p_selectList(){
		$.ajax({
			url:"/p_selectList.do",
			type: "POST",
			success : function(List){
				$("#p_list tr:not(:first)").remove();
				if(List ==""){
					$("#p_list").append(
						"<tr>"
		         			+"<td colspan='8' style='height:50px;border-bottom:1px solid #BDBDBD;font-size:1em;vertical-align:middle;'>"
		         				+"하나 이상의 상품을 등록하십시오.&nbsp;&nbsp;<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>"
		         			+"</td>"
		         		+"</tr>"	
					)
				}
	            $.each(List, function(i, vo){
	            	var confirm_d = if_zero(vo.disply_seq);
	               $("#p_list").append(
	               		'<tr id="'+vo.prodct_seq+'">'
	               			+"<td style='vertical-align:middle;'><input type='checkbox' name='check' value="+vo.prodct_seq+"></td>"
	               			+'<td style="vertical-align:middle;">'+vo.prodct_seq+'</td>'
	               			+'<td style="vertical-align:middle;"><img style="width:100px; height:100px;" src="'+vo.prodct_img_route1+'"></td>'
	               			+'<td style="vertical-align:middle;">'+vo.prodct_nme+'</td>'
	               			+'<td style="vertical-align:middle;">'+confirm_d+'</td>'
	               			+'<td style="vertical-align:middle;">'+vo.prodct_price+'</td>'
	               			+'<td style="vertical-align:middle;">'+vo.sale_bridge_discntrate+'%</td>'
	               			+'<td style="vertical-align:middle;">'+vo.prodct_price*(100 - vo.sale_bridge_discntrate)/100+'</td>'
	               		+'</tr>'
	               );
	            })
			},
			error:function(xhr,status,error)
		      { //ajax 오류인경우  
		         alert("p 상태 리스트 조회 오류");
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		      }
		})
	}
	
	//할인율 
	function sale_percentage(){
		var group = [];
		
		   //체크박스 중 체크된 체크박스만 가져와서 Loop
	    $("input:checkbox[name=check]:checked").each(function(i,elements){
	       group.push($(this).val());
	    });
	    if(group.length==0){
	        alert("1개 이상 체크해주세요.");
	        return;
	    }
	    var sale_per = $("#sale_text").val();
		var formData = "group="+group+"&sale_bridge_discntrate="+sale_per;
		
		if($("sale_per").val()==""){
			alert("숫자를 입력해 주십시오.");
			$("#sale_text").focus();
	        return;
		}
		
		$.ajax({
			url : "/sale_percentage.do",
			data: formData,
			type: "POST",
			success: function(){
				p_selectList();
			},
			error:function(xhr,status,error)
		      { //ajax 오류인경우  
		         alert("p 상태 리스트 조회 오류");
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		      }
		})
	}
	
	//p list 에서 체크 상품 삭제하기
	function delete_pList(){
		var group = [];
		
		   //체크박스 중 체크된 체크박스만 가져와서 Loop
	    $("input:checkbox[name=check]:checked").each(function(i,elements){
	       group.push($(this).val());
	    });
	    if(group.length==0){
	        alert("1개 이상 체크해주세요.");
	        return;
	    }
	    
	    var formData = "group="+group+"&sale_true=P";
	    
	    $.ajax({
	    	url:"/delete_check_sale.do",
	    	type: "POST",
	    	data: formData,
	    	success: function(){
	    		p_selectList();
	    	},
	    	error:function(xhr,status,error)
		      { //ajax 오류인경우  
		         alert("p 리스트 삭제 오류");
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		      }
	    	
	    })
	}
	
	//행사 등록
	function update_sale(){
		var group = [];
		$("input:checkbox[name=check]").each(function(i,elements){
		       group.push($(this).val());
		    });
		    if(group.length==0){
		        alert("1개 이상 체크해주세요.");
		        return;
		    }
		
		if($("#sale_nme").val() == ""){
			$("#sale_nme").focus();
			alert("행사명을 입력해주세요.");
			return
		}else if($("#oneDatepicker").val()==""){
			$("#oneDatepicker").focus();
			alert("시작 날짜를 선택해주세요.");
			return
		}else if($("#twoDatepicker").val()==""){
			$("#twoDatepicker").focus();
			alert("종료 날짜를 선택해주세요.");
			return
		}else if(group.length==0){
	        alert("상품을 1개 이상  추가 해주세요.");
	        return;
	    }
		
		
		var formData = "sale_start_date="+$("#oneDatepicker").val()+"&sale_end_date="+$("#twoDatepicker").val()+"&sale_nme="+$("#sale_nme").val()
		
		$.ajax({
			url: "/update_sale.do",
			type: "POST",
			success: function(){
				$.ajax({
					url:"/insert_sale.do",
					data: formData,
					type:"POST",
					success: function(){
						window.location = "/store.do"		
					},
					error:function(xhr,status,error)
				      { //ajax 오류인경우  
				         alert("sale 등록 오류");
				         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
				      }
				})				
			},
			error:function(xhr,status,error)
		      { //ajax 오류인경우  
		         alert("Y 업데이트 오류");
		         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
		      }
		})
	}
</script>

</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=5"/>
	</div>
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
		
      <div class="row">
         <div class="col-md-12">
            <h4>행사 등록</h4>
            <br>         
         </div>
   
         <div class="col-md-12" style="height:153px;">
            <form name="searchDisplyProdct">
               <table class="table" id="searchTable" style="border:1px solid #e0e0e0; text-align:center; width:100%;">
                  <tr>
                     <td class="active" style="width:15%;"><h6>배너 이미지</h6></td>
                     <td align=left>
						<input type="file">
                     </td>
                  </tr>
                  <tr>
                     <td class="active">행사명</td>
                     <td colspan=3 align=left>
                     	<input type="text" id="sale_nme" class="form-control" style="width:70%">
                     </td>
                  </tr>
                  <tr>
                     <td class="active" style="height:100%">기간</td>
                     <td align=left>
                        <input type="text" id="oneDatepicker" name="oneDatepicker"> &nbsp;&nbsp; ~ &nbsp;&nbsp;
						<input type="text" id="twoDatepicker" name="twoDatepicker">
                     </td>
                  </tr>
               </table>
            </form>
         </div>
         
         
         <div class="col-md-12" style="margin-top:3%">
            <h4>상품 리스트</h4>
         </div>
         
<!--          표를 만들어야 해요~~~~~~ -->
         <div class="col-md-12">
         	<div align=right class="form-inline">
         		전체할인율(%)&nbsp;&nbsp;<input type="text" id="sale_text" class="form-control">&nbsp;&nbsp;<button class="btn btn-default" onclick="sale_percentage()">일괄 적용</button>&nbsp;&nbsp;<button class="btn btn-default" onclick="plusProduct()">상품추가</button>&nbsp;&nbsp;<button class="btn btn-default" onclick="delete_pList()">상품삭제</button>
         	</div>
         	<div style="width:100%;overflow-y:auto;max-height:500px">
	         	<table class="table" id="p_list" style="text-align:center;margin-top:1%;vertical-align:middle;">
	         		<tr>
	         			<td class="active"> <input type="checkbox" id="check"> </td>
	         			<td class="active"> 상품코드 </td>
	         			<td class="active"> 이미지 </td>
	         			<td class="active"> 상품명 </td>
	         			<td class="active"> 진열 여부 </td>
	         			<td class="active"> 판매가 </td>
	         			<td class="active"> 할인율 </td>
	         			<td class="active"> 세일가 </td>
	         		</tr>
	         	</table>
         	</div>
         </div>
             
         <!-- 버튼들 -->
		 <div class="col-md-12">
	         <div class="col-md-12" style="text-align:center; padding-top:1%;">
	            <input type="button" class="btn btn-info" value="등록" onclick="update_sale()"> 
	            <input type="button" class="btn btn-default" style="margin-left:1%;" value="취소" onclick="backHome()">
	         </div>
         </div>
      </div>
	</div>
</body>
</html>