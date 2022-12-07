package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import database.DBConnection;
import model.dto.DTOBlogList;

public class DAOBlogList {
	
	private static DAOBlogList instance;
	
	private DAOBlogList() {}
	
	public static DAOBlogList getInstance() {
		//instance 최초 생성
		if(instance == null) {
			instance = new DAOBlogList();
		}
		
		return instance;
	}
	//블로그리스트만들기 추가하기
	public void insertBlogList(DTOBlogList bl) {
		PreparedStatement pstmt=null;
		Connection con = null;
		String sql=null;		
		try {
			con = DBConnection.getconn();
			if(bl.getThread()==null) {
				sql = "insert into bloglist(id,fid,GNS) values(?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bl.getId());
				pstmt.setString(2, bl.getFid());				
				pstmt.setString(3, bl.getGNS());
				pstmt.executeUpdate();
				System.out.println("insertBlogList(Fid)성공");				
			}else {
				sql = "insert into bloglist(id,fid,thread,GNS) values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bl.getId());
				pstmt.setString(2, bl.getFid());
				pstmt.setString(3, bl.getThread());
				pstmt.setString(4, bl.getGNS());
				pstmt.executeUpdate();
				System.out.println("insertBlogList(Thread)성공");
			}
			
			
			
		}catch (Exception e) {
			System.out.println("insertBlogList오류");
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
	//게시판 지우기
	public void deleteBlogList(DTOBlogList bl) {
		PreparedStatement pstmt=null;
		Connection con = null;
		String sql=null;
		//지울 게시판 전체글 지우기
		try {
			con = DBConnection.getconn();
			sql = "delete from board where id=? fid=?, thread=?";					
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bl.getId());
			pstmt.setString(2, bl.getFid());
			pstmt.setString(3, bl.getThread());
			
			pstmt.executeUpdate();
			System.out.println("deleteBlogList성공");
		}catch (Exception e) {
			System.out.println("bloglist:게시판 글 지우기 오류");
			e.printStackTrace();
		}finally {
			try {				
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();	
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		//게시판 지우기
		try {
			
			con = DBConnection.getconn();
			sql = "delete from bloglist where id=? fid=?, thread=?";					
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bl.getId());
			pstmt.setString(2, bl.getFid());
			pstmt.setString(3, bl.getThread());
			
			pstmt.executeUpdate();
			System.out.println("deleteBlogList2성공");
			
		}catch (Exception e) {
			System.out.println("insertBlogList오류");
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
	
	
	//게시판 수정
		public void updateBlogList(DTOBlogList bl) {
			PreparedStatement pstmt=null;
			Connection con = null;
			String sql=null;	
			try {
				
				con = DBConnection.getconn();
				sql = "update bloglist set title=?, GNS=? where id = ? ";					
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bl.getTitle());
				pstmt.setString(2, bl.getGNS());
				pstmt.setString(3, bl.getId());
				
				pstmt.executeUpdate();
				System.out.println("updateBlogList성공");
			}catch (Exception e) {
				System.out.println("insertBlogList오류");
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
	//게시판 리스트불러오기
	public ArrayList<DTOBlogList> getBlogList(String id) {
		PreparedStatement pstmt=null;
		Connection con = null;
		ResultSet rs = null;
		String sql=null;
		
		ArrayList<DTOBlogList> list = new ArrayList<>();
		try {
			
			con = DBConnection.getconn();
			sql = "select * from bloglist where id=? order by fid";					
			pstmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);	
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DTOBlogList dto = new DTOBlogList();

				dto.setId(rs.getString("id"));
				dto.setFid(rs.getString("fid"));
				dto.setThread(rs.getString("thread"));
				dto.setTitle(rs.getString("title"));
				dto.setGNS(rs.getString("GNS"));
				dto.setRegDate(rs.getString("regDate"));
				
				list.add(dto);
				
			}
			System.out.println("getBlogList성공");	
			return list;
		}catch (Exception e) {
			System.out.println("getBlogList오류");
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
