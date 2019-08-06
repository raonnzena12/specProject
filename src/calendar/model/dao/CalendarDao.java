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
				cal = new Calendar(rset.getString("CAL_TITLE"),
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
	
	
	
	
	
	
	
	
	
	
}
