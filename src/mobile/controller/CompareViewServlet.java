package mobile.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mobile.model.service.MobileService;
import mobile.model.vo.CompareT;
import mobile.model.vo.Mobile;

@WebServlet("/compareSpec.mo")
public class CompareViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompareViewServlet() {
        super(); 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MobileService ms = new MobileService();
		int com1 = 0;
		int com2 = 0;
		if ( request.getParameter("mno") != null ) {
			int mno = Integer.parseInt(request.getParameter("mno"));
			CompareT ct = ms.selectCompareTable(mno);
			com1 = ct.getComDevice1();
			com2 = ct.getComDevice2();
		} else {
			com1 = Integer.parseInt(request.getParameter("com1"));
			com2 = Integer.parseInt(request.getParameter("com2"));
		}
		if ( com1 > com2 ) { // com1과 com2를 오름차순으로 정렬한다
			int tmp = com1;
			com1 = com2;
			com2 = tmp;
		}
		
		CompareT compare = ms.checkCompareTable(com1, com2);
		int resultU = 0;
		// 해당 조합의 비교가 테이블에 있는지 확인
		if ( compare != null ) { // 있다면 조회수를 1 상승시킴
			resultU = ms.updateCompareCount(com1, com2);
		} else { // 없다면 테이블에 비교조합을 추가함
			resultU = ms.insertCompareTable(com1, com2);
			compare = ms.checkCompareTable(com1, com2);
		}
		
		String page = "views/common/errorPage.jsp";
		if ( resultU == 0 ) {
			request.setAttribute("msg", "compare 테이블 에러");
			request.getRequestDispatcher(page).forward(request, response);
			return;
		} 
		
		Mobile device1 = ms.selectMobile(com1);
		Mobile device2 = ms.selectMobile(com2);
		int result1 = ms.countUpMobile(com1);
		int result2 = ms.countUpMobile(com2);
		
		request.setAttribute("device1", device1);
		request.setAttribute("device2", device2);
		request.setAttribute("compare", compare);
		
		if ( device1 != null && device2 != null ) {
			page = "views/mobile/mobileCompareResult.jsp";
		} else {
			request.setAttribute("msg", "디바이스 조회 에러");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
