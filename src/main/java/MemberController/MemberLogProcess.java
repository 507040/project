package MemberController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBConnection;

@WebServlet("/Login_Process")
public class MemberLogProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberLogProcess() {
        super();        
    }
    
    
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(true);
		
		PreparedStatement pstmt=null;
		String sql=null;
		ResultSet rs=null;
		Connection conn=null;
		String URL = req.getParameter("URL");
		String query = req.getParameter("str");		
		String id= req.getParameter("id");
		String pass= req.getParameter("pass");
		String url_str=null;
		if(query==null) {
			url_str=URL;			
		}else {
			url_str = URL+query;
		}
		
		
		

		try{
			conn=DBConnection.getconn();	
			sql="select count(*)as cnt,id as id,nicname as nicname,level as level,profile as profile from member where id=? and pass=?";    				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			String nicname=null;
			String level=null;
			String profile=null;
			int count=0;
			if(rs.next()){
				count = rs.getInt("cnt");
				nicname = rs.getString("id");
				level = rs.getString("level");
				profile = rs.getString("profile");
			}
				
			if(count!=0){ 
				session.setAttribute("id", id);
				session.setAttribute("nicname", nicname);
				session.setAttribute("level", level);
				session.setAttribute("pass", pass);
				session.setAttribute("profile", profile);
				System.out.println("로그인성공 : " + session.getAttribute("id"));
				System.out.println("이동 할 주소 : "+url_str);
				resp.sendRedirect(url_str);//로그인요청을 누른 페이지로 이동
				
			}else {				
				resp.setCharacterEncoding("UTF-8");
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out2= resp.getWriter();
				try{					
					String str = "회원정보를 확인하세요.";	
					System.out.println("로그인실패");				
					out2.println("<script>");
					out2.println("alert('"+str+"');");
					out2.println("history.back()");
					out2.println("</script>");
					
				}catch (Exception e) {
					System.out.println("로그인 실패");
					e.printStackTrace();
				}finally {
					out2.close();
				}
				
			}
				
			
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}	
	}
					
}






