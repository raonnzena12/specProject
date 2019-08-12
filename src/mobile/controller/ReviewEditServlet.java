package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.MobileComment;
import mobile.model.vo.Review;

@WebServlet("/modifyReview.mo")
public class ReviewEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 리뷰 수정창 처음 열었을떄
		// 리뷰 수정창 화면 보여줌
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		Review review = new MobileService().selectReview(rno);
		
		String page = "";
		if ( review != null ) {
			request.setAttribute("mc", review);
			page = "views/mobile/mobileReviewUpdate.jsp";
		} else {
			request.setAttribute("msg", "리뷰 수정창 로드 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
