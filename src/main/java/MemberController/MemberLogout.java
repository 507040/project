package MemberController;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;


@WebServlet("/logout")
public class MemberLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberLogout() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		HttpSession session =request.getSession();
		session.invalidate();		
		
		String url = request.getParameter("URI");
		System.out.println("url:"+url);
		String str = request.getQueryString();
	 	String querystr=null;
		String URL= null;
		String str_url=null;
		try{
			if(url.equals("/")) {str_url="/";
				System.out.println("asd:"+str_url);
				response.sendRedirect(str_url);
			}else {
				int indexstr=str.lastIndexOf("?");
					if(indexstr != -1) {
				 	querystr = str.substring(indexstr,str.length());
				 	System.out.println(querystr);
				 	URL = str.substring(4,indexstr);
				 	System.out.println(URL);
				}else{
					URL = url;
			 		querystr="?";
			 	}
			 	
			 		
			 	
			 	str_url = URL+querystr;
			 	System.out.println("로그아웃:"+str_url);
			 	response.sendRedirect(str_url);
		 	}
			
		 	
		}catch(Exception e){
			e.printStackTrace();
			
		}	
		
		
		
	}

}
