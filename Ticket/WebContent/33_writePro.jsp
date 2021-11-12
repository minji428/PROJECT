<%@page import="ticket.boardDAO"%>
<%@page import="ticket.boardDTO"%>
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
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String pw = request.getParameter("pw");
	String content = request.getParameter("content");
	String id = (String)session.getAttribute("id");
	
	if(pw==""){
		
	}else{
		title = "[비밀글]"+title;
	}
	
	if(writer==null){
		writer=id;
	}
	
	boardDTO dto = new boardDTO();
	
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setPw(pw);
	dto.setContent(content);
	
	boardDAO.instance.insertBoard(dto);
	response.sendRedirect("00_main.jsp?center=22_customerCenter.jsp");
	
%>
</body>
</html>