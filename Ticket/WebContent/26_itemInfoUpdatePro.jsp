<%@page import="ticket.locationDTO"%>
<%@page import="ticket.managerDAO"%>
<%@page import="ticket.ticketDTO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
 String realFolder="";
 String filename="";
 MultipartRequest imageup = null;

 String saveFolder="/TP_img";
 String encType = "utf-8";
 int max_size=2 * 1024 * 1024;	

 ServletContext context = getServletContext();
 realFolder = context.getRealPath(saveFolder);
 System.out.println("realFolder = " + realFolder);
 try{
 	imageup = new MultipartRequest(request, realFolder, max_size,encType, new DefaultFileRenamePolicy());
 	Enumeration files = imageup.getFileNames();
 	
 	while(files.hasMoreElements()){
 		String name =(String)files.nextElement();
 		filename = imageup.getFilesystemName(name);
 	}
 }catch(Exception e){
 	e.printStackTrace();
 }
 %>
 
 <%
 	int ticket_number = Integer.parseInt(imageup.getParameter("ticket_number"));
	
 	String ticket_name = imageup.getParameter("name");
 	String ticket_category = imageup.getParameter("category");
 	String ticket_price = imageup.getParameter("price");
 	String ticket_stock = imageup.getParameter("stock");
 	String ticket_info = imageup.getParameter("info");
 	String discount_rate = imageup.getParameter("discount_rate");
 	String ticket_image = imageup.getParameter("image");
 	String X_position = imageup.getParameter("xposition");
 	String Y_position = imageup.getParameter("yposition");
 	
 	System.out.println("아이템 이름=" + ticket_name);
 	System.out.println("카테고리=" + ticket_category);
 	System.out.println("가격=" + ticket_price);
 	System.out.println("재고=" + ticket_stock);
 	System.out.println("인포=" + ticket_info);
 	System.out.println("할인률=" + discount_rate);
 	
 	ticketDTO dto = new ticketDTO();
 	dto.setTicket_number(ticket_number);
 	dto.setTicket_category(ticket_category);
 	dto.setTicket_name(ticket_name);
 	dto.setTicket_price(Integer.parseInt(ticket_price));
 	dto.setTicket_stock(Integer.parseInt(ticket_stock));
 	dto.setTicket_info(ticket_info);
 	dto.setDiscount_rate(Integer.parseInt(discount_rate));
 	dto.setTicket_image(ticket_image);
 	
 	locationDTO lodto = new locationDTO();
 	lodto.setTicket_number(ticket_number);
	lodto.setTicket_name(ticket_name);
	lodto.setTicket_category(ticket_category);
	lodto.setY_position(Y_position);
	lodto.setX_position(X_position);
 	
 	if(filename!=null){
 		dto.setTicket_image(filename);
 	}else{
 		dto.setTicket_image("error.jpg");
 	}
 	
 	managerDAO.instance.ticketUpdate(dto, ticket_number);
 	managerDAO.instance.locationUpdate(lodto, ticket_number);
 %>
 
 <script>
 	alert("상품정보 수정이 완료되었습니다.");
 	location.href="00_main.jsp?center=25_itemInfoUpdate.jsp";
 </script>
</body>
</html>