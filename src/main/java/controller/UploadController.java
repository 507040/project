package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.DAOBoard;
import model.dao.DAOMember;
import model.dao.DAOShop;
import model.dto.DTOShop;

public class UploadController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		resp.setContentType("text/html; charset=utf-8");
		if(command.equals("/profile.up")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/passMaching.jsp");
			rd.forward(req, resp);
		}else if(command.equals("/profile_process.up")) {
			uploadfir(req,mkdirFolder());
			resp.sendRedirect("/profile.up");
		}else if(command.equals("/profile_delete.up")) {
			deleteprofile(req);						
		}else if(command.equals("/profileDBupdate.up")) {
			DBupload(req);
			resp.sendRedirect("/");
			//RequestDispatcher rd = req.getRequestDispatcher("/");
			//rd.forward(req, resp);
		}else if(command.equals("/productInsert.up")||command.equals("/productInsert.json")) {
			System.out.println(command);
			uploadfirTest(req,mkdirFolder());
			//resp.sendRedirect("/");
			//RequestDispatcher rd = req.getRequestDispatcher("/");
			//rd.forward(req, resp);
		}else if(command.equals("/insertProduct.up")) {
			System.out.println("상품 업로드");			
			insertProduct(req);			
		}
	}
	//이미지 파일을 올릴 디렉토리 생성
	public String mkdirFolder() {
		SimpleDateFormat dir = new SimpleDateFormat("yyyy");
		SimpleDateFormat dir2 = new SimpleDateFormat("MMdd");
		Date date = new Date();
		String dirDate = dir.format(date);
		String dirDate2 = dir2.format(date);
		String realFolderPath = "C:\\upload\\"+dirDate+"\\"+dirDate2+"";//업로드 위치
		File Folder = new File(realFolderPath);		
		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //폴더 생성합니다.
			    System.out.println("생성된 디렉토리 : "+Folder);			    
			    return realFolderPath;
			    
	        }catch(Exception e){
			    e.getStackTrace();
			}        
         }else {
    	 System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		return realFolderPath;
		
	}
	//파일 업로드
	public HashMap<String, Object> uploadfir(HttpServletRequest req, String realFolder) throws IOException {
		HttpSession session = req.getSession(true);
		//String realFolder = "C:\\upload";//업로드 위치
		String filepath = realFolder+"\\";//업로드파일 위치
		System.out.println("업로드 파일 디렉토리 : "+filepath);
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	
		
		
		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,policy);
		
		Date asd = new Date();		
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMddHHmmss");
		String today=day.format(asd);
		
		Enumeration files = multi.getFileNames();	
		String profile = (String)files.nextElement();
		String profile_name = multi.getOriginalFileName(profile); //사용자가 올린 파일명				
		String fileUploadName= today+profile_name;		
		File f = new File(filepath+profile_name); //업로드된 파일 생성 
		File r = new File(filepath+fileUploadName); 
		f.renameTo(r); //업로드된 파일명 변환			
		
		
		System.out.println("사용자가 올린 파일명:"+profile_name);		
		System.out.println("변경된 파일이름:"+r);	
		System.out.println("저장된 파일이름:"+fileUploadName);
		
		
		
		 //JSONObject jObject = new JSONObject(jsonString);
	    // hashMap.put("filename", fileUploadName);
	    
	   // return JSONObject.fromObject(hashMap).toString();
		return null;
	}
	
	public void uploadfirTest(HttpServletRequest req, String realFolder) throws IOException {
		HttpSession session = req.getSession(true);
		//String realFolder = "C:\\upload";//업로드 위치
		String filepath = realFolder+"\\";//업로드파일 위치
		System.out.println("업로드 파일 디렉토리 : "+filepath);
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	
		
		
		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,policy);
		
		Date asd = new Date();		
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMddHHmmss");
		String today=day.format(asd);
		
		Enumeration files = multi.getFileNames();	
		String profile = (String)files.nextElement();
		String profile_name = multi.getOriginalFileName(profile); //사용자가 올린 파일명				
		String fileUploadName= today+profile_name;		
		File f = new File(filepath+profile_name); //업로드된 파일 생성 
		File r = new File(filepath+fileUploadName); 
		f.renameTo(r); //업로드된 파일명 변환			
		
		
		System.out.println("사용자가 올린 파일명:"+profile_name);		
		System.out.println("변경된 파일이름,경로:"+r);	
		System.out.println("저장된 파일이름:"+fileUploadName);
		
		session.removeAttribute("profile");
		session.setAttribute("profile", fileUploadName);
		req.setAttribute("profile", fileUploadName);
		
		HashMap<String, Object> jsonString = new HashMap<>();
		jsonString.put("fileProduct", fileUploadName);
		jsonString.put("filePath", filepath);
		
		JSONObject job = new JSONObject(jsonString);	
		System.out.println(job);		
		//return job;
	}
	//product insert
	public void insertProduct(HttpServletRequest req) {
		HttpSession session = req.getSession();
		DAOShop dao = new DAOShop();
		String category = req.getParameter("category");
		String pName=req.getParameter("Pname");
		SimpleDateFormat pid1 = new SimpleDateFormat("yyMMddhhmm");
		Date pday = new Date();
		String PidDay=pid1.format(pday);
		String pid=PidDay+category+pName;
		int price = Integer.parseInt(req.getParameter("price"));
		System.out.println("pid"+pid);
		System.out.println(price);
		
		DTOShop s = new DTOShop();
		s.setId((String)session.getAttribute("id"));
		s.setpId(pid);
		s.setpName(pName);
		s.setpContent(req.getParameter("content"));
		s.setpPrice(price);
		s.setCategory(category);
		s.setpInStork(Integer.parseInt(req.getParameter("instork")));
		s.setSale(0);
		dao.insertProduct(s);
		
	}
	//파일 삭제
	public void deleteprofile(HttpServletRequest req) {
		String str = req.getParameter("fileName");
		SimpleDateFormat dir = new SimpleDateFormat("yyyy");
		SimpleDateFormat dir2 = new SimpleDateFormat("MMdd");
		String realFolderPath = "C:\\upload\\'"+dir+"'\\'"+dir2+"'";//업로드 위치
		String path = realFolderPath+"\\'"+str+"'";
		System.out.println(path);
		
		Path filePath = Paths.get(path);
		try {
			if(str.equals("persion.jpg")) {
				System.out.println("선택파일 없음");
			}else {
				Files.deleteIfExists(filePath);
				System.out.println("선택파일 delete:"+path);
			}
			
		}catch (Exception e) {
			System.out.println("파일 지우기 오류");
			e.printStackTrace();
		}
		  
	}
	
	//DB에 이미지 파일 업로드
	public void DBupload(HttpServletRequest req) {
		DAOMember d = DAOMember.getInstance();
		HttpSession session = req.getSession(true);
		String session_id = (String)session.getAttribute("id");
		String profile=d.updateProfile(req,session_id);
		System.out.println("DB업로드:"+profile);
		
		session.removeAttribute("profile");
		session.setAttribute("profile", d.updateProfile(req,profile));
		
		
	}
}