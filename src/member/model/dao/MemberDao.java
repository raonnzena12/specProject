package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		System.out.println(query);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getInt(1), 
						rset.getString(2), rset.getString(3),
						rset.getString(4), rset.getString(5), 
						rset.getDate(6), rset.getDate(7), 
						rset.getString(8).charAt(0), rset.getInt(9), 
						rset.getInt(10), rset.getInt(11));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int checkEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("emailCheck");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int checkName(Connection conn, String name) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("nameCheck");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query ="";
		
		try {
			if(member.getPhone() != null) {
				query = prop.getProperty("insertMember2");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,member.getUserEmail());
				pstmt.setString(2, member.getUserPwd());
				pstmt.setString(3,member.getUserName());
				pstmt.setString(4, member.getPhone());
				pstmt.setInt(5,member.getUserMno());
				pstmt.setString(6, member.getUserEmailHash());
				
				result = pstmt.executeUpdate();
			}else {
				query = prop.getProperty("insertMember1");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,member.getUserEmail());
				pstmt.setString(2, member.getUserPwd());
				pstmt.setString(3,member.getUserName());
				pstmt.setString(4, member.getUserEmailHash());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member selectMember(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("USER_EMAIL"), rset.getString("USER_PWD"), rset.getString("USER_NAME"), rset.getInt("USER_STATUS"), rset.getString("USER_EMAILHASH"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}

	public int updateVerify(Connection conn, String email) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = prop.getProperty("updateVerify");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
