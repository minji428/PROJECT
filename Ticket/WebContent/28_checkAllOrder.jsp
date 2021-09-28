<%@page import="ticket.managerDAO"%>
<%@page import="ticket.buyDTO"%>
<%@page import="java.util.ArrayList"%>
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
ArrayList<buyDTO> buylist = managerDAO.instance.getAllOrderList();
System.out.println("buylist size : "+buylist.size());
int num=0;
%>

<table border ="1" style="border-collapse:collapse;">
	<tr height="50">
		<td width="50" align="center">번호</td>
		<td width="100" align="center">아이디</td>
		<td width="100" align="center">주문자명</td>
		<td width="100" align="center">상품명</td>
		<td width="100" align="center">가격</td>
		<td width="100" align="center">구매갯수</td>
		<td width="50" align="center">이미지</td>
		<td width="200" align="center">구매일자</td>
		<td width="100" align="center">결제수단</td>
		<td width="300" align="center">주소</td>
	</tr>
	
	<%
	for(int i=0;i<buylist.size();i++){
		buyDTO bean = buylist.get(i);
		
		%>
		<tr height="30">
			<td width = "50" align="center"><%=++num %></td>
			<td width = "100" align="center"><%=bean.getCustomer_id() %></td>
			<td width = "100" align="center"><%=bean.getCustomer_name() %></td>
			<td width = "100" align="center"><%=bean.getTicket_name() %></td>
			<td width = "100" align="center"><%=bean.getBuy_price() %>원</td>
			<td width = "100" align="center"><%=bean.getBuy_count() %>개</td>
			<td width = "50" align="center">
				<img src="TP_img/<%=bean.getTicket_image() %>" height="50">
				</td>
			<td width = "200" align="center"><%=bean.getBuy_date() %></td>
			<td width = "100" align="center"><%=bean.getHowpay() %></td>
			<td width = "300" align="center"><%=bean.getAddress() %></td>
		</tr>
		
		<%
	}
	%>

</table>
</body>
</html>