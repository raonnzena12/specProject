package admin.model.vo;

import java.sql.Date;

public class AdminReview {
	
	private int rNo;
	private String rTitle;
	private String rContent;
	private Double rStar;
	private Date rRegDate;
	private Date rModiDate;
	private int rWriterNo;
	private String rWriterName;
	private int rRefMno;
	private int rStatusCode;
	private String rStatusType;
	private String mobileName;
	private int rLike;
	private String brandName;
	
	
	public AdminReview() {}
	
	public AdminReview(int rNo, String rTitle, Double rStar, Date rRegDate, Date rModiDate, int rLike,
			String rWriterName, int rRefMno, String rStatusType, String brandName) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rStar = rStar;
		this.rRegDate = rRegDate;
		this.rModiDate = rModiDate;
		this.rLike = rLike;
		this.rWriterName = rWriterName;
		this.rRefMno = rRefMno;
		this.rStatusType = rStatusType;
		this.brandName = brandName;
	}
	
	public AdminReview(int rNo, String rTitle, String rContent, Double rStar, Date rRegDate, Date rModiDate,
			int rWriterNo, String rWriterName, int rRefMno, int rStatusCode, String mobileName, int rLike,
			String brandName) {
		super();
		this.rNo = rNo;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rStar = rStar;
		this.rRegDate = rRegDate;
		this.rModiDate = rModiDate;
		this.rWriterNo = rWriterNo;
		this.rWriterName = rWriterName;
		this.rRefMno = rRefMno;
		this.rStatusCode = rStatusCode;
		this.mobileName = mobileName;
		this.rLike = rLike;
		this.brandName = brandName;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public int getrWriterNo() {
		return rWriterNo;
	}

	public void setrWriterNo(int rWriterNo) {
		this.rWriterNo = rWriterNo;
	}

	public int getrStatusCode() {
		return rStatusCode;
	}

	public void setrStatusCode(int rStatusCode) {
		this.rStatusCode = rStatusCode;
	}

	public String getMobileName() {
		return mobileName;
	}

	public void setMobileName(String mobileName) {
		this.mobileName = mobileName;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
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

	public String getrStatusType() {
		return rStatusType;
	}

	public void setrStatusType(String rStatusType) {
		this.rStatusType = rStatusType;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrNo() {
		return rNo;
	}

	@Override
	public String toString() {
		return "AdminReview [rNo=" + rNo + ", rTitle=" + rTitle + ", rStar=" + rStar + ", rRegDate=" + rRegDate
				+ ", rModiDate=" + rModiDate + ", rLike=" + rLike + ", rWriterName=" + rWriterName + ", rRefMno="
				+ rRefMno + ", rStatusType=" + rStatusType + ", brandName=" + brandName + "]";
	}
	
	
	
}
