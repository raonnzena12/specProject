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

	@Override
	public String toString() {
		return "Review [rNo=" + rNo + ", rTitle=" + rTitle + ", rContent=" + rContent + ", rStar=" + rStar
				+ ", rRegDate=" + rRegDate + ", rModiDate=" + rModiDate + ", rLike=" + rLike + ", rWriterNo="
				+ rWriterNo + ", rWriterName=" + rWriterName + ", rRefMno=" + rRefMno + ", rStatus=" + rStatus + "]";
	}
}