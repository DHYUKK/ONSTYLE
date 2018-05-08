<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 내가 쓰는 꾸밈요소 -->
<link rel="stylesheet" href="/resources/consmr/mem/css/selectView.css">
<title>주문관리 메인화면</title>
</head>
<style type="text/css">
	a:link { color: #000000; text-decoration: none;} /* a:link : 클릭하지 않은 링크   --decoration : 밑줄 */
	a:visited { color: black; text-decoration: none;} /* a:visited : 한번 클릭했던 혹은 다녀갔던 링크 // none : 없는 상태 */
	a:hover { color: black; text-decoration: underline;} /* a:hover : 링크를 클릭하려고 마우스를 가져갔을 때//underline : 있는 상태 */
/*	a:active : 링크부분에서 마우스를 누르고 있는 동안의 상태 */
</style>
<script>
$(document).ready(function(){		//전체주문 갯수 나타내는거 ㅇㅇ
	$.ajax({
		url:"/all.do",
		success:function(all){
			$.each(all, function(i, state){
				if(state.order_state == "입금전"){
					$("#credit").html(state.stateCount);
				}else if (state.order_state == "상품준비중"){
					$("#prodctReady").html(state.stateCount);
				}else if (state.order_state == "배송준비중"){
					$("#shippingReady").html(state.stateCount);
				}else if (state.order_state == "배송중"){
					$("#shipping").html(state.stateCount);
				}else if (state.order_state == "배송완료"){
					$("#shippingFinish").html(state.stateCount);
				}else if (state.order_state == "입금전취소"){
					$("#creditCancel").html(state.stateCount);
				}else if (state.order_state == "입금후취소"){
					$("#creditWoocancel").html(state.stateCount);
				}else if (state.order_state == "교환"){
					$("#exchange").html(state.stateCount);
				}else if (state.order_state == "반품"){
					$("#return").html(state.stateCount);
				}
			})
		},
		error:function(xhr,status,error){ //ajax 오류인경우  
//             alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);       
        }
	})
});
</script>
<body>
	<!-- 상단바 -->
	<div>
		<c:import url="/adminTopMenu.do"/>
	</div>
	<!-- 좌측 바 -->
	<div>
		<c:import url="/adminLeftMenu.do?menuCategry=2"/>
	</div>
	<!-- 본인 디자인은 여기 안에서 -->
	<div class="mainContainer">
		<div class="col-md-12">
			<h4>주문 관리</h4>
			<hr>
		</div>
		<div >
			<h6>
				<font style="padding-left:10px;">
					<span class="glyphicon glyphicon-bullhorn"></span>
					&nbsp;&nbsp; 오늘의 할일
				</font>
			</h6>
		</div>
		<div class="board view view_v2" style="width:50%;"><!--view_v2-->
			<table class="basicT" summary="주문관리">
			<thead></thead>
				<tbody>
					<tr>
						<th scope="row" id="allow" style="width:25%;">입금전</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/creditList.do" id="credit"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">상품 준비중</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/prodctReadyList.do" id="prodctReady"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">배송준비중</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/shippingReady.do" id="shippingReady"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">배송중</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/shippingList.do" id="shipping"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">배송완료</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="#" id="shippingFinish"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">교환신청</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/exchangeList.do" id="exchange"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
					<tr>
						<th scope="row" id="allow">반품신청</th>
						<td colspan="6" headers="allow" class="copyT" style="text-align:left; padding-left:20px;">
							<font><a href="/returnList.do" id="return"><b> 0 </b></a> 건 </font>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
	</div><!-- 지워지면안됨 -->
</body>
</html>