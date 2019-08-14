package mobile.model.vo;

import java.sql.Date;

public class MoImage {
	private int miNo;
	private int refMno;
	private String miFrontImage;
	private String miBackImage;
	private String miPath;
	private Date miUploadDate;
	
	public MoImage() {}

	public MoImage(int miNo, int refMno, String miFrontImage, String miBackImage, String miPath, Date miUploadDate) {
		super();
		this.miNo = miNo;
		this.refMno = refMno;
		this.miFrontImage = miFrontImage;
		this.miBackImage = miBackImage;
		this.miPath = miPath;
		this.miUploadDate = miUploadDate;
	}

	public int getMiNo() {
		return miNo;
	}

	public void setMiNo(int miNo) {
		this.miNo = miNo;
	}

	public int getRefMno() {
		return refMno;
	}

	public void setRefMno(int refMno) {
		this.refMno = refMno;
	}

	public String getMiFrontImage() {
		return miFrontImage;
	}

	public void setMiFrontImage(String miFrontImage) {
		this.miFrontImage = miFrontImage;
	}

	public String getMiBackImage() {
		return miBackImage;
	}

	public void setMiBackImage(String miBackImage) {
		this.miBackImage = miBackImage;
	}

	public String getMiPath() {
		return miPath;
	}

	public void setMiPath(String miPath) {
		this.miPath = miPath;
	}

	public Date getMiUploadDate() {
		return miUploadDate;
	}

	public void setMiUploadDate(Date miUploadDate) {
		this.miUploadDate = miUploadDate;
	}

	@Override
	public String toString() {
		return miNo + " / " + refMno + " / " + miFrontImage + " / " + miBackImage + " / " + miPath + " / "
				+ miUploadDate;
	}
}
