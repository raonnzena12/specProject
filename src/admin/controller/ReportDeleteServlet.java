package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;


@WebServlet("/reportDelete.ad")
public class ReportDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReportDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tno = Integer.parseInt(request.getParameter("tno"));
		int refNo = Integer.parseInt(request.getParameter("refNo"));
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		System.out.println("tno: "+tno);
		System.out.println("refNo : "+refNo);
		
		AdminService aService = new AdminService();
		
		int uResult = aService.reportDelete(tno, refNo);
		if(uResult > 0) {
			
			int rResult = aService.resultUpdate(rNo);
			
			if(rResult > 0) {
				response.sendRedirect(request.getContextPath()+"/adminReport.do");
			} else {
				request.setAttribute("msg", "신고 결과 처리 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			request.setAttribute("msg", "신고 제재 처리 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
