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

@WebServlet("/updateCalendar.do")
public class UpdateCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateCalendarServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String url = request.getParameter("url");
		Date date = Date.valueOf(request.getParameter("date"));
		char status = request.getParameter("status").charAt(0);
		int code = Integer.parseInt(request.getParameter("code"));
		
		Calendar cal = new Calendar(id, title, url, date, status, code);
		
		int result = new CalendarService().updateCalendar(cal);
		
		response.getWriter().print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
