package mobile.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mobile.model.dao.MobileDao;
import mobile.model.util.CreateQuery;
import mobile.model.vo.CompareT;
import mobile.model.vo.MoImage;
import mobile.model.vo.Mobile;
import mobile.model.vo.MobileComment;
import mobile.model.vo.MobileInsert1;
import mobile.model.vo.MobileInsert2;
import mobile.model.vo.Report;
import mobile.model.vo.Review;

public class MobileService {
	
	public MobileService() {}

	/**
	 * 모바일 정보(간략개요) insert Service
	 * @param index 
	 * @param mi1
	 * @return result
	 */
	public int insertMobileSummary(int index, MobileInsert1 mi1) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobileSummary(conn, index, mi1);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 정보 (상세) insert Service
	 * @param index 
	 * @param mi2
	 * @return result
	 */
	public int insertMobile(int index, MobileInsert2 mi2) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobile(conn, index, mi2);
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
				case "screen" : query += cq.createInchq(strArr); break;
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
				case "screen" : query += cq.createInchq(strArr); break;
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
	 * @param type 
	 * @return mcList
	 */
	public ArrayList<MobileComment> selectCommList(int mno, int type) {
		Connection conn = getConnection();
		ArrayList<MobileComment> mcList = new MobileDao().selectCommList(conn, mno, type);
		return mcList;
	}

	/**
	 * 모바일 디바이스 페이지 댓글을 입력하는 Service
	 * @param mc
	 * @param type 
	 * @return result
	 */
	public int insertComment(MobileComment mc, int type) {
		Connection conn = getConnection();
		int result = new MobileDao().insertComment(conn, mc, type);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 디바이스 페이지 댓글을 삭제하는 Service
	 * @param mcNo
	 * @param type 
	 * @return result
	 */
	public int deleteComment(int mcNo, int type) {
		Connection conn = getConnection();
		int result = new MobileDao().deleteComment(conn, mcNo, type);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 댓글을 수정하기위해 댓글 하나를 불러오는 Service
	 * @param mcNo
	 * @param type 
	 * @return mc
	 */
	public MobileComment selectComment(int mcNo, int type) {
		Connection conn = getConnection();
		MobileComment mc = new MobileDao().selectComment(conn, mcNo, type);
		return mc;
	}

	/**
	 * 모바일 댓글을 수정하는 Service
	 * @param mc
	 * @param type 
	 * @return result
	 */
	public int updateComment(MobileComment mc, int type) {
		Connection conn = getConnection();
		int result = new MobileDao().updateComment(conn, mc, type);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 모바일 디바이스별 리뷰 리스트를 받아오는 Service
	 * @param mno
	 * @param uno 
	 * @return rList
	 */
	public ArrayList<Review> selectReviewList(int mno, int uno) {
		Connection conn = getConnection();
		ArrayList<Review> rList = new MobileDao().selectReviewList(conn, mno, uno);
		return rList;
	}

	/**
	 * 리뷰 좋아요 찍는 Service
	 * @param rno
	 * @param uno
	 * @return result
	 */
	public int insertReviewLike(int rno, int uno) {
		Connection conn = getConnection();
		int result = new MobileDao().insertReviewLike(conn, rno, uno);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 리뷰 좋아요 삭제하는 Service
	 * @param rno
	 * @param uno
	 * @return result
	 */
	public int deleteReviewLike(int rno, int uno) {
		Connection conn = getConnection();
		int result = new MobileDao().deleteReviewLike(conn, rno, uno);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 리뷰 등록하는 Service
	 * @param review
	 * @return result 
	 */
	public int insertReview(Review review) {
		Connection conn = getConnection();
		int result = new MobileDao().insertReview(conn, review);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 리뷰 삭제하는 Service
	 * @param rno
	 * @return result
	 */
	public int deleteReview(int rno) {
		Connection conn = getConnection();
		int result = new MobileDao().deleteReview(conn, rno);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 수정할 리뷰 한 개 가져오는 Service
	 * @param rno
	 * @return review
	 */
	public Review selectReview(int rno) {
		Connection conn = getConnection();
		Review review = new MobileDao().selectReview(conn, rno);
		return review;
	}

	/**
	 * 리뷰 수정하는 Service
	 * @param modiR
	 * @return result
	 */
	public int updateReview(Review modiR) {
		Connection conn = getConnection();
		int result = new MobileDao().updateReview(conn, modiR);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * COMPARE 테이블에 비교 튜플 있는지 확인하는 Service
	 * @param com1
	 * @param com2
	 * @return result
	 */
	public CompareT checkCompareTable(int com1, int com2) {
		Connection conn = getConnection();
		CompareT compare = new MobileDao().checkCompareTable(conn, com1, com2);
		return compare;
	}

	/**
	 * COMPARE 테이블 조회횟수 증가시키는 Service
	 * @param com1
	 * @param com2
	 * @return result
	 */
	public int updateCompareCount(int com1, int com2) {
		Connection conn = getConnection();
		int result = new MobileDao().updateCompareCount(conn, com1, com2);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * COMPARE 테이블 인서트하는 Service
	 * @param com1
	 * @param com2
	 * @return result
	 */
	public int insertCompareTable(int com1, int com2) {
		Connection conn = getConnection();
		int result = new MobileDao().insertCompareTable(conn, com1, com2);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 
	 * @param brandNo
	 * @param device
	 * @return
	 */
	public ArrayList<Mobile> joinFormSelectMobile(String device) {
		Connection conn = getConnection();
		
		ArrayList<Mobile> sList = new MobileDao().joinFormSelectMobile(conn,device);
		
		return sList;
	}

	/**

	 * 내가 쓴 리뷰 개수 구하는 서블릿
	 * @param userNo
	 * @return
	 */
	public int getMyReviewCount(int userNo) {
		Connection conn = getConnection();
		
		int myReviewCount = new MobileDao().myReviewCount(conn, userNo);
		
		return myReviewCount;
	}

	/**
	 * 내가 쓴 리뷰의 현재 목록 가져오는 service
	 * @param currentPage
	 * @param limit
	 * @param userNo
	 * @return
	 */
	public ArrayList<Review> selectMyReview(int currentPage, int limit, int userNo) {
		Connection conn = getConnection();
		
		ArrayList<Review> rList = new MobileDao().selectMyReview(conn, currentPage, limit, userNo);
		
		return rList;
  }
  
  	/**
	 * 인서트할 모바일의 인덱스를 받아오는 Service
	 * @return index
	 */
	public int getIndex() {
		Connection conn = getConnection();
		int index = new MobileDao().getIndex(conn);
		if ( index > 0 ) commit(conn);
		else rollback(conn);
		return index;
	}

	/**
	 * 모바일 디바이스 파일 저장하는 Service
	 * @param index
	 * @param mo
	 * @return result
	 */
	public int insertMobileImage(int index, MoImage mo) {
		Connection conn = getConnection();
		int result = new MobileDao().insertMobileImage(conn, index, mo);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;
	}

	/**
	 * 댓글 신고하는 Service
	 * @param report
	 * @return result 
	 */
	public int insertReport(Report report) {
		Connection conn = getConnection();
		int result = new MobileDao().insertReport(conn, report);
		if ( result > 0 ) commit(conn);
		else rollback(conn);
		return result;

	}
	
}
