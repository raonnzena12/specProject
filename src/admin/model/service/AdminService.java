package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
 
import admin.model.dao.AdminDao;
import admin.model.util.CreateQuery;
import admin.model.vo.*;
import board.model.vo.Board;
import calendar.model.vo.Calendar;
import member.model.vo.Member;
import mobile.model.vo.Mobile;

public class AdminService {

	public AdminService() {
	}

	// ------------------------- 관리자 메인 --------------------------

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
	public ArrayList<AdminReport> selectReport() {
		Connection conn = getConnection();

		ArrayList<AdminReport> rList = new AdminDao().selectReport(conn);

		return rList;
	}

	// --------------------------------------- 관리자 멤버
	// ------------------------------------------------

	// --------- memberCount ---------

	/**
	 * 관리자 // 전체 멤버 수를 리턴하는 Service
	 * 
	 * @return count;
	 */
	public int getMemberCount() {
		Connection conn = getConnection();
		int count = new AdminDao().getMemberCount(conn);

		return count;
	}

	/**
	 * 관리자 // 회원 상태에 따른 멤버 수를 리턴하는 Service
	 * 
	 * @param statusNum
	 * @return count
	 */
	public int getMemberStatusCount(int statusNum) {
		Connection conn = getConnection();

		int count = new AdminDao().getMemberStatusCount(conn, statusNum);

		return count;
	}

	public int getMemberSearchCount(String searchSort, String searchText) {
		Connection conn = getConnection();

		int count = new AdminDao().getMemberSearchCount(conn, searchSort, searchText);

		return count;
	}

	// ---------- searchMember ----------

	public ArrayList<AdminMember> selectMemberSearch(String searchSort, String searchText, int sortNum,
			int currentPage) {
		Connection conn = getConnection();

		ArrayList<AdminMember> mList = new AdminDao().selectMemberSearch(conn, searchSort, searchText, sortNum,
				currentPage);

		return mList;
	}

	// ---------- sortMember -----------

	public ArrayList<AdminMember> selectMemberSort(String sort, boolean isSort, int sortNum, int currentPage) {
		Connection conn = getConnection();

		ArrayList<AdminMember> mList = new AdminDao().selectMemberSort(conn, sort, isSort, sortNum, currentPage);

		return mList;
	}

	// ---------- updateMember -----------

	public int updateMemberStatus(int mno, int statusNum) {
		Connection conn = getConnection();

		int result = new AdminDao().updateMemberStatus(conn, mno, statusNum);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

///////////////////////////////////////////////// content 관리 //////////////////////////////////////////////////////////////////////
	/**
	 * 관리자 // 전체 글 갯수를 리턴하는 Service
	 * 
	 * @return totalCount
	 */
	public int contentCount() {
		Connection conn = getConnection();
		int totalCount = new AdminDao().contentCount(conn);
		return totalCount;
	}

	/**
	 * 관리자 // 필터링한 글 갯수를 리턴하는 Service
	 * 
	 * @param sort
	 * @return totalCount
	 */
	public int contentCount(int sort) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().contentCount(conn, sort);
		return totalCount;
	}

	/**
	 * 관리자 // 검색한 글 갯수를 리턴하는 Service
	 * 
	 * @param type
	 * @param keyWord
	 * @return totalCount
	 */
	public int contentCount(int type, String keyWord) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().contentCount(conn, type, keyWord);
		return totalCount;
	}

	/**
	 * 관리자 // 등록된 글 리스트를 받아오는 Service
	 * 
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminBoard> contentList(int currentPage, int limit, int sort) {
		Connection conn = getConnection();
		ArrayList<AdminBoard> cList = new AdminDao().contentList(conn, currentPage, limit, sort);
		return cList;
	}

	/**
	 * 관리자 // 글 하나 관리 하는 Service
	 * 
	 * @param bno
	 * @return result
	 */
	public int updateContent(int type, int bno) {
		Connection conn = getConnection();
		int result = new AdminDao().updateContent(conn, type, bno);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	/**
	 * 관리자 // 글 여러개 관리 하는 Service
	 * @param bnoArr
	 * @return result
	 */
	public int updateContents(int type, String[] bnoArr) {
		Connection conn = getConnection();
		String query = new CreateQuery().makeDeleteQuery(bnoArr);
		int result = new AdminDao().updateContents(conn, type, query);
		if (result == bnoArr.length) {
			commit(conn);
		} else {
			rollback(conn);
			result = 0;
		}
		return result;
	}

	/**
	 * 관리자 // 검색 결과 불러오는 Service
	 * 
	 * @param type
	 * @param keyWord
	 * @param limit
	 * @param currentPage
	 * @return sList
	 */
	public ArrayList<AdminBoard> searchAdminBoard(int type, String keyWord, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<AdminBoard> sList = new AdminDao().searchAdminBoard(conn, type, keyWord, currentPage, limit);
		return sList;
	}

///////////////////////////////////////////////// COMMENT 관리 //////////////////////////////////////////////////////////////////////	
	/**
	 * 관리자 // 코멘트 갯수 카운트 하는 Service
	 * 
	 * @return totalCount
	 */
	public int commentCount() {
		Connection conn = getConnection();
		int totalCount = new AdminDao().commentCount(conn);
		return totalCount;
	}
	
	/**
	 * 관리자 // 댓글 상태 별 코멘트 갯수 카운트 하는 Service
	 * @param sort
	 * @return totalCount
	 */
	public int commentCount(int sort) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().commentCount(conn, sort);
		return totalCount;
	}

	/**
	 * 관리자 // 필터링된 코멘트 갯수 카운트 하는 Service
	 * 
	 * @param type
	 * @param keyWord
	 * @return totalCount
	 */
	public int commentCount(int type, String keyWord) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().commentCount(conn, type, keyWord);
		return totalCount;
	}

	/**
	 * 관리자 // 코멘트 리스트 받아오는 Service
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminReply> commentList(int currentPage, int limit, int sort) {
		Connection conn = getConnection();
		ArrayList<AdminReply> cList = new AdminDao().commentList(conn, currentPage, limit, sort);
		return cList;
	}

	/**
	 * 관리자 // 댓글 처리결과를 받아오는 Service
	 * 
	 * @param type
	 * @param parseInt
	 * @return result
	 */
	public int updateComment(int type, int cno, int tno) {
		Connection conn = getConnection();
		int result = new AdminDao().updateComment(conn, type, cno, tno);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	/**
	 * 관리자 // 댓글들 처리결과를 받아오는 Service
	 * 
	 * @param type
	 * @param cnoArr
	 * @param tnoArr
	 * @return result
	 */
	public int updateComments(int type, String[] cnoArr, String[] tnoArr) {
		Connection conn = getConnection();
		int result = 0;
		for (int i = 0; i < cnoArr.length; i++) {
			result += new AdminDao().updateComment(conn, type, Integer.parseInt(cnoArr[i]),
					Integer.parseInt(tnoArr[i]));
		}
		if (result == cnoArr.length)
			commit(conn);
		else
			rollback(conn);
		return result;
	}

	/**
	 * 관리자 // 댓글들 필터링 결과를 받아오는 Service
	 * 
	 * @param type
	 * @param keyWord
	 * @param currentPage
	 * @param limit
	 * @return sList
	 */
	public ArrayList<AdminReply> searchAdminComment(int type, String keyWord, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<AdminReply> sList = new AdminDao().searchAdminComment(conn, type, keyWord, currentPage, limit);
		return sList;
	}
	
///////////////////////////////////////////////// REVIEW 관리 //////////////////////////////////////////////////////////////////////

	/**
	 * 관리자 // 리뷰 갯수를 카운트하는 Service
	 * @return totalCount
	 */
	public int reviewCount() {
		Connection conn = getConnection();
		int totalCount = new AdminDao().reviewCount(conn);
		return totalCount;
	}
	
	/**
	 * 관리자 // 리뷰 상태 별 갯수를 받아오는 Service
	 * @param sort
	 * @return totalCount
	 */
	public int reviewCount(int sort) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().reviewCount(conn, sort);
		return totalCount;
	}

	/**
	 * 관리자 // 필터링된 리뷰 갯수를 받아오는 Service
	 * @param type
	 * @param keyWord
	 * @return totalCount
	 */
	public int reviewCount(int type, String keyWord) {
		Connection conn = getConnection();
		int totalCount = new AdminDao().reviewCount(conn, type, keyWord);
		return totalCount;
	}
	
	/**
	 * 관리자 // 리뷰 리스트 받아오는 Service
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminReview> reviewList(int currentPage, int limit, int sort) {
		Connection conn = getConnection();
		ArrayList<AdminReview> cList = new AdminDao().reviewList(conn, currentPage, limit, sort);
		return cList;
	}

	/**
	 * 관리자 // 개별 리뷰 상태처리하는 Service
	 * @param type
	 * @param parseInt
	 * @return result
	 */
	public int updateReview(int type, int rno) {
		Connection conn = getConnection();
		int result = new AdminDao().updateReview(conn, type, rno);
		if (result > 0) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 관리자 // 복수 리뷰 상태처리하는 Service
	 * @param type
	 * @param cnoArr
	 * @return result 
	 */
	public int updateReviews(int type, String[] cnoArr) {
		Connection conn = getConnection();
		String query = new CreateQuery().makeDeleteQuery(cnoArr);
		int result = new AdminDao().updateReviews(conn, type, query);
		if (result == cnoArr.length) {
			commit(conn);
		} else {
			rollback(conn);
			result = 0;
		}
		return result;
	}

	/**
	 * 관리자 // 필터링된 리스트를 받아오는 Service
	 * @param type
	 * @param keyWord
	 * @param currentPage
	 * @param limit
	 * @return sList
	 */
	public ArrayList<AdminReview> searchAdminReview(int type, String keyWord, int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<AdminReview> sList = new AdminDao().searchAdminReview(conn, type, keyWord, currentPage, limit);
		return sList;
	}
	
	
////////////////////////////////////////////// REPORT 관리 ///////////////////////////////////////////////

	
	
	
	
	/**
	 * 관리자 신고된 글 sort로 불러오는 Service
	 * @param sort
	 * @return
	 */
	public int reportSortCount(int sort) {
		Connection conn = getConnection();
		int reportSortCount = new AdminDao().reportSortCount(conn, sort);
		return reportSortCount;
	}

	/**
	 * 관리자 신고된글 전체 개수 불러오는 service
	 * @return
	 */
	public int reportTotalCount() {
		Connection conn = getConnection();
		int reportTotalCount = new AdminDao().reportTotalCount(conn);
		return reportTotalCount;
	}

	/**
	 * 관리자 신고된 글 전체 리스트 불러오는 서비스
	 * @param currentPage
	 * @param limit
	 * @return
	 */
	public ArrayList<AdminReport> reportList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<AdminReport> rList = new AdminDao().reportList(conn, currentPage, limit);
		
		return rList;
	}

	public int reportUpdate(int tno, int refNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().updateReport(conn, tno, refNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int resultUpdate(int rNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().resultUpdate(conn, rNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int reportDelete(int tno, int refNo) {
		Connection conn = getConnection();
		
		int result = new AdminDao().reportDelete(conn, tno, refNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}




}
