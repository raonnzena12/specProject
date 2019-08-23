package mobile.model.vo;

import java.sql.Date;

public class MoImage {
	private int refMno;
	private String miFrontImage;
	private String miBackImage;
	private String miPath;
	private Date miUploadDate;
	private String miName;
	
	public MoImage() {}
	
	
	

	public MoImage(int refMno, String miFrontImage, String miName) {
		super();
		this.refMno = refMno;
		this.miFrontImage = miFrontImage;
		this.miName = miName;
	}

	public MoImage(int refMno, String miFrontImage) {
		super();
		this.refMno = refMno;
		this.miFrontImage = miFrontImage;
	}



	public MoImage(int refMno, String miFrontImage, String miBackImage, String miPath, Date miUploadDate) {
		super();
		this.refMno = refMno;
		this.miFrontImage = miFrontImage;
		this.miBackImage = miBackImage;
		this.miPath = miPath;
		this.miUploadDate = miUploadDate;
	}
	
	

	public MoImage(int refMno, String miFrontImage, String miBackImage, String miPath, Date miUploadDate,
			String miName) {
		super();
		this.refMno = refMno;
		this.miFrontImage = miFrontImage;
		this.miBackImage = miBackImage;
		this.miPath = miPath;
		this.miUploadDate = miUploadDate;
		this.miName = miName;
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
	
	public String getMiName() {
		return miName;
	}

	public void setMiName(String miName) {
		this.miName = miName;
	}

	@Override
	public String toString() {
		return refMno + " / " + miFrontImage + " / " + miBackImage + " / " + miPath + " / "
				+ miUploadDate + " / " + miName;
	}
}
