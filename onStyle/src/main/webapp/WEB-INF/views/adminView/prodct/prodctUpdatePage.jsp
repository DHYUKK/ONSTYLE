<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- j쿼리 -->
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<!-- 스마트에디터 -->
<!-- 네이버 에디터 -->
   <script type="text/javascript" src="/resources/admin/prodct/smarteditor2-master/dist/js/service/HuskyEZCreator.js" charset="utf-8"></script>
   <script type="text/javascript" src="/resources/admin/prodct/smarteditor2-master/dist/js/service/hp_SE_ToolbarToggler.js" charset="utf-8"></script>
   <script type="text/javascript" src="/resources/admin/prodct/smarteditor2-master/dist/js/service/hp_SE_OuterIFrameControl.js" charset="utf-8"></script>
   <script type="text/javascript" src="/resources/admin/prodct/smarteditor2-master/dist/js/smarteditor2.js" charset="utf-8"></script>

<!-- 네이버에디터2.0 -->
   <script type="text/javascript" src="/resources/admin/prodct/NaverEditer/js/HuskyEZCreator.js"></script>

<!-- 메뉴 -->
<script src="/resources/assets/js/custom.js"></script>
<script src="/resources/admin/main/adminBootstrap/js/bootstrap.min.js"></script>
<script src="/resources/admin/prodct/js/prodctUpdate.js?ver=2" charset="utf-8"></script>


<style>
.fileContainer {
    overflow: hidden;
    position: relative;
}

.fileContainer [type=file] {
    cursor: inherit;
    display: block;
    font-size: 15px;
    filter: alpha(opacity=0);
    height: 100%;
    width: 87.72px;
    opacity: 0;
    position: absolute;
    left: 0;
    text-align: right;
    top: 0;
}

 </style>
</head>
<body>
	<!-- 상단 바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=1"/>
	</div>
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
		<div class="row">	
	        <div class="col-md-12">
	        	<div class="col-md-12">
	        		<h4>상품 수정</h4>
	        		<hr>
	        	</div>
	        	<div class="col-md-2"></div>
	        	<div class="col-md-8">
	        	<form id="prodctImgFrm" enctype="multipart/form-data"method="post">
	        		<input type="hidden" name="prodct_seq" value="0">
	       			<table style="border:1px solid #ddd; width:100%; height:400px">
	       				<tr>
	       					<td rowspan="4" style="width:50%;" align="center">
								<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:100%; height:400px">
						        	<ol class="carousel-indicators">
					         			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					          			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					          			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					          			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					        		</ol>
					        		<div class="carousel-inner" style="width:100%; height:400px">
								        <div id ="prodct_img_preview1" class="item active" style="width:100%; height:400px">
								           <img src="${prodctVO.prodct_img_route1}" style="width:100%; height:400px" alt="First slide">
								        </div>
								        <div id="prodct_img_preview2" class="item" style="width:100%; height:400px">
								           <img src="${prodctVO.prodct_img_route2}" style="width:100%; height:400px" alt="Second slide">
								        </div>
								        <div id="prodct_img_preview3" class="item" style="width:100%; height:400px">
								           <img src="${prodctVO.prodct_img_route3}" style="width:100%; height:400px" alt="Third slide">
								        </div>
					  			        <div id="prodct_img_preview4" class="item" style="width:100%; height:400px">
								           <img src="${prodctVO.prodct_img_route4}" style="width:100%; height:400px" alt="fourth slide">
								        </div>
									 </div>
									 <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
					         		 	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					        		 	<span class="sr-only">Previous</span>
					       			 </a>
					        		 <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					          			 <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					         			 <span class="sr-only">Next</span>
					       			 </a>		
								</div>
	       					</td>
	       					<td width="50%" style="padding-left:20px">
		       					<label class="fileContainer">
		       						<a href="#" class="btn btn-info">파일 선택</a>
		       						<input type="file" name="prodct_img1" id="prodct_img1"/>
	       						</label>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td style="padding-left:20px">
		       					<label class="fileContainer">
		       						<a href="#" class="btn btn-info">파일 선택</a>
		       						<input type="file" name="prodct_img2" id="prodct_img2"/>
	       						</label>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td style="padding-left:20px">
		       					<label class="fileContainer">
		       						<a href="#" class="btn btn-info">파일 선택</a>
		       						<input type="file" name="prodct_img3" id="prodct_img3"/>
	       						</label>
	       					</td>
	       				</tr>
	       				<tr>
	       					<td style="padding-left:20px">
		       					<label class="fileContainer">
		       						<a href="#" class="btn btn-info">파일 선택</a>
		       						<input type="file" name="prodct_img4" id="prodct_img4"/>
	       						</label>
	       					</td>
	       				</tr>
	       			</table>
	       			</form>
	        	</div>
	        	<div class="col-md-2"></div>
	        	<div class="col-md-12">
	        		<h5>상품 정보</h5>        	
	        	</div>
	        	<form id="prodctInfo" method="post">
	        	<div class="col-md-12">
		        	<table class="table table-bordered">
		        		<tr>
		        			<th class="active text-center"   style="vertical-align:middle">
		        				상품코드
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
								<input type="text" name="prodct_seq" id="prodct_seq" style="width:7%; text-align:center" class="form-control" value="${prodctVO.prodct_seq}" disabled>
		        			</td>
	        			</tr>
	        			<tr>
		        			<th class="active text-center"  style="vertical-align:middle">
		        				상품명
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<input type="text" name="prodct_nme" style="width:20%" class="form-control" style="vertical-align:middle" value="${prodctVO.prodct_nme}">
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				상품명 관리자
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<input type="text" name="admin_prodct_nme" style="width:20%" class="form-control" value="${prodctVO.admin_prodct_nme}">
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				카테고리
		        			</th>
					<!--대분류 -->
	                   		<td>
		                        <select id="bigCategory" name="bigCategory" class="form-control" style="width:30%;" onchange="selectCategory()">
		                           <option value="0">==대분류 카테고리를 선택하세요==</option>
		                           <option value="1" <c:if test="${prodctVO.category_seq eq 6 or prodctVO.category_seq eq 7 or prodctVO.category_seq eq 8}">selected="selected"</c:if> >Top</option>
		                           <option value="2" <c:if test="${prodctVO.category_seq eq 9 or prodctVO.category_seq eq 10}">selected="selected"</c:if>>Bottom</option>
		                           <option value="3" <c:if test="${prodctVO.category_seq eq 3}">selected="selected"</c:if>>Dress</option>
		                           <option value="4" <c:if test="${prodctVO.category_seq eq 4}">selected="selected"</c:if>>Shoes & Bag</option>
		                           <option value="5" <c:if test="${prodctVO.category_seq eq 5}">selected="selected"</c:if>>Outer</option>
		                        </select>
                     <!--준분류 -->	                     
		                        <select id="midCategory" name="midCategory" class="form-control" style="width:30%;">
		                        	<c:choose>
		                        		<c:when test="${prodctVO.category_seq eq 6 or prodctVO.category_seq eq 7 or prodctVO.category_seq eq 8}">
		                        			<option value="6" <c:if test="${prodctVO.category_seq eq 6}">selected="selected"</c:if>>T-shirts</option>
		                        			<option value="7" <c:if test="${prodctVO.category_seq eq 7}">selected="selected"</c:if>>Blouse&Shirts</option>
		                        			<option value="8" <c:if test="${prodctVO.category_seq eq 8}">selected="selected"</c:if>>Knit</option>
		                        		</c:when>
		                        		<c:when test="${prodctVO.category_seq eq 9 or prodctVO.category_seq eq 10}">
		                        			<option value="9" <c:if test="${prodctVO.category_seq eq 9}">selected="selected"</c:if>>Pants</option>
		                        			<option value="10" <c:if test="${prodctVO.category_seq eq 10}">selected="selected"</c:if>>Skirts</option>
		                        		</c:when>
		                        	</c:choose>
		                        </select>
		                    </td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				진열 상태
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<div class="col-md-12">
		        					<div class="col-md-2">
			        					<input type="radio" name="prodct_disply_state" value="Y" <c:if test="${prodctVO.prodct_disply_state eq 'Y' or prodctVO.prodct_disply_state eq 'M'}">checked</c:if>>진열함
		        					</div>
		        					<div class="col-md-2">
			        					<input type="radio" name="prodct_disply_state" value="N" <c:if test="${prodctVO.prodct_disply_state eq 'N'}">checked</c:if>>진열 안함
			        				</div>		        				
		        				</div>
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">		     
	        					판매 상태
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<div class="col-md-12">
		        					<div class="col-md-2">
		        						<input type="radio" name="prodct_sell_state" value="Y" <c:if test="${prodctVO.prodct_sell_state eq 'Y'}">checked</c:if>>판매함
	        						</div>
		       						<div class="col-md-2">
			        					<input type="radio" name="prodct_sell_state" value="N" <c:if test="${prodctVO.prodct_sell_state eq 'N'}">checked</c:if>>판매 안함
		        					</div>
	        					</div>
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				상품 상태
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<select name="prodct_state" class="btn btn-default" name="" style="width:10%">
		        					<option value="new" <c:if test="${prodctVO.prodct_state eq 'new'}">selected="selected"</c:if>>신상상품</option>
		        					<option value="hot" <c:if test="${prodctVO.prodct_state eq 'hot'}">selected="selected"</c:if>>인기상품</option>
		        					<option value="normal" <c:if test="${prodctVO.prodct_state eq 'normal'}">selected="selected"</c:if>>일반상품</option>
		        				</select>
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				공급자 가격
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<input type="text" name="suplr_price" class="form-control" style="width:20%" value="${prodctVO.suplr_price}">
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				소비자 가격
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<input type="text" name="prodct_price" class="form-control" style="width:20%" value="${prodctVO.prodct_price}">
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				거래처
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<select name="client_seq" class="btn btn-default" style="width:20%">
		        					<c:forEach var="clientList" items="${clientList}" varStatus="status">
		        						<option value="${clientList.client_seq}" <c:if test="${clientList.client_seq eq prodctVO.client_seq}">selected="selected"</c:if> >${clientList.client_nme}</option>
		        					</c:forEach>
		        				</select>
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				색상
		        			</th>
		        			<td id="colorZone" style="vertical-align:middle; height:10px;" class="text-left">
		        				<c:import url="/prodctUpdateColorPage.do?prodct_seq=${prodctVO.prodct_seq}"/>
<!-- 		        				<div id="colorInfo" class="col-md-10" style="padding-top:6px; height:100%"> -->
<%-- 		        					<c:forEach var="prodctColorList" items="${prodctColorList}" varStatus="status"> --%>
<%-- 		        						<input type='text' name="tempColor" class='form-control' style='width:10%; height:34px; float:left; margin-left:5px;' value="${prodctColorList.prodct_color_nme}" readonly> --%>
<%-- 		        						<button type="button" class="btn btn-danger" style="width:34px;height:34px;font-weight: bold;float:left;font-size: large;padding-top: 1px;padding-left: 13px;" onclick="prodctColorDelete(${prodctColorList.prodct_color_seq})">-</button> --%>
<%-- 		        					</c:forEach> --%>
<!-- 		        				</div> -->
<!-- 		        				<div class="col-md-2" style="height:100%"> -->
<!-- 			        				<div style="margin-right:49px"> -->
<!-- 			        					<button type="button" class="btn btn-primary" onclick="prodctColorPopUp()" style="width:45px;height:45px;float:right;font-size:large;padding-left: 13px;"> -->
<!-- 				        					<span class="glyphicon glyphicon-arrow-up"> -->
<!-- 				        					</span> -->
<!-- 			        					</button> -->
<!-- 			        				</div> -->
<!-- 		        				</div> -->
		        			</td>
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				size
		        			</th>
		        			<td style="vertical-align:middle;" class="text-left">
		        				<div class="col-md-12">
		        					<div class="col-md-10" id="sizeFrame">
										<c:import url="/ImsiInsertProdctSize.do?category_seq=${prodctVO.category_seq}"/>
		        					</div>
			        				<div class="col-md-1">
			        				</div>
			        				<div class="col-md-1" style="padding-top: 3px;">
			        					<button type="button" class="btn btn-primary" style="width: 45px;height: 45px;font-weight: bold;float:left;font-size: x-large; padding-top: 5px;padding-left: 15px;padding-right: 14px;" onclick="prodctSizePopUp()">+</button>
				        				<button type="button" class="btn btn-danger" style="width: 45px;height: 45px;font-weight: bold;float:left;font-size: x-large;padding-top: 3px;padding-left: 17px; margin-top: 3px;" onclick="sizeDelete()">-</button>
				        				<input type="hidden" name="prodct_detail" id="prodct_detail">
			        				</div>
		        				</div>
		        			</td>	        		
		        		</tr>
		        		<tr>
		        			<th class="active text-center" style="vertical-align:middle">
		        				상품 상세설명
		        			</th>
		        			<td>
		        				<div class="col-md-12">
		        					<textarea name="editor2" id="editor2" rows="15" cols="120">${prodctVO.prodct_detail}</textarea>
		        				</div>
		        			</td>
		        		</tr>
		        	</table>
	        	</div>
	        	</form>
	        	<div class="col-md-12">
	        		<div class="col-md-6">
	        			<input type="button" id="prodctUpdateBtn" class="btn btn-default" value="수정완료" style="float:right; margin-right:5px">
	        		</div>
	        		<div class="cold-md-6">
	        			<input type="button" class="btn btn-default" value="취소" style="margin-left:5px; float:left" onclick="cancel()">
	        		</div>
	        	</div>
	    	</div>
		</div>
	</div>
</body>

</html>

