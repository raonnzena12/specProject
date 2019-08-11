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
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		String phone = "";
		int device = 0;
		
		Member member = null;
		if(request.getParameter("device") != null) {
			device = Integer.parseInt(request.getParameter("device"));
			phone = request.getParameter("phone");
			member = new Member(userEmail, userName, phone, 'Y', device);
			System.out.println(member.toString());
		} else {
			member = new Member(userEmail, userName, 'N');
			System.out.println(member.toString());
		}

		int result = new MemberService().updateMember(member);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
