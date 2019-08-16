package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import mobile.model.service.MobileService;
import mobile.model.vo.Mobile;


/**
 * 회원가입 휴대폰 기종 검색 서블릿
 * @author user1
 *
 */
@WebServlet("/mobileSearch.me")
public class MobileSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileSearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String device = request.getParameter("device");
		
		ArrayList<Mobile> sList = new MobileService().joinFormSelectMobile(device);
		
		new Gson().toJson(sList, response.getWriter());
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
