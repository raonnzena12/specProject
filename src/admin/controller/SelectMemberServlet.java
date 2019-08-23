package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.AdminMember;
import admin.model.vo.AdminPageInfo;
import member.model.vo.Member;

@WebServlet("/adminSelectMember.do")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String sort = "no";
		if(request.getParameter("sort") != null) {
			sort = request.getParameter("sort");			
		}
		
		int sortNum = 5;
		if(request.getParameter("sortNum") != null) {
			sortNum = Integer.parseInt(request.getParameter("sortNum"));
		}
		
		ArrayList<AdminMember> list = null;
		
		AdminService aService = new AdminService();
		
		//------------------- list 받아오는 처리 --------------------
		JSONObject map = null;
		
		if(sort.equals("admin")) {
			list = aService.selectMember();
			
			map = new JSONObject();
			
			for(int i=0; i<list.size(); i++) {
				map.put(i, list.get(i));
			}
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(map, response.getWriter());
			
		}else {
			
			boolean isSort;
			
			if(request.getParameter("isSort") != null) {
				isSort = Boolean.parseBoolean(request.getParameter("isSort"));
				System.out.println("isSort : " + isSort);
			}else {
				isSort = true;
			}
			
			//----------------------- count 계산 및 페이징 변수 선언 --------------------------
			
			int count;
			int statusNum = 5;
			String searchSort = null;
			String searchText = null;
			
			if(request.getParameter("searchSort") != null) {
				searchSort = request.getParameter("searchSort");
			}
			
			if(request.getParameter("searchText") != null) {
				searchText = request.getParameter("searchText");
			}
			
			if(sort.contains("status")) {
				if(sort.contains("0")) {
					statusNum = 0;
				}else if(sort.contains("1")) {
					statusNum = 1;
				}else if(sort.contains("2")) {
					statusNum = 2;
				}else if(sort.contains("3")) {
					statusNum = 3;
				}
				if(sort.contains("4")) {
					count = aService.getMemberCount();
				}else {
					count = aService.getMemberStatusCount(statusNum);
				}
			}else if(sort.contains("search")) {
				count = aService.getMemberSearchCount(searchSort, searchText);
			}else {
				count = aService.getMemberCount();
			}
			
			int limit = sortNum;
			int pagingBarSize = 10;
			
			int currentPage = 0;
			int maxPage = 0;
			int startPage = 0;
			int endPage = 0;
			
			// --------------- 페이징 처리 ------------------
			
			if(request.getParameter("currentPage") == null) {
				currentPage = 1;
			}else {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			maxPage = (int)Math.ceil((double)count / limit);
			
			startPage = ((currentPage - 1) / pagingBarSize) * pagingBarSize + 1;
			endPage = startPage + pagingBarSize - 1;
			
			if(maxPage <= endPage) {
				endPage = maxPage;
			}
			
			AdminPageInfo pInf = new AdminPageInfo(count, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
			
			//------------------------- Member list 받아오기 -----------------------------

			if(sort.contains("search")) {
				list = aService.selectMemberSearch(searchSort, searchText, sortNum, currentPage);
			}else {				
				list = aService.selectMemberSort(sort, isSort, sortNum, currentPage);
			}
			
			String page = "";
			if(list != null) {
				page = "views/admin/adminMember.jsp";			
				request.setAttribute("list", list);
				request.setAttribute("pInf", pInf);
				request.setAttribute("isSort", isSort);
				request.setAttribute("sort", sort);
				request.setAttribute("sortNum", sortNum);
				request.setAttribute("searchSort", searchSort);
				request.setAttribute("searchText", searchText);
				
				if(sort.contains("status")) {
					request.setAttribute("status", sort);
				}

			}else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "게시판 목록 조회 실패");
			}
			request.getRequestDispatcher(page).forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
