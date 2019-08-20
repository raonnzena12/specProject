package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;


@WebServlet("/dangerForm.bo")
public class BoardDangerFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardDangerFormServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bno"));
		int dwriter = Integer.parseInt(request.getParameter("dwriter"));
		
		Board board = new BoardService().contentBoard(bNo);
		
		String page = "";
		
		if(board != null ) {
			page = "views/Board/BoardDangerForm.jsp";
			request.setAttribute("board", board);
			request.setAttribute("dwriter", dwriter);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "신고할 게시글 상세조회 에러");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
