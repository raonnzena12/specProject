package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.AdminDao;
import admin.model.vo.AdminBoard;
import admin.model.vo.AdminMember;
import admin.model.vo.AdminReply;
import admin.model.vo.AdminReview;
import board.model.vo.Board;
import calendar.model.vo.Calendar;
import member.model.vo.Member;

public class AdminService {
	
	public AdminService() {}

	public ArrayList<AdminMember> selectMember() {
		Connection conn = getConnection();
		
		ArrayList<AdminMember> mList = new AdminDao().selectMember(conn);
		
		return mList;
	}

	public ArrayList<AdminBoard> selectBoard() {
		Connection conn = getConnection();
		
		ArrayList<AdminBoard> bList = new AdminDao().selectBoard(conn);
		
		return bList;
	}

	public ArrayList<AdminReply> selectComment() {
		Connection conn = getConnection();
		
		ArrayList<AdminReply> rList = new AdminDao().selectComment(conn);
		
		return rList;
	}

	public ArrayList<AdminReview> selectReview() {
		Connection conn = getConnection();
		
		ArrayList<AdminReview> rList = new AdminDao().selectReview(conn);
		
		return rList;
	}

	public ArrayList<Calendar> selectCalendar() {
		Connection conn = getConnection();
		
		ArrayList<Calendar> cList = new AdminDao().selectCalendar(conn);
		
		return cList;
	}
	
	

}
