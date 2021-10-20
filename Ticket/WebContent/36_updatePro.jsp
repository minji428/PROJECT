<%@page import="ticket.boardDAO"%>
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
	
	boardDAO.instance.updateBoard(num);
%>
<script>
	alert("게시글 수정이 완료되었습니다.");
	location.href="00_main.jsp?center=22_customerCenter.jsp";

</script>
</body>
</html>