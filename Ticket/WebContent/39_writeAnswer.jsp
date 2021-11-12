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
	String id = (String)session.getAttribute("id");
	String managerId = (String)session.getAttribute("managerId");
	
	int ref = bean.getRef();
	int re_step =  bean.getRe_step();
	int re_level = bean.getRe_level();
	String answerWriter="";
%>	
	
	<form action="40_writeAnswerPro.jsp" method="post" accept-charset="UTF-8" >
		<table>
			<tr height="50">
				<td width="200" align="center"> <b>작성자</b> </td>
				<td width="400">  
				<%
					if(managerId!=null){
				%>
						관리자
				<%
						answerWriter = "관리자";
					}else if(id!=null){
				%>
						<%=id %>
				<%
						answerWriter = id ;
					}else{
				%>
					<input type="text" name="writer" size="20" class="form-control">
				<%
					}
				%>
				</td>
			</tr>
			<tr height="50">
				<td width="200" align="center"> <b>제목</b> </td>
				<td width="400"> <input type="text" name="title" value="[답변]" size="50" class="form-control"> </td>
			</tr>
			<tr height="50">
				<td width="200" align="center"> <b>비밀번호</b> </td>
				<td width="400"> <input type="password" name="pw" size="20" class="form-control"> </td>
			</tr>
			<tr height="50">
				<td width="200" align="center"> <b>내용</b> </td>
				<td width="400"> <textarea rows="10" cols="50" name="content" class="form-control"></textarea> </td>
			</tr>
		
			<tr height="40">
				<td align="center" colspan="2">
					<input type="hidden" name="ref" value=<%= ref %>>
					<input type="hidden" name="re_step" value=<%= re_step %>>
					<input type="hidden" name="re_level" value=<%= re_level %>>
					<input type="hidden" name ="writer" value=<%=answerWriter %>>
					<input type="submit" class="btn btn-outline-success" value="답글쓰기"> &nbsp;
					<input type="reset" class="btn btn-outline-success" value="다시쓰기">&nbsp;
					<input type="button" class="btn btn-outline-success" onclick="location.href='00_main.jsp?center=22_customerCenter.jsp'" value="전체글보기" />
				</td>			
			</tr>
		</table>
	</form>
</body>
</html>