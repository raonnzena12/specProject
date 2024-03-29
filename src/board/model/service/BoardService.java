package board.model.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.BoardReport;
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
	 * 게시판 수정용 Service
	 * @param bno
	 * @param category
	 * @param title
	 * @param content
	 * @param brand
	 * @return result
	 */
	public int updateBoard(int bno, int category, String title, String content, int brand) {
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoard(conn, bno, category, title, content, brand);
		
		if(result > 0) {
			commit(conn); 
		}else {
			rollback(conn); 
		}
		return result;
	}
	
	/**
	 * 게시판 검색용 Service
	 * @param currentPage
	 * @param limit
	 * @param bno
	 * @param search
	 * @param text
	 * @return tlist
	 */
	public ArrayList<Board> searchBoard(int currentPage, int limit, int bno, String search, String text) {
		Connection conn = getConnection();
		
		ArrayList<Board> tlist = new BoardDao().searchBoard(conn,currentPage, limit, bno, search, text);
		
		return tlist;
	}
	
	/**
	 * 게시글 신고용 Service
	 * @param bno
	 * @param user
	 * @param dwriter
	 * @param content
	 * @return result
	 */
	public int dangerBoard(int bno, int user, int dwriter, String content) {
		Connection conn = getConnection();
		
		int result = new BoardDao().dangerBoard(conn, bno, user, dwriter, content);
		
		if(result > 0) {
			commit(conn); 
		}else {
			rollback(conn); 
		}
		
		return result;
	}
	
	/**
	 * 신고글 조회용 Service
	 * @param bNo
	 * @return report
	 */
	public BoardReport reportBoard(int bNo) {
		Connection conn = getConnection();
		
		BoardReport report = new BoardDao().reportBoard(conn, bNo);
		
		return report;
	}

	


	//------------------댓글 Service---------------------------------
	
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
	public ArrayList<Reply> selectReply(int bno, int user) {
		Connection conn = getConnection();
		
		ArrayList<Reply> rList = new BoardDao().selectReply(conn, bno, user);
		
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
	public Reply replyContent(int cno) {
		Connection conn = getConnection();
		
		Reply content = new BoardDao().replyContent(conn, cno);
		
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
	 * 댓글 신고용 Service
	 * @param cno
	 * @return result
	 */
	/*
	 * public int dangerReply(int cno) { Connection conn = getConnection();
	 * 
	 * int result = new BoardDao().dangerReply(conn, cno);
	 * 
	 * if(result > 0) { commit(conn); }else { rollback(conn); } return result; }
	 */
	/**
	 * 댓글 신고용 Service
	 * @param text
	 * @param dwriter
	 * @param user
	 * @param cno
	 * @return result
	 */
	public int dangerReply(String text, int dwriter, int user, int cno) {
		Connection conn = getConnection();
				
		int result = new BoardDao().dangerReply(conn, text, dwriter, user, cno);
				
		if(result > 0) {
			commit(conn); 
		}else {
			rollback(conn); 
		}
		
		
		return result;
	}
	
	/**
	 * 댓글 신고글 조회용 Service
	 * @param cno
	 * @return report
	 */
	public BoardReport reportReply(int cno) {
		Connection conn = getConnection();
		
		BoardReport reportReply = new BoardDao().reportReply(conn, cno);
		
		return reportReply;
	}


	//------------------------------------------------------------------------

	

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

