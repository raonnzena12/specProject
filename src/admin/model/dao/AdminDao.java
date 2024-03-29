package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
 
import admin.model.vo.AdminBoard;
import admin.model.vo.AdminMember;
import admin.model.vo.AdminReply;
import admin.model.vo.AdminReport;
import admin.model.vo.AdminReview;
import board.model.vo.Board;
import calendar.model.vo.Calendar;
import member.model.vo.Member;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {

		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<AdminBoard> selectBoard(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminBoard> bList = null;
		AdminBoard board = null;

		String query = prop.getProperty("selectBoard");

		try {
			pstmt = conn.prepareStatement(query);

			bList = new ArrayList<AdminBoard>();

			rset = pstmt.executeQuery();

			while (rset.next()) {
				board = new AdminBoard(rset.getInt(1), rset.getString(2), rset.getInt(3), rset.getDate(4),
						rset.getDate(5), rset.getString(6), rset.getString(7));
				bList.add(board);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return bList;
	}

	public ArrayList<AdminReply> selectComment(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReply> rList = null;
		AdminReply adminReply = null;

		String query = prop.getProperty("selectComment");

		try {
			pstmt = conn.prepareStatement(query);
			rList = new ArrayList<AdminReply>();
			rset = pstmt.executeQuery();

			while (rset.next()) {
				adminReply = new AdminReply(rset.getInt(1), rset.getString(2), rset.getTimestamp(3),
						rset.getTimestamp(4), rset.getString(5), rset.getString(6), rset.getInt(7));
				rList.add(adminReply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rList;
	}

	public ArrayList<AdminReview> selectReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReview> rList = null;
		AdminReview adminReview = null;

		String query = prop.getProperty("selectReview");

		try {
			pstmt = conn.prepareStatement(query);
			rList = new ArrayList<AdminReview>();
			rset = pstmt.executeQuery();

			while (rset.next()) {
				adminReview = new AdminReview(rset.getInt(1), rset.getString(2), rset.getDouble(3), rset.getDate(4),
						rset.getDate(5), rset.getInt(6), rset.getString(7), rset.getInt(8), rset.getString(9),
						rset.getString(10));
				rList.add(adminReview);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}

	public ArrayList<Calendar> selectCalendar(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Calendar> cList = null;
		Calendar cal = null;

		String query = prop.getProperty("selectCalendar");

		try {
			pstmt = conn.prepareStatement(query);
			cList = new ArrayList<Calendar>();
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cal = new Calendar(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getDate(4),
						rset.getString(5).charAt(0), rset.getInt(6));
				cList.add(cal);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	
	public ArrayList<AdminReport> selectReport(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		AdminReport r = null;
		ArrayList<AdminReport> rList = null;
		
		String query = prop.getProperty("selectReport");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			rList = new ArrayList<AdminReport>();
			while(rset.next()) {
				r = new AdminReport();
				r.setrDate(rset.getString("REPORT_DATE"));
				r.setrContent(rset.getString("REPORT_CONT"));
				
				rList.add(r);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return rList;
	}

	
	
	// -------------------------------------------- Member
	// -----------------------------------------------

	/**
	 * 관리자 // 전체 멤버를 리턴하는 Dao
	 * 
	 * @param conn
	 * @return count
	 */
	public int getMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;

		String query = prop.getProperty("getMemberCount");

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	/**
	 * 관리자 // 회원 상태에 따른 멤버 수를 리턴하는 Dao
	 * 
	 * @param conn
	 * @param statusNum
	 * @return count
	 */
	public int getMemberStatusCount(Connection conn, int statusNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;

		String query = prop.getProperty("getMemberStatusCount");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, statusNum);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	public int getMemberSearchCount(Connection conn, String searchSort, String searchText) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;

		String query;
		if (searchSort.contains("아이디")) {
			query = prop.getProperty("getMemberSearchIdCount");
		} else {
			query = prop.getProperty("getMemberSearchNameCount");
		}

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, searchText);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

	/**
	 * 관리자 // 전체 멤버를 리턴하는 Dao
	 * 
	 * @param conn
	 * @return mList
	 */
	public ArrayList<AdminMember> selectMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> mList = null;
		AdminMember mem = null;

		String query = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();

			mList = new ArrayList<AdminMember>();

			while (rset.next()) {
				mem = new AdminMember(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getDate(4),
						rset.getDate(5), rset.getString(6));

				mList.add(mem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}

	public ArrayList<AdminMember> selectMemberSearch(Connection conn, String searchSort, String searchText, int sortNum,
			int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> mList = null;
		AdminMember mem = null;

		String query;
		if (searchSort.contains("아이디")) {
			query = prop.getProperty("selectMemberSearchId");
		} else {
			query = prop.getProperty("selectMemberSearchName");
		}

		try {
			pstmt = conn.prepareStatement(query);
			mList = new ArrayList<AdminMember>();

			int startRow = (currentPage - 1) * sortNum + 1;
			int endRow = startRow + sortNum - 1;

			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				mem = new AdminMember(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getDate(5), rset.getDate(6), rset.getString(7));

				mList.add(mem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}

	public ArrayList<AdminMember> selectMemberSort(Connection conn, String sort, boolean isSort, int sortNum,
			int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> mList = null;
		AdminMember mem = null;

		String query = "";

		if (sort.contains("no")) {
			if (isSort == true) {
				query = prop.getProperty("selectMemberSortNo");
			} else {
				query = prop.getProperty("selectMemberSortNoDesc");
			}
		} else if (sort.contains("email")) {
			if (isSort == true) {
				query = prop.getProperty("selectMemberSortEmail");
			} else {
				query = prop.getProperty("selectMemberSortEmailDesc");
			}
		} else if (sort.contains("name")) {
			if (isSort == true) {
				query = prop.getProperty("selectMemberSortName");
			} else {
				query = prop.getProperty("selectMemberSortNameDesc");
			}
		} else if (sort.contains("status")) {
			if (sort.contains("0")) {
				query = prop.getProperty("selectMemberSortStatusAdmin");
			} else if (sort.contains("1")) {
				query = prop.getProperty("selectMemberSortStatusGeneral");
			} else if (sort.contains("2")) {
				query = prop.getProperty("selectMemberSortStatusSuspended");
			} else if (sort.contains("3")) {
				query = prop.getProperty("selectMemberSortStatusDeleted");
			} else if (sort.contains("4")) {
				query = prop.getProperty("selectMemberSortNo");
			}
		} else if (sort.contains("date")) {
			if (isSort == true) {
				query = prop.getProperty("selectMemberSortDate");
			} else {
				query = prop.getProperty("selectMemberSortDateDesc");
			}
		} else {
			System.out.println("DB에서 sort가 읽히지 않음");
		}

		try {
			pstmt = conn.prepareStatement(query);
			mList = new ArrayList<AdminMember>();

			int startRow = (currentPage - 1) * sortNum + 1;
			int endRow = startRow + sortNum - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				mem = new AdminMember(rset.getInt(1), rset.getInt(2), rset.getString(3), rset.getString(4),
						rset.getDate(5), rset.getDate(6), rset.getString(7));

				mList.add(mem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}

	public int updateMemberStatus(Connection conn, int mno, int statusNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateMemberStatus");

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, statusNum);
			pstmt.setInt(2, mno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

///////////////////////////////////////////////// CONTENT 관리 //////////////////////////////////////////////////////////////////////
	/**
	 * 관리자 // 전체 글 갯수를 리턴하는 DAO
	 * 
	 * @param conn
	 * @return totalCount
	 */
	public int contentCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("contentCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}

	/**
	 * 관리자 // 필터링한 글 갯수를 리턴하는 DAO
	 * 
	 * @param conn
	 * @param sort
	 * @return totalCount
	 */
	public int contentCount(Connection conn, int sort) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("contentCount" + sort);

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}

	/**
	 * 관리자 // 검색한 글 갯수를 반환하는 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @return totalCount
	 */
	public int contentCount(Connection conn, int type, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("contentCount" + type);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyWord);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	/**
	 * 관리자 // 등록된 글 리스트를 받아오는 Service
	 * 
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminBoard> contentList(Connection conn, int currentPage, int limit, int sort) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminBoard> cList = new ArrayList<AdminBoard>();

		String query = prop.getProperty("contentList" + sort);

		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cList.add(new AdminBoard(rset.getInt("BNO"), rset.getString("BTITLE"), rset.getInt("BCOUNT"),
						rset.getDate("BREGDATE"), rset.getDate("BMODIDATE"), rset.getInt("BSTATUS"),
						rset.getInt("BWRITER"), rset.getString("USER_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	/**
	 * 관리자 // 글 하나 관리 하는 DAO
	 * 
	 * @param conn
	 * @param bno
	 * @return result
	 */
	public int updateContent(Connection conn, int type, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateContent");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, type);
			pstmt.setInt(2, bno);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 관리자 // 글 여러개 관리 하는 DAO
	 * 
	 * @param conn
	 * @param query
	 * @return result
	 */
	public int updateContents(Connection conn, int type, String query) {
		PreparedStatement pstmt = null;
		int result = 0;

		String baseQuery = prop.getProperty("updateContents") + query;

		try {
			pstmt = conn.prepareStatement(baseQuery);
			pstmt.setInt(1, type);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 관리자 // 검색 결과 반환하는 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @param limit
	 * @param currentPage
	 * @return sList
	 */
	public ArrayList<AdminBoard> searchAdminBoard(Connection conn, int type, String keyWord, int currentPage,
			int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminBoard> sList = new ArrayList<AdminBoard>();

		String query = prop.getProperty("searchAdminBoard" + type);

		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				sList.add(new AdminBoard(rset.getInt("BNO"), rset.getString("BTITLE"), rset.getInt("BCOUNT"),
						rset.getDate("BREGDATE"), rset.getDate("BMODIDATE"), rset.getInt("BSTATUS"),
						rset.getInt("BWRITER"), rset.getString("USER_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sList;
	}

///////////////////////////////////////////////// COMMENT 관리 //////////////////////////////////////////////////////////////////////
	/**
	 * 관리자 // 전체 댓글 갯수 반환하는 DAO
	 * 
	 * @param conn
	 * @return totalCount
	 */
	public int commentCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("commentCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}
	
	/**
	 * 관리자 // 댓글 상태별 갯수를 카운트하는 DAO
	 * @param conn
	 * @param sort
	 * @return totalCount
	 */
	public int commentCount(Connection conn, int sort) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		
		String query = prop.getProperty("commentCount"+sort);
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if ( rset.next() ) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}

	/**
	 * 관리자 // 필터링된 댓글 댓수 반환하는 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @return totalCount
	 */
	public int commentCount(Connection conn, int type, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("commentCount" + type);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyWord);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalCount;
	}

	/**
	 * 관리자 // 코멘트 리스트 반환하는 DAO
	 * 
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminReply> commentList(Connection conn, int currentPage, int limit, int sort) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReply> cList = new ArrayList<AdminReply>();

		String query = prop.getProperty("commentList" + sort);

		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				cList.add(new AdminReply(rset.getInt("CNO"), rset.getString("CCONTENT"), rset.getTimestamp("CREGDATE"),
						rset.getTimestamp("CMODIDATE"), rset.getInt("REF_NO"), rset.getInt("CWRITER"),
						rset.getInt("CSTATUS"), rset.getInt("CTABLENO"), rset.getString("USER_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	/**
	 * 관리자 // 댓글을 처리하고 결과를 받아오는 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param cno
	 * @return result
	 */
	public int updateComment(Connection conn, int type, int cno, int tno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateComment" + tno);

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, type);
			pstmt.setInt(2, cno);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 관리자 // 필터링 결과를 받아오는 DAO
	 * 
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @param currentPage
	 * @param limit
	 * @return sList
	 */
	public ArrayList<AdminReply> searchAdminComment(Connection conn, int type, String keyWord, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReply> sList = new ArrayList<AdminReply>();
		
		String query = prop.getProperty("searchAdminComment"+type);
		
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while ( rset.next() ) {
				sList.add(new AdminReply(rset.getInt("CNO"), rset.getString("CCONTENT"), rset.getTimestamp("CREGDATE"),
						rset.getTimestamp("CMODIDATE"), rset.getInt("REF_NO"), rset.getInt("CWRITER"),
						rset.getInt("CSTATUS"), rset.getInt("CTABLENO"), rset.getString("USER_NAME")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sList;
	}

///////////////////////////////////////////////// REVIEW 관리 //////////////////////////////////////////////////////////////////////
	
	/**
	 * 관리자 // 리뷰 갯수를 리턴하는 DAO
	 * @param conn
	 * @return totalCOunt
	 */
	public int reviewCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0 ;
		
		String query = prop.getProperty("reviewCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if ( rset.next() ) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}
	
	/**
	 * 관리자 // 리뷰 상태 별 갯수를 받아오는 DAO
	 * @param conn
	 * @param sort
	 * @return totalCount
	 */
	public int reviewCount(Connection conn, int sort) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0 ;
		
		String query = prop.getProperty("reviewCount"+sort);
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if ( rset.next() ) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}
	
	/**
	 * 관리자 // 필터링된 리뷰 갯수를 받아오는 DAO
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @return totalCOunt
	 */
	public int reviewCount(Connection conn, int type, String keyWord) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		
		String query = prop.getProperty("reviewCount"+type);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyWord);
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				totalCount = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return totalCount;
	}

	/**
	 * 관리자 // 리뷰 리스트를 반환하는 DAO
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @param sort
	 * @return cList
	 */
	public ArrayList<AdminReview> reviewList(Connection conn, int currentPage, int limit, int sort) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReview> cList = new ArrayList<AdminReview>();
		
		String query = prop.getProperty("reviewList"+sort);
		
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cList.add(new AdminReview(rset.getInt("RE_NO"), rset.getString("RE_TITLE"), rset.getString("RE_CONTENT"), rset.getDouble("RE_STAR"), rset.getDate("RE_REGDATE"), rset.getDate("RE_MODIDATE"), rset.getInt("RE_WRITER"), rset.getString("USER_NAME"), rset.getInt("RE_MNO"), rset.getInt("RE_STATUS"), rset.getString("MO_NAME"), rset.getInt("LCOUNT"), rset.getString("BRAND_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return cList;
	}

	/**
	 * 관리자 // 개별 리뷰 상태 처리하는 DAO
	 * @param conn
	 * @param type
	 * @param rno
	 * @return result 
	 */
	public int updateReview(Connection conn, int type, int rno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReview");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, type);
			pstmt.setInt(2, rno);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 관리자 // 복수 리뷰 상태처리하는 DAO
	 * @param conn
	 * @param type
	 * @param query
	 * @return result
	 */
	public int updateReviews(Connection conn, int type, String query) {
		PreparedStatement pstmt = null;
		int result = 0;
		String baseQuery = prop.getProperty("updateReviews")+query;
		
		try {
			pstmt = conn.prepareStatement(baseQuery);
			pstmt.setInt(1, type);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 관리자// 필터링된 리스트를 받아오는 DAO
	 * @param conn
	 * @param type
	 * @param keyWord
	 * @param currentPage
	 * @param limit
	 * @return sList
	 */
	public ArrayList<AdminReview> searchAdminReview(Connection conn, int type, String keyWord, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminReview> sList = new ArrayList<AdminReview>();
		
		String query = prop.getProperty("searchAdminReview"+type);
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setString(1, keyWord);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while ( rset.next() ) {
				sList.add(new AdminReview(rset.getInt("RE_NO"), rset.getString("RE_TITLE"), rset.getString("RE_CONTENT"), rset.getDouble("RE_STAR"), rset.getDate("RE_REGDATE"), rset.getDate("RE_MODIDATE"), rset.getInt("RE_WRITER"), rset.getString("USER_NAME"), rset.getInt("RE_MNO"), rset.getInt("RE_STATUS"), rset.getString("MO_NAME"), rset.getInt("LCOUNT"), rset.getString("BRAND_NAME")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sList;
	}

	/**
	 * 관리자 신고된 글 sort로 개수 불러오는 dao
	 * @param conn
	 * @param sort
	 * @return
	 */
	public int reportSortCount(Connection conn, int sort) {
		Statement stmt = null;
		ResultSet rset = null;
		int totalCount = 0;

		String query = prop.getProperty("reportSortCount" + sort);

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				totalCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return totalCount;
	}

	
	
//////////////////////////////////////////////// report //////////////////////////////////////////////
	
	/**
	 * 관리자 신고된 글 전체 개수 불러오는 dao
	 * @param conn
	 * @return
	 */
	public int reportTotalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("reportTotalCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<AdminReport> reportList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		ArrayList<AdminReport> rList = null;
		AdminReport aReport = null;
		
		String query = prop.getProperty("reportList");
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			rList = new ArrayList<AdminReport>();
			while(rset.next()) {
				aReport = new AdminReport();
				aReport.setrNo(rset.getInt("REPORT_NO"));
				aReport.setrContent(rset.getString("REPORT_CONT"));
				aReport.setrRefNo(rset.getInt("REF_NO"));
				aReport.setrDate(rset.getString("REPORT_DATE2"));
				aReport.setrResult(rset.getInt("REPORT_RESULT"));
				aReport.setrWriter(rset.getInt("REPORT_WRI"));
				aReport.setrUser(rset.getInt("REPORT_USER"));
				aReport.setrTableNo(rset.getInt("REPORT_REF_NO"));
				aReport.setReRefCont(rset.getString("REPORT_REF_CONT"));
				aReport.setReRefContType(rset.getString("REPORT_CON_TYPE"));
				aReport.setReStatusType(rset.getString("REPORT_STATUS_TYPE"));
				aReport.setrWriter2(rset.getString("USER_NAME"));
				aReport.setrRefConNo(rset.getInt("REPORT_CONNO"));
				
				rList.add(aReport);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rList;
	}

	public int updateReport(Connection conn, int tno, int refConNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateReport"+tno);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, refConNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	/**
	 * 신고 처리 업데이트
	 * @param conn
	 * @param rNo
	 * @return
	 */
	public int resultUpdate(Connection conn, int rNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("resultUpdate");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rNo);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 신고글 삭제 dao
	 * @param conn
	 * @param tno
	 * @param refNo
	 * @return
	 */
	public int reportDelete(Connection conn, int tno, int refNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("reportDelete"+tno);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, refNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int reportRestore(Connection conn, int tno, int refNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("reportRestore"+tno);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, refNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	

}
