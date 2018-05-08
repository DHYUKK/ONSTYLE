<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객상세조회</title>
<script type="text/javascript"
   src="/resources/admin/mem/js/adminMem.js?1"></script>

<script>
   //이미지 섬네일
   var xOffset = 10;
   var yOffset = 30;
   $(document).on(
         "mouseover",
         ".thumbnail",
         function(e) { //마우스 오버시
            $("body").append(
                  "<p id='preview'><img src='" + $(this).attr("src")
                        + "' width='200px' /></p>"); //보여줄 이미지를 선언                       
            $("#preview").css("top", (e.pageY - xOffset) + "px").css(
                  "left", (e.pageX + yOffset) + "px").fadeIn("fast"); //미리보기 화면 설정 셋팅
         });
   $(document).on(
         "mousemove",
         ".thumbnail",
         function(e) { //마우스 이동시
            $("#preview").css("top", (e.pageY - xOffset) + "px").css(
                  "left", (e.pageX + yOffset) + "px");
         });
   $(document).on("mouseout", ".thumbnail", function() { //마우스 아웃시
      $("#preview").remove();
   });
</script>
<style>
#preview {
   z-index: 9999;
   position: absolute;
   border: 0px solid #ccc;
   background: white;
   padding: 1px;
   display: none;
   color: #fff;
}
/* 이미지 썸네일 */
.thumbnail {
   display: inline;
   margin-bottom: 0px;
   height: 120px;
   width: 150px;
}

.thumbnail2 {
   display: inline;
   margin-bottom: 0px;
   height: 50px;
   width: 50px;
}
</style>

</head>
<body>
   <!-- 상단 바 -->
   <div>
      <c:import url="/adminTopMenu.do" />
   </div>
   <!-- 좌측 바 -->
   <div>
      <c:import url="/adminLeftMenu.do?menuCategry=6" />
   </div>
   <div class="mainContainer">
      <div class="col-md-12">
         <h4>고객 상세 조회</h4>
         <hr>
      </div>
      <div>
         <button type="button" onclick="returnList()" class="btn btn-info">목록</button>
      </div>
      <div style="width: 1150px; height: 50px; padding-top: 20px;">
         <font style="font-weight: bold;"> 회원 정보 </font>
      </div>
      <form name="reqstFrm" id="reqstFrm">
         <input type="hidden" id="currentPageNo" name="currentPageNo"value="${pageSearchInfo.currentPageNo}">
         <input type="hidden" id="searchCondition1" name="searchCondition1" value="${pageSearchInfo.searchCondition1}"> 
         <input type="hidden" id="searchContent" name="searchContent" value="${pageSearchInfo.searchContent}">
      </form>   
      <table class="table table-bordered"style="width:80%;" align="center">
         <colgroup>
            <col style="width: 15%;" />
            <col style="width: 85%;" />
         </colgroup>
         <tr>
            <td rowspan="3" style="width: 150px;"><img src="${adminMemRead.mem_img_route}" class="thumbnail"style="margin: 0 auto;">
            </td>
            <td>이름 <input type="text" id="mem_name" name="mem_name"style="border: 1px solid #BDBDBD; width: 250px; height: 30px; margin-left: 11px;"value="${adminMemRead.mem_name}" readonly>
            </td>
         </tr>
         <tr>
            <td>
               <div style="float: left;">닉네임</div> 
               <input type="text" style="border: 1px solid #BDBDBD; width: 250px; float: left; height: 30px; margin-left: 2px;" id="mem_nicknme" name="mem_nicknme" value="${adminMemRead.mem_nicknme}" readonly>
            </td>
         </tr>
         <tr>
            <td>
               <div style="float: left;">아이디</div> 
               <input type="text"style="border: 1px solid #BDBDBD; width: 250px; height: 30px; float: left; margin-left: 2px;" id="mem_id" name="mem_id" value="${adminMemRead.mem_id}" readonly>
            </td>
         </tr>
         <tr>
            <th>휴대전화</th>
            <td>
               <input type="text" style="border: 1px solid #BDBDBD; height: 30px; width: 200px;" id="mem_ph" name="mem_ph" value="${adminMemRead.mem_ph}" readonly>
            </td>
         </tr>
         <tr>
            <th>주소</th>
               <td>
                  <input type="text" style="border: 1px solid #BDBDBD; width: 200px; height: 30px;" id="mem_postcd" name="mem_postcd" value="${adminMemRead.mem_postcd}" readonly>우편번호 <br></br>
                  <input type="text" style="border: 1px solid #BDBDBD; width: 350px; height: 30px;" id="mem_adrs" name="mem_adrs" value="${adminMemRead.mem_adrs}" readonly>기본주소 <br></br> 
                  <input type="text" style="border: 1px solid #BDBDBD; width: 350px; height: 30px;" id="mem_detail_adrs" name="mem_detail_adrs" value="${adminMemRead.mem_detail_adrs}" readonly>상세 주소
               </td>
         </tr>
         <tr>
            <th>생년월일</th>
            <td>
               <input type="text" id="mem_birth" name="mem_birth" style="border: 1px solid #BDBDBD; height: 30px;" value="${adminMemRead.mem_birth}" readonly>
            </td>
         </tr>
         <tr>
            <th>이메일</th>
            <td>
               <input type="text" style="border: 1px solid #BDBDBD; height: 30px;" id="mem_email" name="mem_email" value="${adminMemRead.mem_email}" readonly>
            </td>
         </tr>
         <tr>
            <th>적립 포인트</th>
            <td>
               <input type="text" style="border: 1px solid #BDBDBD; height: 30px;" id="mem_ecash" name="mem_ecash" value="${adminMemRead.mem_ecash}" readonly>
            </td>
         </tr>
         <tr>
            <th>옷 치수<a href="javascript:size()"><font id="sizeTap">펼치기</font></a>
            </th>
            <td></td>
         </tr>
      </table>
      <table class="hide table table-bordered" id="size" style="margin-top: -23px;width:80%;" align="center">
         <tr>
                        <th style="width:190px;">
                           상의 총기장(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px;"id="mem_top_length" name="mem_top_length" maxlength="5" readonly value="${adminMemRead.mem_top_length}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
							</div>                        
                        </td>
                        <th>
                           상의 어깨넓이(cm)
                        </th>
                        <td>
                        	<div align="center">
                          		 <input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_shouldr" name="mem_top_shouldr" maxlength="5" readonly value="${adminMemRead.mem_top_shouldr}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                       		</div>
                        </td>
                        <th>
                           상의 가슴둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_bust" name="mem_top_bust" maxlength="5" readonly value="${adminMemRead.mem_top_bust}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           상의 밑단둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_tail_girth" name="mem_top_tail_girth" maxlength="5" readonly value="${adminMemRead.mem_top_tail_girth}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           상의 소매길이(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_slv_length" name="mem_top_slv_length" maxlength="5" readonly value="${adminMemRead.mem_top_slv_length}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           상의 소매통(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_slv_opening" name="mem_top_slv_opening" maxlength="5" readonly value="${adminMemRead.mem_top_slv_opening}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           상의 소매선절개둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_top_slv_bill" name="mem_top_slv_bill" maxlength="5" readonly value="${adminMemRead.mem_top_slv_bill}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');" >
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           하의 총기장(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_length" name="mem_bottom_length" maxlength="5" readonly value="${adminMemRead.mem_bottom_length}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           하의 허리둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_waist" name="mem_bottom_waist" maxlength="5" readonly value="${adminMemRead.mem_bottom_waist}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');" >
                        	</div>
                        </td>
                        <th>
                           하의 엉덩이둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_hip" name="mem_bottom_hip" maxlength="5" readonly value="${adminMemRead.mem_bottom_hip}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           하의 허벅지둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_thigh" name="mem_bottom_thigh" maxlength="5" readonly value="${adminMemRead.mem_bottom_thigh}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           하의 밑단둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_tail_girth" name="mem_bottom_tail_girth" maxlength="5" readonly value="${adminMemRead.mem_bottom_tail_girth}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                        <th>
                           하의 앞 밑위 둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_front_width" name="mem_bottom_front_width" maxlength="5" readonly value="${adminMemRead.mem_bottom_front_width}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
                  <tr>
                        <th>
                           하의 뒷 밑위 둘레(cm)
                        </th>
                        <td>
                        	<div align="center">
                           		<input type="text" style="border: 1px solid #BDBDBD; width:80px;height:30px; " id="mem_bottom_back_width" name="mem_bottom_back_width" maxlength="5" readonly value="${adminMemRead.mem_bottom_back_width}" onKeydown="this.value=this.value.replace(/[^0-9,.]/g,'');">
                        	</div>
                        </td>
                  </tr>
      </table>
      <div style="width:1150px; height:50px;">
           <font style="font-weight:bold;"> 주문 상품 정보  </font>
         </div>
      <table class="table table-hover" style="width:80%;" align="center">
         <thead>
         <tr class="active">
            <th class="text-center">주문 번호</th>
            <th class="text-center">상품 이미지</th>
            <th class="text-center">주문 일자</th>
            <th class="text-center">상품 이름</th>
            <th class="text-center">구매 수량</th>
            <th class="text-center">상품 구매 금액</th>
            <th class="text-center">주문 처리 상태</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="adminMemOrdrList" items="${adminMemOrdrList}" varStatus="status">
            <tr onclick="window.location.href='orderetail.do?order_seq=${adminMemOrdrList.order_seq}'">
               <td class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${adminMemOrdrList.order_seq}</td>
               <td class="text-center" style="vertical-align: middle; width:5%; cursor:pointer"><img src="${adminMemOrdrList.prodct_img_route1}"  class="thumbnail2"></td>
               <td class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${adminMemOrdrList.order_date}</td>
               <td class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${adminMemOrdrList.prodct_nme}</td>
               <td class="text-center" style="vertical-align: middle; width:5%; cursor:pointer">${adminMemOrdrList.order_breakdwn_prodct_quanty}</td>
               <td class="text-center" style="vertical-align: middle; width:10%; cursor:pointer">${adminMemOrdrList.order_sum}</td>
               <td class="text-center" style="vertical-align: middle; width:10%; cursor:pointer">${adminMemOrdrList.order_state}</td>
            </tr>
         </c:forEach>
      </tbody>
      </table>
<!--    <div class="col-lg-12" align="center"> -->
<!--       페이징 -->
<!--       <div class="pagination_wrapper"> -->
<!--          <div class="bs-component" style="text-align: center;"> -->
<!--             <ul class="pagination"> -->
            
<!--                무조건 1페이지로 << 버튼 -->
<%--                <c:if test = "${pageSearchInfo.currentPageNo>10}"> --%>
<!--                   <li><a href="javascript:searchPaging(1)">«</a></li> -->
<%--                </c:if> --%>
<%--                <c:if test = "${pageSearchInfo.currentPageNo<=10}"> --%>
<!--                   <li class="disabled"><a href="#">«</a></li> -->
<%--                </c:if> --%>
               
<!--                한 단위 앞으로 < 버튼 -->
<%--                   <c:if test = "${pageSearchInfo.currentPageNo>5}"> --%>
<!--                   <li><a href="javascript:searchPaging(1)">‹</a></li> -->
<%--                </c:if> --%>
<%--                <c:if test = "${pageSearchInfo.currentPageNo<=5}"> --%>
<!--                   <li class="disabled"><a href="#">‹</a></li> -->
<%--                </c:if> --%>
               
<!--                페이지 리스트 -->
<%--                <c:forEach varStatus="status" begin="${pageSearchInfo.firstPageNoOnPageList}" end="${pageSearchInfo.lastPageNoOnPageList}"> --%>
<%--                   <li ${pageSearchInfo.currentPageNo==status.current ? "class='active'" : ""} > --%>
<%--                      <a href="javascript:searchPaging(${status.current})">${status.current}</a> --%>
<!--                   </li> -->
<%--                </c:forEach> --%>
               
<!--                한 단위 뒤로 > 버튼 -->
<%--                <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 5 < pageSearchInfo.totalPageCount}"> --%>
<!--                   <li><a href="#">&rsaquo;</a></li> -->
<%--                </c:if>    --%>
<%--                <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 5 > pageSearchInfo.totalPageCount}"> --%>
<!--                   <li class="disabled"><a href="#">&rsaquo;</a></li> -->
<%--                </c:if>    --%>
               
<!--                   무조건 마지막페이지로 >> 버튼 -->
<%--                   <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 < pageSearchInfo.totalPageCount}"> --%>
<%--                   <li><a href="javascript:searchPaging(${pageSearchInfo.totalPageCount})">»</a></li> --%>
<%--                </c:if> --%>
<%--                <c:if test = "${pageSearchInfo.firstPageNoOnPageList + 10 > pageSearchInfo.totalPageCount}"> --%>
<!--                   <li class="disabled"><a href="#">»</a></li> -->
<%--                </c:if> --%>
<!--             </ul> -->
<!--          </div> -->
<!--       </div> -->
<!--    </div>  -->
   </div>
</body>
</html>