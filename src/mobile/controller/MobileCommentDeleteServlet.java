package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;

@WebServlet("/commentDelete.mo")
public class MobileCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileCommentDeleteServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mcNo = Integer.parseInt(request.getParameter("mcNo"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		int result = new MobileService().deleteComment(mcNo, type);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
