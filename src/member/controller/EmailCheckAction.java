package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

@WebServlet("/emailCheckAction.me")
public class EmailCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EmailCheckAction() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String email = request.getParameter("email");
		MemberService mService = new MemberService();
		
		Member member = mService.selectMember(email);
		
		int result = 0;
		String page = "";
		if(member != null) {
			if(member.getUserEmailHash().equals(code)) {
				result = mService.updateVerify(email);
				
				if(result > 0) {
					request.setAttribute("msg", "이메일 인증이 완료되었습니다.");
					page = "views/member/checkEmailVerify.jsp";

				} else {
					request.setAttribute("msg", "이메일 인증이 실패하였습니다.");
					page = "views/common/errorPage";
				}
			} else {
				request.setAttribute("msg", "유효하지 않은 코드입니다.");
				page = "views/common/errorPage";
			}
		} else {
			request.setAttribute("msg", "이메일이 잘못되었습니다.");
			page = "views/common/errorPage.jsp";
		}
		
		System.out.println(email);
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
