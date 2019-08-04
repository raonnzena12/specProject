package mobile.model.vo;

public class MobileInsert1 {
	private int moNo;
	private String moCode;
	private String moName;
	private String moNameEn;
	private int moBrandCode;
	
	public MobileInsert1() {}

	public MobileInsert1(String moCode, String moName, String moNameEn, int moBrandCode) {
		super();
		this.moCode = moCode;
		this.moName = moName;
		this.moNameEn = moNameEn;
		this.moBrandCode = moBrandCode;
	}

	public MobileInsert1(int moNo, String moCode, String moName, String moNameEn, int moBrandCode) {
		this(moCode, moName, moNameEn, moBrandCode);
		this.moNo = moNo;
	}

	public int getMoNo() {
		return moNo;
	}

	public void setMoNo(int moNo) {
		this.moNo = moNo;
	}

	public String getMoCode() {
		return moCode;
	}

	public void setMoCode(String moCode) {
		this.moCode = moCode;
	}

	public String getMoName() {
		return moName;
	}

	public void setMoName(String moName) {
		this.moName = moName;
	}

	public String getMoNameEn() {
		return moNameEn;
	}

	public void setMoNameEn(String moNameEn) {
		this.moNameEn = moNameEn;
	}

	public int getMoBrandCode() {
		return moBrandCode;
	}

	public void setMoBrandCode(int moBrandCode) {
		this.moBrandCode = moBrandCode;
	}

	@Override
	public String toString() {
		return moNo + " / " + moCode + " / " + moName + " / " + moNameEn + " / " + moBrandCode;
	}
	
}
