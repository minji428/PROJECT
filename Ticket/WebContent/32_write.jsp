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
	String id = (String)session.getAttribute("id");
	String managerId = (String)session.getAttribute("managerId");
%>

<form method="post" action = "33_writePro.jsp" accept-charset="UTF-8">
	<table>
		<tr height = "50">
			<td width = "200" align="center"><b>작성자</b></td>
			<td width = "400">
				<input type = "text" name ="writer" size = "20" class="form-control">
			</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center"><b>제목</b></td>
			<td width = "400">
				<input type = "text" name ="title" size = "50" class="form-control">
			</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center"><b>비밀번호</b></td>
			<td width = "400">
				<input type = "password" name ="pw" size = "20" class="form-control">
			</td>
		</tr>
		<tr height = "150">
			<td width = "200" align="center"><b>글내용</b></td>
			<td width = "400">
				<textarea cols="50" rows="10" name = "content" class="form-control"></textarea>
			</td>
		</tr>
	</table>
	<br>
	<input type = "submit" class="btn btn-outline-info" value = "글쓰기">&nbsp;
	<input type = "reset" class="btn btn-outline-warning" value = "다시쓰기">
</form>
</body>
</html>