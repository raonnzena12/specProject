package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;

@WebServlet("/updateReview.mo")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 방식으로 접근했을때 ( 리뷰 삭제할 때 )
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		int result = new MobileService().deleteReview(rno);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 방식으로 접근했을때 ( 리뷰 수정할 때 )
	}

}
