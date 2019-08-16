package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import admin.model.service.AdminService;
import admin.model.vo.AdminMember;
import member.model.vo.Member;

@WebServlet("/adminSelectMember.do")
public class SelectMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String sort = request.getParameter("sort");
		int sortNum = Integer.parseInt("sortNum");
		
		ArrayList<AdminMember> mList = null;
		
		AdminService aService = new AdminService();
		
		if(sort == null) {
			mList = aService.selectMember();
			
			JSONObject map = new JSONObject();
			
			for(int i=0; i<mList.size(); i++) {
				map.put(i, mList.get(i));
			}
			
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(map, response.getWriter());
		}else {
			if(sort == "no") {
				
			}else if(sort == "title") {
				
			}else if(sort == "name") {
				
			}else if(sort == "status") {
				
			}else if(sort == "date") {
				
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
