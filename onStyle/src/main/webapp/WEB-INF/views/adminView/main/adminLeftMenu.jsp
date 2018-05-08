<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- 모코블링에서 가져온 좌측 바 -->
	<link href="/resources/leftMenu.css" rel="stylesheet" type="text/css" />
 
	
	<!-- 좌측 바 -->
	<script type="text/javascript">
		//스크롤 상하
		function winScroll(stat) {
			var way = 0;
			if (stat != 'top') {
				way = Math.floor(jQuery(document).height()
						- jQuery(window).height());
			}
			jQuery('html, body').animate({
				scrollTop : way
			});
			return false
		}
	</script>
</head>
<body>	
	<!-- 좌측 바 -->
	<div id="aside" style = "width: 191px; background-color:#ffffff">
		<div class="side_inner">
			<div class="col-lg-3 col-md-3 col-sm-4" style = "width:190px; text-align:left; font-size:15px">
			<div class="list-group table-of-contents">
				<c:if test="${menuCategry == 1}">
					<p class="lead">상품관리</p>
					<a class="list-group-item" href="/adminProdctDisply.do">-&nbsp;상품조회</a>   
					<a class="list-group-item" href="/adminProdctInsertPage.do">-&nbsp;상품등록</a>
				</c:if>
				<c:if test="${menuCategry == 2}">
					<p class="lead">주문관리</p>
					<a class="list-group-item" href="/allOrder.do">-&nbsp;전체 주문 조회</a>
					<a class="list-group-item" href="/creditList.do">-&nbsp;입금 전 관리</a>
					<a class="list-group-item" href="/prodctReadyList.do">-&nbsp;상품 준비중 관리</a>
					<a class="list-group-item" href="/shippingReady.do">-&nbsp;배송 준비중 관리</a>
					<a class="list-group-item" href="/shippingList.do">-&nbsp;배송중 관리</a>
					<a class="list-group-item" href="/shippingFinish.do">-&nbsp;배송완료 관리</a>
					   
<!-- 					<p class="lead" style="margin-top:30px">취소/교환/반품 관리</p> -->
<!-- 					<a class="list-group-item" href="/creditCancel.do">-&nbsp;입금 전 취소 관리</a> -->
<!-- 					<a class="list-group-item" href="/creditWoocancel.do">-&nbsp;입금 후 취소 관리</a> -->
<!-- 					<a class="list-group-item" href="/exchangeList.do">-&nbsp;교환 관리</a> -->
<!-- 					<a class="list-group-item" href="/returnList.do">-&nbsp;반품 관리</a> -->
				</c:if>
				<c:if test="${menuCategry == 3}">
					<p class="lead">코디요청관리</p>
				</c:if>
				<c:if test="${menuCategry == 4}">
					<p class="lead">코디공유게시판</p>
				</c:if> 
				<c:if test="${menuCategry == 5}">
					<p class="lead">배너관리</p>
<!-- 					<a class="list-group-item" href="#navbar">-&nbsp;행사관리</a> -->
<!-- 					<a class="list-group-item" href="#buttons">-&nbsp;배너관리</a> -->
				</c:if> 
				<c:if test="${menuCategry == 6}">
					<p class="lead">고객관리</p>
				</c:if>			
			</div>
		</div>
			<div class="bottom_ui">
				<div class="scroll">
					<span class="btn_scroll top" onclick="winScroll('top');"></span>
					<span class="btn_scroll bottom" onclick="winScroll('bottom');"></span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
