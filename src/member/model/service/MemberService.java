package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;
import mobile.model.vo.Review;

public class MemberService {
	public MemberService() {
		// TODO Auto-generated constructor stub
	}

	public Member loginMember(Member member) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, member);
		
		return loginUser;
	}

	public int checkEmail(String email) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().checkEmail(conn, email);
		
		return result;
	}
	
	public int checkName(String name) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().checkName(conn, name);
		
		return result;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	/**
	 * 이메일인증 체크용 서비스
	 * @param userEmail
	 * @return
	 */
	public Member selectMember1(String userEmail) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember1(conn, userEmail);
		
		return member;
	}

	public int updateVerify(String email) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateVerify(conn, email);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Member selectMember2(String userEmail) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember2(conn, userEmail);
		
		return member;
	}

	public int updatePwd(String userEmail, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn,userEmail,newPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public int deleteMember(String userEmail) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userEmail);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int phoneCheck(String phone) {
		Connection conn = getConnection();
		
		int result = new MemberDao().phoneCheck(conn, phone);
		
		return result;
	}

	public String findEmail(String userName, String phone) {
		Connection conn = getConnection();
		
		String userEmail = new MemberDao().findEmail(conn, userName, phone);
		
		return userEmail;
	}

	/**
	 * 내가 신고한 개수 구하는 service
	 * @param userNo
	 * @return
	 */
	public int getMyReportCount(int userNo) {
		Connection conn = getConnection();
		
		int myReportCount = new MemberDao().getMyReportCount(conn, userNo);
		
		return myReportCount;
	}

	/**
	 * 내가 쓴 신고 불러오기 service
	 * @param currentPage
	 * @param limit
	 * @param userNo
	 * @return
	 */
	public ArrayList<Review> selectMyReport(int currentPage, int limit, int userNo) {
		return null;
	}
	
	
}
