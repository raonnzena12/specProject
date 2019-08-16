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

import admin.model.dao.AdminDao;
import admin.model.service.AdminService;
import admin.model.vo.AdminBoard;
import board.model.vo.Board;

@WebServlet("/adminSelectBoard.do")
public class SelectBaordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectBaordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		ArrayList<AdminBoard> bList = new AdminService().selectBoard();
		
		JSONObject map = new JSONObject();
		
		for(int i=0; i<bList.size(); i++) {
			map.put(i, bList.get(i));
		}
		
		new Gson().toJson(map, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
