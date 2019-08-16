package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.MobileComment;

@WebServlet("/modifyComment.mo")
public class MobileCommentUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileCommentUpdateFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 수정창 처음 열었을떄
		// 댓글 수정창 화면 보여줌
		int mcNo = Integer.parseInt(request.getParameter("mcNo"));
		
		MobileComment mc = new MobileService().selectComment(mcNo);
		
		String page = "";
		if ( mc != null ) {
			request.setAttribute("mc", mc);
			page = "views/mobile/mobileCommeUpdate.jsp";
		} else {
			request.setAttribute("msg", "댓글 수정창 로드 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 수정할때 (ajax에서 post 방식으로 접근)
		// 실제 수정과정 실행함
		int mcNo = Integer.parseInt(request.getParameter("mcNo"));
		String text = request.getParameter("text");
		text = text.replaceAll("\n", "<br>");
		
		MobileComment mc = new MobileComment(mcNo, text);
		int result = new MobileService().updateComment(mc);
		
		response.getWriter().print(result);
	}

}
