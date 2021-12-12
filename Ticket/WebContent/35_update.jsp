<%@page import="ticket.boardDAO"%>
<%@page import="ticket.boardDTO"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	
	boardDTO bean = boardDAO.instance.getOneBoard(num);
	%>
<form method = "post" action = "36_updatePro.jsp" accept-charset="UTF-8">
	<table>
		<tr height="40">
			<td align="center" width="120"> <b>글번호</b> </td>
			<td align="center" width="180"> <%= bean.getNum() %></td>
			<td align="center" width="120"> <b>조회수</b> </td>
			<td align="center" width="180"> <%= bean.getReadcount() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> <b>작성자</b> </td>
			<td align="center" width="180"> <%= bean.getWriter() %></td>
			<td align="center" width="120"> <b>작성일</b> </td>
			<td align="center" width="180"> <%= bean.getReg_date() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120"> <b>제목</b> </td>
			<td align="center" colspan="3"> 
			<input type = "text" value="<%= bean.getTitle() %>" size = "30" class="form-control">
			</td>
		</tr>
		<tr height="80">
			<td align="center" width="120"> <b>글 내용</b> </td>
			<td align="center" colspan="3"> 
			<textarea name="content" cols="50" rows="10" class="form-control">
				<%= bean.getContent() %>
			</textarea>
			</td>
		</tr>
	</table>
	<br>
	<input type = "submit" class="btn btn-outline-success" value = "수정하기">&nbsp;
	<input type = "reset" class="btn btn-outline-success" value = "다시작성">
	<input type = "hidden" name = "num" value = <%=num %>>
	<input type = "hidden" name = "num" value = <%=num %>>
	<input type = "hidden" name = "num" value = <%=num %>>
	<input type = "hidden" name = "num" value = <%=num %>>
	<input type = "hidden" name = "num" value = <%=num %>>
	<input type = "hidden" name = "num" value = <%=num %>>
</form>
</body>
</html>