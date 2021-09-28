<%@page import="ticket.managerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int ticket_number=Integer.parseInt(request.getParameter("ticket_number"));
	System.out.println("ticket_number확인 = " + ticket_number);
	
	managerDAO.instance.deleteTicket(ticket_number);
	managerDAO.instance.deleteLocation(ticket_number);
	response.sendRedirect("00_main.jsp?center=25_itemInfoUpdate.jsp");
	%>
</body>
</html>