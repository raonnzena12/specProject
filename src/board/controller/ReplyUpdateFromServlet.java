package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Reply;




@WebServlet("/replyUpdateForm.bo")
public class ReplyUpdateFromServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplyUpdateFromServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Reply content = new BoardService().replyContent(cno);
		
		String page= "";
		
		if(content != null) {
			page = "views/Board/replyUpdateForm.jsp";
			request.setAttribute("content", content);
			request.setAttribute("cno", cno); 
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 내용 불러오기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
