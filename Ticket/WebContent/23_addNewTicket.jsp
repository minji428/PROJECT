<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action = "24_addNewTicketPro.jsp" enctype="multipart/form-data" accept-charset="UTF-8">
	<table>
		<tr height="30">
			<td width ="200">티켓 카테고리</td>
			<td width = "500">
				<select name="category">
					<option value="100">서울</option>
					<option value="200">제주</option>
					<option value="300">경기도</option>
					<option value="400">강원도</option>
					<option value="500">충청도</option>
					<option value="600">전라도</option>
					<option value="700">경상도</option>
				</select>
			
			</td>
		</tr>
		<tr height="30">
			<td width ="200">티켓명</td>
			<td width = "500">
				<input type="text" name="name">
			</td>
		</tr>
		<tr height="30">
			<td width ="200">티켓가격</td>
			<td width = "500">
				<input type="text" name="price">원
			</td>
		</tr>
		<tr height="30">
			<td width ="200">티켓재고</td>
			<td width = "500">
				<input type="text" name="stock">
			</td>
		</tr>
		<tr height="30">
			<td width ="200">이미지</td>
			<td width = "500">
				<input type="file" name="image">
			</td>
		</tr>
		<tr height="30">
			<td width ="200">티켓정보</td>
			<td width = "500">
				<input type="text" name="info" size="50">
			</td>
		</tr>
		<tr height="30">
			<td width ="200">할인률</td>
			<td width = "500">
				<input type="text" name="discountRate">%
			</td>
		</tr>
		<tr height="30">
			<td width ="200">위도</td>
			<td width = "500">
				<input type="text" name="yposition">
			</td>
		</tr>
		<tr height="30">
			<td width ="200">경도</td>
			<td width = "500">
				<input type="text" name="xposition">
			</td>
		</tr>
	
	</table>
	<input type="submit" value="티켓 추가하기" class="btn btn-outline-info">
</form>
</body>
</html>