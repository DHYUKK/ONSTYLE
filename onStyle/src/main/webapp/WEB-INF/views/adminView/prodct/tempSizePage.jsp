<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-bordered" id="sizeTable" style="width:100%; float:left; text-align:center">
		<tr>
			<th colspan="9" class="active text-center">
				size
			</th>
		</tr>
		<c:choose>
			<c:when test="${category_seq == 1 or category_seq == 3 or category_seq == 5 or category_seq == 6 or category_seq == 7 or category_seq == 8}">
				<tr>
					<td>
						<input type="checkbox" name="selectAll" id="selectAll">
					</td>
					<td>
						사이즈
					</td>
					<td>
						총기장
					</td>
					<td>
						어깨넓이
					</td>
					<td>
						가슴 둘레
					</td>
					<td>
						밑단 둘레
					</td>
					<td>
						소매 길이
					</td>
					<td>
						소매통
					</td>
					<td>
						소매 절개선 둘레
					</td>
				</tr>
				<c:forEach var="TempSizeList" items="${TempSizeList}" varStatus="status">
					<tr>
						<td>
							<input type="checkbox" name="checkTemp" value="${TempSizeList.top_size_seq}">
						</td>
						<td>
							${TempSizeList.top_size_nme}
						</td>
						<td>
							${TempSizeList.top_length}
						</td>
						<td>
							${TempSizeList.top_shouldr}
						</td>
						<td>
							${TempSizeList.top_bust}
						</td>
						<td>
							${TempSizeList.top_tail_girth}
						</td>
						<td>
							${TempSizeList.top_slv_length}
						</td>
						<td>
							${TempSizeList.top_slv_opening}
						</td>
						<td>
							${TempSizeList.top_slv_bill}
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:when test="${category_seq == 2 or category_seq == 9 or category_seq == 10}">
				<tr>
					<td>
						<input type="checkbox" name="selectAll" id="selectAll">
					</td>
					<td>
						사이즈
					</td>
					<td>
						총기장
					</td>
					<td>
						허벅지 둘레
					</td>
					<td>
						밑단 둘레
					</td>
					<td>
						앞 밑위 둘레
					</td>
					<td>
						뒷 밑위 둘레
					</td>
					<td>
						힙 둘레
					</td>
					<td>
						허리둘레
					</td>
				</tr>
				<c:forEach var="TempSizeList" items="${TempSizeList}" varStatus="status">
					<tr>
						<td>
							<input type="checkbox" name="checkTemp" value="${TempSizeList.bottom_size_seq}">
						</td>
						<td>
							${TempSizeList.bottom_size_nme}
						</td>
						<td>
							${TempSizeList.bottom_length}
						</td>
						<td>
							${TempSizeList.bottom_thigh}
						</td>
						<td>
							${TempSizeList.bottom_tail_girth}
						</td>
						<td>
							${TempSizeList.bottom_front_width}
						</td>
						<td>
							${TempSizeList.bottom_back_width}
						</td>
						<td>
							${TempSizeList.bottom_hip}
						</td>
						<td>
							${TempSizeList.bottom_waist}
						</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
</body>
</html>