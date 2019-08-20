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
	private char userEvent;
	private int userVerify;
	private int userStatus;
	private int userMno;
	private String userEmailHash;
	private String userDevice;
	private String miFrontName;	
	private String miProductName;


	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	
	// 로그인 용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userEmail = userId;
		this.userPwd = userPwd;
	}


	// 정보 수정용 생성자(이벤트 활용 동의 체크 ㄴ)
	public Member(String userEmail, String userName, char userEvent) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
		this.userEvent = userEvent;
	}
	
	

	// 회원가입용 insertMember1용 생성자
	public Member(String userEmail, String userPwd, String userName, char userEvent, String userEmailHash) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userEvent = userEvent;
		this.userEmailHash = userEmailHash;
	}
	
	

	// 회원가입용 insertMember2용 생성자
	public Member(String userEmail, String userPwd, String userName, String phone, char userEvent, int userMno,
			String userEmailHash, String userDevice) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.userEvent = userEvent;
		this.userMno = userMno;
		this.userEmailHash = userEmailHash;
		this.userDevice = userDevice;
	}


	// 이메일 인증 체크용 생성자
	public Member(String userEmail, String userPwd, String userName, int userStatus, String userEmailHash) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userStatus= userStatus;
		this.userEmailHash = userEmailHash;
	}

	public Member(String userEmail, String userPwd, String userName, String phone, char userEvent, int userMno,
			String userEmailHash) {
		super();
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.userEvent = userEvent;
		this.userMno = userMno;
		this.userEmailHash = userEmailHash;
	}


	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, char userEvent, int userVerify, int userStatus, int userMno) {
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


	


	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, char userEvent, int userVerify, int userStatus, String userDevice) {
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
		this.userDevice = userDevice;
	}
	
	// 마이페이지용 생성자
	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, char userEvent, int userVerify, int userStatus, String userDevice, String miFrontName, String miProductName) {
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
		this.userDevice = userDevice;
		this.miFrontName = miFrontName;
		this.miProductName = miProductName;
	}

	
	/**
	 * updateMember 용 생성자
	 * @param userEmail
	 * @param userName
	 * @param phone
	 * @param userEvent
	 * @param userMno
	 */
	public Member(String userEmail, String userName, String phone, char userEvent, int userMno) {
		super();
		this.userEmail = userEmail;
		this.userName = userName;
		this.phone = phone;
		this.userEvent = userEvent;
		this.userMno = userMno;
	}


	// 로그인 생성자
	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, char userEvent,  int userMno, String userDevice) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.userEvent = userEvent;
		this.userMno = userMno;
		this.userDevice = userDevice;
	}


	public Member(int userNo, String userEmail, String userPwd, String userName, String phone, Date enrollDate,
			Date modifyDate, char userEvent, int userVerify, int userStatus, int userMno, String userEmailHash) {
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
		this.userEmailHash = userEmailHash;
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


	public char getUserEvent() {
		return userEvent;
	}


	public void setUserEvent(char userEvent) {
		this.userEvent = userEvent;
	}


	public int getUserVerify() {
		return userVerify;
	}


	public void setUserVerify(int userVerify) {
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


	public String getUserEmailHash() {
		return userEmailHash;
	}


	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}

	
	// user device 기종 이름
	public String getUserDevice() {
		return userDevice;
	}


	public void setUserDevice(String userDevice) {
		this.userDevice = userDevice;
	}

	
	// 기종 제품 명
	public String getMiProductName() {
		return miProductName;
	}


	public void setMiProductName(String miProductName) {
		this.miProductName = miProductName;
	}


	public String getMiFrontName() {
		return miFrontName;
	}


	public void setMiFrontName(String miFrontName) {
		this.miFrontName = miFrontName;
	}
	
	


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userEmail=" + userEmail + ", userPwd=" + userPwd + ", userName="
				+ userName + ", phone=" + phone + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
				+ ", userEvent=" + userEvent + ", userVerify=" + userVerify + ", userStatus=" + userStatus
				+ ", userMno=" + userMno + ", userEmailHash=" + userEmailHash + "]";
	}


	
}
