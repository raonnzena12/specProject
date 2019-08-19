package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import admin.model.vo.AdminBoard;
import admin.model.vo.AdminMember;
import admin.model.vo.AdminReply;
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
			
			while(rset.next()) {
				board = new AdminBoard(
							rset.getInt(1),
							rset.getString(2),
							rset.getInt(3),
							rset.getDate(4),
							rset.getDate(5),
							rset.getString(6),
							rset.getString(7)
						);
				bList.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
			rList= new ArrayList<AdminReply>();
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adminReply = new AdminReply(rset.getInt(1), 
											rset.getString(2), 
											rset.getTimestamp(3), 
											rset.getTimestamp(4), 
											rset.getString(5), 
											rset.getString(6), 
											rset.getInt(7)
											);
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
			
			while(rset.next()) {
				adminReview = new AdminReview(
						rset.getInt(1), 
						rset.getString(2), 
						rset.getDouble(3), 
						rset.getDate(4), 
						rset.getDate(5), 
						rset.getInt(6), 
						rset.getString(7), 
						rset.getInt(8), 
						rset.getString(9), 
						rset.getString(10)
						);
				rList.add(adminReview);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
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
			
			while(rset.next()) {
				cal = new Calendar(
						rset.getInt(1), 
						rset.getString(2), 
						rset.getString(3), 
						rset.getDate(4), 
						rset.getString(5).charAt(0), 
						rset.getInt(6)
						);
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
	
	//-------------------------------------------- selectMember -----------------------------------------------
	

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
			
			while(rset.next()) {
				mem = new AdminMember(
						rset.getInt(1),
						rset.getString(2),
						rset.getString(3),
						rset.getDate(4),
						rset.getDate(5),
						rset.getString(6)
						);
				
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

	public int getMemberCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		
		String query = prop.getProperty("getMemberCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public ArrayList<AdminMember> selectMemberSort(Connection conn, String sort, boolean isSort, int sortNum, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdminMember> mList = null;
		AdminMember mem = null;
		
		String query = "";
		
		if(sort.contains("no")) {
			if(isSort == true) {
				query = prop.getProperty("selectMemberSortNo");
			}else {
				query = prop.getProperty("selectMemberSortNoDesc");
			}
		}else if(sort.contains("email")) {
			if(isSort == true) {
				query = prop.getProperty("selectMemberSortEmail");
			}else {
				query = prop.getProperty("selectMemberSortEmailDesc");
			}
		}else if(sort.contains("name")) {
			if(isSort == true) {
				query = prop.getProperty("selectMemberSortName");
			}else {
				query = prop.getProperty("selectMemberSortNameDesc");
			}
		}else if(sort.contains("status")) {
			if(sort.contains("0")) {
				query = prop.getProperty("selectMemberSortStatusAdmin");
			}else if(sort.contains("1")) {
				query = prop.getProperty("selectMemberSortStatusGeneral");
			}else if(sort.contains("2")) {
				query = prop.getProperty("selectMemberSortStatusSuspended");
			}else if(sort.contains("3")) {
				query = prop.getProperty("selectMemberSortStatusDeleted");
			}
		}else if(sort.contains("date")) {
			if(isSort == true) {
				query = prop.getProperty("selectMemberSortDate");
			}else {
				query = prop.getProperty("selectMemberSortDateDesc");
			}
		}else {
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
			
			
			while(rset.next()) {
				mem = new AdminMember(
						rset.getInt(1),
						rset.getInt(2),
						rset.getString(3),
						rset.getString(4),
						rset.getDate(5),
						rset.getDate(6),
						rset.getString(7)
						);
				
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


	
	
	
	
	
	
	
	
	
	
}
