package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import util.SHA256;


@WebServlet("/update.me")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UpdateMember() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		String phone = "";
		int device = 0;
		
		Member member = null;
		if(request.getParameter("device") == null && (userName.equals("") || userName.equals(loginUser.getUserName()))) {
			
			member = new Member(userEmail, loginUser.getUserName(), 'N');
			
		}else if(request.getParameter("device") != null && (userName.equals("") || userName.equals(loginUser.getUserName()))) {
			
			device = Integer.parseInt(request.getParameter("device"));
			phone = request.getParameter("phone");
			member = new Member(userEmail, loginUser.getUserName(), phone, 'Y', device);
			
		} else if(request.getParameter("device") != null && (!userName.equals("") || !userName.equals(loginUser.getUserName()))) {
			
			device = Integer.parseInt(request.getParameter("device"));
			phone = request.getParameter("phone");
			member = new Member(userEmail, userName, phone, 'Y', device);
			
		}else {
			
			member = new Member(userEmail, userName, 'N');
		}

		int result = new MemberService().updateMember(member);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "성공적으로 수정되었습니다!");
			response.sendRedirect("mypage.me");
		}else {
			request.setAttribute("msg", "회원정보 수정 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
