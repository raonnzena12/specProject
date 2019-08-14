package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Reply;


@WebServlet("/selectReply.bo")
public class ReplySelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReplySelectServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		ArrayList<Reply> rList = new BoardService().selectReply(bno);
		
		
		Gson gson = new GsonBuilder().setDateFormat("yy년 MM월 dd일 HH:mm:ss").create();
		gson.toJson(rList, response.getWriter());
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
