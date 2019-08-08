package board.model.vo;

import java.sql.Date;

public class BoardVo {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private int bCount;
	private Date bRegdate;
	private Date bModidate;
	private int bCode;
	private int bWriter;
	private int bStatus;
	
	
	public BoardVo() {
		// 기본 생성자
	}


	public BoardVo(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, Date bModidate, int bCode,
			int bWriter, int bStatus) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bModidate = bModidate;
		this.bCode = bCode;
		this.bWriter = bWriter;
		this.bStatus = bStatus;
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


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
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


	public int getbCode() {
		return bCode;
	}


	public void setbCode(int bCode) {
		this.bCode = bCode;
	}


	public int getbWriter() {
		return bWriter;
	}


	public void setbWriter(int bWriter) {
		this.bWriter = bWriter;
	}


	public int getbStatus() {
		return bStatus;
	}


	public void setbStatus(int bStatus) {
		this.bStatus = bStatus;
	}


	@Override
	public String toString() {
		return "BoardVo [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bCount=" + bCount
				+ ", bRegdate=" + bRegdate + ", bModidate=" + bModidate + ", bCode=" + bCode + ", bWriter=" + bWriter
				+ ", bStatus=" + bStatus + "]";
	}
	
	
	
	
	
}
