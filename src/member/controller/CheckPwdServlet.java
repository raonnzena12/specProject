package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

@WebServlet(urlPatterns="/checkPwd.me", name="CheckPwdServlet")
public class CheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckPwdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkPwd = request.getParameter("checkPwd");
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println(loginUser.toString());
		String page = "";
		if(checkPwd.equals(loginUser.getUserPwd())) {
			/*page = "views/member/updateInfoForm.jsp";*/
			response.sendRedirect("updateInfoForm.me");
		} else {
			
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다");
			page = "views/member/inputPwdForm.jsp";
			
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
