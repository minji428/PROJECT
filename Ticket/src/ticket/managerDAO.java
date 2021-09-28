package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class managerDAO {
	public static managerDAO instance = new managerDAO();
	
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
	
	public int checkManager(String id, String pw) {
		int check=-1;
		try {
			conn = getConnection();
			String sql = "select * from manager where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				check=1;
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
		
		return check;
	}
	
	public managerDTO getManagerInfo(String id) {
			managerDTO dto = new managerDTO();
		
		try {
			conn = getConnection();
			
			String sql = "select * from manager where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
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
	
	public void deleteTicket(int ticket_number) {
		try {
			conn = getConnection();
			
			String sql = "delete from ticket where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ticket_number);
			pstmt.executeUpdate();
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
	}
	
	public void ticketUpdate(ticketDTO dto,int ticket_number) {
		//아이템정보 수정하기
		try {
			conn = getConnection();
			
			String sql = "update ticket set ticket_category=?, ticket_name=?, ticket_price=?, ticket_stock=?, ticket_image=?, ticket_info=?, discount_rate=? where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTicket_category());
			pstmt.setString(2, dto.getTicket_name());
			pstmt.setInt(3, dto.getTicket_price());
			pstmt.setInt(4, dto.getTicket_stock());
			pstmt.setString(5, dto.getTicket_image());
			pstmt.setString(6, dto.getTicket_info());
			pstmt.setInt(7, dto.getDiscount_rate());
			pstmt.setInt(8, dto.getTicket_number());
			
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
	
	public void insertNewTicket(ticketDTO dto) {
		try {
			conn = getConnection();
			
			int num=0;
			String sql = "select max(ticket_number) from ticket";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			sql = "insert into ticket(ticket_number, ticket_category,ticket_name,ticket_price,ticket_stock,ticket_image,ticket_info,discount_rate,reg_date,sold)  values(?,?,?,?,?,?,?,?,now(),0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num+1);
			pstmt.setString(2, dto.getTicket_category());
			pstmt.setString(3, dto.getTicket_name());
			pstmt.setInt(4, dto.getTicket_price());
			pstmt.setInt(5, dto.getTicket_stock());
			pstmt.setString(6, dto.getTicket_image());
			pstmt.setString(7, dto.getTicket_info());
			pstmt.setInt(8, dto.getDiscount_rate());
			
			pstmt.executeUpdate();
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
	}
	
	public ticketDTO getOneTicket(int ticket_number) {
		ticketDTO dto = new ticketDTO();
		try {
			conn = getConnection();
			
			String sql = "select * from ticket where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ticket_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
	
	public ArrayList<buyDTO> getAllOrderList(){
		ArrayList<buyDTO> orderList = new ArrayList<buyDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "select * from buy";
			
			pstmt = conn.prepareStatement(sql);
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
				
				orderList.add(dto);
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
		
		return orderList;
	}
	
	
	//아이템정보위치 수정하기
	public void locationUpdate(locationDTO dto,int ticket_number) {
		try {
			conn = getConnection();
			
			String sql = "update location set ticket_category=?, ticket_name=?, Y_position=?, X_position=? where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTicket_category());
			pstmt.setString(2, dto.getTicket_name());
			pstmt.setString(3, dto.getY_position());
			pstmt.setString(4, dto.getX_position());
			pstmt.setInt(5, dto.getTicket_number());
			
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

	public void insertNewLocation(locationDTO dto) {
		try {
			conn = getConnection();
			
			int num=0;
			String sql = "select max(ticket_number) from location";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				num = rs.getInt(1);
			}
			
			sql = "insert into location(ticket_number, ticket_category,ticket_name,Y_position,X_position)  values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num+1);
			pstmt.setString(2, dto.getTicket_category());
			pstmt.setString(3, dto.getTicket_name());
			pstmt.setString(4, dto.getY_position());
			pstmt.setString(5, dto.getX_position());
			
			pstmt.executeUpdate();
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
	}
	
	public void deleteLocation(int ticket_number) {
		try {
			conn = getConnection();
			
			String sql = "delete from location where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ticket_number);
			pstmt.executeUpdate();
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
	}
	
	public ArrayList<locationDTO> getAlllocation(){
		ArrayList<locationDTO> location = new ArrayList<locationDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "select * from location";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				locationDTO dto = new locationDTO();

				dto.setTicket_number(rs.getInt("ticket_number"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setY_position(rs.getString("Y_position"));
				dto.setX_position(rs.getString("X_position"));
				location.add(dto);
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
		
		return location;
	}
}
