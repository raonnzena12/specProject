package calendar.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.model.service.CalendarService;
import calendar.model.vo.Calendar;

@WebServlet("/insertCalendar.do")
public class InsertCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCalendarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String url = request.getParameter("url");
		Date date = Date.valueOf(request.getParameter("date"));
		char status = request.getParameter("status").charAt(0);
		int code = Integer.parseInt(request.getParameter("code"));
		
		Calendar cal = new Calendar(title, url, date, status, code);
		
		int result = new CalendarService().insertCalendar(cal);
		
		response.getWriter().print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
