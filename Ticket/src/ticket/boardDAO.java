package ticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class boardDAO {
	public static boardDAO instance = new boardDAO();
	
	
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
	
	public ArrayList<boardDTO> getAllBoardlist(int start, int end){
		ArrayList<boardDTO> boardlist = new ArrayList<boardDTO>();
		
		try {
			conn = getConnection();
			
			String sql = "select * from board ORDER BY ref DESC , re_level LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end - start);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardDTO dto = new boardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setPw(rs.getString("pw"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setContent(rs.getString("content"));
				
				boardlist.add(dto);
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
		return boardlist;
	}
	public int getAllCount() {
		int count = 0;
		try {
			conn = getConnection();
			
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		return count;
	}
	
	public void insertBoard(boardDTO dto) {
		int ref = 0;
		int num = 0;
		try {
			conn = getConnection();

			String refSql = "SELECT MAX(ref) FROM board";
			pstmt = conn.prepareStatement(refSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}

			String numSql = "SELECT MAX(num) FROM board";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			String sql = "INSERT INTO board (num , writer, title, pw, reg_date, ref, re_step, re_level, readcount, content) VALUES(?, ?, ?, ?, now(),?, 1, 1, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, ref);
			pstmt.setString(6, dto.getContent());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
	}
	
	
	public int checkPwForRead(int num, String pw) {
		int check=-1;
		try {
			conn = getConnection();
			
			String sql = "select * from board where num=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check=1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		
		return check;
	}
	
	public boardDTO getOneBoard(int num) {
		boardDTO dto = new boardDTO();
		try {
			conn = getConnection();
			
			String readsql = "UPDATE board SET readcount=readcount+1 WHERE NUM=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setPw(rs.getString("pw"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_step"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setContent(rs.getString("content"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		
		return dto;
	}
	public void deleteBoard(int num) {
		try {
			conn = getConnection();
			
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
		
	}
	
	public void updateBoard(int num) {
		boardDTO bean = new boardDTO();

		try {
			conn = getConnection();

			String sql = "UPDATE board SET subject=?, content=? WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, num);

			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
	}
	
	public void writeAnswer(boardDTO dto) {
		int ref = dto.getRef();
		int re_step = dto.getRe_step();
		int re_level = dto.getRe_level();

		int num = 0;

		try {
			conn = getConnection();

			String numSql = "SELECT MAX(num) FROM board";
			pstmt = conn.prepareStatement(numSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1) + 1;
			}

			String levelsql = "UPDATE board SET re_level=re_level+1  WHERE ref=? and re_level=?";

			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);

			pstmt.executeUpdate();

			String sql = "INSERT INTO board (num , writer, title, pw, reg_date, ref, re_step, re_level, readcount, content) VALUES (?,?,?,?,now(),?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getPw());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step + 1);
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, dto.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn!=null)
				try {conn.close();}catch(SQLException sqle) {}
			if(pstmt!=null)
				try {pstmt.close();}catch(SQLException sqle) {}
			if(rs!=null)
				try {rs.close();}catch(SQLException sqle) {}
		}
	}
}