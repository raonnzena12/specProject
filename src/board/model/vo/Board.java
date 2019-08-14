package board.model.vo;

import java.sql.Date;

public class Board {
	
	private int bNo;
	private String bTitle;
	private String bContent;
	private int bCount;
	private Date bRegdate;
	private Date bModidate;
	private int bCode;
	private String bType;
	private int bWriter;
	private int bStatus;
	private int bCategory;
	private String cgCategory;
	
	
	public Board() {
		// 기본 생성자
	}
	

	


	public Board(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, int bCode, String bType,
			int bWriter, int bCategory, String cgCategory) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bCode = bCode;
		this.bType = bType;
		this.bWriter = bWriter;
		this.bCategory = bCategory;
		this.cgCategory = cgCategory;
	}





	public Board(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, int bCode, int bCategory,
			String cgCategory) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bCode = bCode;
		this.bCategory = bCategory;
		this.cgCategory = cgCategory;
	}


	public Board(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, int bCode, String bType, int bCategory, String cgCategory) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bCode = bCode;
		this.bType = bType;
		this.bCategory = bCategory;
		this.cgCategory = cgCategory;
		
	}

	public Board(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, int bCode, int bWriter,
			int bCategory, String cgCategory) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bCode = bCode;
		this.bWriter = bWriter;
		this.bCategory = bCategory;
		this.cgCategory = cgCategory;
	}

	public Board(int bNo, String bTitle, String bContent, int bCount, Date bRegdate, Date bModidate, int bCode,
			String bType, int bWriter, int bStatus, int bCategory, String cgCategory) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bCount = bCount;
		this.bRegdate = bRegdate;
		this.bModidate = bModidate;
		this.bCode = bCode;
		this.bType = bType;
		this.bWriter = bWriter;
		this.bStatus = bStatus;
		this.bCategory = bCategory;
		this.cgCategory = cgCategory;
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



	public String getbType() {
		return bType;
	}



	public void setbType(String bType) {
		this.bType = bType;
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



	public int getbCategory() {
		return bCategory;
	}



	public void setbCategory(int bCategory) {
		this.bCategory = bCategory;
	}



	public String getCgCategory() {
		return cgCategory;
	}



	public void setCgCategory(String cgCategory) {
		this.cgCategory = cgCategory;
	}



	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bCount=" + bCount
				+ ", bRegdate=" + bRegdate + ", bModidate=" + bModidate + ", bCode=" + bCode + ", bType=" + bType
				+ ", bWriter=" + bWriter + ", bStatus=" + bStatus + ", bCategory=" + bCategory + ", cgCategory="
				+ cgCategory + "]";
	}
	
	


	
	
	

	
	
	
	
	
	
}
