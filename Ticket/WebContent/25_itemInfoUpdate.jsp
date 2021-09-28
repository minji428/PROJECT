<%@page import="ticket.ticketDAO"%>
<%@page import="ticket.ticketDTO"%>
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
ArrayList<ticketDTO> allTicket = ticketDAO.instance.getAllTicket();
%>

<table>
	<tr>
		<td width="1000" align="left">
			<button onclick="location.href='00_main.jsp?center=23_addNewTicket.jsp'">신상품 추가하기</button>
		</td>
	</tr>
</table>

<table border="1"  style="border-collapse:collapse;">
	<tr height="50">
		<td width = "50" align="center"><b>번호</b></td>
		<td width = "100" align = "center"><b>카테고리</b></td>
		<td width = "100" align = "center"><b>상품명</b></td>
		<td width = "100" align = "center"><b>가격</b></td>
		<td width = "50" align = "center"><b>재고</b></td>
		<td width = "50" align = "center"><b>이미지</b></td>
		<td width = "200" align = "center"><b>상품정보</b></td>
		<td width = "50" align = "center"><b>할인률</b></td>
		<td width = "100" align = "center"><b>등록일</b></td>
		<td width = "50" align = "center"><b>판매량</b></td>
		<td width = "100" align = "center" colspan="2"><b>수정/삭제</b></td>
	<%
	for(int i=0;i<allTicket.size();i++){
		ticketDTO bean = allTicket.get(i);
		
		%>
		<tr height="50">
			<td width = "50" align="center">
				<%=bean.getTicket_number() %>
			</td>
			<td width = "100" align = "center"><%--카테고리 --%>
				<%
				if(bean.getTicket_category().equals("100")){
					%>
					서울
					<%
				}else if(bean.getTicket_category().equals("200")){
					%>
					제주도
					<%
				}else if(bean.getTicket_category().equals("300")){
					%>
					경기도
					<%
				}else if(bean.getTicket_category().equals("400")){
					%>
					강원도
					<%
				}else if(bean.getTicket_category().equals("500")){
					%>
					충청도
					<%
				}else if(bean.getTicket_category().equals("600")){
					%>
					전라도
					<%
				}else if(bean.getTicket_category().equals("700")){
					%>
					경상도
					<%
				}				
				%>
			
			</td>
			<td width = "100" align = "center"><%--상품명 --%>
				<%=bean.getTicket_name() %>
			</td>
			<td width = "100" align = "center"><%--가격 --%>
				<%=bean.getTicket_price() %>
			</td>
			<td width = "50" align = "center" ><%--재고 --%>
				<%=bean.getTicket_stock() %>
			</td>
			<td width = "50" align = "center"><%--현재이미지 --%>
				<img src="TP_img/<%=bean.getTicket_image() %>" height="50">
			</td>
			<td width = "200" align = "center"><%--상품정보 --%>
				<%=bean.getTicket_info() %>
			</td>
			<td width = "50" align = "center"><%--할인률 --%>
				<%=bean.getDiscount_rate() %>
			</td>
			<td width = "100" align = "center"><%--등록일--%>
				<%=bean.getReg_date() %>
			</td>
			<td width = "50" align = "center"><%--판매량--%>
				<%=bean.getSold() %>
			</td>
			<td width = "50" align = "center"><%--수정버튼--%>
				<a href="00_main.jsp?center=27_itemInfoUpdateForm.jsp?ticket_number=<%=bean.getTicket_number() %>">수정</a>
			</td>
			
			<td width = "50" align = "center"><%--삭제버튼--%>
				<a href="29_deleteTicket.jsp?ticket_number=<%=bean.getTicket_number() %>">삭제</a>
			</td>
		</tr>
		<%
	}
	%>
</table>
</body>
</html>