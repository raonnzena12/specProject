package member.model.service;

import static common.JDBCTemplate.getConnection;

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

	public int emailCheck(String email) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().checkEmail(conn, email);
		
		return result;
	}
	
	
}
