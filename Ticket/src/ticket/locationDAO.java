package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class locationDAO {
	private locationDAO() {}
	public static locationDAO instance = new locationDAO();
	public static locationDAO getInstance() {return instance;}
	
	Connection conn=null;
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
	
	// 모든 위치 불러오기
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
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setY_position(rs.getString("Y_posotion"));
				dto.setX_position(rs.getString("X_posotion"));
				
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
	
	public locationDTO getOneLocation(int num) {
		locationDTO dto = null;
		conn = getConnection();
		
		try {
			String sql = "select * from location where ticket_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new locationDTO();
				
				dto.setTicket_number(rs.getInt("ticket_number"));
				dto.setTicket_category(rs.getString("ticket_category"));
				dto.setTicket_name(rs.getString("ticket_name"));
				dto.setX_position(rs.getString("X_position"));
				dto.setY_position(rs.getString("Y_position"));
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
