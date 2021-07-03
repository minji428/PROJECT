<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

<div align="center">
	<h3>비밀번호 찾기</h3>
	<hr width="700" color="black" size="3"/>
	<br>
	
	<form method="post" action="04_findPro.jsp" accept-charset="UTF-8">
	<table>
		<tr height="50">
			<td width="330">
				<h6>계정 생성 시 사용하신 이메일 주소를 입력하세요. 비밀번호를 알려드리겠습니다.</h6>
			</td>
		</tr>
		<tr height="20">
			<td></td>
		</tr>
		<tr height="50">
			<td>
				<div class="form-group">
	      			<input type="email" name="email" class="form-control" placeholder="이메일">
	      		</div>
			</td>
		</tr>
		<tr height="50">
			<td>
				<div class="form-group">
				    <input type="text" name="name" class="form-control" placeholder="이름">
				</div>
			</td>
		</tr>
		<tr height="50">
			<td>
				<div class="form-group">
				    <input type="text" name="id" class="form-control" placeholder="아이디">
				</div>
			</td>
		</tr>
		
		<tr height="50">
			<td>
				<input type="submit" class="btn btn-primary" value="					다음						">
			</td>
		</tr>
	</table>
	
	
	
	</form>








</div>

</body>
</html>