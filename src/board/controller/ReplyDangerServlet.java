package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;


@WebServlet("/replyDanger.bo")
public class ReplyDangerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplyDangerServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String text = request.getParameter("text");
		int dwriter = Integer.parseInt(request.getParameter("dwriter"));
		int user = Integer.parseInt(request.getParameter("user"));
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new BoardService().dangerReply(text, dwriter, user, cno);
		
		response.getWriter().print(result);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
