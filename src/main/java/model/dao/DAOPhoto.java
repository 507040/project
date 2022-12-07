package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.DBConnection;
import model.dto.DTOPhoto;

public class DAOPhoto {
	
	public static DAOPhoto instence;
	
	public DAOPhoto() {};
	
	public static DAOPhoto getInstence() {
		
		if(instence==null) {
			instence = new DAOPhoto();
		}
		return instence;
	}
	public void insertPhoto(DTOPhoto p) {
		
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		try {
			
			conn=DBConnection.getconn();
			sql="insert into board(bno,file_s,file_o,regDate) values(?,?,?,now())";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,p.getBno());
			pstmt.setString(2,p.getFile_s());
			pstmt.setString(3,p.getFile_o());						
			pstmt.executeUpdate();			
			
		}catch(Exception e){			
			System.out.println("photoDB 오류");
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
}

