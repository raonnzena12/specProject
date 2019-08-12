package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.vo.Member;


@WebServlet("/write.bo")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardWriteServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String content = request.getParameter("connent");
		int brand = Integer.parseInt(request.getParameter("brand"));
		
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		Board board = new Board();
		board.setbCategory(category);
		board.setbTitle(title);
		board.setbContent(content); 
		board.setbWriter(writer);
		board.setbCode(brand);
		
		int result = new BoardService().writeBoard(board);
		
		if(result > 0) {
			response.sendRedirect("maintotal.bo?bno="+ brand );
		}else {
			request.setAttribute("msg", "게시글 작성 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
