<%@page import="ticket.cartDAO"%>
<%@page import="ticket.cartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<%
request.setCharacterEncoding("UTF-8");
%>
</head>
<body>

	<%
	String id=(String)session.getAttribute("id");
	ArrayList<cartDTO> cartlist = cartDAO.instance.getCartList(id);
	int num=0;
	int cnt=cartDAO.instance.countTicket(id);
	int total=0;
	int deliveryfee=3000;
	%>
	
	<h2>장바구니</h2>
	<hr size="2" color="purple" width = "300">
	<%
	if(cnt==0){
		%>
		<h3>장바구니에 담겨있는 상품이 없습니다.</h3>
		<%
	}else{
		for(int i=0;i<cartlist.size();i++){
			cartDTO bean = cartlist.get(i);
		%>
		
			<table>
				<tr height="40">
					<td width="50" align="center">
						<font size="2"><%=++num %></font>
					</td>
					<td width = "100" align = "center">
						<img alt="아이템사진" src="TP_img/<%=bean.getTicket_image() %>" height="40">
					</td>
					<td width = "300">
						<font size = "3"> <b><%=bean.getTicket_name() %></b></font>
					</td>
					<td width = "100" align = "center">
						<font size = "3"> <b><%=bean.getBuy_count() %></b></font>
					</td>
					<td width = "100">
						<font size = "3"> <b><%=bean.getBuy_price()*bean.getBuy_count() %>원</b></font>
					</td>
					<td width = "40" align = "center">
					<input type = "image" value="삭제" src = "TP_img/delete.png" onclick="location.href='18_deleteCart.jsp?cart_number=<%=bean.getCart_number()%>'">
						<%--<button type="button" onclick="location.href='21_deleteCart.jsp?cart_number=<%=bean.getCart_number()%>'" style="height:18px">
							<img src ="img/delete.png"> --%>
						</button> 
					</td>
				</tr>
				
			</table>
		
		<hr size="1" color="gray" width="680">
		<%
		total += bean.getBuy_count()*bean.getBuy_price();
		}
		%>
		<form method="post" action="00_main.jsp?center=19_order.jsp">
		<table>
			<tr height = "30">
				<td align="right" width = "480" align="right">
					<h4>총 상품금액 </h4>
				</td>
				<td align="right" width = "200" align="right">
					<h4><%=total %>원</h4>
				</td>
			</tr>
			<tr height = "40">
				<td align="right" width = "480" align="right">
					<h5>배송비</h5>
				</td>
				<td align="right" width = "200" align="right">
						<h5>0원</h5>
				</td>
			</tr>
			<tr height = "40">
				<td align="right" width = "480" align="right">
					<h3>총 결제금액 </h3>
				</td>
				<td align="right" width = "200" align="right">
						<h3><b><%=total%>원</b></h3>
				</td>
			</tr>
			<tr height = "30">
				<td align="right" colspan="2">
					<input type="submit" name="submit" value="주문하기" class="btn btn-warning" />
					<input type="hidden" name="total" value=<%=total %>>
				</td>
			</tr>
		</table>
		</form>
		<%
		
	}//end of else
	
	%>
</body>
</html>