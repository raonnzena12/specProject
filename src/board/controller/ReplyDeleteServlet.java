package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;


@WebServlet("/replydelete.bo")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReplyDeleteServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		/* int bno = Integer.parseInt(request.getParameter("bno")); */
		
		int result = new BoardService().deleteReply(cno);
		
		response.getWriter().print(result);
		
		/*
		 * if(result > 0) { response.sendRedirect(request.getContextPath() +
		 * "/content.bo"); }else { request.setAttribute("msg", "댓글 삭제 에러");
		 * request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,
		 * response);
		 * 
		 * }
		 */
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
