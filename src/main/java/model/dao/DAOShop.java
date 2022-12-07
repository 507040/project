package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import database.DBConnection;
import model.dto.DTOShop;

public class DAOShop {
	
	public void insertProduct(DTOShop d) {
		PreparedStatement pstmt =null;
		Connection con = null;
		String sql = null;
		try {
			con = DBConnection.getconn();
			sql="insert into product(pID,id,pName,pPrice,sale,pInStrok,pContent,category,pImg) values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getpId());
			pstmt.setString(2, d.getId());
			pstmt.setString(3, d.getpName());
			pstmt.setInt(4, d.getpPrice());
			pstmt.setInt(5, d.getSale());
			pstmt.setInt(6, d.getpInStork());
			pstmt.setString(7, d.getpContent());
			pstmt.setString(8, d.getCategory());
			pstmt.setString(9, "persion.jpg");
			pstmt.executeUpdate();
			System.out.println("상품등록 성공 : "+d.getpId());
		}catch (Exception e) {
			System.out.println("상품등록 오류");
			e.printStackTrace();
		}
	}

}
 