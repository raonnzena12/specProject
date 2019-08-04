package mobile.model.dao;

import static common.JDBCTemplate.*;
import java.io.*;
import java.sql.*;
import java.util.*;

import mobile.model.vo.*;

public class MobileDao {
	private Properties prop = new Properties();
	
	public MobileDao() {
		String fileName = MobileDao.class.getResource("/sql/mobile/mobile-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int insertMobileSummary(Connection conn, MobileInsert1 mi1) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMobileSummary");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mi1.getMoCode());
			pstmt.setString(2, mi1.getMoName());
			pstmt.setInt(3, mi1.getMoBrandCode());
			pstmt.setString(4, mi1.getMoNameEn());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertMobile(Connection conn, MobileInsert2 mi2) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("insertMobile");
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, mi2.getReleaseDate());
			pstmt.setString(2, mi2.getOsVersion());
			pstmt.setString(3, mi2.getMaterial());
			pstmt.setString(4, mi2.getSize());
			pstmt.setString(5, mi2.getWeight());
			pstmt.setString(6, mi2.getLink());
			pstmt.setDouble(7, mi2.getInch());
			pstmt.setString(8, mi2.getResolution());
			pstmt.setString(9, mi2.getPixelInch());
			pstmt.setString(10, mi2.getDisplayType());
			pstmt.setString(11, mi2.getDisWidth());
			pstmt.setString(12, mi2.getDisHeight());
			pstmt.setString(13, mi2.getAp());
			pstmt.setString(14, mi2.getCpu());
			pstmt.setString(15, mi2.getCpuCore());
			pstmt.setString(16, mi2.getCpuClock());
			pstmt.setString(17, mi2.getGpu());
			pstmt.setString(18, mi2.getRam());
			pstmt.setString(19, mi2.getInnerMemory());
			pstmt.setString(20, mi2.getOuterMemory());
			pstmt.setString(21, mi2.getCameraSensor());
			pstmt.setString(22, mi2.getIris());
			pstmt.setString(23, mi2.getFlash());
			pstmt.setString(24, mi2.getPicResolution());
			pstmt.setString(25, mi2.getVidResolution());
			pstmt.setString(26, mi2.getVidFrame());
			pstmt.setString(27, mi2.getFrontResolution());
			pstmt.setString(28, mi2.getFrontVidResolution());
			pstmt.setString(29, mi2.getFrontVidFrame());
			pstmt.setString(30, mi2.getCamera());
			pstmt.setInt(31, mi2.getBattery());
			pstmt.setString(32, mi2.getBatteryType());
			pstmt.setString(33, mi2.getWirelessCharging());
			pstmt.setString(34, mi2.getStandBy());
			pstmt.setString(35, mi2.getProtocol());
			pstmt.setString(36, mi2.getWifi());
			pstmt.setString(37, mi2.getBluetooth());
			pstmt.setString(38, mi2.getUsb());
			pstmt.setString(39, mi2.getBio());
			pstmt.setString(40, mi2.getPayment());
			pstmt.setString(41, mi2.getVerify());
			pstmt.setString(42, mi2.getEtc());
			pstmt.setString(43, "Y");
			pstmt.setInt(44, mi2.getOsCode());
			pstmt.setString(45, mi2.getFastCharging());
			pstmt.setString(46, mi2.getRemovableBattery());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
