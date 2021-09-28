<%@page import="ticket.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticket.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	
	int pageSize=10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int count = 0;
	int number = 0;
	
	int curPage = Integer.parseInt(pageNum);
	count = boardDAO.instance.getAllCount();
	
	int startRow=(curPage-1)*pageSize;
	int endRow = curPage*pageSize;
	
	ArrayList<boardDTO> boardlist = boardDAO.instance.getAllBoardlist(startRow, endRow);
	
	number = count - (curPage-1)*pageSize;
%>

	<h2>고객센터</h2>
	<hr size = "1" color = "purple" width = "300">
	<br>
	






</body>
</html>