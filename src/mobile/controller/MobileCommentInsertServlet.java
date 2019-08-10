package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.MobileComment;

@WebServlet("/commentInsert.mo")
public class MobileCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileCommentInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int refMoNo = Integer.parseInt(request.getParameter("mno"));
		int mcoWriter = Integer.parseInt(request.getParameter("writer"));
		String mcoContent = request.getParameter("commCon");
		mcoContent = mcoContent.replaceAll("\n", "<br>");
		
		MobileComment mc = new MobileComment(mcoContent, refMoNo, mcoWriter);
		int result = new MobileService().insertComment(mc);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
