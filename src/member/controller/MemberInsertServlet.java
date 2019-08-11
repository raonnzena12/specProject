package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;
import util.Gmail;
import util.SHA256;

@WebServlet(urlPatterns = "/insert.me", name="MemberInsertServlet")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		String pwd = request.getParameter("pwd");
		
		String phone = "";
		int device = 0;
		
		Member member = null;
		if(request.getParameter("device") != null) {
			device = Integer.parseInt(request.getParameter("device"));
			phone = request.getParameter("phone");
			member = new Member(userEmail, pwd, userName, phone, 'Y', device, new SHA256().getSHA256(userEmail));
			System.out.println(member.toString());
		} else {
			member = new Member(userEmail, pwd, userName, 'N', new SHA256().getSHA256(userEmail));
			System.out.println(member.toString());
		}

		int result = new MemberService().insertMember(member);
		
		String page = "";
		if(result > 0) {
			 String host = "http://localhost:8080/SpecProject/";
			 String from = "specprojectmanager@gmail.com";
			 String to = member.getUserEmail();
			 String subject = "SPEC 회원가입을 위한 이메일 확인 메일 입니다.";
			 String content = "다음 링크에 접속하여 이메일 확인을 진행하세요." +
					"<a href='" + host + "emailCheckAction.me?code=" + new SHA256().getSHA256(to) + "&email="+to +"'>이메일 인증하기</a>";

			// SMTP에 접속하기 위한 정보를 기입합니다.
			Properties p = new Properties();
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from, "SPEC");
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
			} catch (Exception e) {
				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다..');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
			request.setAttribute("msg", "이메일 주소 인증 메일이 전송되었습니다. 이메일에 들어가셔서 인증해주세요");
			page = "views/member/checkEmailVerify.jsp";
			
		 } else {
			request.setAttribute("msg", "회원가입 실패");
			page = "views/common/errorPage.jsp";
		 }
		 
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
