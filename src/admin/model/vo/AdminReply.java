package admin.model.vo;

import java.sql.Timestamp;

public class AdminReply {

	private int cNo;
	private String cContent;
	private Timestamp cRegdate;
	private Timestamp cModidate;
	private String cWriterName;
	private String cStatusType;
	private int bNo;
	
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

	@Override
	public String toString() {
		return "AdminReply [cNo=" + cNo + ", cContent=" + cContent + ", cRegdate=" + cRegdate + ", cModidate="
				+ cModidate + ", cWriterName=" + cWriterName + ", cStatusType=" + cStatusType + ", bNo=" + bNo + "]";
	}
	
	
	
}
