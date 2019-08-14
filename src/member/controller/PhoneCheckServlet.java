package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 *  핸드폰 번호 존재 여부 검사 서블릿
 * @author user1
 *
 */
@WebServlet("/phoneCheck.me")
public class PhoneCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PhoneCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		
		int result = new MemberService().phoneCheck(phone);
		System.out.println(result);
		
		PrintWriter out = response.getWriter();
		
		out.print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
