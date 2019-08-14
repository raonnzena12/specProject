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
import board.model.vo.Reply;

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
						rset.getInt("BWRITER"),
						rset.getInt("BCATEGORY"),
						rset.getString("CGCATEGORY")
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
				board = new Board(rset.getInt("BNO"), rset.getString("BTITLE"), rset.getString("BCONTENT"), rset.getInt("BCOUNT"), rset.getDate("BREGDATE"), rset.getInt("BCODE"), rset.getInt("BWRITER"), rset.getInt("BCATEGORY"), rset.getString("CGCATEGORY"));
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
	 * 게시글 조회수 증가 Dao
	 * @param conn
	 * @param bNo
	 * @return result
	 */
	public int increaseCount(Connection conn, int bNo) {
		PreparedStatement pstmt = null;
		int result =0;
		
		String query = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bNo);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
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
	
	/**
	 * 게시글삭제
	 * @param conn
	 * @param bno
	 * @return result
	 */
	public int deleteBoard(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bno);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	/**
	 * 댓글 등록 Dao
	 * @param conn
	 * @param r
	 * @return result
	 */
	public int writeReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("writeReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, r.getcContent());
			pstmt.setInt(2, r.getcWriter());
			pstmt.setInt(3, r.getbNo());
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}



	/**
	 * 댓글 조회용 Dao
	 * @param conn
	 * @param bno
	 * @return rList
	 */
	public ArrayList<Reply> selectReply(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Reply> rList = null;
		
		String query = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			rList = new ArrayList<Reply>();
			
			while(rset.next()) {
				rList.add(new Reply(
						rset.getInt("CNO"),
						rset.getString("CCONTENT"),
						rset.getTimestamp("CREGDATE"),
						rset.getInt("CWRITER"),
						rset.getString("USER_NAME"),
						rset.getInt("CSTATUS"),
						rset.getInt("BNO")
						));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return rList;
	}



	/**
	 * 댓글 개수 조회용 Dao
	 * @param bno 
	 * @param conn 
	 * @return replycount
	 */
	public int getReplyCount(Connection conn, int bno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int replycount = 0;
		
		String query = prop.getProperty("replyCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				replycount = rset.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return replycount;
	}



	


	/**
	 * 댓글 삭제 Dao
	 * @param conn
	 * @param cno
	 * @return result
	 */
	public int deleteReply(Connection conn, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}



	/**
	 * 댓글 내용 불러오기 Dao
	 * @param conn
	 * @param cno
	 * @return result
	 */
	public String replyContent(Connection conn, int cno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String content = null;
		
		String query  = prop.getProperty("replyContent");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				content = rset.getString("CCONTENT");
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return content;
	}



	/**
	 * 댓글 수정용 Doa
	 * @param conn
	 * @param con
	 * @param cno
	 * @return result
	 */
	public int updateReply(Connection conn, String con, int cno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, con);
			pstmt.setInt(2, cno);
			
			result = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}



	


	

}
