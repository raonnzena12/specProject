package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/Board/Board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	
	
	public int getBoardCount(Connection conn, int bno) {
		Statement stmt = null;
		ResultSet rset = null;
		
		int boardCount = 0;
		
		String query = prop.getProperty("boardCount"+bno);
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				boardCount = rset.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardCount;
	}
	
	
	
	/**
	 * 게시글 목록 조회용 Dao
	 * @param conn
	 * @param bNo
	 * @return bList
	 */
	public ArrayList<Board> selectTBoard(Connection conn, int currentPage, int limit, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> tlist = null;
		
		String query = prop.getProperty("selectTotalList"+bno);
		
		try {
			pstmt = conn.prepareStatement(query);
			 
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			tlist = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board(
						rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getString("BCONTENT"),
						rset.getInt("BCOUNT"),
						rset.getDate("BREGDATE"),
						rset.getInt("BCODE"),
						rset.getString("BTYPE"),
						rset.getInt("bCategory"),
						rset.getString("cgCategory")
						);
				tlist.add(b);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return tlist;
	}



	/**
	 * 게시글 상세보기용 Dao
	 * @param conn
	 * @param bNo
	 * @return board
	 */
	public Board contentBoard(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board board = null;
		
		String query = prop.getProperty("contentBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(
						rset.getInt("BNO"),
						rset.getString("BTITLE"),
						rset.getString("BCONTENT"),
						rset.getInt("BCOUNT"),
						rset.getDate("BREGDATE"),
						rset.getInt("BCODE"),
						rset.getInt("BCATEGORY"),
						rset.getString("CGCATEGORY")
						);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return board;
	}
	
	/**
	 * 게시글 작성용 Dao
	 * @param conn 
	 * @param board
	 * @return result
	 */
	public int writeBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("writeBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, board.getbCode());
			pstmt.setInt(4, board.getbWriter());
			pstmt.setInt(5, board.getbCategory());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	

}
