package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.Reply;

public class BoardService {

	/**
	 * 게시글 전체 개수 조회용 service
	 * @return bCount
	 */
	public int getBoardCount(int bno) {
		Connection conn = getConnection();
		
		int boardCount = new BoardDao().getBoardCount(conn, bno);
		
		return boardCount;
	}
	
	
	/**
	 * 게시글 목록 조회용 service
	 * @param bNo
	 * @return 
	 */
	public ArrayList<Board> selectTBoard(int currentPage, int limit, int bno) {
		Connection conn = getConnection();
		
		ArrayList<Board> tlist = new BoardDao().selectTBoard(conn, currentPage, limit, bno);
		
		return tlist;
	}



	/**
	 * 게시글 상세보기 Service
	 * @param bNo
	 * @return board
	 */
	public Board contentBoard(int bNo) {
		Connection conn = getConnection();
		
		BoardDao bDao = new BoardDao();
		
		Board board = bDao.contentBoard(conn, bNo);
		
		if(board != null) {
			
			int result = bDao.increaseCount(conn, bNo);
			
			if(result > 0) {
				commit(conn);
				board.setbCount(board.getbCount()+1);
			}else {
				rollback(conn);
				board = null;
			}	
		
		}
		
		return board;
	}
	
	/**
	 * 게시글 작성용 Service
	 * @param board
	 * @return result
	 */
	public int writeBoard(Board board) {
		Connection conn = getConnection();
		
		int result = new BoardDao().writeBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}



	/**
	 * 댓글 작성용 Service
	 * @param r
	 * @return result
	 */
	public int writeReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new BoardDao().writeReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}



	/**
	 * 댓글 조회용 Service
	 * @param bno
	 * @return rList
	 */
	public ArrayList<Reply> selectReply(int bno) {
		Connection conn = getConnection();
		
		ArrayList<Reply> rList = new BoardDao().selectReply(conn, bno);
		
		return rList;
	}



	/**
	 * 댓글 개수 조회용 Service
	 * @param bno
	 * @return replycount
	 */
	public int getReplyCount(int bno) {
		Connection conn = getConnection();
		
		int replycount = new BoardDao().getReplyCount(conn, bno);
		
		return replycount;
	}



	/**
	 * 게시글 삭제
	 * @param bno
	 * @return result
	 */
	public int deleteBoard(int bno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoard(conn, bno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}



	/**
	 * 댓글 삭제용 Service
	 * @param cno
	 * @return result
	 */
	public int deleteReply(int cno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReply(conn, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}



	/**
	 * 댓글 내용 불러오기 Service
	 * @param cno
	 * @return content
	 */
	public String replyContent(int cno) {
		Connection conn = getConnection();
		
		String content = new BoardDao().replyContent(conn, cno);
		
		return content;
	}



	/**
	 * 댓글 수정용 Service
	 * @param con
	 * @param cno
	 * @return result
	 */
	public int updateReply(String con, int cno) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateReply(conn, con, cno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}

	

	/**
	 * 내가 쓴 글 개수 조회용 service
	 * @param uNo
	 * @return
	 */
	public int getMyBoardCount(int uNo) {
		Connection conn = getConnection();
		
		int myBoardCount = new BoardDao().getMyBoardCount(conn, uNo);
		
		return myBoardCount;
	}
	/**
	 * 내가 쓴 글 목록 조회용 service
	 * @param currentPage
	 * @param limit
	 * @param uNo
	 * @return
	 */
	public ArrayList<Board> selectMyBoard(int currentPage, int limit, int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Board> mlist = new BoardDao().selectMyBoard(conn, currentPage, limit, uNo);
		
		return mlist;
	}
}

