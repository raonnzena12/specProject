package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardPageInfo;


@WebServlet("/boardSearch.bo")
public class BoardRearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BoardRearchServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		String search = request.getParameter("search");
		String text = request.getParameter("text");
		
		BoardService bService = new BoardService();
		
		// 페이징 처리
		int boardCount = bService.getBoardCount(bno);
		
		int limit = 10;
		int pagingBarSize = 10;
		
		int currentPage = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage=0;
		
		if(request.getParameter("currentPage") == null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		maxPage = (int)Math.ceil((double)boardCount / limit);
		
		startPage = ((currentPage-1) / limit) * pagingBarSize + 1;
		
		endPage = startPage + pagingBarSize -1;
		
		if(maxPage <= endPage) {
			endPage = maxPage;
		}
		
		BoardPageInfo bpi = new BoardPageInfo(boardCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
		
		
		//------------------------------------------------------
		/* int bNo = Integer.parseInt(request.getParameter("bNo")); */
	
		ArrayList<Board> tlist = bService.searchBoard(currentPage, limit, bno, search, text);
		
			
		String page = "";
		if(tlist != null) {
				page="views/Board/BoardMainTotal.jsp";
				request.setAttribute("tlist", tlist);
				request.setAttribute("bpi", bpi);
				request.setAttribute("bno", bno);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 목록조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
