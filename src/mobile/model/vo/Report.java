package mobile.model.vo;

import java.sql.Date;

public class Report {
	int rNo;
	String rContent;
	int rTableNo;
	Date rDate;
	String rResult;
	int rWriter;
	int rUser;
	int rRefNo;
		
	public Report() {}

	public Report(String rContent, int rTableNo, int rWriter, int rUser, int rRefNo) {
		super();
		this.rContent = rContent;
		this.rTableNo = rTableNo;
		this.rWriter = rWriter;
		this.rUser = rUser;
		this.rRefNo = rRefNo;
	}

	public Report(int rNo, String rContent, int rTableNo, Date rDate, String rResult, int rWriter, int rUser,
			int rRefNo) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rTableNo = rTableNo;
		this.rDate = rDate;
		this.rResult = rResult;
		this.rWriter = rWriter;
		this.rUser = rUser;
		this.rRefNo = rRefNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrTableNo() {
		return rTableNo;
	}

	public void setrTableNo(int rTableNo) {
		this.rTableNo = rTableNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getrResult() {
		return rResult;
	}

	public void setrResult(String rResult) {
		this.rResult = rResult;
	}

	public int getrWritter() {
		return rWriter;
	}

	public void setrWritter(int rWriter) {
		this.rWriter = rWriter;
	}

	public int getrUser() {
		return rUser;
	}

	public void setrUser(int rUser) {
		this.rUser = rUser;
	}

	public int getrRefNo() {
		return rRefNo;
	}

	public void setrRefNo(int rRefNo) {
		this.rRefNo = rRefNo;
	}

	@Override
	public String toString() {
		return "Report [rNo=" + rNo + ", rContent=" + rContent + ", rTableNo=" + rTableNo + ", rDate=" + rDate
				+ ", rResult=" + rResult + ", rWriter=" + rWriter + ", rUser=" + rUser + ", rRefNo=" + rRefNo + "]";
	}
}
