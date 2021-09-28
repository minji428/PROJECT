<%@page import="ticket.locationDAO"%>
<%@page import="ticket.locationDTO"%>
<%@page import="ticket.ticketDTO"%>
<%@page import="ticket.managerDAO"%>
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
int ticket_number=Integer.parseInt(request.getParameter("ticket_number"));
ticketDTO bean = managerDAO.instance.getOneTicket(ticket_number);
locationDTO lobean = locationDAO.instance.getOneLocation(ticket_number);
%>

<form method="post" action = "26_itemInfoUpdatePro.jsp" enctype="multipart/form-data" accept-charset="UTF-8">
	<table border="1"  style="border-collapse:collapse;">
		<tr height="30">
			<td width="150" align="center">
			 	번호
			</td>
			<td width = "300">
				<%=bean.getTicket_number() %>
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	카테고리
			</td>
			<td width = "300">
				<select name="category">
					<option value="100" <% if(bean.getTicket_category().equals("100")) { %>selected <% }%>>서울</option>
					<option value="200" <% if(bean.getTicket_category().equals("200")) { %>selected <% }%>>제주도</option>
					<option value="300" <% if(bean.getTicket_category().equals("300")) { %>selected <% }%>>경기도</option>
					<option value="400" <% if(bean.getTicket_category().equals("400")) { %>selected <% }%>>강원도</option>
					<option value="500" <% if(bean.getTicket_category().equals("500")) { %>selected <% }%>>충청도</option>
					<option value="600" <% if(bean.getTicket_category().equals("600")) { %>selected <% }%>>전라도</option>
					<option value="700" <% if(bean.getTicket_category().equals("700")) { %>selected <% }%>>경상도</option>
				</select>
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	상품명
			</td>
			<td width = "300">
				<input type = "text" name = "name" value="<%=bean.getTicket_name() %>">
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	가격
			</td>
			<td width = "300">
				<input type = "text" name = "price" value="<%=bean.getTicket_price() %>">
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	재고
			</td>
			<td width = "300">
				<input type = "text" name = "stock"  size="3" value="<%=bean.getTicket_stock() %>">
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	이미지
			</td>
			<td width = "300">
				<img src="TP_img/<%=bean.getTicket_image() %>" height="30">
				<input type="file" name = "image" value="업로드">
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	상품정보
			</td>
			<td width = "300">
				<input type = "text" name = "info" value="<%=bean.getTicket_info() %>" >
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	할인률
			</td>
			<td width = "300">
				<input type = "text" name = "discount_rate" size="3" value="<%=bean.getDiscount_rate() %>">%
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	등록일
			</td>
			<td width = "300">
				<%=bean.getReg_date() %>
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	판매량
			</td>
			<td width = "300">
				<%=bean.getSold() %>
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	위도
			</td>
			<td width = "300">
				<input type = "text" name = "yposition" size="5" value="<%=lobean.getY_position() %>">
			</td>
		</tr>
		<tr height="30">
			<td width="150" align="center">
			 	경도
			</td>
			<td width = "300">
				<input type = "text" name = "xposition" size="5" value="<%=lobean.getX_position() %>">
			</td>
		</tr>
		<tr height="30">
			<td width="450" align="center" colspan="2">
			 	<input type="submit" value="수정하기">&nbsp;
			 	
			 	<input type="hidden" name="ticket_number" value=<%=bean.getTicket_number() %>>
			 	<input type="hidden" name="ticket_category" value=<%=bean.getTicket_category() %>>
			 	<input type="hidden" name="ticket_name" value=<%=bean.getTicket_name() %>>
			 	<input type="hidden" name="ticket_price" value=<%=bean.getTicket_price() %>>
			 	<input type="hidden" name="ticket_stock" value=<%=bean.getTicket_stock() %>>
			 	<input type="hidden" name="ticket_image" value=<%=bean.getTicket_image() %>>
			 	<input type="hidden" name="ticket_info" value=<%=bean.getTicket_info() %>>
			 	
			 	<input type="reset" value="다시작성">
			 	
			</td>
		</tr>
	</table>
</form>
</body>
</html>