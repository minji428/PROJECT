<%@page import="ticket.managerDAO"%>
<%@page import="ticket.managerDTO"%>
<%@page import="ticket.buyDAO"%>
<%@page import="ticket.customerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리 소스</title>
<%
request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
String id=(String)session.getAttribute("id");
String managerId=(String)session.getAttribute("managerId");

customerDTO customerbean = buyDAO.instance.getCustomerInfo(id);
managerDTO managerbean = managerDAO.instance.getManagerInfo(managerId);
String name="";
%>
		<div align="right">
			<font size="2">
			<%
			if(id==null && managerId==null){
				%>
			<a href = "00_main.jsp?center=04_newlogin.jsp" style="text-decoration: none">회원가입</a>&nbsp;
			<img alt="" src="img/top1.jpg"> &nbsp;
			<a href = "00_main.jsp?center=04_login.jsp" style="text-decoration: none">로그인</a>&nbsp;
				
				<%
			}else{
				if(id!=null){
					name = customerbean.getName();
					System.out.println("로그인 아이디 확인용 = " + name);
					%>
					<%=name %>님 &nbsp;  <img alt="" src="img/top1.jpg"> &nbsp;
					<a href = "00_main.jsp?center=24_orderListCheck.jsp" style="text-decoration: none">주문확인</a>&nbsp;
					<%
				}else if(managerId!=null){
					name = managerbean.getName();
					%>
					<%=name %>님 &nbsp;  <img alt="" src="img/top1.jpg"> &nbsp;
					<a href = "00_main.jsp?center=28_itemInfoUpdate.jsp" style="text-decoration: none">상품수정</a>&nbsp;
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href = "00_main.jsp?center=34_checkAllOrder.jsp" style="text-decoration: none">주문확인</a>&nbsp;
					<%
				}
				%>
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href = "00_main.jsp?center=05_logout.jsp" style="text-decoration: none">로그아웃</a>&nbsp;
				<%
			}
			%>
					<img alt="" src="img/top1.jpg"> &nbsp;
					<a href = "00_main.jsp?center=07_customerCenter.jsp" style="text-decoration: none">고객센터</a>&nbsp;
			</font>
		</div>
		<div align="center">
			<a href="00_main.jsp">
				<img src="TP_img/KakaoTalk_20210414_195932358.jpg" alt="" height="80">
			</a>
		</div>
		
		<table>
		<tr height="50">
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=06_seoul.jsp" 
				style="text-decoration: none">서울</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=08_jeju.jsp" 
				style="text-decoration: none">제주도</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=09_gyeonggi.jsp" 
				style="text-decoration: none">경기도</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=10_kangwon.jsp" 
				style="text-decoration: none">강원도</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=11_chungcheng.jsp" 
				style="text-decoration: none">충청도</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=12_jeolla.jsp" 
				style="text-decoration: none">전라도</a></font>
			</td>
			<td align="center" width="200" bgcolor="white">
				<font color="white" size="3"><a href="00_main.jsp?center=13_gyeongsand.jsp" 
				style="text-decoration: none">경상도</a></font>
			</td>
		</tr>
	</table>
</body>
</html>