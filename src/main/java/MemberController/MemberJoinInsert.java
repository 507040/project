package MemberController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.DAOMember;
import model.dto.DTOMember;


@WebServlet("/join_insert")
public class MemberJoinInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberJoinInsert() {
        super();

    }    
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DTOMember m = new DTOMember();
		
		
		m.setId(request.getParameter("inputId"));
		m.setPass(request.getParameter("inputPassword"));
		m.setName(request.getParameter("inputname"));
		m.setNicname(request.getParameter("inputnicname"));
		m.setSecurity1(request.getParameter("securitynumber1"));
		m.setSecurity2(request.getParameter("securitynumber2"));
		m.setPhone1(request.getParameter("inputPhone1"));
		m.setPhone2(request.getParameter("inputPhone2"));
		m.setPhone3(request.getParameter("inputPhone3"));
		m.setAdress1(request.getParameter("adress1"));
		m.setAdress2(request.getParameter("adress2"));
		m.setAdress3(request.getParameter("adress3"));
		m.setAdress4(request.getParameter("adress4"));		
		m.setEmail1(request.getParameter("inputemail1"));
		m.setEmail2(request.getParameter("inputemail2"));		
		m.setGender(request.getParameter("gender"));		
		m.setPrisite(request.getParameter("prisite"));
		
		DAOMember insert = DAOMember.getInstance();
		insert.insertMember(m);		
		response.sendRedirect("/main");
		
	}

}
