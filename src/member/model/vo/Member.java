package member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable { /**
// 해당 객체 자체를 DB에 저장하고 싶을 떄 직렬화를 해주어야 한다.
	 * 
	 */
	private static final long serialVersionUID = 6681603411878778107L; // 직렬화 해서 외부로 보낼 때 구분을 위해 ID를 지정해주어 버전관리를 해주어야 함.
	
	private int userNo;
	private String userEmail;
	private String userPwd;
	private String userName;
	private String phone;
	private Date enrollDate;
	private Date modifyDate;
	private String userEvent;
	private String userVerify;
	private int userStatus;
	private int userMno;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	
	// 로그인 용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userEmail = userId;
		this.userPwd = userPwd;
	}



	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, String userEvent, String userVerify, int userStatus, int userMno) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.userEvent = userEvent;
		this.userVerify = userVerify;
		this.userStatus = userStatus;
		this.userMno = userMno;
	}


	


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getUserEvent() {
		return userEvent;
	}


	public void setUserEvent(String userEvent) {
		this.userEvent = userEvent;
	}


	public String getUserVerify() {
		return userVerify;
	}


	public void setUserVerify(String userVerify) {
		this.userVerify = userVerify;
	}


	public int getUserStatus() {
		return userStatus;
	}


	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}


	public int getUserMno() {
		return userMno;
	}


	public void setUserMno(int userMno) {
		this.userMno = userMno;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userEmail=" + userEmail + ", userPwd=" + userPwd + ", userName="
				+ userName + ", phone=" + phone + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", userEvent=" + userEvent + ", userStatus=" + userStatus + ", userMno=" + userMno + "]";
	}

	
	
}
