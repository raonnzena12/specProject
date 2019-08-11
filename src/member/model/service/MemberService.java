package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

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

	public Member selectMember(String userEmail) {
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember(conn, userEmail);
		
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
	
	
}
