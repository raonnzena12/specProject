package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 비밀번호 입력폼 서블릿
 * @author user
 *
 */
@WebServlet("/inputPwdForm.me")
public class InputPwdFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InputPwdFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		request.setAttribute("code", code);
		request.getRequestDispatcher("views/member/inputPwdForm.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
