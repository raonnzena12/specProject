package mobile.model.vo;

public class CompareT {
	private int comNo;
	private int comCount;
	private int comDevice1;
	private String comDevice1Name;
	private int comDevice2;
	private String comDevice2Name;
	
	public CompareT() {}

	public CompareT(int comDevice1, int comDevice2) {
		super();
		this.comDevice1 = comDevice1;
		this.comDevice2 = comDevice2;
	}
	
	public CompareT(int comNo, int comCount, int comDevice1, int comDevice2) {
		super();
		this.comNo = comNo;
		this.comCount = comCount;
		this.comDevice1 = comDevice1;
		this.comDevice2 = comDevice2;
	}

	public CompareT(int comNo, int comCount, int comDevice1, String comDevice1Name, int comDevice2,
			String comDevice2Name) {
		super();
		this.comNo = comNo;
		this.comCount = comCount;
		this.comDevice1 = comDevice1;
		this.comDevice1Name = comDevice1Name;
		this.comDevice2 = comDevice2;
		this.comDevice2Name = comDevice2Name;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getComCount() {
		return comCount;
	}

	public void setComCount(int comCount) {
		this.comCount = comCount;
	}

	public int getComDevice1() {
		return comDevice1;
	}

	public void setComDevice1(int comDevice1) {
		this.comDevice1 = comDevice1;
	}

	public String getComDevice1Name() {
		return comDevice1Name;
	}

	public void setComDevice1Name(String comDevice1Name) {
		this.comDevice1Name = comDevice1Name;
	}

	public int getComDevice2() {
		return comDevice2;
	}

	public void setComDevice2(int comDevice2) {
		this.comDevice2 = comDevice2;
	}

	public String getComDevice2Name() {
		return comDevice2Name;
	}

	public void setComDevice2Name(String comDevice2Name) {
		this.comDevice2Name = comDevice2Name;
	}

	@Override
	public String toString() {
		return "CompareT [comNo=" + comNo + ", comCount=" + comCount + ", comDevice1=" + comDevice1
				+ ", comDevice1Name=" + comDevice1Name + ", comDevice2=" + comDevice2 + ", comDevice2Name="
				+ comDevice2Name + "]";
	}
	
}
