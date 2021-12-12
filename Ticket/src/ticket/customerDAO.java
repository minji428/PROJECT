package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class customerDAO {
	private customerDAO() {}
	public static customerDAO instance = new customerDAO();
	public static customerDAO getInstance() {return instance;}
	
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
	
	public int userCheck(String id, String pw) {
		int check=-1;
		String dbpw = "";
		conn = getConnection();
		try {
			String sql = "select pw from customer where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw = rs.getString(1);
				if(dbpw.equals(pw)) {
					check=1;
				}
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
		
		return check;
	}
	
	public void insertMember(String id, String pw, String name, String tel, String address, String email) {
		conn = getConnection();
		
		try {
			String sql = "insert into customer values(?,?,?,now(),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, address);
			pstmt.setString(6, email);
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
	
	public String findId(String name, String email) {
		String id="";
		try {
			conn=getConnection();
			String sql = "SELECT * FROM customer WHERE name=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				id = rs.getString("id");
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
		//System.out.println(" id 확인용 = " + id);
		return id;
	}
	
	public String findPw(String name, String id, String email) {
		String pw="";
		try {
			conn=getConnection();
			String sql = "SELECT * FROM customer WHERE name=? and id=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString("pw");
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
		//System.out.println(" pw 확인용 = " + pw);
		return pw;
	}
	
	
	
	//--------------------------------------------------
	public int checkDoubleId(String id) {
		int check=-1;
		try {
			String dbid="";
			conn = getConnection();
			
			String sql = "select * from customer where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dbid = rs.getString("id");
				if(dbid.equals(id)) {
					check=1;
				}
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
		System.out.println("check = " + check);
		return check;
	}
	
	public int checkDoubleEmail(String email) {
		int check=-1;
		String dbemail="";
		try {
			conn = getConnection();
			String sql = "select email from customer where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbemail = rs.getString(1);
				if(dbemail.equals(email)) {
					check=2;
				}
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
	
	public int getPoint(String id) {
		int point=0;
		try {
			conn=getConnection();
			String sql = "SELECT * FROM customer WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				point = rs.getInt("point");
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
		//System.out.println(" point 확인용 = " + point);
		return point;
	}
}
