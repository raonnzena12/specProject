package board.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Reply {
	
	private int cNo;
	private String cContent;
	private Timestamp cRegdate;
	private Timestamp cModidate;
	private int cWriter;
	private String bcWriter;
	private int cStatus;
	private int bNo;
	private int cCount;
	private int cReport;
	
	private int rRnum;
	private String cRegdate2;
	private String cModidate2;
	private int refNo;
	private int cTableNo;
	private String refCont;
	private String refContType;
	
	
	public Reply() {
		super();
		
	}
	
	
	public Reply(int cNo, String cContent, Timestamp cRegdate, int cWriter, String bcWriter, int cStatus, int bNo, int cReport) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cWriter = cWriter;
		this.bcWriter = bcWriter;
		this.cStatus = cStatus;
		this.bNo = bNo;
		this.cReport = cReport;
	}
	
	public Reply(int cNo, String cContent, Timestamp cRegdate, int cWriter, String bcWriter, int cStatus, int bNo) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cWriter = cWriter;
		this.bcWriter = bcWriter;
		this.cStatus = cStatus;
		this.bNo = bNo;
		
	}


	public Reply(int cNo, String cContent, Timestamp cRegdate, int cWriter, String bcWriter, int bNo) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cWriter = cWriter;
		this.bcWriter = bcWriter;
		this.bNo = bNo;
	}
	


	public Reply(int cNo, String cContent, Timestamp cRegdate, Timestamp cModidate, int cWriter, String bcWriter,
			int cStatus, int bNo, int cCount, int cReport) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.cRegdate = cRegdate;
		this.cModidate = cModidate;
		this.cWriter = cWriter;
		this.bcWriter = bcWriter;
		this.cStatus = cStatus;
		this.bNo = bNo;
		this.cCount = cCount;
		this.cReport = cReport;
		
	}


	public Reply(String cContent, int cWriter, int bNo) {
		super();
		this.cContent = cContent;
		this.cWriter = cWriter;
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


	public int getcWriter() {
		return cWriter;
	}


	public void setcWriter(int cWriter) {
		this.cWriter = cWriter;
	}


	public String getBcWriter() {
		return bcWriter;
	}


	public void setBcWriter(String bcWriter) {
		this.bcWriter = bcWriter;
	}


	public int getcStatus() {
		return cStatus;
	}


	public void setcStatus(int cStatus) {
		this.cStatus = cStatus;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getcCount() {
		return cCount;
	}


	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	
	


	public int getrRnum() {
		return rRnum;
	}


	public void setrRnum(int rRnum) {
		this.rRnum = rRnum;
	}


	public String getcRegdate2() {
		return cRegdate2;
	}


	public void setcRegdate2(String cRegdate2) {
		this.cRegdate2 = cRegdate2;
	}


	public String getcModidate2() {
		return cModidate2;
	}


	public void setcModidate2(String cModidate2) {
		this.cModidate2 = cModidate2;
	}


	public int getRefNo() {
		return refNo;
	}


	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}


	public int getcTableNo() {
		return cTableNo;
	}


	public void setcTableNo(int cTableNo) {
		this.cTableNo = cTableNo;
	}

	

	public String getRefCont() {
		return refCont;
	}


	public void setRefCont(String refCont) {
		this.refCont = refCont;
	}


	public String getRefContType() {
		return refContType;
	}


	public void setRefContType(String refContType) {
		this.refContType = refContType;
	public int getcReport() {
		return cReport;
	}


	public void setcReport(int cReport) {
		this.cReport = cReport;
	}


	@Override
	public String toString() {
		return "Reply [cNo=" + cNo + ", cContent=" + cContent + ", cRegdate=" + cRegdate + ", cModidate=" + cModidate
				+ ", cWriter=" + cWriter + ", bcWriter=" + bcWriter + ", cStatus=" + cStatus + ", bNo=" + bNo
				+ ", cCount=" + cCount + ", cReport=" + cReport + "]";
	}


	
	
	
	

	

	
	
	
	

}
