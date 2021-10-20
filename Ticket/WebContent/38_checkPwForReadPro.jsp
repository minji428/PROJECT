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
	String pw = request.getParameter("pw");
	
	int check = boardDAO.instance.checkPwForRead(num, pw);
	
	if(check==1){
		%>
		<script>
			location.href="00_main.jsp?center=30_showBoardContent.jsp?num=<%=num%>";
		</script>
		<%
	}else{
		%>
		<script>
			alert("비밀번호가 다릅니다.");
			location.href="00_main.jsp?center=22_customerCenter.jsp";
		</script>
		<%
	}
%>
</body>
</html>