package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Member;
import mobile.model.vo.Report;

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
	
	/**
	 * login dao
	 * @param conn
	 * @param member
	 * @return
	 */
	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserEmail());
			pstmt.setString(2, member.getUserPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setUserNo(rset.getInt("USER_NO"));
				loginUser.setUserEmail(rset.getString("USER_EMAIL"));
				loginUser.setUserPwd(rset.getString("USER_PWD"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setPhone(rset.getString("USER_PHONE"));
				loginUser.setEnrollDate(rset.getDate("USER_ENDATE"));
				loginUser.setModifyDate(rset.getDate("USER_MDDATE"));
				loginUser.setUserEvent(rset.getString("USER_EVENT").charAt(0));
				loginUser.setUserMno(rset.getInt("USER_MNO"));
				loginUser.setUserDevice(rset.getString("MO_NAME_EN"));
				loginUser.setUserStatus(rset.getInt("USER_STATUS"));
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

	/**
	 * 이메일 중복 검사
	 * @param conn
	 * @param email
	 * @return
	 */
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
	
	/**
	 * 이름 중복 검사 dao
	 * @param conn
	 * @param name
	 * @return
	 */
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

	/**
	 * 회원가입 dao
	 * @param conn
	 * @param member
	 * @return
	 */
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
				pstmt.setString(7, member.getUserDevice());
				
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

	/**
	 * 이메일 인증 완료 전 회원 존재여부 체크용(해쉬값 가져와야 함) DAO
	 * @param conn
	 * @param userEmail
	 * @return
	 */
	public Member selectMember1(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member member = null;
		
		String query = prop.getProperty("selectMember1");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("USER_EMAIL"), 
						rset.getString("USER_PWD"), 
						rset.getString("USER_NAME"), 
						rset.getInt("USER_STATUS"), 
						rset.getString("USER_EMAILHASH"));
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

	/**
	 * 이메일 인증 dao
	 * @param conn
	 * @param email
	 * @return
	 */
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

	// 회원정보 수정 dao
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query ="";
		
		try {
			if(member.getUserEvent() != 'N') {
				query = prop.getProperty("updateMember2");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,member.getUserName());
				pstmt.setString(2, member.getPhone());
				pstmt.setString(3, member.getUserEvent()+"");
				pstmt.setInt(4,member.getUserMno());
				pstmt.setString(5, member.getUserEmail());
				
				result = pstmt.executeUpdate();
			}else {
				query = prop.getProperty("updateMember1");
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1,member.getUserName());
				pstmt.setString(2, member.getUserEvent()+"");
				pstmt.setString(3, member.getUserEmail());
				
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

	/**
	 * 마이페이지 정보 조회용 dao
	 * @param conn
	 * @param userEmail
	 * @return
	 */
	public Member selectMember2(Connection conn, String userEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Member member = null;
		
		String query = prop.getProperty("selectMember2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,userEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getInt("USER_NO"), 
						rset.getString("USER_EMAIL"), 
						rset.getString("USER_PWD"), 
						rset.getString("USER_NAME"), 
						rset.getString("USER_PHONE"), 
						rset.getDate("USER_ENDATE"), 
						rset.getDate("USER_MDDATE"), 
						rset.getString("USER_EVENT").charAt(0), 
						rset.getInt("USER_VERIFY"), 
						rset.getInt("USER_STATUS"), 
						rset.getString("MO_NAME_EN"),
						rset.getString("MI_FRONTNAME"),
						rset.getString("MO_CODE"));
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

	/**
	 * 비밀번호 변경 용 dao
	 * @param conn
	 * @param userEmail
	 * @param newPwd
	 * @return
	 */
	public int updatePwd(Connection conn, String userEmail, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userEmail);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String userEmail) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userEmail);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int phoneCheck(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("phoneCheck");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
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

	public String findEmail(Connection conn, String userName, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String userEmail = "";
		
		String query = prop.getProperty("findEmail");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,userName);
			pstmt.setString(2, phone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userEmail = rset.getString(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userEmail;
	}

	/**
	 * 내가 신고한 개수 구하는 dao
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int getMyReportCount(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("getMyReportCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	    return result;
	}

	/**
	 * 내가 신고한 목록 불러오는 dao
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @param userNo
	 * @return
	 */
	public ArrayList<Report> selectMyReport(Connection conn, int currentPage, int limit, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Report> rpList = null;
		
		String query = prop.getProperty("selectMyReport");
		
		try {
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			rpList = new ArrayList<Report>();
			while(rset.next()) {
				rpList.add(new Report(rset.getInt("REPORT_NO"), 
						rset.getString("REPORT_CONT"), 
						rset.getString("REPORT_DATE"), 
						rset.getInt("REPORT_RESULT"), 
						rset.getInt("REPORT_WRI"), 
						rset.getInt("REPORT_USER"), 
						rset.getString("REPORT_REF_CONT"), 
						rset.getString("REPORT_CON_TYPE")));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rpList;
	}
}
