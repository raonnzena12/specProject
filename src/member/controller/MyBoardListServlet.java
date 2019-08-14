package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.ws.api.message.Attachment;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardPageInfo;
import member.model.vo.Member;


@WebServlet("/myBoardList.me")
public class MyBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyBoardListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		String page = "";
		if(loginUser != null) {
			System.out.println("로그인 유저 번호 : " + loginUser.getUserNo());
			
			
			BoardService bService = new BoardService();
	    	
	    	// --------------------- 페이징 처리 -------------------------
	    	// 전체 게시글 수 구하기
	    	int myBoardCount = bService.getMyBoardCount(loginUser.getUserNo());
	    	
	    	// 페이징 처리용 변수 선언
	    	int limit = 10;			// 한 페이지에 보여질 게시글 수        
	    	int pagingBarSize = 10; // 보여질 페이징 바의 페이지 개수
	    	
	    	int currentPage = 0;	// 현재 페이지 번호를 표시할 변수
	    	int maxPage = 0;		// 전체 페이지에서 가장 마지막 페이지
	    	int startPage = 0;		// 페이징 바 시작 페이지
	    	int endPage = 0;		// 페이징 바 끝 페이지 번호
	    	
	    	// currentPage - 현재 페이지 번호를 표시할 변수
	    	if(request.getParameter("currentPage") == null) {
	    		// 처음 게시판 목록으로 화면 전환 시 1페이지가 보이도록 함.
	    		currentPage = 1;
	    	} else {
	    		// 아닌 경우, 현재 currentPage 값을 전달 받음
	    		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	    	}
	    	
	    	// maxPage - 총 페이지 수
	    	// 게시글의 개수가 100개 일 경우 필요 페이지 : 10페이지
	    	// 게시글의 개수가 101개 일 경우 필요 페이지 : 11페이지
	    	// 전체 개시글 수 / 한 페이지에 보여질 수 있는 게시글 개수
	    	// 위 결과를 올림 처리 함. (ex. 101 / 10 -> 10.1 이면 11 페이지로 계산
	    	maxPage = 	(int)Math.ceil((double)myBoardCount / limit) ;
	    	
	    	System.out.println("max p : " + maxPage);
	    	// startPage - 페이징 바 시작 페이지 번호
	    	// 페이징 바에 숫자가 10개 씩 표시되는 경우
	    	// 1, 11, 21, 31, ...
	    	startPage = ((currentPage - 1) / limit) * pagingBarSize + 1;
	    	
	    	// endPage - 페이징 바 끝 페이지 번호
	    	// 페이징 바에 숫자가 10개 씩 표시되는 경우
	    	// 10, 20, 30, 40, ....
	    	endPage = startPage + pagingBarSize - 1;
	    	
	    	if(maxPage <= endPage) {
	    		endPage = maxPage;
	    	}
	    	System.out.println("start" +startPage);
	    	System.out.println("end" + endPage);
	    	BoardPageInfo bpi = new BoardPageInfo(myBoardCount, limit, pagingBarSize, currentPage, maxPage, startPage, endPage);
	    	
	    	// --------------------------- 페이징 바 처리 끝 -----------------------------------
	    	
	    	// -------------- 게시글 목록 조회 시작 ------------------
	    	// 전체 목록을 가져오는게 아니라 해당페이지의 게시글 목록을 가져옴
	    	ArrayList<Board> mList = bService.selectMyBoard(currentPage, limit, loginUser.getUserNo()); 
	    	
	    	// ----------- 섬네일 목록 조회 --------------
	    	//ArrayList<Attachment> fList = bService.selectFlist(currentPage, limit);
	    	
	    	// 게시글 목록 조회 결과에 따른 view 연결 처리
	    	
	    	if(mList != null) {
	    		page = "views/member/myBoardListView.jsp";
	    		request.setAttribute("mList", mList);
	    		request.setAttribute("bpi", bpi);
	    		System.out.println(mList.size());
	    		//request.setAttribute("fList", fList);
	    	} else {
	    		page = "views/common/errorPage.jsp";
	    		request.setAttribute("msg", "게시판 목록 조회 실패");
	    	}
			
			
			
		} else {
			request.setAttribute("msg", "로그인해주세요!");
			page = "views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
