package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Reply;


@WebServlet("/writeReply.bo")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReplyInsertServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  
		  int writer = Integer.parseInt(request.getParameter("writer"));
		  String content = request.getParameter("content");
		  int bno = Integer.parseInt(request.getParameter("bno"));
		  
		  content = content.replace("\n", "<br>");
		  
		  Reply r = new Reply(content, writer, bno);
		  
		  int result = new BoardService().writeReply(r);
		  
		  response.getWriter().print(result);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
