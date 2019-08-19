package mobile.model.vo;

import java.sql.Date;

public class MobileInsert2 {
	private int moNo;
	private String releaseDate;
	private int osCode;
	private String osVersion;
	private String material;
	private String size;
	private String weight;
	private String link;
	private double inch;
	private String resolution;
	private String pixelInch;
	private String displayType;
	private String disWidth;
	private String disHeight;
	private String ap;
	private String cpu;
	private String cpuCore;
	private String cpuClock;
	private String gpu;
	private String ram;
	private String innerMemory;
	private String outerMemory;
	private String cameraSensor;
	private String iris;
	private String flash;
	private String picResolution;
	private String vidResolution;
	private String vidFrame;
	private String frontResolution;
	private String frontVidResolution;
	private String frontVidFrame;
	private String camera;
	private int battery;
	private String batteryType;
	private String fastCharging;
	private String removableBattery;
	private String wirelessCharging;
	private String standBy;
	private String protocol;
	private String wifi;
	private String bluetooth;
	private String usb;
	private String bio;
	private String payment;
	private String verify;
	private String etc;
	private String status;
	
	public MobileInsert2() {}

	public MobileInsert2(String releaseDate, int osCode, String osVersion, String material, String size, String weight,
			String link, double inch, String resolution, String pixelInch, String displayType, String disWidth,
			String disHeight, String ap, String cpu, String cpuCore, String cpuClock, String gpu, String ram,
			String innerMemory, String outerMemory, String cameraSensor, String iris, String flash,
			String picResolution, String vidResolution, String vidFrame, String frontResolution,
			String frontVidResolution, String frontVidFrame, String camera, int battery, String batteryType,
			String fastCharging, String removableBattery, String wirelessCharging, String standBy, String protocol,
			String wifi, String bluetooth, String usb, String bio, String payment, String verify, String etc) {
		super();
		this.releaseDate = releaseDate;
		this.osCode = osCode;
		this.osVersion = osVersion;
		this.material = material;
		this.size = size;
		this.weight = weight;
		this.link = link;
		this.inch = inch;
		this.resolution = resolution;
		this.pixelInch = pixelInch;
		this.displayType = displayType;
		this.disWidth = disWidth;
		this.disHeight = disHeight;
		this.ap = ap;
		this.cpu = cpu;
		this.cpuCore = cpuCore;
		this.cpuClock = cpuClock;
		this.gpu = gpu;
		this.ram = ram;
		this.innerMemory = innerMemory;
		this.outerMemory = outerMemory;
		this.cameraSensor = cameraSensor;
		this.iris = iris;
		this.flash = flash;
		this.picResolution = picResolution;
		this.vidResolution = vidResolution;
		this.vidFrame = vidFrame;
		this.frontResolution = frontResolution;
		this.frontVidResolution = frontVidResolution;
		this.frontVidFrame = frontVidFrame;
		this.camera = camera;
		this.battery = battery;
		this.batteryType = batteryType;
		this.fastCharging = fastCharging;
		this.removableBattery = removableBattery;
		this.wirelessCharging = wirelessCharging;
		this.standBy = standBy;
		this.protocol = protocol;
		this.wifi = wifi;
		this.bluetooth = bluetooth;
		this.usb = usb;
		this.bio = bio;
		this.payment = payment;
		this.verify = verify;
		this.etc = etc;
	}

	public MobileInsert2(int moNo, String releaseDate, int osCode, String osVersion, String material, String size,
			String weight, String link, double inch, String resolution, String pixelInch, String displayType,
			String disWidth, String disHeight, String ap, String cpu, String cpuCore, String cpuClock, String gpu,
			String ram, String innerMemory, String outerMemory, String cameraSensor, String iris, String flash,
			String picResolution, String vidResolution, String vidFrame, String frontResolution,
			String frontVidResolution, String frontVidFrame, String camera, int battery, String batteryType,
			String fastCharging, String removableBattery, String wirelessCharging, String standBy, String protocol,
			String wifi, String bluetooth, String usb, String bio, String payment, String verify, String etc,
			String status) {
		this(releaseDate, osCode, osVersion, material, size, weight, link, inch, resolution, pixelInch, displayType, disWidth, disHeight, ap, cpu, cpuCore, cpuClock, gpu, ram, innerMemory, outerMemory, cameraSensor, iris, flash, picResolution, vidResolution, vidFrame, frontResolution, frontVidResolution, frontVidFrame, camera, battery, batteryType, fastCharging, removableBattery, wirelessCharging, standBy, protocol, wifi, bluetooth, usb, bio, payment, verify, etc);
		this.moNo = moNo;
		this.status = status;
	}

	public int getMoNo() {
		return moNo;
	}

	public void setMoNo(int moNo) {
		this.moNo = moNo;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public int getOsCode() {
		return osCode;
	}

	public void setOsCode(int osCode) {
		this.osCode = osCode;
	}

	public String getOsVersion() {
		return osVersion;
	}

	public void setOsVersion(String osVersion) {
		this.osVersion = osVersion;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public double getInch() {
		return inch;
	}

	public void setInch(double inch) {
		this.inch = inch;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public String getPixelInch() {
		return pixelInch;
	}

	public void setPixelInch(String pixelInch) {
		this.pixelInch = pixelInch;
	}

	public String getDisplayType() {
		return displayType;
	}

	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}

	public String getDisWidth() {
		return disWidth;
	}

	public void setDisWidth(String disWidth) {
		this.disWidth = disWidth;
	}

	public String getDisHeight() {
		return disHeight;
	}

	public void setDisHeight(String disHeight) {
		this.disHeight = disHeight;
	}

	public String getAp() {
		return ap;
	}

	public void setAp(String ap) {
		this.ap = ap;
	}

	public String getCpu() {
		return cpu;
	}

	public void setCpu(String cpu) {
		this.cpu = cpu;
	}

	public String getCpuCore() {
		return cpuCore;
	}

	public void setCpuCore(String cpuCore) {
		this.cpuCore = cpuCore;
	}

	public String getCpuClock() {
		return cpuClock;
	}

	public void setCpuClock(String cpuClock) {
		this.cpuClock = cpuClock;
	}

	public String getGpu() {
		return gpu;
	}

	public void setGpu(String gpu) {
		this.gpu = gpu;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getInnerMemory() {
		return innerMemory;
	}

	public void setInnerMemory(String innerMemory) {
		this.innerMemory = innerMemory;
	}

	public String getOuterMemory() {
		return outerMemory;
	}

	public void setOuterMemory(String outerMemory) {
		this.outerMemory = outerMemory;
	}

	public String getCameraSensor() {
		return cameraSensor;
	}

	public void setCameraSensor(String cameraSensor) {
		this.cameraSensor = cameraSensor;
	}

	public String getIris() {
		return iris;
	}

	public void setIris(String iris) {
		this.iris = iris;
	}

	public String getFlash() {
		return flash;
	}

	public void setFlash(String flash) {
		this.flash = flash;
	}

	public String getPicResolution() {
		return picResolution;
	}

	public void setPicResolution(String picResolution) {
		this.picResolution = picResolution;
	}

	public String getVidResolution() {
		return vidResolution;
	}

	public void setVidResolution(String vidResolution) {
		this.vidResolution = vidResolution;
	}

	public String getVidFrame() {
		return vidFrame;
	}

	public void setVidFrame(String vidFrame) {
		this.vidFrame = vidFrame;
	}

	public String getFrontResolution() {
		return frontResolution;
	}

	public void setFrontResolution(String frontResolution) {
		this.frontResolution = frontResolution;
	}

	public String getFrontVidResolution() {
		return frontVidResolution;
	}

	public void setFrontVidResolution(String frontVidResolution) {
		this.frontVidResolution = frontVidResolution;
	}

	public String getFrontVidFrame() {
		return frontVidFrame;
	}

	public void setFrontVidFrame(String frontVidFrame) {
		this.frontVidFrame = frontVidFrame;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public int getBattery() {
		return battery;
	}

	public void setBattery(int battery) {
		this.battery = battery;
	}

	public String getBatteryType() {
		return batteryType;
	}

	public void setBatteryType(String batteryType) {
		this.batteryType = batteryType;
	}

	public String getFastCharging() {
		return fastCharging;
	}

	public void setFastCharging(String fastCharging) {
		this.fastCharging = fastCharging;
	}

	public String getRemovableBattery() {
		return removableBattery;
	}

	public void setRemovableBattery(String removableBattery) {
		this.removableBattery = removableBattery;
	}

	public String getWirelessCharging() {
		return wirelessCharging;
	}

	public void setWirelessCharging(String wirelessCharging) {
		this.wirelessCharging = wirelessCharging;
	}

	public String getStandBy() {
		return standBy;
	}

	public void setStandBy(String standBy) {
		this.standBy = standBy;
	}

	public String getProtocol() {
		return protocol;
	}

	public void setProtocol(String protocol) {
		this.protocol = protocol;
	}

	public String getWifi() {
		return wifi;
	}

	public void setWifi(String wifi) {
		this.wifi = wifi;
	}

	public String getBluetooth() {
		return bluetooth;
	}

	public void setBluetooth(String bluetooth) {
		this.bluetooth = bluetooth;
	}

	public String getUsb() {
		return usb;
	}

	public void setUsb(String usb) {
		this.usb = usb;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return moNo + " / " + releaseDate + " / " + osCode + " / " + osVersion + " / " + material + " / " + size + " / "
				+ weight + " / " + link + " / " + inch + " / " + resolution + " / " + pixelInch + " / " + displayType
				+ " / " + disWidth + " / " + disHeight + " / " + ap + " / " + cpu + " / " + cpuCore + " / " + cpuClock
				+ " / " + gpu + " / " + ram + " / " + innerMemory + " / " + outerMemory + " / " + cameraSensor + " / "
				+ iris + " / " + flash + " / " + picResolution + " / " + vidResolution + " / " + vidFrame + " / "
				+ frontResolution + " / " + frontVidResolution + " / " + frontVidFrame + " / " + camera + " / "
				+ battery + " / " + batteryType + " / " + fastCharging + " / " + removableBattery + " / "
				+ wirelessCharging + " / " + standBy + " / " + protocol + " / " + wifi + " / " + bluetooth + " / " + usb
				+ " / " + bio + " / " + payment + " / " + verify + " / " + etc + " / " + status;
	}
}
