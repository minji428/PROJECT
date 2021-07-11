<%@page import="ticket.cartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니삭제</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
	int cart_number = Integer.parseInt(request.getParameter("cart_number"));
	String buyer =(String)session.getAttribute("id");
	
	if(buyer==null){
		%>
		<script>
		alert("로그인 후 이용이 가능합니다.");
		location.href="00_main.jsp";
		</script>
		<%
	}else{
		cartDAO.instance.deleteCart(cart_number);
		response.sendRedirect("00_main.jsp?center=16_cartInfo.jsp");
		
	}

%>
</body>
</html>