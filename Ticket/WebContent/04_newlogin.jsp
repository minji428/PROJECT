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
		<h1>회원가입</h1>
		<hr width = "700" color = "black" size = "3"/>
		<br>
	<form method="post" action = "04_newloginPro.jsp" accept-charset="UTF-8">
	<table>
		<tr height = "50">
			<td width="150">
				<b>아이디</b>
			</td>
			<td width = "300" align="center">
				<div class="form-group">
				    <input type="text" name="id" class="form-control" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
				</div>
			</td>
		</tr>
		</table>
	<table>
		<tr height = "50">
			<td width="150">
				<b>비밀번호</b>
			</td>
			<td width = "300" align="center">
				<div class="form-group">
				    <input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력해주세요">
				</div>
			</td>
		</tr>
		<tr height = "50">
			<td width="150">
				<b>이름</b>
			</td>
			<td width = "300" align="center">
				<div class="form-group">
				    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요">
				</div>
			</td>
		</tr>
		<tr height = "50">
			<td width="150">
				<b>휴대폰</b>
			</td>
			<td width = "300" align="center">
				<div class="form-group">
      				<input type="text" name="tel" class="form-control" placeholder="010-1234-5678">
      			</div>
			</td>
		</tr>
		<tr height = "50">
			<td width="150">
				<b>주소</b>
			</td>
			<td width = "300" align="center">
				<div class="form-group">
      				<input type="text" name="address" class="form-control" placeholder="주소를 입력해주세요">
      			</div>
			</td>
		</tr>
		</table>
		<table>
			<tr height = "50">
				<td width="150">
					<b>이메일</b>
				</td>
				<td width = "300" align="center">
					<div class="form-group">
      					<input type="email" name="email" class="form-control" aria-describedby="emailHelp" placeholder="qwer@skuniv.ac.kr">
      				</div>
				</td>
			</tr>
			</table>
			<table>
				<tr height="50">
					<td colspan="2" align = "center">
					<br>
						<input type="submit" class="btn btn-success" value="회원가입" name="submit">
					</td>
				</tr>
			</table>
	</form>
</div>
</body>
</html>