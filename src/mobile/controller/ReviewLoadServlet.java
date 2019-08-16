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
import mobile.model.vo.Review;

@WebServlet("/loadReview.mo")
public class ReviewLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewLoadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		ArrayList<Review> rList = null;
		
		if ( uno < 0 ) {
			rList = new MobileService().selectReviewList(mno);
		} else {
			rList = new MobileService().selectReviewListUser(mno, uno);
		}
		new Gson().toJson(rList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
