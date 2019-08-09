package calendar.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import calendar.model.dao.CalendarDao;
import calendar.model.vo.Calendar;

public class CalendarService {
	
	public CalendarService() {}

	public int insertCalendar(Calendar cal) {
		Connection conn = getConnection();
		
		int result = new CalendarDao().insertCalendar(conn, cal);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Calendar> loadCalendar() {
		Connection conn = getConnection();
		
		ArrayList<Calendar> list = new CalendarDao().loadCalendar(conn);
		
		return list;
	}

}
