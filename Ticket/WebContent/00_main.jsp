<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<div align="center">
	<%
		String center = request.getParameter("center");
		if(center == null){
			center="02_center.jsp";
		}
	%>	
	<table>
		<%-- top 부분 --%>
		<tr height="120" align="center">
			<td align="center" width="1000">
				<jsp:include page="01_top.jsp"/>
			</td>
		</tr>
		<%-- center 부분 --%>
		<tr align="center">
			<td align="center" width="1000">
				<jsp:include page="<%=center %>"/>
			</td>
		</tr>
		<%-- bottom 부분 --%>
		<tr height="100" align="center">
			<td align="center" width="1000">
				<jsp:include page="03_bottom.jsp"/>
			</td>
		</tr>
	</table>
</div>
</body>
</html>