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
			System.out.println("?????? ?????????");			
			insertProduct(req);			
		}
	}
	//????????? ????????? ?????? ???????????? ??????
	public String mkdirFolder() {
		SimpleDateFormat dir = new SimpleDateFormat("yyyy");
		SimpleDateFormat dir2 = new SimpleDateFormat("MMdd");
		Date date = new Date();
		String dirDate = dir.format(date);
		String dirDate2 = dir2.format(date);
		String realFolderPath = "C:\\upload\\"+dirDate+"\\"+dirDate2+"";//????????? ??????
		File Folder = new File(realFolderPath);		
		// ?????? ??????????????? ???????????? ??????????????? ???????????????.
		if (!Folder.exists()) {
			try{
			    Folder.mkdir(); //?????? ???????????????.
			    System.out.println("????????? ???????????? : "+Folder);			    
			    return realFolderPath;
			    
	        }catch(Exception e){
			    e.getStackTrace();
			}        
         }else {
    	 System.out.println("?????? ????????? ???????????? ????????????.");
		}
		return realFolderPath;
		
	}
	//?????? ?????????
	public HashMap<String, Object> uploadfir(HttpServletRequest req, String realFolder) throws IOException {
		HttpSession session = req.getSession(true);
		//String realFolder = "C:\\upload";//????????? ??????
		String filepath = realFolder+"\\";//??????????????? ??????
		System.out.println("????????? ?????? ???????????? : "+filepath);
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	
		
		
		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,policy);
		
		Date asd = new Date();		
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMddHHmmss");
		String today=day.format(asd);
		
		Enumeration files = multi.getFileNames();	
		String profile = (String)files.nextElement();
		String profile_name = multi.getOriginalFileName(profile); //???????????? ?????? ?????????				
		String fileUploadName= today+profile_name;		
		File f = new File(filepath+profile_name); //???????????? ?????? ?????? 
		File r = new File(filepath+fileUploadName); 
		f.renameTo(r); //???????????? ????????? ??????			
		
		
		System.out.println("???????????? ?????? ?????????:"+profile_name);		
		System.out.println("????????? ????????????:"+r);	
		System.out.println("????????? ????????????:"+fileUploadName);
		
		
		
		 //JSONObject jObject = new JSONObject(jsonString);
	    // hashMap.put("filename", fileUploadName);
	    
	   // return JSONObject.fromObject(hashMap).toString();
		return null;
	}
	
	public void uploadfirTest(HttpServletRequest req, String realFolder) throws IOException {
		HttpSession session = req.getSession(true);
		//String realFolder = "C:\\upload";//????????? ??????
		String filepath = realFolder+"\\";//??????????????? ??????
		System.out.println("????????? ?????? ???????????? : "+filepath);
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	
		
		
		MultipartRequest multi = new MultipartRequest(req,realFolder,maxSize,encType,policy);
		
		Date asd = new Date();		
		SimpleDateFormat day = new SimpleDateFormat("yyyyMMddHHmmss");
		String today=day.format(asd);
		
		Enumeration files = multi.getFileNames();	
		String profile = (String)files.nextElement();
		String profile_name = multi.getOriginalFileName(profile); //???????????? ?????? ?????????				
		String fileUploadName= today+profile_name;		
		File f = new File(filepath+profile_name); //???????????? ?????? ?????? 
		File r = new File(filepath+fileUploadName); 
		f.renameTo(r); //???????????? ????????? ??????			
		
		
		System.out.println("???????????? ?????? ?????????:"+profile_name);		
		System.out.println("????????? ????????????,??????:"+r);	
		System.out.println("????????? ????????????:"+fileUploadName);
		
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
	//?????? ??????
	public void deleteprofile(HttpServletRequest req) {
		String str = req.getParameter("fileName");
		SimpleDateFormat dir = new SimpleDateFormat("yyyy");
		SimpleDateFormat dir2 = new SimpleDateFormat("MMdd");
		String realFolderPath = "C:\\upload\\'"+dir+"'\\'"+dir2+"'";//????????? ??????
		String path = realFolderPath+"\\'"+str+"'";
		System.out.println(path);
		
		Path filePath = Paths.get(path);
		try {
			if(str.equals("persion.jpg")) {
				System.out.println("???????????? ??????");
			}else {
				Files.deleteIfExists(filePath);
				System.out.println("???????????? delete:"+path);
			}
			
		}catch (Exception e) {
			System.out.println("?????? ????????? ??????");
			e.printStackTrace();
		}
		  
	}
	
	//DB??? ????????? ?????? ?????????
	public void DBupload(HttpServletRequest req) {
		DAOMember d = DAOMember.getInstance();
		HttpSession session = req.getSession(true);
		String session_id = (String)session.getAttribute("id");
		String profile=d.updateProfile(req,session_id);
		System.out.println("DB?????????:"+profile);
		
		session.removeAttribute("profile");
		session.setAttribute("profile", d.updateProfile(req,profile));
		
		
	}
}