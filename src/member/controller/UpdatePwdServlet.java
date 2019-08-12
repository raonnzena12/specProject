package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;


/**
 * 비밀번호 변경용 서블릿
 * @author user1
 *
 */
@WebServlet(urlPatterns="/updatePwd.me", name="UpdatePwdServlet")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String newPwd = request.getParameter("newPwd");
		
		MemberService mService = new MemberService();
		Member member = mService.selectMember2(loginUser.getUserEmail());
		
		
		int result = 0;
		if(member != null) {
			result = mService.updatePwd(loginUser.getUserEmail(), newPwd);
			System.out.println("비밀번호 변경 결과 : "+result);
			if(result > 0) {
				request.getSession().setAttribute("msg", "비밀번호가 변경되었습니다.");
				response.sendRedirect("mypage.me");
			} else {
				request.setAttribute("msg", "비밀번호 변경 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "회원정보 조회 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
