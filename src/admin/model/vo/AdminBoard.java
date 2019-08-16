package admin.model.vo;

import java.sql.Date;

public class AdminBoard {
	
	private int bNo;
	private String bTitle;
	private int bCount;
	private Date bRegdate;
	private Date bModidate;
	private String bStatusType;
	private String userName;
	
	public AdminBoard() {}
	
	

	public AdminBoard(int bNo, String bTitle, int bCount, Date bRegdate, Date bModidate, String bStatusType,
			String userName) {
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bModidate = bModidate;
		this.bStatusType = bStatusType;
		this.userName = userName;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public Date getbRegdate() {
		return bRegdate;
	}

	public void setbRegdate(Date bRegdate) {
		this.bRegdate = bRegdate;
	}

	public Date getbModidate() {
		return bModidate;
	}

	public void setbModidate(Date bModidate) {
		this.bModidate = bModidate;
	}

	public String getbStatusType() {
		return bStatusType;
	}

	public void setbStatusType(String bStatusType) {
		this.bStatusType = bStatusType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "AdminBoard [bNo=" + bNo + ", bTitle=" + bTitle + ", bCount=" + bCount + ", bRegdate=" + bRegdate
				+ ", bModidate=" + bModidate + ", bStatusType=" + bStatusType + ", userName=" + userName + "]";
	}
	
	
}