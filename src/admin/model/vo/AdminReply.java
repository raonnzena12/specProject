package admin.model.vo;

import java.sql.Timestamp;

public class AdminReply {

	private int cNo;
	private String cContent;
	private Timestamp cRegdate;
	private Timestamp cModidate;
	private int bNo;
	private int cWriterNo;
	private int cStatusCode;
	private String cStatusType;
	private int cRefTableNo;
	private String cWriterName;
	
	public AdminReply() {}

	public AdminReply(int cNo, String cContent, Timestamp cRegdate, Timestamp cModidate, String cWriterName,
			String cStatusType, int bNo) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cModidate = cModidate;
		this.cWriterName = cWriterName;
		this.cStatusType = cStatusType;
		this.bNo = bNo;
	}
	
	public AdminReply(int cNo, String cContent, Timestamp cRegdate, Timestamp cModidate, int bNo, int cWriterNo,
			String cStatusType, int cRefTableNo, String cWriterName) {
		this(cNo, cContent, cRegdate, cModidate, cWriterName, cStatusType, bNo);
		this.cWriterNo = cWriterNo;
		this.cRefTableNo = cRefTableNo;
	}

	public AdminReply(int cNo, String cContent, Timestamp cRegdate, Timestamp cModidate, int bNo, int cWriterNo,
			int cStatusCode, int cRefTableNo, String cWriterName) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cModidate = cModidate;
		this.bNo = bNo;
		this.cWriterNo = cWriterNo;
		this.cStatusCode = cStatusCode;
		this.cRefTableNo = cRefTableNo;
		this.cWriterName = cWriterName;
	}

	public int getcWriterNo() {
		return cWriterNo;
	}

	public void setcWriterNo(int cWriterNo) {
		this.cWriterNo = cWriterNo;
	}

	public int getcRefTableNo() {
		return cRefTableNo;
	}

	public void setcRefTableNo(int cRefTableNo) {
		this.cRefTableNo = cRefTableNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Timestamp getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(Timestamp cRegdate) {
		this.cRegdate = cRegdate;
	}

	public Timestamp getcModidate() {
		return cModidate;
	}

	public void setcModidate(Timestamp cModidate) {
		this.cModidate = cModidate;
	}

	public String getcWriterName() {
		return cWriterName;
	}

	public void setcWriterName(String cWriterName) {
		this.cWriterName = cWriterName;
	}

	public String getcStatusType() {
		return cStatusType;
	}

	public void setcStatusType(String cStatusType) {
		this.cStatusType = cStatusType;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getcStatusCode() {
		return cStatusCode;
	}

	public void setcStatusCode(int cStatusCode) {
		this.cStatusCode = cStatusCode;
	}

	@Override
	public String toString() {
		return "AdminReply [cNo=" + cNo + ", cContent=" + cContent + ", cRegdate=" + cRegdate + ", cModidate="
				+ cModidate + ", cWriterName=" + cWriterName + ", cStatusType=" + cStatusType + ", bNo=" + bNo + "]";
	}
	
	
	
}
