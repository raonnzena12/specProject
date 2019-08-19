package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;


@WebServlet("/update.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardUpdateServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int category = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title-1");
		String content = request.getParameter("summernote");
		int brand = Integer.parseInt(request.getParameter("brand"));
		
		content = content.replace("\n", "<br>");
		
		int result = new BoardService().updateBoard(bno, category, title, content, brand);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/content.bo?bno="+bno);
		}else {
			request.setAttribute("msg", "게시글 수정 에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
