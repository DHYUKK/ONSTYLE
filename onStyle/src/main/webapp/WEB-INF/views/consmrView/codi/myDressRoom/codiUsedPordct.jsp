<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<!-- 나의 코디에서 조회 and 활용한 미스봄 상품이 있음 -->
	<c:if test="${pageCode eq 1 and codiRead ne '[]'}">
		<c:forEach var="codiRead" items="${codiRead}" varStatus="status">
			<div class="col-xs-4" style ="border:1px solid #e0e0e0; margin:30px 40px">
				<table onclick="javascript:prodct_read(${codiRead.prodct_seq})" style = "width:100%; height:210px; text-align:center; cursor:pointer;">
					<tr>
						<td style="height:140px">
						<img src="${codiRead.transparent_img_route}" style="max-height: 100%; max-width: 100%;">
						</td>
					</tr>
					<tr>
						<td>${codiRead.prodct_nme}</td>
					 </tr>
					 <tr>
					 	<td>${codiRead.prodct_price}</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 나의 코디에서 조회 and 활용한 미스봄 상품이 없음 -->
	<c:if test="${pageCode eq 1 and codiRead eq '[]'}">
		<center><h3 style="margin-top:45%; font-size: 25px; color: red;">활용된 미스봄 상품이 없습니다.</h3></center>
	</c:if>
	
	<!-- 코디요청내역에서 조회 and 활용한 미스봄 상품이 있음 -->
	<c:if test="${pageCode eq 2 and codiRead ne '[]'}">
		<c:forEach var="codiRead" items="${codiRead}" varStatus="status">
			<div class="col-xs-2" style ="border:1px solid #e0e0e0; margin:30px 40px">
				<table onclick="javascript:prodct_read(${codiRead.prodct_seq})" style = "width:100%; height:210px; text-align:center; cursor:pointer;">
					<tr>
						<td style="height:140px">
						<img src="${codiRead.transparent_img_route}" style="max-height: 100%; max-width: 100%;">
						</td>
					</tr>
					<tr>
						<td>${codiRead.prodct_nme}</td>
					 </tr>
					 <tr>
					 	<td>${codiRead.prodct_price}</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</c:if>
	
	<!-- 나의 코디에서 조회 and 활용한 미스봄 상품이 없음 -->
	<c:if test="${pageCode eq 2 and codiRead eq '[]'}">
		<center><h3 style="margin:11% 0%; font-size: 25px; color: red;">활용된 미스봄 상품이 없습니다.</h3></center>
	</c:if>
