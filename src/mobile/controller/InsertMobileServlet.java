package mobile.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertForm.mo")
public class InsertMobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertMobileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		if ( method.equalsIgnoreCase("GET") ) {
			RequestDispatcher view = request.getRequestDispatcher("/views/mobile/insertMobileForm.jsp");
			view.forward(request, response);
		} else {
			request.setCharacterEncoding("UTF-8");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
