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
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String pw = request.getParameter("pw");
	String content = request.getParameter("content");
	
	boardDTO dto = new boardDTO();
	
	dto.setRef(ref);
	dto.setRe_step(re_step);
	dto.setRe_level(re_level);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setPw(pw);
	dto.setContent(content);

	boardDAO.instance.writeAnswer(dto);
	response.sendRedirect("00_main.jsp?center=22_customerCenter.jsp");

%>
</body>
</html>