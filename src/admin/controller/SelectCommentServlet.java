package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import admin.model.service.AdminService;
import admin.model.vo.AdminReply;

@WebServlet("/adminSelectComment.do")
public class SelectCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectCommentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<AdminReply> rList = new AdminService().selectComment();
		
		Gson gson = new GsonBuilder().setDateFormat("yy년 M월 dd일 HH:mm:ss").create();
		gson.toJson(rList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
