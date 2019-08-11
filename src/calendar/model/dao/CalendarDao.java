package calendar.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import calendar.model.vo.Calendar;


public class CalendarDao {
	
	private Properties prop = new Properties();
	
	public CalendarDao() {
		
		String fileName = CalendarDao.class.getResource("/sql/calendar/calendar-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertCalendar(Connection conn, Calendar cal) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCalendar");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cal.getTitle());
			pstmt.setString(2, cal.getUrl());
			pstmt.setDate(3, cal.getDate());
			pstmt.setString(4, cal.getStatus()+"");
			pstmt.setInt(5, cal.getCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

	public ArrayList<Calendar> loadCalendar(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Calendar> list = null;
		Calendar cal = null;
		
		String query = prop.getProperty("loadCalendar");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Calendar>();
			
			while(rset.next()) {
				cal = new Calendar( rset.getInt("CAL_NO"),
									rset.getString("CAL_TITLE"),
									rset.getString("CAL_URL"),
									rset.getDate("CAL_DATE"),
									rset.getString("CAL_STATUS").charAt(0),
									rset.getInt("CAL_CODE")
								);
				list.add(cal);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList<Calendar> selectLoadCalendar(Connection conn, int code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Calendar> list = null;
		Calendar cal = null;
		
		String query = prop.getProperty("selectLoadCalendar");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Calendar>();
			
			while(rset.next()) {
				cal = new Calendar( rset.getInt("CAL_NO"),
									rset.getString("CAL_TITLE"),
									rset.getString("CAL_URL"),
									rset.getDate("CAL_DATE"),
									rset.getString("CAL_STATUS").charAt(0),
									rset.getInt("CAL_CODE")
								);
				list.add(cal);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateCalendar(Connection conn, Calendar cal) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCalendar");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cal.getTitle());
			pstmt.setString(2, cal.getUrl());
			pstmt.setDate(3, cal.getDate());
			pstmt.setString(4, cal.getStatus()+"");
			pstmt.setInt(5, cal.getCode());
			pstmt.setInt(6, cal.getId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCalendar(Connection conn, int id) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCalendar");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, id);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
