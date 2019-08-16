package mobile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mobile.model.service.MobileService;

@WebServlet("/count.mo")
public class ListCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCountServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String qString = request.getParameter("qString");
		int listCount = 0;
		
		if ( qString != null && qString.trim().length() != 0 ) {
			String[] queryArr = qString.split(","); 
			ArrayList<String[]> queryList = new ArrayList<String[]>();
			for ( int i = 0 ; i < queryArr.length ; i++ ) {
				queryList.add(queryArr[i].split(":"));
			}
			listCount = new MobileService().getListCount(queryList);
		} else {
			listCount = new MobileService().getListCount(); 
		}
			
		response.getWriter().print(listCount);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
