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
import mobile.model.vo.MobileComment;

@WebServlet("/commentLoad.mo")
public class MobileCommentLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MobileCommentLoadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		ArrayList<MobileComment> mcList = new MobileService().selectCommList(mno);
		new Gson().toJson(mcList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
