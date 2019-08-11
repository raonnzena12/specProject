package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;

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
			commit(conn);
			board.setbCount(board.getbCount()+1);
		}else {
			rollback(conn);
			board = null;
		}
		
		return board;
	}

	

}
