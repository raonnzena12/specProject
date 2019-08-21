package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.AdminService;

@WebServlet("/adminUpdateMember.do")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("------------------- updateMemberServlet ------------------");
		
		request.setCharacterEncoding("UTF-8");
		
		String status = request.getParameter("status");
		int mno = Integer.parseInt(request.getParameter("mno"));
		int statusNum;
		
		if(status.contains("genera")) {
			statusNum = 1;
		}else if(status.contains("suspend")) {
			statusNum = 2;
		}else if(status.contains("delete")) {
			statusNum = 3;
		}else {
			statusNum = 100;
		}
		System.out.println("statusNum : " + statusNum);
		System.out.println("mno : " + mno);
		int result = new AdminService().updateMemberStatus(mno, statusNum);
		
		response.getWriter().print(result);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
