package admin.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

@WebServlet("/reviewUpdate.ad")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int type = Integer.parseInt(request.getParameter("type"));
		String rno = request.getParameter("rno");
		String[] rnoArr = null;
		if ( rno != null ) rnoArr = rno.split("/");
		int result = 0;
		System.out.println(Arrays.toString(rnoArr));
		if ( rnoArr != null && rnoArr.length > 1 ) { // 여러글을 처리 요청할때
			result = new AdminService().updateReviews(type, rnoArr);
		} else { // 글 하나를 처리 요청할때
			result = new AdminService().updateReview(type, Integer.parseInt(rno));
		}
	
		System.out.println("Result : " + result);
		if ( result > 0 ) {
			request.getSession().setAttribute("msg", rnoArr.length + "건의 리뷰 처리가 성공하였습니다.");
			response.sendRedirect("adminReview.ad?currentPage="+currentPage);
		} else {
			request.setAttribute("msg", "게시글 처리 실패"); 
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
