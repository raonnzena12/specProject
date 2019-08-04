package mobile.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import mobile.model.dao.MobileDao;
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
	
	
}
