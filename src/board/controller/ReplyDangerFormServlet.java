package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Reply;


@WebServlet("/replyDangerForm.bo")
public class ReplyDangerFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplyDangerFormServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		int dwriter = Integer.parseInt(request.getParameter("dwriter"));
		
		
		Reply content = new BoardService().replyContent(cno);
		
		String page = "";
		if(content != null) {
			page = "views/Board/replyDangerForm.jsp";
			request.setAttribute("content", content);
			request.setAttribute("cno", cno);
			request.setAttribute("dwriter", dwriter);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "신고 댓글 내용 불러오기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
