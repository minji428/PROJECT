<%@page import="ticket.ticketDTO"%>
<%@page import="ticket.ticketDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전라도</title>
<%
request.setCharacterEncoding("UTF-8");
%>

<%
	ArrayList<ticketDTO> allTicket = ticketDAO.instance.getCategoryTicket(600);
	int check=1;
%>
</head>
<body>
	<h2 align="left">카테고리</h2>
	
	<table>
		<tr height="30">
			<td align="center" width="200">입장권</td>
			<td align="center" width="200">액티비티</td>
			<td align="center" width="200">미식</td>
			<td align="center" width="200">스파/힐링</td>
			<td align="center" width="200">대여</td>
		</tr>
	</table>
	<br>
	
	<h2 align="left">전라도</h2>
	<img alt="전라도지도" src="TP_img/jeolla_map.jpg">
	
		<h2 align="left">추천티켓</h2>
	
	<table>
	<%
	int k=0;
	
	for(int i=0; i<allTicket.size(); i++){
		ticketDTO bean = allTicket.get(i);
		int sold = bean.getSold();
		String cate=bean.getTicket_category();
		if(cate.equals("600")){
			if(sold >= 1){
				if(k%3==0){
					%>	
					<tr height="250">
					<%
				}
		%>
				<td width="400" align="center">
		<%
				if(check==1){
					%>
					<a href="00_main.jsp?center=14_showOneTicket.jsp?ticket_number=<%=bean.getTicket_number() %>&ticket_image=<%=bean.getTicket_image() %>" >
					<%
					if(bean.getTicket_stock()>0){
						%>
						<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250">
						<%
					}else{
						%>
						<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250" style = "opacity : 40%">
						<%
					}
					%>
					</a>
					<%
				}
		%>
				<p><font size="5"><b><%=bean.getTicket_name() %></b></font></p>
				
		<%
					if(bean.getTicket_stock()>0){
						int price = bean.getTicket_price();
						int realprice = bean.getTicket_price() - bean.getTicket_price()*bean.getDiscount_rate()/100;
						if(price==realprice){
							%>
							<p><font size = "4"><%=bean.getTicket_price() %>원</font></p>
							<%
						}else if(price>realprice){
							%>
							<p><font size = "3"><del><%=bean.getTicket_price() %>원</del></font>
							→				
							<font size = "4" color = "purple"><b><%=realprice %>원</b></font></p>
							<%
						}
						
						%>
						<p><font size = "2"><%=bean.getTicket_info() %></font></p>
						<%
					}else{
						%>
						<p><font size = "3" color = "red"><b>품절</b></font></p>
						<%
					}%>
				</td>		
			<%
			k+=1;
			}
		}
	}
	%>
	</table>
	
	<h2 align="left">티켓</h2>
	
	<table>
	<%
	int j=0;

	for(int i=0;i<allTicket.size();i++){
		ticketDTO bean = allTicket.get(i);
		if(j%3==0){
			%>
			<tr height="250" >
			<%
		}

		String cate=bean.getTicket_category();
			%>
			
			<td width = "400" align="center">
			<%
			if(check==1){
				%>
				<a href="00_main.jsp?center=14_showOneTicket.jsp?ticket_number=<%=bean.getTicket_number() %>&ticket_image=<%=bean.getTicket_image() %>" >
				<%
				if(bean.getTicket_stock()>0){
					%>
					<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250">
					<%
				}else{
					%>
					<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250" style = "opacity : 40%">
					<%
				}
				%>
				</a>
				<%
			}else{
				%>
				<a href="00_main.jsp?center=14_showOneTicket.jsp?ticket_number=<%=bean.getTicket_number() %>&ticket_image=<%=bean.getTicket_image() %>" >
				<%
				if(bean.getTicket_stock()>0){
					%>
					<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250">
					<%
				}else{
					%>
					<img alt="" src="TP_img/<%=bean.getTicket_image() %>" width = "250" style = "opacity : 40%">
					<%
				}
				%>
				</a>
				<%
			}
			%>
				<p>
				<font size = "5"><b><%=bean.getTicket_name() %></b></font></p>
				
				<%
				if(bean.getTicket_stock()>0){
					int price = bean.getTicket_price();
					int realprice = bean.getTicket_price() - bean.getTicket_price()*bean.getDiscount_rate()/100;
					if(price==realprice){
						%>
						<p><font size = "4"><%=bean.getTicket_price() %>원</font></p>
						<%
					}else if(price>realprice){
						%>
						<p><font size = "3"><del><%=bean.getTicket_price() %>원</del></font>
						→				
						<font size = "4" color = "purple"><b><%=realprice %>원</b></font></p>
						<%
					}
					
					%>
					<p><font size = "2"><%=bean.getTicket_info() %></font></p>
					<%
				}else{
					%>
					<p><font size = "3" color = "red"><b>품절</b></font></p>
					<%
				}%>
			</td>		
			
			
		<%	
			j+=1;
	}
	
	%>

	</table>
</body>
</html>