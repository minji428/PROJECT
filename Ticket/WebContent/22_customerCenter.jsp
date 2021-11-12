<%@page import="ticket.boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ticket.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
	String managerId=(String)session.getAttribute("managerId");
	
	int pageSize=10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
	int count = 0;
	int number = 0;
	
	int curPage = Integer.parseInt(pageNum);
	count = boardDAO.instance.getAllCount();
	
	int startRow=(curPage-1)*pageSize;
	int endRow = curPage*pageSize;
	
	ArrayList<boardDTO> boardlist = boardDAO.instance.getAllBoardlist(startRow, endRow);
	
	number = count - (curPage-1)*pageSize;
%>

	<h2>고객센터</h2>
	<hr size = "1" color = "purple" width = "300">
	<br>
	
	<table>
		<tr height = "30">
			<td width = "50" align="center"><b>번호</b></td>
			<td width = "400" align="center"><b>제목</b></td>
			<td width = "200" align="center"><b>작성자</b></td>
			<td width = "200" align="center"><b>작성일</b></td>
			<td width = "50" align="center"><b>조회수</b></td>
		</tr>
		<%
		for(int i=0;i<boardlist.size();i++){
			boardDTO bean = boardlist.get(i);
			
			%>
			<tr height="30">
				<td width = "50" align="center"><%=number-- %></td>
				<td width = "400" align="left">
					<%
						if(bean.getRe_step() > 1){
							
							for(int j=0; j<(bean.getRe_step()-1)*5; j++){
					%>
						&nbsp;
					<%			
							}
						}
					%>
					<%
					if(managerId!=null){
						%>
						<a href="00_main.jsp?center=30_showBoardContent.jsp?num=<%= bean.getNum() %>" style="text-decoration: none"><%=bean.getTitle() %></a>
						<%
					}else{
						String pw = boardDAO.instance.checkPw(i);
						System.out.println("게시글 비밀번호 확인 : "+pw);
						if(pw.equals(" ")){
						%>
							<a href="00_main.jsp?center=30_showBoardContent.jsp?num=<%= bean.getNum() %>" style="text-decoration: none"><%=bean.getTitle() %></a>
						<%
						}
						else{
						%>
							<a href="00_main.jsp?center=37_checkPwForRead.jsp?num=<%= bean.getNum() %>" style="text-decoration: none"><%=bean.getTitle() %></a>
						<%}
					}
					%>						
				</td>
				<td width = "200" align="center"><%=bean.getWriter() %></td>
				<td width = "200" align="center"><%=bean.getReg_date() %></td>
				<td width = "50" align="center"><%=bean.getReadcount() %></td>
			</tr>
			
			<%
			
		}
		
		
		%>
	</table>
	
	<table>
		<tr height= "30">
			<td width = "910" align="right">
				<input type = "button" class="btn btn-outline-info" value = "글쓰기" onclick = "location.href='00_main.jsp?center=32_write.jsp'">
			</td>
		</tr>
	</table>
	
	<p>
	 	<%
			if(count > 0){
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	
				int startPage = 1;
				if(curPage % pageSize != 0){
					startPage = (int)(curPage / pageSize) * pageSize + 1;
				}else{
					startPage = ((int)(curPage / pageSize )- 1) * pageSize + 1;
				}
				int endPage = startPage + pageSize - 1;	
				if(endPage > pageCount) endPage = pageCount;
					
				if(startPage > 10){
		%>
			<a href="00_main.jsp?center=22_customerCenter.jsp?pageNum=<%= startPage - 10 %>"> [이전] </a>
		<%
				}
				for(int i=startPage; i<=endPage; i++){
		%>
			<a href="00_main.jsp?center=22_customerCenter.jsp?pageNum=<%= i %>"> [<%= i %>] </a>
		<%
					
				}
				if(endPage < pageCount){
		%>
			<a href="00_main.jsp?center=22_customerCenter.jsp?pageNum=<%= startPage + 10 %>"> [다음] </a>
		<%
				}
			}
		 %>





</body>
</html>