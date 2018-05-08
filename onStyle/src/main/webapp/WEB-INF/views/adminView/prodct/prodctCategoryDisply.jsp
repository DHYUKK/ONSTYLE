<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Table 행 바꾸는 JS -->
<script src="/resources/admin/prodct/js/jquery-tablednd.js" type="text/javascript" charset="utf-8"></script>

<!-- JSTree 관련 파일들 -->
<script src="/resources/admin/prodct/js/jstree/jstree.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="/resources/admin/prodct/js/jstree/themes/proton/style.min.css">
<script src="/resources/admin/prodct/js/jstree/jstree.min.js" charset="utf-8"></script>

<script>
$(document).ready(function() {
   var prodct_seq;
   var displyArray=0;
   
   var data = [
   {
      "id" : "0",
      "parent" : "#",
      "text" : "메인 진열"
   },            
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
   
   //jstree 카테고리 선택시 정렬
   $('#tree').on("select_node.jstree", function(e, data){
      displyArray = data.node.id;
      formData = "displyArray="+displyArray;

      $.ajax({
         type:"POST",
         url:"/categoryDisply.do",
         data: formData,
         success:function(data){
            $("#disply tbody").html(""); 
            
            $.each(data, function(i, vo){
               var output = ''; 
               output += '<tr class="prodct" id="'+vo.prodct_seq+'">';
               output += '<td style="vertical-align:middle;"><input type="checkbox" name="check" value="'+vo.prodct_seq+'"></td>';
               output += '<td style="vertical-align:middle;">'+vo.main_disply+'</td>';
               output += '<td style="vertical-align:middle;"><img style="width:100px; height:100px;" src="'+vo.prodct_img_route1+'"></td>';
               output += '<td style="vertical-align:middle;">'+vo.prodct_seq+'</td>';
               output += '<td style="vertical-align:middle;"><a href="/prodctUpdatePage.do?prodct_seq='+vo.prodct_seq+'">'+vo.prodct_nme+'</a></td>';
               output += '<td style="vertical-align:middle;">'+vo.prodct_price+'</td>';
               output += '<td style="vertical-align:middle;">'+vo.prodct_disply_state+'</td>';
               output += '<td style="vertical-align:middle;">'+vo.prodct_sell_state+'</td>';
               output += '</tr>';
               
               $("#disply tbody").append(output);
            })
            
            //진열 순서 변경
            $("#disply").tableDnD({
               //클래스 지정
               onDragClass: "dragRow",
               //드래그 한 후 드롭이벤트가 일어날 경우의 이벤트
               onDrop: function(table, row){
                  prodct_seq = $.tableDnD.jsonize();
               }
            });
         },
         error:function(request,status,error){
            alert("error");
              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });         
   });
   
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
 
   //진열순서변경
   $("#disply").tableDnD({
      //클래스 지정
      onDragClass: "dragRow",
      //드래그 한 후 드롭이벤트가 일어날 경우의 이벤트
      onDrop: function(table, row){
         prodct_seq = $.tableDnD.jsonize();
      }
   });
   
   //진열순서변경 업데이트 
   $('#orderConfirm').click(function(){
      if(prodct_seq == null){
         alert("변경된 진열 순서가 없습니다.");
      }
      else{
         $.ajax({
            type:"POST",
            url:"/updateMainDisplyOrdr.do?displyArray="+displyArray,
            data:prodct_seq,
            contentType:"application/json",
            success:function(data){
               //정렬 조회 값 재 조회
               $.ajax({
                  type:"POST",
                  url:"/categoryDisply.do?displyArray="+displyArray,
                  data:displyArray,
                  success:function(data){
                	 alert("진열 순서를 변경합니다.")
                     $("#disply tbody").html(""); 
                     
                     $.each(data, function(i, vo){
                        var output = ''; 
                        output += '<tr class="prodct" id="'+vo.prodct_seq+'">';
                        output += '<td style="vertical-align:middle;"><input type="checkbox" name="check" value="'+vo.prodct_seq+'"></td>';
                        output += '<td style="vertical-align:middle;">'+vo.main_disply+'</td>';
                        output += '<td style="vertical-align:middle;"><img style="width:100px; height:100px;" src="'+vo.prodct_img_route1+'"></td>';
                        output += '<td style="vertical-align:middle;">'+vo.prodct_seq+'</td>';
                        output += '<td style="vertical-align:middle;"><a href="/prodctUpdatePage.do?prodct_seq="'+vo.prodct_seq+'>'+vo.prodct_nme+'</a></td>';
                        output += '<td style="vertical-align:middle;">'+vo.prodct_price+'</td>';
                        output += '<td style="vertical-align:middle;">'+vo.prodct_disply_state+'</td>';
                        output += '<td style="vertical-align:middle;">'+vo.prodct_sell_state+'</td>';
                        output += '</tr>';
                        
                        $("#disply tbody").append(output);
                     })
               
                     //진열 순서 변경
                     $("#disply").tableDnD({
                        //클래스 지정
                        onDragClass: "dragRow",
                        //드래그 한 후 드롭이벤트가 일어날 경우의 이벤트
                        onDrop: function(table, row){
                           prodct_seq = $.tableDnD.jsonize();
                        }
                     });
                  }
               })
            },
            error:function(request,status,error){
               alert("error");
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
         });
      }
   });
   
})

//상품 상태 변경
function updateProdctState(a){
   var group=[];
   var state = a;
   
   //체크박스 중 체크된 체크박스만 가져와서 Loop
    $("input:checkbox[name=check]:checked").each(function(i,elements){
       group.push($(this).val());
    });
    var formData = "group="+group;  

    $.ajax({
      type: "POST",
      url: "/updateProdctState.do?state="+state,
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
</script>

<style>
.prodct:hover{
   background-color:#F4FFFD; 
}
</style>

</head>
<body>
   <!-- 카테고리 -->
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
      
      <div class="pull-left" style="display:inline-block; width:100%;">
         <table style="margin:0 auto;">
            <tr style="height:70px;">
               <td style="text-align:center; width:150px;"><input type="button" onclick="updateProdctState(1)" class="btn btn-default" style="width:110px;" value="판매함"></td>
               <td style="text-align:center; width:150px;"><input type="button" onclick="updateProdctState(2)" class="btn btn-default" style="width:110px;" value="판매안함"></td>
            </tr>
            <tr style="padding-top:3%;">
               <td style="text-align:center;"><input type="button" onclick="updateProdctState(3)" class="btn btn-default" style="width:110px;" value="메인진열"></td>
               <td style="text-align:center;"><input type="button" onclick="updateProdctState(4)" class="btn btn-default" style="width:110px;" value="진열안함"></td>
            </tr>
         </table>
      </div>
   </div>
   
   <!--메인 진열 상품 조회 -->
   <div class="pull-left" style="margin-left:10px; display:inline-block; width:79%; height:580px; overflow-y:auto;">
      <table id="disply" class="table" style="text-align:center; width:100%;  border:1px solid #e0e0e0;">
         <thead>
            <tr class="nodrag nodrop">
               <td colspan=8><b>진열 상품</b></td>
            </tr>
            <tr class="nodrag nodrop active">
               <td class="active" style="width:5%;"><input type="checkbox" id="check"></td>
               <td class="active" style="width:10%;">진열 순서</td>
               <td class="active" style="width:10%;">상품 간략보기</td>
               <td class="active" style="width:20%;">상품 코드</td>
               <td class="active" style="width:20%;">상품명</td>
               <td class="active" style="width:15%;">판매가</td> 
               <td class="active" style="width:5%;">진열</td>
               <td class="active" style="width:5%;">판매</td>
            </tr>
         </thead>
         <tbody>
            <c:forEach items="${mainDisplyProdctList}" var="adminProdctVo" varStatus="status">
               <tr class="prodct" id="${adminProdctVo.prodct_seq}">
                  <td style="vertical-align:middle;"><input type="checkbox" name="check" value="${adminProdctVo.prodct_seq}"></td>
                  <td style="vertical-align:middle;">${adminProdctVo.main_disply}</td>
                  <td style="vertical-align:middle;"><img style="width:100px; height:100px;" src="${adminProdctVo.prodct_img_route1}"></td>
                  <td style="vertical-align:middle;">${adminProdctVo.prodct_seq}</td>
                  <td style="vertical-align:middle;"><a href="/prodctUpdatePage.do?prodct_seq=${adminProdctVo.prodct_seq}">${adminProdctVo.prodct_nme}</a></td>
                  <td style="vertical-align:middle;">${adminProdctVo.prodct_price}</td>
                  <td style="vertical-align:middle;">${adminProdctVo.prodct_disply_state}</td>
                  <td style="vertical-align:middle;">${adminProdctVo.prodct_sell_state}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>

</body>
</html>