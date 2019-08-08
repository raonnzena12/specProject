package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.*;

@WebServlet("/spec.mo")
public class ViewMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ViewMobileServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int mId = Integer.parseInt(request.getParameter("mId"));
		// 테스트용
		int mId = 1;
		
		Mobile device = new MobileService().selectMobile(mId);
		String page = "";
		if ( device != null ) {
			request.setAttribute("device", device);
			page = "views/mobile/mobileSpec.jsp";
		} else {
			request.setAttribute("msg", "로딩 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
