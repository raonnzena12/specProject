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

/**
 * 회원탈퇴 서블릿
 * @author user1
 *
 */
@WebServlet(urlPatterns="/delete.me", name="DeleteMemberServlet")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = ((Member)request.getSession().getAttribute("loginUser")).getUserEmail();
		
		String pwd = request.getParameter("pwd");
		
		System.out.println(userEmail);
		System.out.println(pwd);
		Member member = new Member(userEmail, pwd);
		MemberService mService = new MemberService();
		Member loginMember = mService.loginMember(member);
		System.out.println(loginMember);
		int result = 0;
		if(loginMember != null) {
			result = mService.deleteMember(userEmail);
			
			System.out.println(result);
			if(result > 0) {
				HttpSession session = request.getSession(false);
				if(session != null) {
					session.removeAttribute("loginUser");
				}
				
				session.setAttribute("msg", "회원 탈퇴가 완료되었습니다. 복구 관련 사항은 관리자에게 문의주세요.");
				response.sendRedirect(request.getContextPath());
			} else {
				request.setAttribute("msg", "회원 탈퇴에 실패했습니다");
				RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
				view.forward(request, response);
			}
			
		} else {
			request.setAttribute("msg", "회원정보를 찾지 못했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
