package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.MobileComment;
import mobile.model.vo.Report;
import mobile.model.vo.Review;
import sun.security.provider.certpath.OCSP.RevocationStatus;

@WebServlet("/reportComment.mo")
public class MobileCommentReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileCommentReportServlet() {
        super();
    } 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mcNo = Integer.parseInt(request.getParameter("mcNo"));
		int type = Integer.parseInt(request.getParameter("type"));
		
		MobileComment mc = null;
		Review review = null;
		if ( type == 1 || type == 2 ) {
			mc = new MobileService().selectComment(mcNo, type);
		} else {
			review = new MobileService().selectReview(mcNo);
		}
		
		if ( mc != null ) {
			request.setAttribute("mc", mc);
			request.getRequestDispatcher("views/mobile/mobileCommentReportForm.jsp").forward(request, response);
		} else if ( review != null) {
			request.setAttribute("review", review);
			request.getRequestDispatcher("views/mobile/mobileReviewReportForm.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "댓글 신고 로딩 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		String rContent = request.getParameter("text");
		int rRefNo = Integer.parseInt(request.getParameter("mcNo"));
		int rWriter = Integer.parseInt(request.getParameter("rWriter"));
		int rUser = Integer.parseInt(request.getParameter("rUserNum"));
		int type = Integer.parseInt(request.getParameter("type"));
		int rTableNo = 0;  
		
		switch ( type ) {
		case 1 : rTableNo = 5; break;
		case 2 : rTableNo = 6; break;
		case 3 : rTableNo = 4; break;
		}
		
		Report report = new Report(rContent, rTableNo, rWriter, rUser, rRefNo);
		System.out.println(rWriter);
		int result = new MobileService().insertReport(report);
		
		response.getWriter().print(result);		
	}

}
