package model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import database.DBConnection;
import model.dto.DTOMember;

public class DAOMember{	
	
	private static DAOMember instance;
	
	private DAOMember() {}
	
	public static DAOMember getInstance() {
		//instance 최초 생성
		if(instance == null) {
			instance = new DAOMember();
		}
		
		return instance;
	}
	
	public void insertMember(DTOMember m){		
		PreparedStatement pstmt=null;
		String sql=null;		
		Connection conn=null;	
					
		try {				
			
			conn= DBConnection.getconn();
			sql="insert into member"
					+ "(id,"
					+ "pass"
					+ ",name"
					+ ",nicname"
					+ ",security1"
					+ ",security2"
					+ ",phone1"
					+ ",phone2"
					+ ",phone3,"				
					+ "adress1"
					+ ",adress2,"
					+ "adress3,"
					+ "adress4,"
					+ "email1,"
					+ "email2,"
					+ "gender,"
					+ "level,"
					+ "prisite,"
					+ "signdata,"
					+ "point)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,m.getId());//아이디
			pstmt.setString(2,m.getPass());//비밀번호
			pstmt.setString(3,m.getName());//이름
			pstmt.setString(4,m.getNicname());//닉네임
			pstmt.setString(5,m.getSecurity1());//주민번호1
			pstmt.setString(6,"");//주민번호2
			pstmt.setString(7,m.getPhone1());//전화번호1
			pstmt.setString(8,m.getPhone2());//전화번호2
			pstmt.setString(9,m.getPhone3());//전화번호3
			pstmt.setString(10,m.getAdress1());//우편번호
			pstmt.setString(11,m.getAdress2());//도로명주소
			pstmt.setString(12,m.getAdress3());//지번주소
			pstmt.setString(13,m.getAdress4());//상세정보			
			pstmt.setString(14,m.getEmail1());//이메일
			pstmt.setString(15,m.getEmail2());//이메일주소
			pstmt.setString(16,m.getGender());//성별
			pstmt.setString(17,"1");//레벨
			pstmt.setString(18,m.getPrisite());//선호지역					
			pstmt.setInt(19,0);//포인트
			
			pstmt.executeUpdate();		
			
			
		
		}catch(Exception e){			
			System.out.println("<h1>점검 중 잠시 후 바람</h1><<hr>");
			System.out.println(e.getMessage());						
		}finally {
			try {				
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		
	}
	
	public void update(HttpServletRequest req,String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		java.util.Date utilDate = new java.util.Date();
		java.sql.Timestamp day = new java.sql.Timestamp(utilDate.getTime());
		System.out.println(day);
		try {
			con = DBConnection.getconn();
			sql="update member set "
					+ "nicname=? , "
					+ "pass = ? , "
					+ "phone1 = ? , "
					+ "phone2 = ? , "
					+ "phone3 = ? , "
					+ "adress1 = ? , "
					+ "adress2 = ? , "
					+ "adress3 = ? , "
					+ "adress4 = ? , "
					+ "email1 = ? ,"
					+ "email2 = ? ,"
					+ "gender = ? ,"
					+ "prisite = ? "
					+ "updateDate = ? "
					+ "where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("inputnicname"));
			pstmt.setString(2, req.getParameter("inputPassword"));
			pstmt.setString(3, req.getParameter("inputPhone1"));
			pstmt.setString(4, req.getParameter("inputPhone2"));
			pstmt.setString(5, req.getParameter("inputPhone3"));
			pstmt.setString(6, req.getParameter("adress1"));
			pstmt.setString(7, req.getParameter("adress2"));
			pstmt.setString(8, req.getParameter("adress3"));
			pstmt.setString(9, req.getParameter("adress4"));
			pstmt.setString(10, req.getParameter("inputemail1"));
			pstmt.setString(11, req.getParameter("inputemail2"));
			pstmt.setString(12, req.getParameter("gender"));
			pstmt.setString(13, req.getParameter("prisite"));
			pstmt.setTimestamp(14, day);
			pstmt.setString(14, id);
			pstmt.executeUpdate();
			System.out.println("개인정보 업데이트 완료");
		}catch (Exception e) {
			System.out.println("개인정보 수정 오류");
			e.printStackTrace();
		}finally {
			try {				
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();	
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	}
	public String updateProfile(HttpServletRequest req,String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		java.util.Date utilDate = new java.util.Date();
		java.sql.Timestamp day = new java.sql.Timestamp(utilDate.getTime());
		System.out.println(day);
		try {
			con = DBConnection.getconn();
			sql="update member set profile=? where id=?";			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("str"));
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			System.out.println("프로필 업데이트 성공:"+req.getParameter("str"));
			return req.getParameter("str");			
		}catch (Exception e) {
			System.out.println("프로필 업데이트 오류");
			e.printStackTrace();
			
		}finally {
			try {				
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();	
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
	}
	
	
}