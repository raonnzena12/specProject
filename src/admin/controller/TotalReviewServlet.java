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
import member.model.vo.Member;

@WebServlet("/adminReview.ad")
public class TotalReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TotalReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = null;
		if ( request.getSession().getAttribute("loginUser") != null ) {
			loginUser = (Member)request.getSession().getAttribute("loginUser");
		}
		
		if ( loginUser == null || loginUser.getUserStatus() != 0 ) {
			response.sendRedirect(request.getContextPath());
		} else {
		
		
		// sort 정렬값 구하기
		int sort = 0;
		if ( request.getParameter("sort") == null ) {
			sort = 1;
		} else {
			sort = Integer.parseInt(request.getParameter("sort"));
		}
		
		
		AdminService aService = new AdminService();
		
		// === === === 페이징 처리  === === ===
		// 전체 리뷰 수 구하기
		int totalContent= 0;
		if ( sort > 4 ) {
			totalContent = aService.reviewCount(sort);
		} else {
			totalContent = aService.reviewCount();
		}
		
		// 페이징 처리용 변수 선언
		int limit = 0; // 한 페이지에 보여질 게시글 수
		int pagingBarSize = 10; // 보여질 페이징바의 페이지 개수
		int currentPage = 0; // 현재 페이지 번호를 표시할 변수
		int maxPage = 0; // 전체 페이지에서 가장 마지막 페이지
		int startPage = 0; // 페이징 바 시작 페이지 번호
		int endPage = 0; // 페이징 바 끝 페이지 번호
		if ( request.getParameter("limit") == null ) {
			limit = 10;
		} else {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		
		// currentPage - 현재 페이지 번호를 표시할 변수
		if ( request.getParameter("currentPage") == null ) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)(Math.ceil((double)totalContent/limit));
		startPage = ((currentPage-1)/limit)*pagingBarSize +1;
		endPage = startPage + pagingBarSize - 1 ;
		if ( endPage >= maxPage ) endPage = maxPage;
		
		AdminPageInfo pInf = new AdminPageInfo(totalContent, limit, pagingBarSize, currentPage, maxPage, startPage, endPage, sort);
		
		ArrayList<AdminReview> cList = aService.reviewList(currentPage, limit, sort);
		
			request.setAttribute("cList", cList);
			request.setAttribute("pInf", pInf);
			request.getRequestDispatcher("views/admin/adminReview.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
