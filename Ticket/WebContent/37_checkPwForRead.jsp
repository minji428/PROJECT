<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>

<%
	int num = Integer.parseInt(request.getParameter("num"));
%>
<form method="post" action = "38_checkPwForReadPro.jsp">
	<table>
		<tr height = "50">
			<td width="200">비밀번호 입력</td>
			<td width = "300">
				<input type = "password" name = "pw" size = "20" class="form-control">
			</td>
		</tr>
	</table>
	<input type = "submit" value = "확인" class="btn btn-light">
	<input type = "hidden" name = "num" value = "<%=num %>">
</form>
</body>
</html>