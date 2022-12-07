package MemberController;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBConnection;
import model.dto.DTOMember;

@WebServlet("/updateMember")
public class MemberUpdate extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public MemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=req.getSession(true);
		String id = (String)session.getAttribute("id");
		
		getMember(req,id);//return arraylist 개인정보 
 		RequestDispatcher rd = req.getRequestDispatcher("/member/updateMember.jsp");
		rd.forward(req, resp);		
	}	
	
	
	public void getMember(HttpServletRequest req,String id) {
		ArrayList<DTOMember> memberlist = new ArrayList<DTOMember>();
		DTOMember d = new DTOMember();
		PreparedStatement pstmt=null;
		Connection con = null;
		String sql = null;
		ResultSet rs = null;
		
		try {
			 con = DBConnection.getconn();
			 sql="select * from member where id=?";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 d.setId(rs.getString("id"));
				 d.setName(rs.getString("name"));
				 d.setNicname(rs.getString("nicname"));
				 d.setPass(rs.getString("pass"));
				 d.setSecurity1(rs.getString("security1"));
				 d.setPhone1(rs.getString("phone1"));
				 d.setPhone2(rs.getString("phone2"));
				 d.setPhone3(rs.getString("phone3"));
				 d.setAdress1(rs.getString("adress1"));
				 d.setAdress2(rs.getString("adress2"));
				 d.setAdress3(rs.getString("adress3"));
				 d.setAdress4(rs.getString("adress4"));
				 d.setEmail1(rs.getString("email1"));
				 d.setEmail2(rs.getString("email2"));
				 d.setGender(rs.getString("gender"));
				 d.setPrisite(rs.getString("prisite"));
				 memberlist.add(d);
				 
			 }
			 req.setAttribute("list",memberlist);
			
		}catch (Exception e) {
			System.out.println("개인정보 불러오기");
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)rs.close();
				if(con!=null)rs.close();
			}catch (Exception e) {

			}
		}
		
	}
}
