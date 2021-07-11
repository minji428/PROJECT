<%@page import="ticket.cartDAO"%>
<%@page import="ticket.cartDTO"%>
<%@page import="ticket.ticketDAO"%>
<%@page import="ticket.ticketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		String buyer = (String)session.getAttribute("id");
		int ticket_number=Integer.parseInt(request.getParameter("ticket_number"));
		ticketDTO bean = ticketDAO.instance.getOneTicket(ticket_number);
		String ticket_name = bean.getTicket_name();
		int buy_price = bean.getTicket_price() - bean.getTicket_price()*bean.getDiscount_rate()/100;
		int buy_count = Integer.parseInt(request.getParameter("buycnt"));
		String ticket_image = bean.getTicket_image();
		
		cartDTO dto = new cartDTO();
		dto.setBuyer(buyer);
		dto.setTicket_name(ticket_name);
		dto.setBuy_price(buy_price);
		dto.setBuy_count(buy_count);
		dto.setTicket_image(ticket_image);
		
		cartDAO.instance.insertCart(dto);
	%>
	<script>
	alert("상품을 장바구니에 담았습니다.");
	location.href="00_main.jsp?center=16_cartInfo.jsp";
	</script>
</body>
</html>