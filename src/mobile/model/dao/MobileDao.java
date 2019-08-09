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
			pstmt.setString(3, mi1.getMoNameEn());
			pstmt.setInt(4, mi1.getMoBrandCode());
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
			pstmt.setString(33, mi2.getFastCharging());
			pstmt.setString(34, mi2.getRemovableBattery());
			pstmt.setString(35, mi2.getWirelessCharging());
			pstmt.setString(36, mi2.getStandBy());
			pstmt.setString(37, mi2.getProtocol());
			pstmt.setString(38, mi2.getWifi());
			pstmt.setString(39, mi2.getBluetooth());
			pstmt.setString(40, mi2.getUsb());
			pstmt.setString(41, mi2.getBio());
			pstmt.setString(42, mi2.getPayment());
			pstmt.setString(43, mi2.getVerify());
			pstmt.setString(44, mi2.getEtc());
			pstmt.setString(45, "Y");
			pstmt.setInt(46, mi2.getOsCode());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Mobile selectMobile(Connection conn, int mId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Mobile device = null;
		
		String query = prop.getProperty("selectMobile");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mId);
			
			rset = pstmt.executeQuery();
			
			if ( rset.next() ) {
				device = new Mobile(rset.getInt(1), rset.getString(2), rset.getString(3), 
						rset.getString(4), rset.getString(5), rset.getDate(6), rset.getString(7), 
						rset.getString(8), rset.getString(9), rset.getString(10), rset.getString(11), 
						rset.getString(12), rset.getDouble(13), rset.getString(14), rset.getString(15), 
						rset.getString(16), rset.getString(17), rset.getString(18), rset.getString(19), 
						rset.getString(20), rset.getString(21), rset.getString(22), rset.getString(23), 
						rset.getString(24), rset.getString(25), rset.getString(26), rset.getString(27), 
						rset.getString(28), rset.getString(29), rset.getString(30), rset.getString(31),
						rset.getString(32), rset.getString(33), rset.getString(34), rset.getString(35),
						rset.getString(36), rset.getInt(37), rset.getString(38), rset.getString(39), 
						rset.getString(40), rset.getString(41), rset.getString(42), rset.getString(43),
						rset.getString(44), rset.getString(42), rset.getString(46), rset.getString(47), 
						rset.getString(48), rset.getString(49), rset.getString(50), rset.getString(51));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return device;
	}

	/**
	 * (페이징용) 전체 게시글 수를 조회하는 Dao
	 * @param conn
	 * @return listCount
	 */
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if ( rset.next() ) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	public int getListCount(Connection conn, String query) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String baseQuery = prop.getProperty("getListCount");
		String finQuery = baseQuery + query;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(finQuery);
			if ( rset.next() ) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCount;
	}

	/**
	 * 페이지 리스트를 받아오는 Dao
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @return list
	 */
	public ArrayList<Mobile> selectList(Connection conn, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Mobile> list = new ArrayList<Mobile>();
		
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			int startRow = ( currentPage - 1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Mobile(rset.getInt(2), rset.getString(3), rset.getString(4), 
						rset.getString(5), rset.getString(6), rset.getDate(7), rset.getString(8), 
						rset.getString(9), rset.getString(10), rset.getString(11), rset.getString(12), 
						rset.getString(13), rset.getDouble(14), rset.getString(15), rset.getString(16), 
						rset.getString(17), rset.getString(18), rset.getString(19), rset.getString(20), 
						rset.getString(21), rset.getString(22), rset.getString(23), rset.getString(24), 
						rset.getString(25), rset.getString(26), rset.getString(27), rset.getString(28), 
						rset.getString(29), rset.getString(30), rset.getString(31), rset.getString(32),
						rset.getString(33), rset.getString(34), rset.getString(35), rset.getString(36),
						rset.getString(37), rset.getInt(38), rset.getString(39), rset.getString(40), 
						rset.getString(41), rset.getString(42), rset.getString(43), rset.getString(44),
						rset.getString(45), rset.getString(46), rset.getString(47), rset.getString(48), 
						rset.getString(49), rset.getString(50), rset.getString(51), rset.getString(52)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 필터링용 Service
	 * @param conn
	 * @param currentPage
	 * @param limit
	 * @param query
	 * @return fList
	 */
	public ArrayList<Mobile> filterList(Connection conn, int currentPage, int limit, String query) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Mobile> fList = new ArrayList<Mobile>();
		
		String makeQuery = prop.getProperty("filterList1");
		makeQuery += query;
		makeQuery += prop.getProperty("filterList2");
		try {
			
			pstmt = conn.prepareStatement(makeQuery);
			int startRow = ( currentPage - 1 ) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				fList.add(new Mobile(rset.getInt(2), rset.getString(3), rset.getString(4), 
						rset.getString(5), rset.getString(6), rset.getDate(7), rset.getString(8), 
						rset.getString(9), rset.getString(10), rset.getString(11), rset.getString(12), 
						rset.getString(13), rset.getDouble(14), rset.getString(15), rset.getString(16), 
						rset.getString(17), rset.getString(18), rset.getString(19), rset.getString(20), 
						rset.getString(21), rset.getString(22), rset.getString(23), rset.getString(24), 
						rset.getString(25), rset.getString(26), rset.getString(27), rset.getString(28), 
						rset.getString(29), rset.getString(30), rset.getString(31), rset.getString(32),
						rset.getString(33), rset.getString(34), rset.getString(35), rset.getString(36),
						rset.getString(37), rset.getInt(38), rset.getString(39), rset.getString(40), 
						rset.getString(41), rset.getString(42), rset.getString(43), rset.getString(44),
						rset.getString(45), rset.getString(46), rset.getString(47), rset.getString(48), 
						rset.getString(49), rset.getString(50), rset.getString(51), rset.getString(52)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fList;
	}

	/**
	 * 핸드폰 기종 개요 출력하는 DAO
	 * @param conn
	 * @return mdList
	 */
	public ArrayList<MobileInsert1> selectDigest(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<MobileInsert1> mdList = new ArrayList<MobileInsert1>();
		
		String query = prop.getProperty("selectDigest");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while ( rset.next() ) {
				mdList.add(new MobileInsert1(rset.getInt("MO_NO"), rset.getString("MO_CODE"), rset.getString("MO_NAME"), rset.getString("MO_NAME_EN"), rset.getInt("MO_BRANDCODE")));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return mdList;
	}

}
