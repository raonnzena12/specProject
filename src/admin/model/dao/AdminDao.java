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


	
	
	
	
	
	
	
	
	
	
}
