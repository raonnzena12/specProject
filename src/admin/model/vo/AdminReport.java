package admin.model.vo;

import java.sql.Date;

public class AdminReport {
	private int rNo;
	private String rContent;
	private int rTableNo;
	private String rDate;
	private int rResult;
	private int rWriter;
	private int rUser;
	private int rRefNo;
	
	
	private String reRefCont;
	private String reRefContType;
	private String reStatusType;
	private String rWriter2;
	
	public AdminReport() {}

	public AdminReport(String rContent, int rTableNo, int rWriter, int rUser, int rRefNo) {
		super();
		this.rContent = rContent;
		this.rTableNo = rTableNo;
		this.rWriter = rWriter;
		this.rUser = rUser;
		this.rRefNo = rRefNo;
	}

	public AdminReport(int rNo, String rContent, int rTableNo, String rDate, int rResult, int rWriter, int rUser,
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
	
	

	/**
	 * 내가 쓴 신고 불러오는 생성자
	 * @param rNo
	 * @param rContent
	 * @param rDate
	 * @param rResult
	 * @param rWriter
	 * @param rUser
	 * @param refCont
	 * @param refType
	 */
	public AdminReport(int rNo, String rContent, String rDate, int rResult, int rWriter, int rUser, String reRefCont,
			String reRefContType) {
		super();
		this.rNo = rNo;
		this.rContent = rContent;
		this.rDate = rDate;
		this.rResult = rResult;
		this.rWriter = rWriter;
		this.rUser = rUser;
		this.reRefCont = reRefCont;
		this.reRefContType = reRefContType;
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

	public String getrDate() {
		return rDate;
	}

	public void setrDate(String rDate) {
		this.rDate = rDate;
	}

	public int getrResult() {
		return rResult;
	}

	public void setrResult(int rResult) {
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
	
	

	public int getrWriter() {
		return rWriter;
	}

	public void setrWriter(int rWriter) {
		this.rWriter = rWriter;
	}

	public String getReRefCont() {
		return reRefCont;
	}

	public void setReRefCont(String reRefCont) {
		this.reRefCont = reRefCont;
	}

	public String getReRefContType() {
		return reRefContType;
	}

	public void setReRefContType(String reRefContType) {
		this.reRefContType = reRefContType;
	}
	
	public String getReStatusType() {
		return reStatusType;
	}

	public void setReStatusType(String reStatusType) {
		this.reStatusType = reStatusType;
	}
	
	

	public String getrWriter2() {
		return rWriter2;
	}

	public void setrWriter2(String rWriter2) {
		this.rWriter2 = rWriter2;
	}

	@Override
	public String toString() {
		return "Report [rNo=" + rNo + ", rContent=" + rContent + ", rTableNo=" + rTableNo + ", rDate=" + rDate
				+ ", rResult=" + rResult + ", rWriter=" + rWriter + ", rUser=" + rUser + ", rRefNo=" + rRefNo + "]";
	}
}
