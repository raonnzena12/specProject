package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;


@WebServlet(urlPatterns="/login.me", name="LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("userEmail");
		String userPwd = request.getParameter("userPwd");
		
		Member member = new Member(userEmail, userPwd);
		System.out.println(userPwd);
		Member loginUser = new MemberService().loginMember(member);
		if(loginUser != null) {
			if(loginUser.getUserStatus() == 1 || loginUser.getUserStatus() == 0) {
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(14400);
				
				session.setAttribute("loginUser", loginUser);
				
				response.sendRedirect(request.getContextPath());
			} else if(loginUser.getUserStatus() == 2) {
				request.setAttribute("msg", "정지된 회원입니다.");
				
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				
				view.forward(request, response);
			} else {
				request.setAttribute("msg", "탈퇴한 회원입니다.");
				
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				
				view.forward(request, response);
			}
			
		} else {
			
			request.setAttribute("msg", "존재하는 아이디를 찾을 수 없습니다.");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			view.forward(request, response);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
