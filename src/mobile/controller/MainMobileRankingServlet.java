package mobile.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.CompareT;
import mobile.model.vo.MoImage;
import mobile.model.vo.Mobile;


@WebServlet("/mainPageRank.bo")
public class MainMobileRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MainMobileRankingServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<CompareT> rankList = new MobileService().mobileRank();
		
		ArrayList<MoImage> img = new MobileService().mobileImg();
		
		ArrayList<Mobile> hList = new MobileService().mobileHotRank();
		
		String page = "";
		if(rankList != null) {
				page="views/common/mainPage.jsp";
				request.setAttribute("rankList", rankList);
				request.setAttribute("img", img);
				request.setAttribute("hList", hList); 
				
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "랭킹 불러오기 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
