package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;
import ticket.ticketDTO;

public class ticketDAO {
//	private ticketDAO() {}
	public static ticketDAO instance = new ticketDAO();
//	public static ticketDAO getInstance() {return instance;}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/ticket?serverTimezone=UTC";
		String dbID = "root";
		String dbPassword = "alswl3092!";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	// 모든 티켓 보여주기
	public ArrayList<ticketDTO> getAllTicket(){
		ArrayList<ticketDTO> itemList = new ArrayList<ticketDTO>();
		
		conn = getConnection();
		try {
			String sql ="select * from ticket order by ticket_number asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
				ticketDTO dto = new ticketDTO();
				
				dto.setTicket_number(rs.getInt("ticket_number"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setTicket_price(rs.getInt("ticket_price"));
				dto.setTicket_stock(rs.getInt("ticket_stock"));
				dto.setTicket_image(rs.getString("ticket_image"));
				dto.setTicket_info(rs.getString("ticket_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				itemList.add(dto);
				
				}while(rs.next());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		return itemList;
	}
	
	// 카테고리별로 출력
	public ArrayList<ticketDTO> getCategoryTicket(int category){
		ArrayList<ticketDTO> itemList = new ArrayList<ticketDTO>();
		
		conn = getConnection();
		try {
			String sql ="select * from ticket where ticket_category=? order by ticket_number asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
				ticketDTO dto = new ticketDTO();
				
				dto.setTicket_number(rs.getInt("ticket_number"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setTicket_price(rs.getInt("ticket_price"));
				dto.setTicket_stock(rs.getInt("ticket_stock"));
				dto.setTicket_image(rs.getString("ticket_image"));
				dto.setTicket_info(rs.getString("ticket_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				itemList.add(dto);
				
					
				}while(rs.next());
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		return itemList;
	}

	// 한개씩 출력
	public ticketDTO getOneTicket(int num) {
		ticketDTO dto  = null;
		conn=getConnection();
		try {
			String sql = "select * from ticket where ticket_number=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ticketDTO();
				
				dto.setTicket_number(rs.getInt("ticket_number"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setTicket_price(rs.getInt("ticket_price"));
				dto.setTicket_stock(rs.getInt("ticket_stock"));
				dto.setTicket_image(rs.getString("ticket_image"));
				dto.setTicket_info(rs.getString("ticket_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
			}
					
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		return dto;
	}
	
	
	
	
	
}