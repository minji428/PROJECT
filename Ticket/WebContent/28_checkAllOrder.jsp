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
int num=0;
%>

<table>
	<tr height="50">
		<td width="50" align="center"><b>번호</b></td>
		<td width="100" align="center"><b>아이디</b></td>
		<td width="100" align="center"><b>주문자명</b></td>
		<td width="100" align="center"><b>상품명</b></td>
		<td width="100" align="center"><b>가격</b></td>
		<td width="100" align="center"><b>구매갯수</b></td>
		<td width="50" align="center"><b>이미지</b></td>
		<td width="200" align="center"><b>구매일자</b></td>
		<td width="100" align="center"><b>결제수단</b></td>
		<td width="300" align="center"><b>주소</b></td>
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