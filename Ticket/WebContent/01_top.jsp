<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	// 세션을 이용한 로그인 처리
	String id = (String)session.getAttribute("id");

	// 로그인이 되어있지 않다면
	if(id == null){
		id = "GUEST";
	}
%>
	<table>
		<tr height="70">
			<td colspan="5">
				<a href="00_main.jsp"  style="text-decoration: none">
				<img alt="" src="TP_img/KakaoTalk_20210414_195932358.jpg" height="120">
				</a>
			</td>
			<td colspan="2">
				<%=id %>님
				<%
					if(id.equals("GUEST")){
				%>
				<button onclick="location.href='00_main.jsp?center=04_login.jsp'" class="btn btn-light"> 로그인 </button>
				<button onclick="location.href='00_main.jsp?center=04_newlogin.jsp'" class="btn btn-light"> 회원가입 </button>
				<%						
					}else{
				 %>
				 		<button onclick="location.href='00_main.jsp?center=16_cartInfo.jsp'" class="btn btn-light"> 장바구니 </button> 
				 		<button onclick="location.href='05_logout.jsp'" class="btn btn-light"> 로그아웃 </button> 
				<%						
					}
				 %>
			</td>
		</tr>
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