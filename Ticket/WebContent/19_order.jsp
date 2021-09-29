<%@page import="ticket.buyDAO"%>
<%@page import="ticket.cartDTO"%>
<%@page import="java.util.ArrayList"%>
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

	String id=(String)session.getAttribute("id");
	customerDTO customerBean = buyDAO.instance.getCustomerInfo(id);
	ArrayList<cartDTO> itemlist = buyDAO.instance.getTicketList(id);
	int num=0;
	int total = Integer.parseInt(request.getParameter("total"));
%>
<div width = "800">
	<h2>주문서</h2>
	<hr size="2" color="purple" width = "300">
	<br><br>
	<form method="post" action = "20_insertOrderList.jsp" accept-charset="UTF-8-">
	
	<table>
		<tr height="50">
		<td colspan = "4">
			<h3 align = "left">구매상품확인</h3>
		</td>
		</tr>
		<tr height="5">
		<td colspan ="4">
			<hr size="1" color="gray" width="800">
		</td>
		</tr>
		
		<%
		
		for(int i=0;i<itemlist.size();i++){
			cartDTO bean = itemlist.get(i);
			
			%>
			<tr height = "50">
				<td width = "200" align="center">
					<font size="2"><b><%=++num %></b></font>
				</td>
				<td width = "100" align="center">
					<img src="TP_img/<%=bean.getTicket_image() %>" height="50">
				</td>
				<td width = "400" align="center">
					<font size="3"><%=bean.getTicket_name() %></font>
				</td>
				<td width = "100" align="center">
					<font size="3"><%=bean.getBuy_count() %></font>
				</td>
			</tr>
			<%
		}
		%>
		</table>
	
	<%-- --%>
	<table>
		<tr height="50">
		<td colspan = "2">
			<h3 align = "left">구매자 정보</h3>
		</td>
		</tr>
		<tr height="5">
		<td colspan ="2">
			<hr size="1" color="gray" width="800">
		</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center">
				<font size="2"><b>이름</b></font>
			</td>
			<td width = "600">
				<input type="text" name = "buyerName" style="width:200px height:30px" value=<%=customerBean.getName() %>>
			</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center">
				<font size="2"><b>전화번호</b></font>
			</td>
			<td width = "600">
				<input type="text" name = "buyerTel" style="width:200px height:30px" value=<%=customerBean.getTel() %>>
			</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center">
				<font size="2"><b>주소</b></font>
			</td>
			<td width = "600">
				<input type="text" name = "buyerAddress" style="width:300px height:30px" value=<%=customerBean.getAddress() %>>
			</td>
		</tr>
		<tr height = "50">
			<td width = "200" align="center">
				<font size="2"><b>이메일</b></font>
			</td>
			<td width = "600">
				<input type="text" name = "buyerAddress" style="width:300px height:30px" value=<%=customerBean.getEmail() %>>
			</td>
		</tr>
		</table>
		<br>
		
		<table>
		<tr height="50">
		<td colspan = "2">
			<h3 align = "left">결제방법</h3>
		</td>
		</tr>
		<tr height="5">
		<td colspan ="2">
			<hr size="1" color="gray" width="800">
		</td>
		</tr>
		<tr height="50">
			<td width="200" align="center">
				<font size="2"><b>결제수단</b></font>
			</td>
			<td width="600">
				<select name="howPay">
					<option value="1">계좌이체</option>
					<option value="2">신용카드</option>
				</select>
			</td>
		</tr>
		</table>
		
		
		<table>
			<tr height="50">
				<td width="800">
					<h3 align = "left">결제금액</h3>
				</td>
			</tr>
			<tr height="5">
				<td width="800">
					<hr size="1" color="gray" width="800">
				</td>
			</tr>
			<tr height="50">
				<td align = "right" width="800">
					<h3><%=total %>원</h3>
				</td>
			</tr>
			<tr height="50">
				<td align="center" width="800">
					<input type="submit" name="submit" value="결제하기" class="btn btn-warning" />
				</td>
			</tr>
		
		</table>
	</form>
	</div>
</body>
</html>