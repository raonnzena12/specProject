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

@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		int device = Integer.parseInt(request.getParameter("device"));
		
		Member member = null;
		if(phone.equals("") || device == 0) {
			member = new Member(userEmail, pwd, userName, 'N', new SHA256().getSHA256(userEmail));
		}else {
			member = new Member(userEmail, pwd, userName, phone, 'Y', device, new SHA256().getSHA256(userEmail));
		}
	
		int result = new MemberService().insertMember(member);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
