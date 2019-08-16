package mobile.model.vo;

import java.sql.Timestamp;

public class MobileComment {
	private int mcoNo;
	private String mcoContent;
	private Timestamp mcoRegDate;
	private Timestamp mcoModiDate;
	private int refMoNo;
	private int mcoWriter;
	private String mcoWName;
	private int mcoStatus;
	private int mcoIreport;
	private int mcoReportCount;
	
	public MobileComment() {}
	
	public MobileComment(int mcoNo, String mcoContent) {
		super();
		this.mcoNo = mcoNo;
		this.mcoContent = mcoContent;
	}

	public MobileComment(String mcoContent, int refMoNo, int mcoWriter) {
		super();
		this.mcoContent = mcoContent;
		this.refMoNo = refMoNo;
		this.mcoWriter = mcoWriter;
	}

	public MobileComment(int mcoNo, String mcoContent, Timestamp mcoRegDate, int refMoNo, int mcoWriter,
			String mcoWName, int mcoStatus) {
		this(mcoContent, refMoNo, mcoWriter);
		this.mcoNo = mcoNo;
		this.mcoRegDate = mcoRegDate;
		this.mcoWriter = mcoWriter;
		this.mcoWName = mcoWName;
		this.mcoStatus = mcoStatus;
	}

	public MobileComment(int mcoNo, String mcoContent, Timestamp mcoRegDate, Timestamp mcoModiDate, int refMoNo,
			int mcoWriter, String mcoWName, int mcoStatus) {
		this(mcoNo, mcoContent, mcoRegDate, refMoNo, mcoWriter, mcoWName, mcoStatus);
		this.mcoModiDate = mcoModiDate;
	}
	
	public MobileComment(int mcoNo, String mcoContent, Timestamp mcoRegDate, Timestamp mcoModiDate, int refMoNo,
			int mcoWriter, String mcoWName, int mcoStatus, int mcoIreport, int mcoReportCount) {
		this(mcoNo, mcoContent, mcoRegDate, mcoModiDate, refMoNo, mcoWriter, mcoWName, mcoStatus);
		this.mcoIreport = mcoIreport;
		this.mcoReportCount = mcoReportCount;
	}

	public int getMcoNo() {
		return mcoNo;
	}

	public void setMcoNo(int mcoNo) {
		this.mcoNo = mcoNo;
	}

	public String getMcoContent() {
		return mcoContent;
	}

	public void setMcoContent(String mcoContent) {
		this.mcoContent = mcoContent;
	}

	public Timestamp getMcoRegDate() {
		return mcoRegDate;
	}

	public void setMcoRegDate(Timestamp mcoRegDate) {
		this.mcoRegDate = mcoRegDate;
	}

	public Timestamp getMcoModiDate() {
		return mcoModiDate;
	}

	public void setMcoModiDate(Timestamp mcoModiDate) {
		this.mcoModiDate = mcoModiDate;
	}

	public int getRefMoNo() {
		return refMoNo;
	}

	public void setRefMoNo(int refMoNo) {
		this.refMoNo = refMoNo;
	}

	public int getMcoWriter() {
		return mcoWriter;
	}

	public void setMcoWriter(int mcoWriter) {
		this.mcoWriter = mcoWriter;
	}

	public String getMcoWName() {
		return mcoWName;
	}

	public void setMcoWName(String mcoWName) {
		this.mcoWName = mcoWName;
	}

	public int getMcoStatus() {
		return mcoStatus;
	}

	public void setMcoStatus(int mcoStatus) {
		this.mcoStatus = mcoStatus;
	}
	
	public int getMcoIreport() {
		return mcoIreport;
	}

	public void setMcoIreport(int mcoIreport) {
		this.mcoIreport = mcoIreport;
	}

	public int getMcoReportCount() {
		return mcoReportCount;
	}

	public void setMcoReportCount(int mcoReportCount) {
		this.mcoReportCount = mcoReportCount;
	}

	@Override
	public String toString() {
		return mcoNo + " / " + mcoContent + " / " + mcoRegDate + " / " + mcoModiDate + " / " + refMoNo + " / "
				+ mcoWriter + " / " + mcoWName + " / " + mcoStatus;
	}
}
