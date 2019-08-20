package admin.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

@WebServlet("/commentUpdate.ad")
public class CommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int type = Integer.parseInt(request.getParameter("type"));
		String cno = request.getParameter("cno");
		String[] cnoArr = null;
		if ( cno != null ) cnoArr = cno.split("/");
		String tno = request.getParameter("tno");
		String[] tnoArr = null;
		if ( tno != null ) tnoArr = tno.split("/");
		int result = 0;
		if ( cnoArr != null && cnoArr.length > 1 ) { // 여러 댓글을 처리 요청할때
			result = new AdminService().updateComments(type, cnoArr, tnoArr);
		} else { // 댓글 하나를 처리 요청할때
			result = new AdminService().updateComment(type, Integer.parseInt(cno), Integer.parseInt(tno));
		}
	
		if ( result > 0 ) {
			request.getSession().setAttribute("msg", cnoArr.length + "건의 댓글 처리가 성공하였습니다.");
			response.sendRedirect("adminComment.ad?currentPage="+currentPage);
		} else {
			request.setAttribute("msg", "댓글 처리 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
