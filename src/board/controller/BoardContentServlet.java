package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;


@WebServlet("/content.bo")
public class BoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public BoardContentServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bno"));
		
		Board board = new BoardService().contentBoard(bNo);
		
		String page = "";
		if(board != null) {
			page = "views/Board/BoardContent.jsp";
			request.setAttribute("board", board);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세조회 에러");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
