package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.util.CreateQuery;
import admin.model.vo.AdminBoard;
import admin.model.vo.AdminMember;
import admin.model.vo.AdminReply;
import admin.model.vo.AdminReview;
import board.model.vo.Board;
import calendar.model.vo.Calendar;
import member.model.vo.Member;
import mobile.model.vo.Mobile;

public class AdminService {
	
	public AdminService() {}

	public ArrayList<AdminMember> selectMember() {
		Connection conn = getConnection();
		
		ArrayList<AdminMember> mList = new AdminDao().selectMember(conn);
		
		return mList;
	}

	public ArrayList<AdminBoard> selectBoard() {
		Connection conn = getConnection();
		
		ArrayList<AdminBoard> bList = new AdminDao().selectBoard(conn);
		
		return bList;
	}

	public ArrayList<AdminReply> selectComment() {
		Connection conn = getConnection();
		
		ArrayList<AdminReply> rList = new AdminDao().selectComment(conn);
		
		return rList;
	}

	public ArrayList<AdminReview> selectReview() {
		Connection conn = getConnection();
		
		ArrayList<AdminReview> rList = new AdminDao().selectReview(conn);
		
		return rList;
	}

	public ArrayList<Calendar> selectCalendar() {
		Connection conn = getConnection();
		
		ArrayList<Calendar> cList = new AdminDao().selectCalendar(conn);
		
		return cList;
	}
	
	
	//--------------------------------------- sortMember ------------------------------------------------
	
	
	public int getMemberCount() {
		Connection conn = getConnection();
		int count = new AdminDao().getMemberCount(conn);
		
		return count;
	}
	

	public ArrayList<AdminMember> selectMemberSort(String sort, boolean isSort, int sortNum, int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<AdminMember> mList = new AdminDao().selectMemberSort(conn, sort, isSort, sortNum, currentPage);
		
		return mList;
	}

	/**
	 * 관리자 // 전체 글 갯수를 리턴하는 Service
	 * @return totalCount
	 */
	public int contentCount() {
		Connection conn = getConnection();
		int totalCount = new AdminDao().contentCount(conn);
		return totalCount;
	}

	/**
	 * 관리자 // 등록된 글 리스트를 받아오는 Service
	 * @param currentPage
	 * @param limit
	 * @return cList
	 */
	public ArrayList<AdminBoard> contentList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<AdminBoard> cList = new AdminDao().contentList(conn, currentPage, limit);
		return cList;
	}

	/**
	 * 관리자 // 글 하나 삭제관리 하는 Service
	 * @param bno
	 * @return result
	 */
	public int deleteContent(int bno) {
		Connection conn = getConnection();
		int result = new AdminDao().deleteContent(conn, bno);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 관리자 // 글 여러개 삭제관리 하는 Service
	 * @param bnoArr
	 * @return result
	 */
	public int deleteCntents(String[] bnoArr) {
		Connection conn = getConnection();
		String query = new CreateQuery().makeDeleteQuery(bnoArr);
		int result = new AdminDao().deleteContents(conn, query);
		if ( result == bnoArr.length ) {
			commit(conn);
		} else {
			rollback(conn);
			result = 0;
		}
		return result;
	}
	
	

}
