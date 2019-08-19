package admin.model.vo;

import java.sql.Date;

public class AdminMember {
	
	private int userNo;
	private String userEmail;
	private String userName;
	private Date enrollDate;
	private Date modifyDate;
	private String userStatusType;
	
	public AdminMember() {}
	
	public AdminMember(int userNo, String userEmail, String userName, Date enrollDate, Date modifyDate,
			String userStatusType) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userName = userName;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.userStatusType = userStatusType;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public String getUserStatusType() {
		return userStatusType;
	}

	public void setUserStatusType(String userStatusType) {
		this.userStatusType = userStatusType;
	}

	@Override
	public String toString() {
		return "AdminMember [userNo=" + userNo + ", userEmail=" + userEmail + ", userName=" + userName + ", enrollDate="
				+ enrollDate + ", modifyDate=" + modifyDate + ", userStatusType=" + userStatusType + "]";
	}
	
	

}
