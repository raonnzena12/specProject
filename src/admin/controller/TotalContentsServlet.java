package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;
import admin.model.vo.*;

@WebServlet("/adminBoard.do")
public class TotalContentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TotalContentsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminService aService = new AdminService();
		
		// === === === 페이징 처리  === === ===
		// 전체 게시글 수 구하기
		int totalContent = aService.contentCount();
		
		// 페이징 처리용 변수 선언
		int limit = 10; // 한 페이지에 보여질 게시글 수
		int pagingBarSize = 10; // 보여질 페이징바의 페이지 개수
		int currentPage = 0; // 현재 페이지 번호를 표시할 변수
		int maxPage = 0; // 전체 페이지에서 가장 마지막 페이지
		int startPage = 0; // 페이징 바 시작 페이지 번호
		int endPage = 0; // 페이징 바 끝 페이지 번호
		
		// currentPage - 현재 페이지 번호를 표시할 변수
		if ( request.getParameter("currentPage") == null ) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)Math.ceil((double)totalContent/limit);
		startPage = ((currentPage-1)/limit)*pagingBarSize +1;
		endPage = startPage + pagingBarSize - 1 ;
		if ( endPage >= maxPage ) endPage = maxPage;
		
		AdminPageInfo pInf = new AdminPageInfo(totalContent, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		ArrayList<AdminBoard> cList = aService.contentList(currentPage, limit);
		
		if ( !cList.isEmpty() ) {
			request.setAttribute("cList", cList);
			request.setAttribute("pInf", pInf);
			request.getRequestDispatcher("views/admin/adminContent.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "리스트 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
	}

}
