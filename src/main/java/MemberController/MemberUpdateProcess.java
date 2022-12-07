package MemberController;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import database.DBConnection;
import model.dao.DAOBoard;
import model.dao.DAOMember;

@WebServlet("/update_process")
public class MemberUpdateProcess extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		String id = (String)session.getAttribute("id");
		DAOMember d = DAOMember.getInstance();
		d.update(req,id);
		System.out.println("회원수정");
		resp.sendRedirect("/updateMember");		
	}
}
	
	
