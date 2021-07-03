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
	<form action="04_loginPro.jsp" method="post">
		<table>
			<tr height="100">
				<td align="center">
					<font size="6" color="gray">로그인</font>
				</td>
			</tr>
			<tr height="40">
				<td width="300">
					<div class="form-group">
					    <input type="text" name="id" class="form-control" placeholder="아이디">
					</div>
				</td>
			</tr>	
			<tr height="40">
				<td width="300">
					<div class="form-group">
					    <input type="password" name="pw" class="form-control" placeholder="비밀번호">
					</div>
				</td>
			</tr>
			<tr height="40">
				<td width="300"></td>
			</tr>
			<tr height="40">
				<td align="center">
					<input type="submit" value="                                    로그인                                            " class="btn btn-primary"/>				
				</td>
			</tr>			
			<tr height="40">
				<td align="right">
					<a href="00_main.jsp?center=04_find.jsp">아이디를 잊으셨나요?</a>
				</td>
			</tr>					
			<tr height="40">
				<td><h6>회원이 아니신가요?</h6></td>
			</tr>
			<tr height="40">
				<td>
					<a href="00_main.jsp?center=04_newlogin.jsp"><input type="button" class="btn btn-success" value="회원가입"/></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>