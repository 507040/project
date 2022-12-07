package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShopController extends HttpServlet {

	/**
	 * 
	 */
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
		//서블릿 호출 명령
		//블로그메인
		if (command.equals("/SMain.pn")) {//shop메인}
			RequestDispatcher rd = req.getRequestDispatcher("/shop/SMain.jsp");
			rd.forward(req, resp);
		}else if (command.equals("/cart.pn")) {//cart 메인}
			RequestDispatcher rd = req.getRequestDispatcher("/shop/cartMain.jsp");
			rd.forward(req, resp);
		}else if (command.equals("/order.pn")) {//order 메인}
			RequestDispatcher rd = req.getRequestDispatcher("/shop/order.jsp");
			rd.forward(req, resp);
		}else if (command.equals("/productInsert.pn")) {//order 메인}
			
			RequestDispatcher rd = req.getRequestDispatcher("/shop/productInsert.jsp");
			rd.forward(req, resp);
		}
		
		
		
	}

}
