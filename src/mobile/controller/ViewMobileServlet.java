package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mobile.model.service.MobileService;
import mobile.model.vo.*;

@WebServlet("/spec.mo")
public class ViewMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewMobileServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mId = Integer.parseInt(request.getParameter("mno"));
		int specPage = Integer.parseInt(request.getParameter("page"));
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		// 스펙/리뷰/비교중 한 페이지로 연결해주기 위해 파라미터의 page를 받는다
		
		Mobile device = new MobileService().selectMobile(mId);
		
		String page = "";
		if ( device != null && specPage == 1 ) {
			request.setAttribute("device", device);
			page = "/views/mobile/mobileSpec.jsp"; 
		} else if ( device != null && specPage == 2 ) {
			request.setAttribute("device", device);
			page = "/views/mobile/mobileReview.jsp"; 
			
		} else {
			request.setAttribute("msg", "로딩 실패");
			page = "/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		int mno = Integer.parseInt(request.getParameter("mno"));
		Mobile device = new MobileService().selectMobile(mno);
		
		new Gson().toJson(device, response.getWriter());
	}

}
