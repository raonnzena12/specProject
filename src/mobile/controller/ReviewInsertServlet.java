package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.Review;

@WebServlet("/reviewInsert.mo")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rTitle = request.getParameter("reviewTitle");
		String rContent = request.getParameter("reviewText");
		rContent = rContent.replaceAll("\n", "<br>");
		int star = Integer.parseInt(request.getParameter("star"));
		double rStar = star * 0.5 ;
		int rWriterNo = Integer.parseInt(request.getParameter("rWriter"));
		int rRefMno = Integer.parseInt(request.getParameter("mno"));
		
		Review review = new Review(rTitle, rContent, rStar, rWriterNo, rRefMno);
		int result = new MobileService().insertReview(review);
		
		String page = "";
		if ( result > 0 ) {
			page = request.getContextPath()+"/spec.mo?currentPage=1&mno="+rRefMno+"&page=2";
			request.getSession().setAttribute("msg", "리뷰가 등록되었습니다!");
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "리뷰 등록 실패");
		}
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
