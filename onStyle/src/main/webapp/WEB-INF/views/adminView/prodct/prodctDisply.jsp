<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 진열관리</title>

<!-- consmrMenu css, js 링크 모아 놓은곳 -->
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<!-- JSTree 관련 파일들 -->
<script src="/resources/admin/prodct/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/admin/prodct/js/jstree/themes/proton/style.min.css">
<script src="/resources/admin/prodct/js/jstree/jstree.min.js" charset="utf-8"></script>

<!-- Table 행 바꾸는 JS -->
<script src="/resources/admin/prodct/js/jquery-tablednd.js" type="text/javascript" charset="utf-8"></script>

<script>
$(document).ready(function(){
   //중분류 초기 값
   var firstOutput = '';
//    firstOutput += '<option value="5" selected="selected"> T-shirts </option>';
//    firstOutput += '<option value="6" selected="selected"> blouse&shirts </option>';
//    firstOutput += '<option value="7" selected="selected"> knit </option>';

   $("#search_mid_category").append(firstOutput);
})

//검색 조건 초기화
function resetSearch(){
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
//          firstOutput += '<option value="5" selected="selected"> T-shirts </option>';
//          firstOutput += '<option value="6" selected="selected"> blouse&shirts </option>';
//          firstOutput += '<option value="7" selected="selected"> knit </option>';

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
            output += '<option value="'+ vo.category_seq +'" selected="selected">'+vo.category_nme+'</option>';
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
   
   $.ajax({
      type: "POST",
      url: "/searchMainDisply.do",
      data : searchOption,
      success: function(data){
         
          var menuOutput = '';
         $("#disply tbody").html("");

         $.each(data, function(i, vo){
            var searchOutput = '';
            searchOutput += '<tr>'
            searchOutput += '<td style="vertical-align:middle;"><input type="checkbox" name="check"></td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.main_disply + '</td>';
            searchOutput += '<td><img style="width:100px; height:100px;" src="' + vo.prodct_img_route1 + '"></td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_seq + '</td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_nme + '</td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_price + '</td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_disply_state + '</td>';
            searchOutput += '<td style="vertical-align:middle;">' + vo.prodct_sell_state + '</td>';
            searchOutput += '</tr>'
            
            $("#disply").append(searchOutput);
         })
         
         $("#disply").append(firstOutput);
      },
      error:function(xhr,status,error)
      { //ajax 오류인경우  
         alert("error");
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
      }
   }); 
}

//상품 삭제
function deleteDisplyProdct(){
   var group=[];
   //체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=check]:checked").each(function(i,elements){
       group.push($(this).val());
    });
    if(group.length==0){
        alert("1개 이상 체크해주세요.");
        return;
    }
    var formData = "group="+group;  
    var count = confirm(group.length+"개의 상품을 삭제하시겠습니까?");
   
    $.ajax({
       type: "POST",
       url: "/deleteDisplyProdct.do",
       data : formData,
       success: function(data){
         location.reload();
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
   var group=[];
    //체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=check]:checked").each(function(i,elements){
       group.push($(this).val());
    });
    if(group.length==0){
        alert("1개 이상 체크해주세요.");
        return;
    }
    var formData = "group="+group;
    var count = confirm(group.length+"개의 상품을 변경하시겠습니까?");

    if(count == true){
      var childWindow;
      var popUrl = "/categoryUpdatePopUp.do?group="+group;
       var popupName= "상품 분류 수정";
       var width = 1000;
       var height = 700;
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
    else{
      return;
   }  
 };

</script>

</head>
<body>
   <!-- 상단 바 -->
   <div>
      <c:import url="/adminTopMenu.do" />
   </div>
   <!-- 좌측 바 -->
   <div>
      <c:import url="/adminLeftMenu.do?menuCategry=1" />
   </div>
   
   <!-- 본인 디자인은 여기 안에서 -->
   <div class="mainContainer">
   
      <div class="row">
         <div class="col-md-12">
            <h4>상품 관리</h4>
            <br>         
         </div>
   
         <div class="col-md-12" style="height:153px;">
            <form name="searchDisplyProdct">
               <table class="table" id="searchTable" style="border:1px solid #e0e0e0; text-align:center; width:100%;">
                  <tr>
                     <td class="active" style="width:15%;"><h6>검색</h6></td>
                     <td>
                        <select id="search_nme" name="search_nme" class="form-control" style="width:100%;">
                           <option value="prodct_seq" selected="selected">상품코드</option>
                           <option value="admin_prodct_nme" selected="selected">관리자용 상품명</option>
                           <option value="prodct_nme" selected="selected">소비자용 상품명</option>
                        </select>
                     </td>
                     <td colspan=2; style="width: 70%;">
                        <input type="text" class="form-control" name="search" placeholder="상품명을 입력하세요.">
                     </td>
                  </tr>
                  <tr>
                     <td class="active">상품 분류</td>
                     <!--대분류 -->
                     <td>
                        <select id="search_category" name="search_category" class="form-control" style="width:100%;" onchange="selectCategory()">
                           <option value="0"></option>
                           <option value="1">Top</option>
                           <option value="2">Bottom</option>
                           <option value="3">Dress</option>
                           <option value="4">Shoes & Bag</option>
                           <option value="5">Outer</option>
                        </select>
                     </td>
                     <!--준분류 -->
                     <td colspan=2;>
                        <select id="search_mid_category" name="search_mid_category" class="form-control" style="width: 50%;">
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td class="active" style="height:100%">진열상태</td>
                     <td style="width: 28%;">
                        <input type="radio" name="search_disply_state" value="1">전체
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_disply_state" value="Y">진열함
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_disply_state" value="N">진열안함
                     </td>
                     <td class="active">판매상태</td>
                     <td><input type="radio" name="search_sell_state" value="1">전체
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_sell_state" value="Y">판매함
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="search_sell_state" value="N">판매안함
                     </td>
                  </tr>
               </table>
            </form>
         </div>
         
         <!-- 버튼들 -->
         <div class="col-md-12" style="text-align:center; padding-top:1%;">
            <input type="button" class="btn btn-default" value="검색" onclick="searchProdct()"> 
            <input type="button" class="btn btn-default" style="margin-left:1%;" value="초기화" onclick="resetSearch()">
         </div>
   
         <!-- 메인 진열 상품 -->
         <div class="col-md-12" style="padding-top:1%;">
            <c:import url="/mainDisply.do"/>
         </div>
         
         <!-- 버튼들 -->
         <div class="col-md-12">
            <div style="float:right;">
               <input type="button" class="btn btn-default" id="orderConfirm" value="확인">
               <input type="button" class="btn btn-default" id="deleteProdct" onclick="deleteDisplyProdct()" value="삭제">
               <input type="button" class="btn btn-default" id="updateProdct" onclick="javascript:categoryUpdatePopUp()" value="분류수정">
            </div>
         </div>
         
         
      </div>
   </div>
</body>
</html>