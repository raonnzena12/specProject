package mobile.model.vo;

import java.sql.Date;

public class Review {
	private int rNo;
	private String rTitle;
	private String rContent;
	private Double rStar;
	private Date rRegDate;
	private Date rModiDate;
	private int rIlike;
	private int rLike;
	private int rWriterNo;
	private String rWriterName;
	private int rRefMno;
	private int rStatus;
	private int rIreport;
	
	
	private int rnum;
	private String rDeviceName;
	
	private String rRegDate2;
	private String rModidate2;
	
	public Review() {}
	
	public Review(int rNo, String rTitle, String rContent, Double rStar) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rStar = rStar;
	}

	public Review(String rTitle, String rContent, Double rStar, int rWriterNo, int rRefMno) {
		super();
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rStar = rStar;
		this.rWriterNo = rWriterNo;
		this.rRefMno = rRefMno;
	}
	
	public Review(int rNo, String rTitle, String rContent, Double rStar, Date rRegDate, Date rModiDate, int rLike,
			int rWriterNo, int rRefMno, int rStatus) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rStar = rStar;
		this.rRegDate = rRegDate;
		this.rModiDate = rModiDate;
		this.rLike = rLike;
		this.rWriterNo = rWriterNo;
		this.rRefMno = rRefMno;
		this.rStatus = rStatus;
	}
	
	
	
	// 내가 쓴 리뷰 목록 불러올 생성자
	public Review(int rNo, String rTitle, Double rStar, int rLike, int rWriterNo, int rRefMno,
			int rnum, String rDeviceName, String rRegDate2, String rModidate2) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rStar = rStar;
		this.rLike = rLike;
		this.rWriterNo = rWriterNo;
		this.rRefMno = rRefMno;
		this.rnum = rnum;
		this.rDeviceName = rDeviceName;
		this.rRegDate2 = rRegDate2;
		this.rModidate2 = rModidate2;
	}

	public Review(int rNo, String rTitle, String rContent, Double rStar, Date rRegDate, Date rModiDate, int rLike,
			int rWriterNo, String rWriterName, int rRefMno, int rStatus) {
		this(rNo, rTitle, rContent, rStar, rRegDate, rModiDate, rLike, rWriterNo, rRefMno, rStatus);
		this.rWriterName = rWriterName;
	}

	public Review(int rNo, String rTitle, String rContent, Double rStar, Date rRegDate, Date rModiDate, int rIlike,
			int rLike, int rWriterNo, String rWriterName, int rRefMno, int rStatus) {
		this(rNo, rTitle, rContent, rStar, rRegDate, rModiDate, rLike, rWriterNo, rWriterName, rRefMno, rStatus);
		this.rIlike = rIlike;
	}
	
	public Review(int rNo, String rTitle, String rContent, Double rStar, Date rRegDate, Date rModiDate, int rIlike,
			int rLike, int rWriterNo, String rWriterName, int rRefMno, int rStatus, int rIreport) {
		this(rNo, rTitle, rContent, rStar, rRegDate, rModiDate, rLike, rWriterNo, rWriterName, rRefMno, rStatus);
		this.rIlike = rIlike;
		this.rIreport = rIreport;
	}

	public int getrIlike() {
		return rIlike;
	}

	public void setrIlike(int rIlike) {
		this.rIlike = rIlike;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Double getrStar() {
		return rStar;
	}

	public void setrStar(Double rStar) {
		this.rStar = rStar;
	}

	public Date getrRegDate() {
		return rRegDate;
	}

	public void setrRegDate(Date rRegDate) {
		this.rRegDate = rRegDate;
	}

	public Date getrModiDate() {
		return rModiDate;
	}

	public void setrModiDate(Date rModiDate) {
		this.rModiDate = rModiDate;
	}

	public int getrLike() {
		return rLike;
	}

	public void setrLike(int rLike) {
		this.rLike = rLike;
	}

	public int getrWriterNo() {
		return rWriterNo;
	}

	public void setrWriterNo(int rWriterNo) {
		this.rWriterNo = rWriterNo;
	}

	public String getrWriterName() {
		return rWriterName;
	}

	public void setrWriterName(String rWriterName) {
		this.rWriterName = rWriterName;
	}

	public int getrRefMno() {
		return rRefMno;
	}

	public void setrRefMno(int rRefMno) {
		this.rRefMno = rRefMno;
	}

	public int getrStatus() {
		return rStatus;
	}

	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}
	
	// 출력용 날짜
	public String getrDeviceName() {
		return rDeviceName;
	}

	public void setrDeviceName(String rDeviceName) {
		this.rDeviceName = rDeviceName;
	}
	
	

	public String getrRegDate2() {
		return rRegDate2;
	}

	public void setrRegDate2(String rRegDate2) {
		this.rRegDate2 = rRegDate2;
	}

	public String getrModidate2() {
		return rModidate2;
	}

	public void setrModidate2(String rModidate2) {
		this.rModidate2 = rModidate2;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rStar=" + rStar
				+ ", rRegDate=" + rRegDate + ", rModiDate=" + rModiDate + ", rLike=" + rLike + ", rWriterNo="
				+ rWriterNo + ", rWriterName=" + rWriterName + ", rRefMno=" + rRefMno + ", rStatus=" + rStatus + "]";
	}
}