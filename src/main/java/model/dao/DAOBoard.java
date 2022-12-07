package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBConnection;
import model.dto.DTOBoard;
import model.dto.DTOPage;

public class DAOBoard {
	
	public static DAOBoard instence;
	
	public DAOBoard() {};
	
	public static DAOBoard getInstence() {
		
		if(instence==null) {
			instence = new DAOBoard();
		}
		return instence;
	}
	//게시글 등록
	public void insertBoard(DTOBoard b,HttpServletResponse resp,String str) {	
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		try {
			
			conn=DBConnection.getconn();
			sql="insert into board(id,subject,comment,category,regDate,GNS,fid,thread) values(?,?,?,?,now(),?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,b.getId());//글쓴이
			pstmt.setString(2,b.getSubject());//제목
			pstmt.setString(3,b.getComment());//내용
			pstmt.setString(4,b.getCategory());//카테고리
			
			/*mysql 테이블 regdate 컬럼 timestamp로 선언
			java.util.Date utilDate = new java.util.Date();
			java.sql.Timestamp sqlTS = new java.sql.Timestamp(utilDate.getTime());
			pstmt.setTimestamp(4,sqlTS);//등록시간*/
			
			pstmt.setString(5,b.getGNS());//글 등급
			pstmt.setString(6,b.getFid());//게시판 대분류
			pstmt.setString(7,b.getThread());//게시판 소분류
			pstmt.executeUpdate();			
			
			System.out.println(b.getId()+"글 등록");			
			System.out.println("str----"+str);
			
			resp.sendRedirect("/Myblog.do?list="+str+"&id="+b.getId());
			
		}catch(Exception e){			
			System.out.println("boardInsert 오류");
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
	//개인 블로그 메인 게시판 미 선택 시
	public ArrayList<DTOBoard> getboard(HttpServletRequest req,String id,ArrayList<DTOPage> page) {
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int limitStatr=0;
		int limitEnd=0;
		System.out.println(id);
		ArrayList<DTOBoard> boardlist = new ArrayList<DTOBoard>();
		for(DTOPage p : page) {
			limitStatr= p.getOffset();
			limitEnd = p.getLimit();
			
		}
		try {			
			
			conn=DBConnection.getconn();
			sql="select * from board where id=? order by regDate desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, limitEnd);
			pstmt.setInt(3, limitStatr);
			rs = pstmt.executeQuery();
			int i= 0;
			while(rs.next()) {
				DTOBoard b = new DTOBoard();
				b.setBno(rs.getInt("bno"));
				b.setId(rs.getString("id"));
				b.setSubject(rs.getString("subject"));
				b.setComment(rs.getString("comment"));
				b.setCategory(rs.getString("category"));
				b.setRegDate(rs.getString("regDate"));
				b.setRef(rs.getInt("ref"));
				b.setUp(rs.getInt("up"));
				b.setDown(rs.getInt("down"));
				b.setGNS(rs.getString("GNS"));
				b.setFid(rs.getString("fid"));
				b.setThread(rs.getString("thread"));
				i++;
				boardlist.add(b);
			}
			req.setAttribute("i", i);
			System.out.println(id+"블로그 전체 게시물 가져오기 **성공** 게시물 수 : "+i);
			return boardlist;
			
		}catch (Exception e) {
			System.out.println(id+"블로그 전체 게시물 가져오기**오류**");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		return null;
	}
	//개인 블로그 메인 게시판 선택 시
	public ArrayList<DTOBoard> getboardlist(HttpServletRequest req,String id,String fid,String thread,ArrayList<DTOPage> page) {
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int limitStatr=0;
		int limitEnd=0;
		System.out.println(id);
		ArrayList<DTOBoard> boardlist = new ArrayList<DTOBoard>();
		for(DTOPage p : page) {
			limitStatr= p.getOffset();
			limitEnd = p.getLimit();
		}
		
		try {			
			
			conn=DBConnection.getconn();
			sql="select * from board where id=? and fid=? and thread=? order by regDate desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, fid);
			pstmt.setString(3, thread);
			pstmt.setInt(4, limitEnd);
			pstmt.setInt(5, limitStatr);
			rs = pstmt.executeQuery();
			int i= 0;
			while(rs.next()) {
				DTOBoard b = new DTOBoard();
				b.setBno(rs.getInt("bno"));
				b.setId(rs.getString("id"));
				b.setSubject(rs.getString("subject"));
				b.setComment(rs.getString("comment"));
				b.setCategory(rs.getString("category"));
				b.setRegDate(rs.getString("regDate"));
				b.setRef(rs.getInt("ref"));
				b.setUp(rs.getInt("up"));
				b.setDown(rs.getInt("down"));
				b.setGNS(rs.getString("GNS"));
				b.setFid(rs.getString("fid"));
				b.setThread(rs.getString("thread"));
				boardlist.add(b);
				i++;
			}
			req.setAttribute("i", i);
			System.out.println(id+"블로그"+fid+thread+"리스트 게시물가져오기 **성공** 게시물 수 :"+i);
			return boardlist;
			
		}catch (Exception e) {
			System.out.println(id+"블로그"+fid+thread+"리스트 게시물가져오기 **오류**");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		return null;
	}
	public static String setDefault(HttpServletRequest req){//parameter null check
	String search=req.getParameter("search");
	//System.out.println("search : " + search + search.length());
	if(search.length()==0){
		search="nostr";
		return search;
	}else{
	return search;}
	}
	public static String setDefaultID(HttpServletRequest req){//parameter null check
	String id=req.getParameter("id");
	//System.out.println("search : " + search + search.length());
	if(id==null){
		id="noId";
		return id;
	}else{
	return id;}
	}
	
	//게시글 불러오기(카테고리A)
	public ArrayList<DTOBoard> listA(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		ArrayList<DTOBoard> listA = new ArrayList<DTOBoard>();
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int limitStatr=0;
		int limitEnd=0;
		String search = setDefault(req);
		String id = setDefaultID(req);
		System.out.println(search);
		System.out.println(id);
		int i =0;
		for(DTOPage p : page) {
			limitStatr= p.getOffset();
			limitEnd = p.getLimit();
			
		}
		try {			
			conn=DBConnection.getconn();
			if(!search.equals("nostr")||!search.trim().equals("nostr")) {//검색어 있음
				System.out.println("검색어있음");
				if(id.equals("noId")||id.trim().equals("noId")) {	//main
				sql="select * from board where category=? and (subject like ? or comment like ?) order by regDate desc limit ?,?";
					System.out.println("main");
					System.out.println(sql);
					System.out.println("search:"+search);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "1");				
					pstmt.setString(2, "%"+search+"%");
					pstmt.setString(3, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();
				}else {//blog
					sql="select * from board where category=? and id = ? and (subject like ? or comment like ?) order by regDate desc limit ?,?";
					System.out.println("blog");
					System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "1");
					pstmt.setString(2, id);
					pstmt.setString(3, "%"+search+"%");
					pstmt.setString(4, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();					
				}
			}else {//검색어 없음
				if(id.equals("noId")||id.trim().equals("noId")) {//main
					System.out.println("검색어 없음");
					sql="select * from board where category=? order by regDate desc limit ?,?";
						System.out.println("main");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "1");
						pstmt.setInt(2, limitStatr);
						pstmt.setInt(3, limitEnd);						
						rs = pstmt.executeQuery();
					}else {//blog
						sql="select * from board where category=? and id = ? order by regDate desc limit ?,?";
						System.out.println("blog");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "1");
						pstmt.setString(2, id);
						pstmt.setInt(3, limitEnd);
						pstmt.setInt(4, limitStatr);
						
						rs = pstmt.executeQuery();			
					}				
			}
			
			
			while(rs.next()) {
				DTOBoard dto = new DTOBoard();
				dto.setBno(rs.getInt("bno"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setCategory(rs.getString("category"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setRef(rs.getInt("ref"));
				dto.setUp(rs.getInt("up"));
				dto.setDown(rs.getInt("down"));
				dto.setGNS(rs.getString("GNS"));
				dto.setFid(rs.getString("fid"));
				dto.setThread(rs.getString("thread"));
				i++;
				listA.add(dto);				
			}
			System.out.println("dao"+i);
			return listA;
		}catch (Exception e) {
			System.out.println("listA오류");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		return null;
	}
	//게시글 불러오기(카테고리B)
	public ArrayList<DTOBoard> listB(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		ArrayList<DTOBoard> listB = new ArrayList<DTOBoard>();
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int limitStatr=0;
		int limitEnd=0;
		String search = setDefault(req);
		String id = setDefaultID(req);
		System.out.println(search);
		System.out.println(id);
		int i =0;
		for(DTOPage p : page) {
			limitStatr= p.getOffset();
			limitEnd = p.getLimit();
			
		}
		try {			
			conn=DBConnection.getconn();
			if(!search.equals("nostr")||!search.trim().equals("nostr")) {//검색어 있음
				System.out.println("검색어있음");
				if(id.equals("noId")||id.trim().equals("noId")) {	//main
				sql="select * from board where category=? and (subject like ? or comment like ?) order by regDate desc limit ?,?";
					System.out.println("main");
					System.out.println(sql);
					System.out.println("search:"+search);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "2");				
					pstmt.setString(2, "%"+search+"%");
					pstmt.setString(3, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();
				}else {//blog
					sql="select * from board where category=? and id = ? and (subject like ? or comment like ?) order by regDate desc limit ?,?";
					System.out.println("blog");
					System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "2");
					pstmt.setString(2, id);
					pstmt.setString(3, "%"+search+"%");
					pstmt.setString(4, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();					
				}
			}else {//검색어 없음
				if(id.equals("noId")||id.trim().equals("noId")) {//main
					System.out.println("검색어 없음");
					sql="select * from board where category=? order by regDate desc limit ?,?";
						System.out.println("main");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "2");
						pstmt.setInt(2, limitEnd);
						pstmt.setInt(3, limitStatr);						
						rs = pstmt.executeQuery();
					}else {//blog
						sql="select * from board where category=? and id = ? order by regDate desc limit ?,?";
						System.out.println("blog");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "2");
						pstmt.setString(2, id);
						pstmt.setInt(4, limitEnd);
						pstmt.setInt(5, limitStatr);
						
						rs = pstmt.executeQuery();			
					}				
			}
			
			
			while(rs.next()) {
				DTOBoard dto = new DTOBoard();
				dto.setBno(rs.getInt("bno"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setCategory(rs.getString("category"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setRef(rs.getInt("ref"));
				dto.setUp(rs.getInt("up"));
				dto.setDown(rs.getInt("down"));
				dto.setGNS(rs.getString("GNS"));
				dto.setFid(rs.getString("fid"));
				dto.setThread(rs.getString("thread"));
				i++;
				listB.add(dto);				
			}
			System.out.println("dao"+i);
			return listB;
		}catch (Exception e) {
			System.out.println("listB오류");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		return null;
	}
	//게시글 불러오기(카테고리C)
	public ArrayList<DTOBoard> listC(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		ArrayList<DTOBoard> listC = new ArrayList<DTOBoard>();
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int limitStatr=0;
		int limitEnd=0;
		String search = setDefault(req);
		String id = setDefaultID(req);
		System.out.println(search);
		System.out.println(id);
		int i =0;
		for(DTOPage p : page) {
			limitStatr= p.getOffset();
			limitEnd = p.getLimit();
			
		}
		System.out.println("fir:"+limitStatr);
		System.out.println("end:"+limitEnd);
		try {			
			conn=DBConnection.getconn();
			if(!search.equals("nostr")||!search.trim().equals("nostr")) {//검색어 있음
				System.out.println("검색어있음");
				if(id.equals("noId")||id.trim().equals("noId")) {	//main
				sql="select * from board where category=? and (subject like ? or comment like ?) order by regDate desc limit ?,?";				
					System.out.println("main");
					System.out.println(sql);
					System.out.println("search:"+search);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "3");				
					pstmt.setString(2, "%"+search+"%");
					pstmt.setString(3, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();
				}else {//blog
					sql="select * from board where category=? and id = ? and (subject like ? or comment like ?) order by regDate desc limit ?,?";
					System.out.println("blog");
					System.out.println(sql);
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "3");
					pstmt.setString(2, id);
					pstmt.setString(3, "%"+search+"%");
					pstmt.setString(4, "%"+search+"%");
					pstmt.setInt(4, limitEnd);
					pstmt.setInt(5, limitStatr);
					rs = pstmt.executeQuery();					
				}
			}else {//검색어 없음
				if(id.equals("noId")||id.trim().equals("noId")) {//main
					System.out.println("검색어 없음");
					sql="select * from board where category=? order by regDate desc limit ?,?";
						System.out.println("main");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "3");
						pstmt.setInt(2, limitEnd);
						pstmt.setInt(3, limitStatr);						
						rs = pstmt.executeQuery();
					}else {//blog
						sql="select * from board where category=? and id = ? order by regDate desc limit ?,?";
						System.out.println("blog");
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "3");
						pstmt.setString(2, id);
						pstmt.setInt(3, limitEnd);
						pstmt.setInt(4, limitStatr);
						
						rs = pstmt.executeQuery();			
					}				
			}
			
			
			while(rs.next()) {
				DTOBoard dto = new DTOBoard();
				dto.setBno(rs.getInt("bno"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setCategory(rs.getString("category"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setRef(rs.getInt("ref"));
				dto.setUp(rs.getInt("up"));
				dto.setDown(rs.getInt("down"));
				dto.setGNS(rs.getString("GNS"));
				dto.setFid(rs.getString("fid"));
				dto.setThread(rs.getString("thread"));
				i++;
				listC.add(dto);				
			}
			System.out.println("dao"+i);
			return listC;
		}catch (Exception e) {
			System.out.println("listA오류");
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
			
		}
		return null;
	}
	//전체 게시물 수
	public Integer getCount(String category) {
		
		PreparedStatement pstmt=null;
		System.out.println("categoty:"+category);
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int cnt=0;			
		try {			
			conn=DBConnection.getconn();
			sql="select count(*) from board where category=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);				
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println("전체 게시물 수 " + cnt);
			return cnt;				
		}catch (Exception e) {
			System.out.println("게시물 수 가져오기 오류");
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
		
	}
	//검색어 전체 게시물 수
		public Integer getCountSearch(String category,String search) {
		
		PreparedStatement pstmt=null;
		System.out.println("categoty:"+category);
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int cnt=0;			
		try {			
			conn=DBConnection.getconn();
			sql="select count(*) from board where category=? and (subject like ? or comment like ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);				
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println("검색 전체 게시물 수 " + cnt);
			return cnt;				
		}catch (Exception e) {
			System.out.println("검색 게시물 수 가져오기 오류");
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
		
	}
	//전체 개인 블로그 게시물 수
	public Integer getCountblog(HttpServletRequest req) {
		
		PreparedStatement pstmt=null;		
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;
		int cnt=0;		
		String fid = null;
		String thread = null;		
		String list = req.getParameter("list");
		try {
			conn=DBConnection.getconn();
			if(list.equals("0")) {
				sql="select count(*) from board where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, req.getParameter("id"));								
				rs = pstmt.executeQuery();
			}else {
				fid = list.substring(0,1);
				thread = list.substring(1,2);
				sql="select count(*) from board where id=? and fid=? and thread=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, req.getParameter("id"));
				pstmt.setString(2, fid);				
				pstmt.setString(3, thread);				
				rs = pstmt.executeQuery();
			}
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			System.out.println("블로그 게시물 수 " + cnt);
			return cnt;				
		}catch (Exception e) {
			System.out.println("블로그 게시물 수 가져오기 오류");
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
		
	}

	//특정 게시물 자세히 보기
	public ArrayList<DTOBoard> getview(int bno) {
		ArrayList<DTOBoard> view = new ArrayList<DTOBoard>();
		PreparedStatement pstmt=null;
		String sql = null;
		Connection conn = null;
		ResultSet rs = null;			
		try {			
			conn=DBConnection.getconn();
			sql="select * from board where bno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DTOBoard dto = new DTOBoard();
				dto.setBno(rs.getInt("bno"));
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setCategory(rs.getString("category"));
				dto.setRegDate(rs.getString("regDate"));
				dto.setRef(rs.getInt("ref"));
				dto.setUp(rs.getInt("up"));
				dto.setDown(rs.getInt("down"));
				dto.setGNS(rs.getString("GNS"));
				dto.setFid(rs.getString("fid"));
				dto.setThread(rs.getString("thread"));					
				view.add(dto);				
			}
			return view;
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();	
				if(rs != null) rs.close();
			}catch(Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
		return null;
		
	}
	public void refAdd(int ref,int bno) {
		PreparedStatement pstmt = null;
		Connection con = null;
		String sql = null;
		ref++;
		try {
			con = DBConnection.getconn();
			sql = "update board set ref = ? where bno = ?";
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, bno);
			pstmt.executeUpdate();
			System.out.println("조회수:"+ref);
		}catch (Exception e) {
			System.out.println("조회수 추가 오류");
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
	public void updateBoard(HttpServletRequest req,HttpServletResponse resp,DTOBoard d,String href) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		java.util.Date utilDate = new java.util.Date();
		java.sql.Timestamp day = new java.sql.Timestamp(utilDate.getTime());
		System.out.println(day);
		try {
			con = DBConnection.getconn();
			sql="update board set "
				+ "subject=?,"
				+ "comment=?,"
				+ "category=?,"
				+ "updateDate=?, "
				+ "GNS=?,"
				+ "fid=?,"
				+ "thread=?"				
				+ "where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getSubject());
			pstmt.setString(2, d.getComment());
			pstmt.setString(3, d.getCategory());
			pstmt.setTimestamp(4, day);
			pstmt.setString(5, d.getGNS());
			pstmt.setString(6, d.getFid());
			pstmt.setString(7, d.getThread());			
			pstmt.setInt(8, d.getBno());
			pstmt.executeUpdate();
			System.out.println("수정완료 bno:"+d.getBno());
			System.out.println(href);
			resp.sendRedirect(href);
			
		}catch (Exception e) {
			System.out.println("게시물 수정 오류");
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
		
}

