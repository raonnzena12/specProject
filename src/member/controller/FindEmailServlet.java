package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

@WebServlet("/findEmail.me")
public class FindEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindEmailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		String userEmail = new MemberService().findEmail(userName,phone);
		
		if(userEmail == "") {
			request.setAttribute("msg", "이메일을 찾을 수 없습니다.");
		} else {
			request.setAttribute("msg", "가입된 이메일은 " + userEmail + " 입니다." );
		}
		
		request.getRequestDispatcher("views/member/checkEmailVerify.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
