package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class buyDAO {
	public static buyDAO instance = new buyDAO();
	
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
	
	public customerDTO getCustomerInfo(String id) {
		customerDTO dto = new customerDTO();
		
		try {
			conn = getConnection();
			
			String sql = "select * from customer where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				dto.setEmail(rs.getString("email"));
				
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
	
	public ArrayList<cartDTO> getTicketList(String id){
		ArrayList<cartDTO> cartlist = new ArrayList<cartDTO>();
		try {
			conn = getConnection();
			
			String sql = "select * from cart where buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartDTO dto = new cartDTO();
				
				dto.setCart_number(rs.getInt("cart_number"));
				dto.setBuyer(rs.getString("buyer"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setBuy_count(rs.getInt("buy_count"));
				dto.setTicket_image(rs.getString("ticket_image"));
				
				cartlist.add(dto);
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
		return cartlist;
	}
	
	public void insertOrderList(buyDTO dto) {
		try {
			conn = getConnection();
			
			String sql = "insert into buy(customer_id,customer_name,cart_number,ticket_name,buy_price,buy_count,ticket_image,buy_date,howpay,address) values(?,?,?,?,?,?,?,now(),?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCustomer_id());
			pstmt.setString(2, dto.getCustomer_name());
			pstmt.setInt(3, dto.getCart_number());
			pstmt.setString(4, dto.getTicket_name());
			pstmt.setInt(5, dto.getBuy_price());
			pstmt.setInt(6, dto.getBuy_count());
			pstmt.setString(7, dto.getTicket_image());
			pstmt.setString(8, dto.getHowpay());
			pstmt.setString(9, dto.getAddress());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) 
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null) 
				try {pstmt.close();}catch(SQLException sqle) {}
			
		}
		
	}
	
	public void deleteCartList(String id) {
		try {
			conn = getConnection();
			
			String sql = "DELETE FROM cart WHERE buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) 
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null) 
				try {pstmt.close();}catch(SQLException sqle) {}
			
		}
	}
	
	public void updateSold(String ticket_name, int buy_count) {
		int soldcnt=0;
		try {
			conn = getConnection();
			
			String sql = "select sold from ticket where ticket_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ticket_name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				soldcnt = rs.getInt(1);
			}
			
			sql = "UPDATE ticket SET sold=? where ticket_name=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, soldcnt+buy_count);
			pstmt.setString(2, ticket_name);
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) 
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null) 
				try {pstmt.close();}catch(SQLException sqle) {}
			
		}
		
	}
	
	public ArrayList<buyDTO> getbuyList(String id){
		ArrayList<buyDTO> buylist = new ArrayList<buyDTO>();
		try {
			conn = getConnection();
			
			String sql = "select * from buy where customer_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				buyDTO dto = new buyDTO();
				
				dto.setCustomer_id(rs.getString("customer_id"));
				dto.setCustomer_name(rs.getString("customer_name"));
				dto.setCart_number(rs.getInt("cart_number"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setBuy_count(rs.getInt("buy_count"));
				dto.setTicket_image(rs.getString("ticket_image"));
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setHowpay(rs.getString("howpay"));
				dto.setAddress(rs.getString("address"));
				
				buylist.add(dto);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null) 
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null) 
				try {pstmt.close();}catch(SQLException sqle) {}
			
		}
		
		return buylist;
	}
	
	
}
