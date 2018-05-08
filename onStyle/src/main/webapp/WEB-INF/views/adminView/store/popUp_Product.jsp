<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 분류 수정</title>
<!-- 화면 디자인에 필요한 CSS -->
<link href="/resources/consmr/main/consmrBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/resources/assets/css/custom.min.css"/>

<!-- 부트스트랩의  다양한 기능들을 구현 해놓은 js소스-->
<script src="/resources/consmr/main/consmrBootstrap/js/bootstrap.min.js"></script>
<script src="/resources/assets/js/custom.js"></script>
   
<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- JSTree 관련 파일들 -->
<script src="/resources/admin/prodct/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/admin/prodct/js/jstree/themes/proton/style.min.css">
<script src="/resources/admin/prodct/js/jstree/jstree.min.js" charset="utf-8"></script>

<script>
var prodct_seq =0;
var prodct_nme ="";
var prodct_price ="";
var category_seq = 1;
$(document).ready(function(){
	
	 var data = [            
     {
        "id" : "1",
        "parent" : "#",
        "text" : "Top"
     },
     {
        "id" : "6",
        "parent" : "1",
        "text" : "T-shirts"
     },
     {
        "id" : "7",
        "parent" : "1",
        "text" : "blouse&shirts"
     },
     {
        "id" : "8",
        "parent" : "1",
        "text" : "knit"
     },
     {
        "id" : "2",
        "parent" : "#",
        "text" : "Bottom"
     },
     {
        "id" : "9",
        "parent" : "2",
        "text" : "pants"
     },
     {
        "id" : "10",
        "parent" : "2",
        "text" : "skirts"
     },
     {
        "id" : "3",
        "parent" : "#",
        "text" : "Dress"
     },
     {
        "id" : "4",
        "parent" : "#",
        "text" : "Shoes&Bag"
     },
     {
        "id" : "5",
        "parent" : "#",
        "text" : "Outer"
     }]
     
     $('#tree').jstree({
        'plugins': ["wholerow"],
        'core' : {
           'data' : data,
              'themes' : {
                 'name' : 'proton', 
                 'responsive' : true
              }
        }
     });
	//jstree 클릭시
	   $('#tree').on("select_node.jstree", function(e, data){
		    category_seq = data.node.id;
		    left_select(category_seq);
		});
	
	//중분류 초기 값
	var firstOutput = '';
	
	left_select(1);
	
	//체크박스 전체선택
   $("#left_check").click(function(){ 
	     var check = $("#left_check").is(":checked");
	         if(check == true){
	           $("input[name=check]:checkbox").prop("checked", true);
	        }
	        else{
	           $("input[name=check]:checkbox").prop("checked", false);
	        }
   });
	//오른쪽 리시트 체크박스 전체선택
   $("#right_check").click(function(){ 
	     var check = $("#right_check").is(":checked");
	         if(check == true){
	           $("input[name=check_R]:checkbox").prop("checked", true);
	        }
	        else{
	           $("input[name=check_R]:checkbox").prop("checked", false);
	        }
 	});
	
	//팝업 닫을 시 임시로 저장된 값 지우기
   $(window).bind('beforeunload', function(){
			$.ajax({
			url: "/delete_yet_sale.do",
			data: "sale_true=N",
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
// 상품 조회
function left_select(seq){
	$.ajax({
		url: "/select_product.do",
		data:"category_seq="+seq+"&sale_start_date="+$("#sale_start_date").val()+"&sale_end_date="+$("#sale_end_date").val(),
		type: "post",
		success: function(List){
			$("#product_cell tr:not(:first)").remove(); 
            $.each(List, function(i, vo){
               $("#product_cell").append(
               		'<tr class="prodct" id="'+vo.prodct_seq+'">'
               			+"<td style='vertical-align:middle;'><input type='checkbox' name='check' value="+vo.prodct_seq+"></td>"
               			+'<td style="vertical-align:middle;">'+vo.prodct_nme+'</td>'
               			+'<td style="vertical-align:middle;">'+vo.prodct_price+'</td>'
               		+'</tr>'
               );
            })
		},
		error:function(xhr,status,error){ 
			alert("상품 조회 오류")
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		}
	})
}

//선택된 값 조회
function right_select(){
	$.ajax({
		url: "/product_check_List.do",
		type: "post",
		success: function(List){
			$("#product_selected tr:not(:first)").remove(); 
            $.each(List, function(i, vo){
               $("#product_selected").append(
               		'<tr class="prodct" id="'+vo.prodct_seq+'">'
               			+"<td style='vertical-align:middle;'><input type='checkbox' name='check_R' value="+vo.prodct_seq+"></td>"
               			+'<td style="vertical-align:middle;">'+vo.prodct_nme+'</td>'
               			+'<td style="vertical-align:middle;">'+vo.prodct_price+'</td>'
               		+'</tr>'
               );
            })
		},
		error:function(xhr,status,error){ 
			alert("상품 조회 오류")
			alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
		}
	})
};

//추가 버튼 클릭
function insert_yet_sale(){
	var group = [];
	
	//체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=check]:checked").each(function(i,elements){
       group.push($(this).val());
    });
    if(group.length==0){
        alert("1개 이상 체크해주세요.");
        return;
    }
    
	var formData = "group="+group
	
	$.ajax({
		type:"POST",
		url : "/insert_yet_sale.do",
		data : formData,
		success: function (){
			left_select(category_seq);
			right_select();
		},
		error:function(xhr,status,error)
	      { //ajax 오류인경우  
	         alert("추가 버튼 클리스 오류");
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	      }
	})
};

//제거 버튼 클릭
function delete_check_sale(){
	var group = [];
	
	//체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=check_R]:checked").each(function(i,elements){
       group.push($(this).val());
    });
    if(group.length==0){
        alert("1개 이상 체크해주세요.");
        return;
    }
    
	var formData = "group="+group+"&sale_true=N";
	
	$.ajax({
		type:"POST",
		url : "/delete_check_sale.do",
		data : formData,
		success: function (){
			left_select(category_seq);
			right_select();
		},
		error:function(xhr,status,error)
	      { //ajax 오류인경우  
	         alert("제거 버튼 클릭 오류");
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	      }
	})
};

//팝업 확인 버튼 클릭
function pop_defBtn(){	
    $.ajax({
    	url : "/pop_defBtn.do",
    	type: "POST",
    	success: function(){
    	    self.close();
    	    //부모창 상품 리스트 조회 함수 호출 
    	    opener.parent.p_selectList();
    	},
    	error:function(xhr,status,error)
	     { //ajax 오류인경우  
	        alert("팝업 확인 클릭 오류");
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
	     }
    })
}

//팝업창 닫기
function cancelPopup(){
//     window.opener.location.reload();
    self.close();
};
</script>
</head>
<body>
<div class="maincontainer">
	<input id="sale_start_date" type="hidden" value="${storeVo.sale_start_date }">
	<input id="sale_end_date" type="hidden" value="${storeVo.sale_end_date}">

	<div class="container" style="color: #fff; background-color: #000; border-radius:4px; padding:3px 8px; margin-top:1%;">
		<h4><font color="white">행사 상품 등록</font></h4>
	</div>
	
	<div class="container" id=" " style="padding-top:2%; margin:0 auto;">
		<div class="pull-left" style="display:inline-block; width:20%; height:100%;">
	    	<table class="table table-bordered">
	        	<tbody>
	           		<tr>
	               		<th>카테고리</th>
	            	</tr>
	            		<tr style="vertical-align:top">
		               <!-- td에 height값을 줘야 JSTree가 고정됨 -->
		               <td style="height:380px">
		                  <div id="tree"></div>
		               </td>
	            	</tr>
	         	</tbody>
	      	</table>
		</div>
		<div class="pull-left" style="display:inline-block; width:35%; height:420px;" align=center>
	    	<div class="form-inline" align=center>
	    		<input type="text" class="form-control" style="border:1px solid #BDBDBD;border-radius:5px;"> <button class="btn btn-default">검색</button>
	    	</div>
	    	<div style="width:100%;height:88%;overflow-y:auto">
	    		<table style="width:85%;margin-top:3%;height:auto" class="table table-bordered" id="product_cell">
		    		<tr>
		    			<td class="active"> <input type="checkbox" id="left_check"></td>
		    			<td class="active"> 상품명</td>
		    			<td class="active"> 판매가</td>
		    		</tr>
	    		</table>
	    	</div>
		</div>
		
		<div class="pull-left" style="display:table; width:10%; height:420px;;" align=center>
	    	<div style="display:table-cell;vertical-align:middle">
	    		<button class="btn btn-default" onclick="insert_yet_sale()">추가</button>
	    			<br>
	    			<br>
	    		<button class="btn btn-default" onclick="delete_check_sale()">제거</button>
	    	</div>
		</div>
		
		<div class="pull-left" style="display:inline-block; width:35%; height:420px;" align=center>
	    	<div class="form-inline" align=center>
	    		<input type="text" class="form-control" style="border:1px solid #BDBDBD;border-radius:5px;"> <button class="btn btn-default">검색</button>
	    	</div>
	    	<div style="width:100%;height:88%;overflow-y:auto">
	    		<table style="width:85%;margin-top:3%;height:auto" class="table table-bordered" id="product_selected">
		    		<tr>
		    			<td class="active"> <input type="checkbox" id="right_check"></td>
		    			<td class="active"> 상품명</td>
		    			<td class="active"> 판매가</td>
		    		</tr>
	    		</table>
	    	</div>
		</div>

	</div>
	
	<!-- 버튼들 -->
	<div style="margin-top:1%; text-align:center;">
		<input type="button" class="btn btn-default" value="확인" onclick="pop_defBtn()"> 
		<input type="button" class="btn btn-default" style="margin-left:1%;" value="취소" onclick="cancelPopup()">
	</div>
	
</div>	
</body>
</html>