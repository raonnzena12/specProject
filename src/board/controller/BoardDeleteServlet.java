package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;


@WebServlet("/delete.bo")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardDeleteServlet() {
        super(); 
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		int result = new BoardService().deleteBoard(bno);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/maintotal.bo?bno="+bcode);
		}else {
			request.setAttribute("msg", "게시글 삭제 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
