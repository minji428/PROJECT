<%@page import="ticket.buyDAO"%>
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
request.setCharacterEncoding("UTF-8");
%>

<%
String id=(String)session.getAttribute("id");
ArrayList<buyDTO> buylist = buyDAO.instance.getbuyList(id);
int num=0;
%>

<h2>주문내역 확인</h2>
	<hr size="2" color="purple" width = "300">
	<br><br>
	<table>
		<tr height="50">
			<td width="50" align="center">
				<font size = "3" color="purple">번호</font>
			</td>
			<td width="50" align="center">
				<font size = "3" color="purple"></font>
			</td>
			<td width="100" align="center">
				<font size = "3" color="purple">상품명</font>
			</td>
			<td width="50" align="center">
				<font size = "3" color="purple">수량</font>
			</td>
			<td width="100" align="center">
				<font size = "3" color="purple">가격</font>
			</td>
			<td width="200" align="center">
				<font size = "3" color="purple">주문일</font>
			</td>
			<td width="150" align="center">
				<font size = "3" color="purple">결제수단</font>
			</td>
		</tr>
		<tr height="10">
			<td colspan="7">
				<hr size="2" color="gray" width="800">
			</td>
		</tr>
		<%
		for(int i =0;i<buylist.size();i++){
			buyDTO bean = buylist.get(i);
			
			%>
		<tr height="50">
			<td width="50" align="center">
				<font size="2"><%=++num %></font>
			</td>
			<td width="50" align="center">
				<img src="TP_img/<%=bean.getTicket_image() %>" height="50">
			</td>
			<td width="100" align="center">
				<font size = "2"><%=bean.getTicket_name() %></font>
			</td>
			<td width="50" align="center">
				<font size = "2"><%=bean.getBuy_count()%></font>
			</td>
			<td width="100" align="center">
				<font size = "2" ><%=bean.getBuy_price()*bean.getBuy_count() %></font>
			</td>
			<td width="200" align="center">
				<font size = "2"><%=bean.getBuy_date() %></font>
			</td>
			<td width="150" align="center">
				<font size = "2"><%=bean.getHowpay() %></font>
			</td>
		</tr>
			<%
			
		}
		
		%>
	
	
	</table>
</body>
</html>