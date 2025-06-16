package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDao {
	String id = "root";
	String pw = "";
	String url = "jdbc:mysql://localhost:";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("MySQL has been connected");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void disconnect() {
		if(con != null) {
			try {
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(rs != null) {
			try {
				rs.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void insertBoard(BoardDo bdo) {
		connect();
		String sql = "insert into board values(null, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdo.getTitle());
			pstmt.setString(2, bdo.getCont());
			pstmt.setString(3, bdo.getId());
			pstmt.setString(4, bdo.getPw());
			
			int rs = pstmt.executeUpdate();
			System.out.println("[INSERTATION RESULT] : " + rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}
	
	public ArrayList<BoardDo> getAllBoards() {
		connect();
		ArrayList<BoardDo> boards = new ArrayList<>();
		String sql = "select * from board";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDo bdo = new BoardDo();
				bdo.setNum(rs.getInt(1));
				bdo.setTitle(rs.getString(2));
				bdo.setCont(rs.getString(3));
				bdo.setId(rs.getString(4));
				bdo.setPw(rs.getString(5));
				
				boards.add(bdo);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return boards;
	}
	
	public BoardDo getBoard(int num) {
		connect();
		String sql = "select * from board where num = ?";
		BoardDo board = new BoardDo();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setCont(rs.getString(3));
				board.setId(rs.getString(4));
				board.setPw(rs.getString(5));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return board;
	}
	
	public int updateBoard(BoardDo bdo) {
		connect();
		String sql = "update board set title = ?, cont = ? where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdo.getTitle());
			pstmt.setString(2, bdo.getCont());
			pstmt.setInt(3, bdo.getNum());
			
			int rs = pstmt.executeUpdate();
			System.out.println("[MODIFICATION RESULT] : " + rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
		return bdo.getNum();
	}
	
	public void deleteBoard(int num) {
		connect();
		String sql = "delete from board where num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			int rs = pstmt.executeUpdate();
			System.out.println("[DELETION RESULT] : " + rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect();
	}
}
