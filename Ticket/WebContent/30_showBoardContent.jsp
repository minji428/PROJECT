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
		<td align="center" colspan="3"> <%= bean.getTitle() %></td>
	</tr>
	<tr height="80">
		<td align="center" width="120"> <b>글 내용</b> </td>
		<td align="center" colspan="3"> <%= bean.getContent() %></td>
	</tr>
	<tr height="40">
		<td align="center" colspan="4">
			
			<input type="button" value="답글쓰기" class="btn btn-outline-success" onclick="location.href='00_main.jsp?center=39_writeAnswer.jsp?num=<%= bean.getNum() %>'">
			<input type="button" value="수정하기" class="btn btn-outline-success" onclick="location.href='00_main.jsp?center=35_update.jsp?num=<%= bean.getNum() %>'" >
			<input type="button" value="삭제하기" class="btn btn-outline-success" onclick="location.href='34_delete.jsp?num=<%= bean.getNum() %>'" >
			<input type="button" value="목록보기" class="btn btn-outline-success" onclick="location.href='00_main.jsp?center=22_customerCenter.jsp'" >
		</td>
	</tr>
</table>
</body>
</html>