package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class cartDAO {
public static cartDAO instance = new cartDAO();
	
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
	
	public void insertCart(cartDTO dto) {
		int cart_number=0;
		try {
			conn = getConnection();
			String sql = "select max(cart_number) from cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart_number = rs.getInt(1);
			}
			sql = "insert into cart(cart_number, buyer,ticket_name,buy_price,buy_count,ticket_image) values(?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number+1);
			pstmt.setString(2, dto.getBuyer());
			pstmt.setString(3, dto.getTicket_name());
			pstmt.setInt(4, dto.getBuy_price());
			pstmt.setInt(5, dto.getBuy_count());
			pstmt.setString(6, dto.getTicket_image());
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
	
	
	public ArrayList<cartDTO> getCartList(String id){
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
	
	public int countTicket(String id) {
		int cnt=0;
		try {
			conn = getConnection();
			
			String sql = "select count(*) from cart where buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
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
		return cnt;
	}
	
	public void deleteCart(int cart_number) {
		try {
			conn = getConnection();
			
			String sql="delete from cart where cart_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number);
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
	
}
