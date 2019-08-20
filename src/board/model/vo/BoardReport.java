package board.model.vo;

import java.sql.Date;

public class BoardReport {
	
	private int brNo;// 신고글 번호
	private String brcontent;// 신고 내용
	private int brTextNo;// 신고된 글 번호
	private Date brDate;// 신고된 날짜
	private int brWriter;// 신고글 작성한 사람
	private int brUser;// 신고 된 사람
	private int brRegNo;//테이블 고유번호 (board:1 / reply:2)
	private int rResult;// 신고 결과
	
	public BoardReport() {
		
	}

	public BoardReport(int brNo, String brcontent, int brTextNo, Date brDate, int brWriter, int brUser, int brRegNo,
			int rResult) {
		super();
		this.brNo = brNo;
		this.brcontent = brcontent;
		this.brTextNo = brTextNo;
		this.brDate = brDate;
		this.brWriter = brWriter;
		this.brUser = brUser;
		this.brRegNo = brRegNo;
		this.rResult = rResult;
	}

	public int getBrNo() {
		return brNo;
	}

	public void setBrNo(int brNo) {
		this.brNo = brNo;
	}

	public String getBrcontent() {
		return brcontent;
	}

	public void setBrcontent(String brcontent) {
		this.brcontent = brcontent;
	}

	public int getBrTextNo() {
		return brTextNo;
	}

	public void setBrTextNo(int brTextNo) {
		this.brTextNo = brTextNo;
	}

	public Date getBrDate() {
		return brDate;
	}

	public void setBrDate(Date brDate) {
		this.brDate = brDate;
	}

	public int getBrWriter() {
		return brWriter;
	}

	public void setBrWriter(int brWriter) {
		this.brWriter = brWriter;
	}

	public int getBrUser() {
		return brUser;
	}

	public void setBrUser(int brUser) {
		this.brUser = brUser;
	}

	public int getBrRegNo() {
		return brRegNo;
	}

	public void setBrRegNo(int brRegNo) {
		this.brRegNo = brRegNo;
	}

	public int getrResult() {
		return rResult;
	}

	public void setrResult(int rResult) {
		this.rResult = rResult;
	}

	@Override
	public String toString() {
		return "BoardReport [brNo=" + brNo + ", brcontent=" + brcontent + ", brTextNo=" + brTextNo + ", brDate="
				+ brDate + ", brWriter=" + brWriter + ", brUser=" + brUser + ", brRegNo=" + brRegNo + ", rResult="
				+ rResult + "]";
	}
	
	
	
}
