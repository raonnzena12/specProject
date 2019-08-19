package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

@WebServlet("/adminContentUpdate.do" ) 
public class ContentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int type = Integer.parseInt(request.getParameter("type"));
		String bno = request.getParameter("bno");
		String[] bnoArr = bno.split("/");
		int result = 0;
		
		if ( type == 1 ) { // type가 1일떄 ( 삭제요청일때 )
			if ( bnoArr.length > 1 ) { // 여러글을 삭제 요청할때
				result = new AdminService().deleteCntents(bnoArr);
			} else { // 글 하나를 삭제 요청할때
				result = new AdminService().deleteContent(Integer.parseInt(bno));
			}
		}
		
		String page = "";
		if ( result > 0 && type == 1 ) {
			request.getSession().setAttribute("msg", bnoArr.length + "건의 게시글 삭제처리가 성공하였습니다.");
			page = request.getContextPath()+"/adminBoard.do?currentPage="+currentPage;
		} else {
			request.setAttribute("msg", "게시글 처리 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
