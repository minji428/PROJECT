<%@page import="ticket.ticketDAO"%>
<%@page import="ticket.ticketDTO"%>
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
	String id=(String)session.getAttribute("id");
	int ticket_number = Integer.parseInt(request.getParameter("ticket_number"));
	ticketDTO bean = ticketDAO.instance.getOneTicket(ticket_number);
	%>


	<form method = "post" action = "17_insertCart.jsp">
		<table border="1">
			<tr height="80">
				<td rowspan = "6" width = "350" align = "center" >
					<img alt="티켓이미지" src="TP_img/<%=bean.getTicket_image()%>" height = "350">
				</td>
				<td width = "400" colspan="2">
					<font size = "5"><b><%=bean.getTicket_name() %></b></font><br>
					<font size = "2"><%=bean.getTicket_info() %></font>
					
				</td>
			</tr>
			<tr height="70">
				<td width = "400" colspan="2">
					<font size="3"><b><del><%=bean.getTicket_price() %>원</del></b></font> →
					<font size="4" color="purple"><b><%=bean.getTicket_price() - bean.getTicket_price()*bean.getDiscount_rate()/100 %>원</b></font><br>
					<font size="2" color = "purple">구매 후 즉시 확정됩니다.</font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100">
					<font size="2"><b>판매단위</b></font>
				</td>
				<td width = "300">
					<font size="2">1개</font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100">
					<font size="2"><b>배송방법</b></font>
				</td>
				<td width = "300">
					<font size="2">e-ticket</font>
				</td>
			</tr>
			<tr height="50">
				<td width = "100">
					<font size="2"><b>구매수량</b></font>
				</td>
				<td width = "300">
					<input type = "number" name="buycnt" min="0" max="100" size = "100" value = "1">
				</td>
			</tr>
			<tr height="35">
				<td colspan="3" align="right">
					<input type="button" name="submit" class="btn btn-success" value="구매하기"/>
					<input type="hidden" name = "item_number" value="<%=bean.getTicket_number() %>">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>