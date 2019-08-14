package mobile.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mobile.model.service.MobileService;
import mobile.model.vo.*;

@WebServlet("/devicelist.mo")
public class ListMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListMobileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서비스 객체 생성
		MobileService mService = new MobileService();
		String qString = request.getParameter("qString");
//		if ( qString != null ) System.out.println(qString.trim().length()); 
		 
		// === === === 페이징 처리  === === ===
		// 전체 게시글 수 구하기
		int listCount = mService.getListCount(); 
		
		// 페이징 처리용 변수 선언
		int limit = 11; // 한 페이지에 보여질 게시글 수
		int pagingBarSize = 5; // 보여질 페이징바의 페이지 개수
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
		
		maxPage = (int)Math.ceil((double)listCount/limit);
		startPage = ((currentPage-1)/limit)*pagingBarSize +1;
		endPage = startPage + pagingBarSize - 1 ;
		if ( endPage >= maxPage ) endPage = maxPage;
		
		PageInfo pInf = new PageInfo(listCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		ArrayList<Mobile> list = null;
		if ( qString != null && qString.trim().length() != 0 ) {
			String[] queryArr = qString.split(","); 
			ArrayList<String[]> queryList = new ArrayList<String[]>();
			for ( int i = 0 ; i < queryArr.length ; i++ ) {
				queryList.add(queryArr[i].split(":"));
			}
			list = mService.filterList(currentPage, limit , queryList);
			
		} else {
			// === === === 게시글 목록 조회 시작 === === ===
			list = mService.selectList(currentPage, limit);
		}
		
		// 게시글 목록 조회 결과에 따른 view 연결처리
		String page = "";
		if ( qString != null ) { 
			new Gson().toJson(list, response.getWriter());
			return;
//		} else if ( qString != null && qString.trim().length() == 0 ) {
			
//			return;
		} else if ( list != null ) {
			page = "/views/mobile/mobileList.jsp";
			request.setAttribute("pInf", pInf);
			request.setAttribute("list", list);
		} else {
			page = "/views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
