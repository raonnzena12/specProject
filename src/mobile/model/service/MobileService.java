package mobile.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mobile.model.dao.MobileDao;
import mobile.model.util.CreateQuery;
import mobile.model.vo.Mobile;
import mobile.model.vo.MobileInsert1;
import mobile.model.vo.MobileInsert2;

public class MobileService {
	
	public MobileService() {}

	public int insertMobileSummary(MobileInsert1 mi1) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobileSummary(conn, mi1);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	public int insertMobile(MobileInsert2 mi2) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobile(conn, mi2);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 선택된 기기의 스펙 1개를 로드하는 Service
	 * @param mId
	 * @return device
	 */
	public Mobile selectMobile(int mId) {
		Connection conn = getConnection();
		Mobile device = new MobileDao().selectMobile(conn, mId);
		return device;
	}

	/**
	 * (페이징용) 전체 게시글 수를 조회하는 Service
	 * @return listCount
	 */
	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new MobileDao().getListCount(conn);
		return listCount;
	}

	/**
	 * 페이지 리스트를 받아오는 Service
	 * @param currentPage
	 * @param limit
	 * @return list
	 */
	public ArrayList<Mobile> selectList(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Mobile> list = new MobileDao().selectList(conn, currentPage, limit);
		return list;
	}

	/**
	 * 검색 필터 결과리스트를 받아오는 Service
	 * @param currentPage
	 * @param limit
	 * @param bArr
	 * @return list
	 */
	public ArrayList<Mobile> filterList(int currentPage, int limit, String[] bArr) {
		Connection conn = getConnection();
		
		String query = "";
		// 쿼리문 조합
		// 브랜드 쿼리문 조합
		if ( bArr != null ) {
			query = new CreateQuery().createBrandq(bArr);
		}
		
		ArrayList<Mobile> fList = new MobileDao().filterList(conn, currentPage, limit, query);
		return fList;
	}
	
	
}
