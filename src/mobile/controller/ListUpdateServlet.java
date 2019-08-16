package mobile.controller;

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

@WebServlet("/listUpdate.mo")
public class ListUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListUpdateServlet() { 
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		String qString = request.getParameter("qString");
		
		ArrayList<Mobile> list = null;
		if ( qString != null && qString.trim().length() != 0 ) {
			String[] queryArr = qString.split(","); 
			ArrayList<String[]> queryList = new ArrayList<String[]>();
			for ( int i = 0 ; i < queryArr.length ; i++ ) {
				queryList.add(queryArr[i].split(":"));
			}
			list = new MobileService().filterList(currentPage, limit , queryList);
			
		} else {
			// === === === 게시글 목록 조회 시작 === === ===
			list = new MobileService().selectList(currentPage, limit);
		}
		
//		ArrayList<Mobile> list = new MobileService().selectList(currentPage, limit);
//		
		new Gson().toJson(list, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
