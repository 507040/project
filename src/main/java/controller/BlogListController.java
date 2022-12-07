package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import model.dao.DAOBlogList;
import model.dao.DAOBoard;
import model.dto.DTOBlogList;
import model.dto.DTOBoard;


public class BlogListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("text/html; charset=utf-8");
	String RequestURI = req.getRequestURI();
	String contextPath = req.getContextPath();
	String command = RequestURI.substring(contextPath.length());
	
	if(command.equals("/addlist.bl")) {		
		String id = req.getParameter("id");
		String fid = req.getParameter("fid");
		String GNS = req.getParameter("GNS");
		System.out.printf("%s:아이디-%s:fid-%s:GNS",id,fid,GNS);
		System.out.println("addlist.bl");
		//HttpSession session = req.getSession(true); 
		String session_id = "test";		
		addlist(req,parametercheck(req,dbinAC(req)));	
		System.out.println("fidThread -- "+parametercheck(req,dbinAC(req)));
		/*HashMap<String, String> stra = new HashMap<String, String>();
		System.out.println("------------------------");
		System.out.println("GetBody"+getBody(req));
		System.out.println("------------------------");*/
        ArrayList<String> l = new ArrayList<String>();
        l.add(id);
        l.add(fid);
        l.add(GNS);
        req.setAttribute("listTest", l);
        req.getRequestDispatcher("error.jsp").forward(req, resp);
	}
	
	else if(command.equals("/deletelist.bl")) {
		String id = (String)req.getAttribute("blog_id");
		deletelist(req, id);
		RequestDispatcher rd = req.getRequestDispatcher("/blog/Myblog.jsp");
		rd.forward(req, resp);
	}
	
	else if(command.equals("/update.bl")) {
		String id = (String)req.getAttribute("blog_id");
		update(req, id);
		RequestDispatcher rd = req.getRequestDispatcher("/blog/Myblog.jsp");
		rd.forward(req, resp);
	}
	
	else if(command.equals("/getlist.bl")) {
		HttpSession session = req.getSession(true); 
		String session_id = (String)session.getAttribute("blog_id");
		System.out.println(session_id);
		
		getlist(req,req.getParameter("id"));//return (Arraylist<DTO>)blist; 
	}else if(command.equals("/error.bl")) {//개인블로그 메인페이지
		HttpSession session = req.getSession(true); 
		String session_id = "test";//(String)session.getAttribute("blog_id");
		System.out.println(session_id);
		
					
		getblist(req,session_id);//return (Arraylist<DTO>)blist; 
		RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
		rd.forward(req, resp); 		

	}	
	
}
	/*public void getboard(HttpServletRequest req,String id) {
		DAOBoard dao = new DAOBoard();
		ArrayList<DTOBoard> getlist= dao.getboard(req,id);
		/*for(DTOBoard l : getlist) {
			System.out.println(l);
		}
		req.setAttribute("boardlistAll", getlist);
	}
	
	public void getboardlist(HttpServletRequest req,String id,String fid,String thread) {
		DAOBoard dao = new DAOBoard();
		ArrayList<DTOBoard> getboardlist= dao.getboardlist(req, id, fid, thread);
		/*for(DTOBoard l : getboardlist) {
			System.out.println(l);
		}
		req.setAttribute("boardlist", getboardlist);
	}*/
	//배열형태 fid,thread 중복체크
	public String parametercheck(HttpServletRequest req,ArrayList<String> list) {	
		
		String id = "test";//req.getParameter("id");
		String fid = req.getParameter("fid");
		String thread = req.getParameter("thread");
		String AC;
		System.out.println(id);	
		boolean start = true;
		
		/*for(String i :list) {
			System.out.println(i);
			System.out.println(i.length());	
		}*/
		if(thread==null){//대분류 추가시
			AC = fid;
			boolean check = list.contains(fid);
			if(check!=true) {//중복없음
				list.add(fid);//list에 추가	
				System.out.println("중복 : "+check);
			}else {//중복있음
				/*for(String i :list) {
					System.out.println(i);
					System.out.println(i.length());
				}*/				
					int i =0;
					int ascii = 65;
					while(start){
						
						AC = String.valueOf((char)(ascii + i));//fid 'A'로 초기화
						
						boolean threadCheck = list.contains(AC);//fid 'A' 부터 다시 중복체그
						if(threadCheck!=true) {
							start = false;
						}
						i++;
						//System.out.println(AC);
					}			
					list.add(AC);//리스트에 추가
			}
		}else {//소분류 추가시
			AC = fid+thread;
			boolean check = list.contains(AC);
			if(check!=true) {//중복없음
				list.add(AC);//list에 추가
			}else {//중복있음
					int i =0;
					int ascii = 97;
					while(start){//thread 'a'로 초기화
						
						thread = String.valueOf((char)(ascii + i));
						AC = fid+thread;						
						
						boolean threadCheck = list.contains(AC);//thread 'a' 부터 다시 중복체그
						if(threadCheck!=true) {
							start = false;
						}
						i++;
					}			
					list.add(AC);//리스트에 추가
			}
		}		
		
		return AC;
		
	}
	//db에 등록된 fid,thread list형태로 저장
	public ArrayList<String> dbinAC(HttpServletRequest req) {
		DAOBlogList dao = DAOBlogList.getInstance();
		String id = req.getParameter("id");
		
		ArrayList<DTOBlogList> blist = dao.getBlogList(id);
		
		ArrayList<String> list = new ArrayList<String>();
		
		for(int i =0;i<blist.size();i++) {
			DTOBlogList d = (DTOBlogList)blist.get(i);		
			
			if(d.getThread().equals("1")) {
				String AC =d.getFid();
				System.out.println("thread null : "+AC);				
				list.add(AC);				
			}else {
				String AC =d.getFid()+d.getThread();
				System.out.println("thread : "+AC);				
				list.add(AC);
				
			}
		System.out.println("getbloglist");
			
		}		
		return list;		
	}
	
	
	
	//리스트 추가하기
	public void addlist(HttpServletRequest req,String AC) {		
		DTOBlogList dto = new DTOBlogList();
		DAOBlogList dao = DAOBlogList.getInstance();
		System.out.println("AC : "+AC);
		if(AC.length()<=1) {
			String fid = AC.substring(0,1);
			dto.setId("test");
			dto.setFid(fid);	
			dto.setGNS(req.getParameter("GNS"));
			System.out.println("---------대분류---------");
			//System.out.println(dto.getId());
			//System.out.println(dto.getFid());
			//System.out.println(dto.getGNS());
			
			
		}else {			
			String thread  = AC.substring(1,2);
			dto.setId("test");
			dto.setFid(req.getParameter("fid"));
			dto.setThread(thread);		
			dto.setGNS(req.getParameter("GNS"));
			
			
			System.out.println("---------소분류---------");
			//System.out.println(dto.getId());
			//System.out.println(dto.getFid());
		///	System.out.println(dto.getThread());
			///System.out.println(dto.getGNS());
		}
		
		dao.insertBlogList(dto);
		
	}
	//리스트 지우기
	public void deletelist(HttpServletRequest req, String id) {
		DAOBlogList dao = DAOBlogList.getInstance();
		DTOBlogList dto = new DTOBlogList();
		
		dto.setId(id);
		dto.setFid(req.getParameter("fid"));
		dto.setThread(req.getParameter("thread"));
		
		dao.deleteBlogList(dto);
	}
	//게시판 수정 바꾸기
	public void update(HttpServletRequest req, String id) {
		DAOBlogList dao = DAOBlogList.getInstance();
		DTOBlogList dto = new DTOBlogList();
		
		dto.setId(id);
		dto.setFid(req.getParameter("fid"));
		dto.setThread(req.getParameter("thread"));
		dto.setTitle(req.getParameter("title"));
		dto.setGNS(req.getParameter("GNS"));
		
		
		dao.updateBlogList(dto);
	}
	//게시판목록 가져오기
	public ArrayList<DTOBlogList> getlist(HttpServletRequest req,String id) {
		DAOBlogList dao = DAOBlogList.getInstance();
		
		ArrayList<DTOBlogList> notice = dao.getBlogList(id);		
		/*
		 * for (DTOBlogList b : blist) { System.out.println(b.getFid()+b.getThread());
		 * 
		 * 
		 * }
		 */
		System.out.println("getlist");
		return notice;
	}
	
	public void getblist(HttpServletRequest req,String id) {
		DAOBlogList dao = DAOBlogList.getInstance();
		
		ArrayList<DTOBlogList> blist = dao.getBlogList(id);
		/*for(DTOBlogList d : blist) {
			System.out.println(d.getFid());
			System.out.println(d.getThread());
		}*/
		
		req.setAttribute("blList", blist);
		System.out.println("getblist:BList");
		
	}
	 //Requestbody
	 public static String getBody(HttpServletRequest request) throws IOException {
		 
	        String body = null;
	        StringBuilder stringBuilder = new StringBuilder();
	        BufferedReader bufferedReader = null;
	 
	        try {
	            InputStream inputStream = request.getInputStream();
	            if (inputStream != null) {
	                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
	                    stringBuilder.append(charBuffer, 0, bytesRead);
	                }
	            }
	        } catch (IOException ex) {
	            throw ex;
	        } finally {
	            if (bufferedReader != null) {
	                try {
	                    bufferedReader.close();
	                } catch (IOException ex) {
	                    throw ex;
	                }
	            }
	        }
	 
	        body = stringBuilder.toString();
	        return body;
	    }
	
	
	

}
/* ---blog리스트------
 * 데이터 베이스 값 배열 로 가져 옴
 * 서블릿 배열 뿌림
 * 배열 돌림
 * 배열만큼 게시판 리스트 만듬
 *  
 */

/*----blog admin----
 * ~~리스트~~~
 * java에서 데이터 베이스 값 가져와서 배열에 담음
 * 버튼 누르면 modal창 show 게시판(대,소분류) 이름 쓰세요.
 * 
 * 버튼 클릭시 ajax값 서블릿에 넘김 중복없으면 추가함
 * 데이터베이스에 올림 column id,게시판 이름 fid thread GNS regdata updatedata;
 * ~~~리스트~~~~
 * */
 
