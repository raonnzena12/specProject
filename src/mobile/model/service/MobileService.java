package mobile.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mobile.model.dao.MobileDao;
import mobile.model.util.CreateQuery;
import mobile.model.vo.Mobile;
import mobile.model.vo.MobileComment;
import mobile.model.vo.MobileInsert1;
import mobile.model.vo.MobileInsert2;

public class MobileService {
	
	public MobileService() {}

	/**
	 * 모바일 정보(간략개요) insert Service
	 * @param mi1
	 * @return result
	 */
	public int insertMobileSummary(MobileInsert1 mi1) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobileSummary(conn, mi1);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 정보 (상세) insert Service
	 * @param mi2
	 * @return result
	 */
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
	 * 필터링된 게시글 수를 조회하는 Service
	 * @param queryList
	 * @return listCount
	 */
	public int getListCount(ArrayList<String[]> queryList) {
		Connection conn = getConnection();
		CreateQuery cq = new CreateQuery();
		String query = "";
		// 쿼리문 조합
		if ( !queryList.isEmpty() ) {
			for ( String[] strArr : queryList ) {
				switch ( strArr[0] ) {
				case "brand" : query += cq.createBrandq(strArr); break;
				case "battery" : query += cq.createBatteryq(strArr); break;
				}
			}
		}
		int listCount = new MobileDao().getListCount(conn, query);
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
	public ArrayList<Mobile> filterList(int currentPage, int limit, ArrayList<String[]> queryList) {
		Connection conn = getConnection();
		CreateQuery cq = new CreateQuery();
		String query = "";
		// 쿼리문 조합
		if ( !queryList.isEmpty() ) {
			for ( String[] strArr : queryList ) {
				switch ( strArr[0] ) {
				case "brand" : query += cq.createBrandq(strArr); break;
				case "battery" : query += cq.createBatteryq(strArr); break;
				}
			}
		}
		
		ArrayList<Mobile> fList = new MobileDao().filterList(conn, currentPage, limit, query);
		return fList;
	}

	/**
	 * 핸드폰 기종 개요 출력하는 Service
	 * @return mdList
	 */
	public ArrayList<MobileInsert1> selectDigest() {
		Connection conn = getConnection();
		ArrayList<MobileInsert1> mdList = new MobileDao().selectDigest(conn);
		
		return mdList;
	}

	/**
	 * 모바일 디바이스별 댓글 리스트를 받아오는 Service
	 * @param mno
	 * @return mcList
	 */
	public ArrayList<MobileComment> selectCommList(int mno) {
		Connection conn = getConnection();
		ArrayList<MobileComment> mcList = new MobileDao().selectCommList(conn, mno);
		return mcList;
	}

	/**
	 * 모바일 디바이스 페이지 댓글을 입력하는 Service
	 * @param mc
	 * @return result
	 */
	public int insertComment(MobileComment mc) {
		Connection conn = getConnection();
		int result = new MobileDao().insertComment(conn, mc);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 디바이스 페이지 댓글을 삭제하는 Service
	 * @param mcNo
	 * @return result
	 */
	public int deleteComment(int mcNo) {
		Connection conn = getConnection();
		int result = new MobileDao().deleteComment(conn, mcNo);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}
	
}
