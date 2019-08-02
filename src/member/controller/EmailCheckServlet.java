package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;


@WebServlet("/emailCheck.me")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmailCheckServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		int result = new MemberService().emailCheck(email);
		
		System.out.println(result);
		
		PrintWriter out = response.getWriter();
		boolean check = false;
		if(result > 0) {
			check = true;
		} else {
			check = false;
		}
		
		out.print(check);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
