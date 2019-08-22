package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;

/**
 * 비밀번호를 체크하여 로그인 유저의 정보와 확인 후 일치하면 각각의 페이지로 전환시키는 서블릿
 * @author user1
 *
 */
@WebServlet(urlPatterns="/checkPwd.me", name="CheckPwdServlet")
public class CheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckPwdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkPwd = request.getParameter("checkPwd");
		String code = request.getParameter("code");
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String page = "";
		if(checkPwd.equals(loginUser.getUserPwd())) {
			/*page = "views/member/updateInfoForm.jsp";*/
			switch(code) {
			case "1":	response.sendRedirect("updateInfoForm.me"); break;
			case "2": response.sendRedirect("updatePwdForm.me?userNo=" + loginUser.getUserNo()); break;
			}
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
