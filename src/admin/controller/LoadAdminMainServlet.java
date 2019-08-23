package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

@WebServlet("/loadAdminMain.do")
public class LoadAdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadAdminMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = null;
		String page = "";
		
		if ( request.getSession().getAttribute("loginUser") != null ) {
			loginUser = (Member)request.getSession().getAttribute("loginUser");
		}
		
		if ( loginUser == null || loginUser.getUserStatus() != 0 ) {
			page = "/";
			//response.sendRedirect(request.getContextPath());
		} else {
			page = "views/admin/adminMain.jsp";
			//response.sendRedirect(request.getContextPath() + "/views/admin/adminMain.jsp");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
