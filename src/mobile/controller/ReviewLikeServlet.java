package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;

@WebServlet("/reviewLike.mo")
public class ReviewLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		int control = Integer.parseInt(request.getParameter("num"));
		
		int result = 0;
		if ( control > 0 ) {
			result = new MobileService().insertReviewLike(rno, uno);
		} else {
			result = new MobileService().deleteReviewLike(rno, uno);
		}
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
