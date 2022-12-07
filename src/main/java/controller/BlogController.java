package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.conf.ConnectionUrl.Type;

import model.dao.DAOBlogList;
import model.dao.DAOBoard;
import model.dto.DTOBlogList;
import model.dto.DTOBoard;
import model.dto.DTOPage;

public class BlogController extends HttpServlet{

	
	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		doPost(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		/*
		request.getContextPath() : 프로젝트명만 리턴
		예)  http://localhost:8080/project/list.jsp
			[return]/project 
			
		프로젝트 + 파일경로까지 가져옵니다.
		request.getRequestURI() 
		예)  http://localhost:8080/project/list.jsp
		[return]        /project/list.jsp  
 
		전체 경로를 가져옵니다. 
		request.getRequestURL()
		예) http://localhost:8080/project/list.jsp
		[return]   http://localhost:8080/project/list.jsp
 
		파일명만 가져옵니다.
		request.ServletPath() 
		예) http://localhost:8080/project/list.jsp
		[return] /list.jsp
 
		서버 or 로컬 웹 애플리케이션 절대경로 가져옵니다. 
		request.getRealPath() 
		예) http://localhost:8080/projectname/list.jsp
		[return]  c:\project\webapps\projectname\

	 */
	
		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		resp.setContentType("text/html; charset=utf-8");
		//서블릿 호출 명령
		//블로그메인
		if (command.equals("/BMain.do")) {//블로그 메인
			RequestDispatcher rd = req.getRequestDispatcher("/blog/BMain.jsp");
			rd.forward(req, resp);
		}else if(command.equals("/Myblog.do")) {//개인블로그 메인페이지
			getQuery(req);
			RequestDispatcher rd = req.getRequestDispatcher("/blog/Myblog.jsp");
			rd.forward(req, resp);
		}else if(command.equals("/BlogWrite.do")) {//글쓰기
			String thread =req.getParameter("Thread");			
			BoardWrite(req,resp,thread);			
		}else if(command.equals("/Bloglist.do")) {
			//DTOPage dp = new DTOPage(getCount("1"),3,Integer.parseInt(req.getParameter("PageNum")));//total,Amount,PageNum매게 변수를 가진 DTOPAGE
			/*
			 * int limit = null; try { if(limit==null) { limit = 0;
			 * Integer.parseInt(req.getParameter("command")); }
			 * 
			 * Integer.parseInt(req.getParameter("offset")); }catch (Exception e) { // TODO:
			 * handle exception }finally {
			 * 
			 * }
			 */
			
			//listA(req,3,getCount("1"));
			listA(req,Calp(req,getp(req),getCount("1"),3));
			listB(req,Calp(req,getp(req),getCount("2"),3));
			listC(req,Calp(req,getp(req),getCount("3"),3));
			RequestDispatcher rd = req.getRequestDispatcher("/blog/list.jsp");
			rd.forward(req, resp); 		
		}else if(command.equals("/BloglistCategory.do")) {
			String category = req.getParameter("category");		
			String search = req.getParameter("search");			
			
			if(category.equals("1")){
				if(search.equals("")) {listA(req,Calp(req,getp(req),getCount("1"),10));}
				else{listA(req,Calp(req,getp(req),getCountsaerch("1",search),10));}				
			}else if(category.equals("2")){
				if(search.equals("")) {listB(req,Calp(req,getp(req),getCount("2"),10));}
				else{listB(req,Calp(req,getp(req),getCountsaerch("2",search),10));}
			}else if(category.equals("3")){
				if(search.equals("")) {listC(req,Calp(req,getp(req),getCount("3"),10));}
				else{listC(req,Calp(req,getp(req),getCountsaerch("3",search),10));}
			}
			RequestDispatcher rd = req.getRequestDispatcher("/blog/listCategory.jsp");
			rd.forward(req, resp);			
		}else if(command.equals("/BoardUpdate.do")) {
			System.out.println("게시글 수정:servlet");
			updateBoard(req,resp);			
		}
				
	}
	public void updateBoard(HttpServletRequest req,HttpServletResponse resp) {
		DAOBoard d= DAOBoard.getInstence();		
		DTOBoard dto = new DTOBoard();
		String Thread = req.getParameter("Thread");
		String fid = Thread.substring(0,1);		
		String thread = Thread.substring(1,2);
		int bno = Integer.parseInt(req.getParameter("bno"));
		String id = req.getParameter("id");
		
		
		String href = "http://localhost:8080/Myblog.do?list="+Thread+"&bno="+bno+"&id="+id+"";
		System.out.println(href);
		System.out.println("게시글 수정:contorller");		
		System.out.println(fid);System.out.println(thread);
		dto.setBno(bno);
		dto.setId(id);
		dto.setSubject(req.getParameter("subjectForm"));
		dto.setComment(req.getParameter("commentForm"));
		dto.setCategory(req.getParameter("category"));
		dto.setGNS(req.getParameter("GNS"));
		dto.setFid(fid);
		dto.setThread(thread);		
		d.updateBoard(req,resp,dto,href);
		
	}
	
	public Integer getp(HttpServletRequest req) {
		int p = 0;
		try {
			String reqP = req.getParameter("P");
			System.out.println("reqP:"+reqP);
			if(reqP==null) {
				p=0;
			}else {
				p=Integer.parseInt(reqP);
			}
			System.out.println("reqBno:"+p);
			return p;
		}catch (Exception e) {
			System.out.println("쿼리 P 오류");
			e.printStackTrace();
		}
		System.out.println("page_num:"+p);
		return null;
	}
	public ArrayList<DTOPage> Calp(HttpServletRequest req,int p,int total,int Amount) {
		
		ArrayList<DTOPage> page = new ArrayList<DTOPage>();
		DTOPage dtop =new DTOPage(p,total,Amount);	
		page.add(dtop);
		req.setAttribute("page", page);
		
		
		return page;		
	}
	public void  BoardWrite(HttpServletRequest req,HttpServletResponse resp,String str) {
		DAOBoard dao = DAOBoard.getInstence();
		DTOBoard dto = new DTOBoard();
		String fid = str.substring(0,1);
		String thread = str.substring(1,2);
		
		dto.setId(req.getParameter("session_id"));
		dto.setSubject(req.getParameter("subjectForm"));
		dto.setComment(req.getParameter("commentForm"));
		dto.setCategory(req.getParameter("category"));
		dto.setGNS(req.getParameter("GNS"));
		dto.setFid(fid);
		dto.setThread(thread);
		dao.insertBoard(dto,resp,str);		
	}
	public Integer getCountblog(HttpServletRequest req) {
		DAOBoard dao = DAOBoard.getInstence();		
		int cnt = 0;
		try {
			dao.getCountblog(req);
			return cnt;
		}catch (Exception e) {
			System.out.println("count error");
			e.printStackTrace();
		}
				
		return null;
	}
	public Integer getCountsaerch(String category,String search) {
		System.out.println("countsearch:"+category);
		System.out.println("countsearch:"+search);
		DAOBoard dao = DAOBoard.getInstence();
		int cnt = dao.getCountSearch(category,search);
		return cnt;
	}
	public Integer getCount(String category) {
		DAOBoard dao = DAOBoard.getInstence();
		int cnt = 0; 
		try {
			cnt = dao.getCount(category);
			return cnt;
		}catch (Exception e) {
			System.out.println("count error");
			e.printStackTrace();
		}
				
		return null;
	}
	
	public void getboard(HttpServletRequest req,String id,ArrayList<DTOPage> page) {
		DAOBoard dao = new DAOBoard();
		ArrayList<DTOBoard> getlist= dao.getboard(req,id,page);
		/*for(DTOBoard l : getlist) {
			System.out.println(l);
		}*/
		req.setAttribute("boardlistAll", getlist);
	}
	
	public void getboardlist(HttpServletRequest req,String id,String fid,String thread,ArrayList<DTOPage> page) {
		DAOBoard dao = new DAOBoard();
		ArrayList<DTOBoard> getboardlist= dao.getboardlist(req, id, fid, thread,page);
		/*for(DTOBoard l : getboardlist) {
			System.out.println(l);
		}*/
		req.setAttribute("boardlist", getboardlist);
	}
	
	public void listA(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		DAOBoard dao = DAOBoard.getInstence();
		DTOPage p = new DTOPage();		
		
		ArrayList<DTOBoard> boardlist = dao.listA(req,page);
		
		req.setAttribute("blistA", boardlist);
				//new ArrayList<DTOBoard>();
		//boardlist.add(dao.listA(req,category,limit,offset));
	}
	public void listB(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		DAOBoard dao = DAOBoard.getInstence();
		DTOPage p = new DTOPage();		
		
		ArrayList<DTOBoard> boardlist = dao.listB(req,page);
		
		req.setAttribute("blistB", boardlist);
				//new ArrayList<DTOBoard>();
		//boardlist.add(dao.listA(req,category,limit,offset));
	}
	public void listC(HttpServletRequest req,ArrayList<DTOPage> page) {
		//,int limit,int offset
		DAOBoard dao = DAOBoard.getInstence();
		DTOPage p = new DTOPage();		
		
		ArrayList<DTOBoard> boardlist = dao.listC(req,page);
		
		req.setAttribute("blistC", boardlist);
				//new ArrayList<DTOBoard>();
		//boardlist.add(dao.listA(req,category,limit,offset));
	}
	
	
	public void getlist(HttpServletRequest req,String id) {
		DAOBlogList dao = DAOBlogList.getInstance();
		
		ArrayList<DTOBlogList> blist = dao.getBlogList(id);
		/*for(DTOBlogList d : blist) {
			System.out.println(d.getFid());
			System.out.println(d.getThread());
		}*/
		
		req.setAttribute("blList", blist);
		System.out.println("getlist");
		
	}
	
	public void getview(HttpServletRequest req ,int bno) {
		DAOBoard d = new DAOBoard();		
		System.out.println("getview");
		ArrayList<DTOBoard> view = d.getview(bno);
		int ref = 0;
		for(DTOBoard v : view) {
			ref = v.getRef();
			
			System.out.println("ref:"+ref);
		}
		d.refAdd(ref,bno);
		req.setAttribute("view", view);
	}
	public String QueryId(HttpServletRequest req) {
		String id = null;
		try {
			String reqid=req.getParameter("id");
			if(reqid==null) {
				id="noId";
			}else {
				id=reqid;
			}
			return id;
		}catch (Exception e) {
			System.out.println("쿼리 id 오류");
			e.printStackTrace();
		}
		return null;
	}
	public String QueryCategory(HttpServletRequest req) {
		String category = null;
		try {
			String reqcategory=req.getParameter("category");
			if(reqcategory==null) {
				category="noCategory";
			}else {
				category=reqcategory;
			}
			System.out.println("category:"+category);
			return category;
		}catch (Exception e) {
			System.out.println("쿼리 category 오류");
			e.printStackTrace();
		}
		return null;
	}
	public Integer Querybno(HttpServletRequest req) {
		int bno = 0;
		try {
			String reqBno = req.getParameter("bno");
			System.out.println("reqBno:"+reqBno);
			if(reqBno==null) {
				bno=0;
			}else {
				bno=Integer.parseInt(reqBno);
			}
			System.out.println("reqBno:"+bno);
			return bno;
		}catch (Exception e) {
			System.out.println("쿼리 bno 오류");
			e.printStackTrace();
		}
		return null;
	}
	
	public void getQuery(HttpServletRequest req) throws UnsupportedEncodingException {
		String list = req.getParameter("list");				
		String id = QueryId(req);
		int bno =Querybno(req);
		int p = getp(req);
		String category = QueryCategory(req);
		System.out.println("getP:"+p);
		System.out.println("getcountblog:"+getCountblog(req));
		
		if(!id.equals("noId")) {//블로그 메인 게시판 리스트
			System.out.println("블로그 id : "+id); 
			getlist(req,id);
		}
		if(bno!=0) {//특정 글 보기
			System.out.println(bno);
			getview(req,bno);
		}		
		if(list.equals("0")) {//전체 게시물 가져오기
			System.out.println(id);
			getboard(req,id,Calp(req,1,getCountblog(req),20));
			System.out.println("cnt:"+getCountblog(req));

		}else {//특정 게시판 게시물 가져오기
			String fid = list.substring(0,1);
			String thread = list.substring(1,2);
			System.out.println(fid);
			System.out.println(thread);
			getboardlist(req,id,fid,thread,Calp(req,1,getCountblog(req),20));
			System.out.println(fid+":fid / "+thread+":thread");
			
		
		}
		
		/* String query = req.getQueryString();
		 * String queryString = URLDecoder.decode(query, "UTF-8");
		 * int length = queryString.length();
		 * if(length > 7) {//2번째 쿼리
		 * 
		 * int index = queryString.indexOf("&");//list 다음 쿼리 String str =
		 * query.substring(index+1,length);
		 * //System.out.println("---------------------------");
		 * //System.out.println("list를 제외한 쿼리 : "+str); length = str.length();
		 * //System.out.println(str+"의 길이 : "+length);
		 * 
		 * int indexRs= str.indexOf("="); String strRs = str.substring(0,indexRs);
		 * //System.out.println("---------------------------");
		 * //System.out.println("list를 제외한 쿼리 이름 : "+strRs);
		 * 
		 * if(strRs.equals("id")){//parameta 값이 id 일때 id = req.getParameter("id");
		 * System.out.println("list를 제외한 쿼리 이름(id) : "+strRs+" 값 : "+id);
		 * getlist(req,id);
		 * 
		 * //System.out.println("---------------------------");
		 * 
		 * }else if(strRs.equals("bno")){//parameta 값이 bno 일때 bno =
		 * Integer.parseInt(req.getParameter("bno")); getview(req,bno);//게시글보기
		 * //System.out.println("---------------------------");
		 * //System.out.println("list를 제외한 쿼리 이름(bno) : "+strRs+" 값 : "+bno); } int
		 * indexNext = str.indexOf("&");//3쿼리여부 확인 없을시 return -1 String IN =
		 * String.valueOf(indexNext); System.out.printf("%s : 쿼리 여부\n",IN);
		 * 
		 * if(!IN.equals("-1")){//쿼리 3개 String nextquery =
		 * str.substring(indexNext+1,length);//list를 제외한 나머지 query
		 * 
		 * //System.out.println("---------------------------");
		 * //System.out.println("3쿼리 여부 : "+true);
		 * 
		 * int indexQuery = nextquery.indexOf("="); String nextqueryRs =
		 * nextquery.substring(0,indexRs-1);
		 * 
		 * if(nextqueryRs.equals("id")){//parameta 값이 id 일때 id = req.getParameter("id");
		 * System.out.println("3쿼리 id : "+id); getlist(req,id);
		 * 
		 * }else if(nextqueryRs.equals("bno")){//parameta 값이 bno 일때 bno =
		 * Integer.parseInt(req.getParameter("bno")); getview(req,bno);//게시글보기
		 * //System.out.println("3쿼리 bno : "+bno); } }else { System.out.println("쿼리 끝");
		 * } }
		 */
			
	}

	
	
	public void gettime(HttpServletRequest req,String regDate) {
		Date time=null;
		Date day_22=null;				

		//2일전 날짜
		Date today = new Date(); //오늘날짜
		Date day2 = new Date(today.getTime() - (long)(1000*60*60*24*2));//오늘 -2일
		SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd");
		String day_2 = bbb.format(day2);
		try {
			day_22 = new SimpleDateFormat("yyyy-MM-dd").parse(day_2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//리스트 입력날짜
		try {
			time = new SimpleDateFormat("yyyy-MM-dd").parse(regDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(time);
	}
		
	/*public void uploadAjaxPost(HttpServletRequest request) {		

		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		String today = sf.format(new Date());
		//첨부파일을 대입하기 위해 ArrayList 인스턴스 생성
		ArrayList<DTOPhoto> list = new ArrayList<>();
		String rootpath = request.getSession().getServletContext().getRealPath("/");
		String uploadFolderPath = rootpath+"file/resources/img/"+today;		
		
		File f = new File();
		
		Files[] files = MultipartRequest.getParameter("uploadFile");
		
		File uploadPath = new File(uploadFolderPath);		
		
		//만약 업로드 폴더가 존재하지 않으면 생성
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();MultipartFile[] uploadFile
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			//c:\\test\\image\\a.jpg
			//파일경로에서 파일명만 추출
			//Internet Explorer인 경우
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("업로드 파일명:" + uploadFileName);
			
			//p518 업로드 파일명을 AttachDTO에 대입
			attachDTO.setFileName(uploadFileName);
			
			//p511 파일 업로드시 파일명에 uuid 적용
			//uuid값을 랜덤으로 발생시켜 파일명에 적용
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			try {
				
				File saveFile = new File(uploadPath,uploadFileName);
				//c드라이브 upload 폴더에 저장 
				multipartFile.transferTo(saveFile);
				
				//p518 랜덤으로 발생된 uuid값을 AttachDTO 대입
				attachDTO.setUuid(uuid.toString());
				//업로드 파일 경로를 AttachDTO 대입
				attachDTO.setUploadPath(uploadFolderPath);
				
				//p514
				//만약에 업로드하는 파일이 이미지이면
				//썸네일 파일 자동으로 생성
				if(checkImageType(saveFile)) {
					
					//p518
					//업로드 파일이 이미지 인지 여부를 AttachDTO 대입
					attachDTO.setImage(true);
					
					//바이트 단위 출력 보조 스트림
					FileOutputStream thumbnail = 
						new FileOutputStream(
							//문자 단위 파일 기반 스트림	
							new File(uploadPath,"s_" + 
						             uploadFileName));
					//썸네일 크기 100px*100px으로 생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					thumbnail.close();
					
				}
				
				//p518 첨부파일을 ArrayList에 추가
				list.add(attachDTO);
				
			}catch(Exception e) {
				log.error(e.getMessage());
			}
		}//
		
		return new ResponseEntity<>(list,HttpStatus.OK);
	}*/
	
}

