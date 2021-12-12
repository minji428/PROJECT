<%@page import="ticket.customerDAO"%>
<%@page import="ticket.buyDTO"%>
<%@page import="ticket.cartDAO"%>
<%@page import="ticket.cartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticket.buyDAO"%>
<%@page import="ticket.customerDTO"%>
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
request.setCharacterEncoding("UTF-8");
%>
<%
	String customer_id = (String)session.getAttribute("id");	
	customerDTO customerBean = buyDAO.instance.getCustomerInfo(customer_id);
	ArrayList<cartDTO> cartlist = cartDAO.instance.getCartList(customer_id);
	int payhow = Integer.parseInt(request.getParameter("howPay"));
	int usePoint = Integer.parseInt(request.getParameter("usePoint"));
	int ePoint = customerDAO.instance.getPoint("id");
	String pay="";
	if(payhow==1){
		pay="계좌이체";
	}else if(payhow==2){
		pay="신용카드";
	}
	
	for(int i=0;i<cartlist.size();i++){
		cartDTO bean = cartlist.get(i);
		
		String customer_name =customerBean.getName();		
		int cart_number = bean.getCart_number();
		String ticket_name = bean.getTicket_name();	
		int buy_price = bean.getBuy_price();
		int buy_count = bean.getBuy_count();
		String ticket_image = bean.getTicket_image();		
		String howpay = pay;		
		String address = customerBean.getAddress();
		
		buyDTO dto = new buyDTO();
		dto.setCustomer_id(customer_id);
		dto.setCustomer_name(customer_name);
		dto.setCart_number(cart_number);
		dto.setTicket_name(ticket_name);
		dto.setBuy_price(buy_price);
		dto.setBuy_count(buy_count);
		dto.setTicket_image(ticket_image);
		dto.setHowpay(howpay);
		dto.setAddress(address);
		
		customerDTO cus = new customerDTO();
		int point = buy_price*(int)0.01;	
		
		System.out.println("point 출력 : "+point);
		cus.setPoint(ePoint-usePoint+point);
		
		buyDAO.instance.insertOrderList(dto);
		buyDAO.instance.updateSold(ticket_name, buy_count);
	}
	buyDAO.instance.deleteCartList(customer_id);
	%>
	<script>
		alert("주문이 완료되었습니다.");
		location.href="00_main.jsp";
	</script>
	<%

%>
</body>
</html>