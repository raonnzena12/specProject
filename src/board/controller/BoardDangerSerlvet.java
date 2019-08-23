package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;


@WebServlet("/danger.bo")
public class BoardDangerSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardDangerSerlvet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int user = Integer.parseInt(request.getParameter("dangerUser"));
		int dwriter = Integer.parseInt(request.getParameter("dwriter"));
		String content = request.getParameter("dangerContent");
		
		int bcode = Integer.parseInt(request.getParameter("bcode"));
		
		int result = new BoardService().dangerBoard(bno, user, dwriter, content);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/content.bo?bno=" + bno+"&bcode="+ bcode);
		}else {
			request.setAttribute("msg", "게시글 신고 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
