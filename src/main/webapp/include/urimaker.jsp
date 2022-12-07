<%@page import="java.io.PrintWriter"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
    String URI = null;
	String query = null;
	String uri_str = null;
	
	try{
		URI = request.getRequestURI();
		//out.print(URI);
		query = request.getQueryString();
		if(URI.equals("/blog/listCategory.jsp")){
			URI="/BloglistCategory.do";			
		}else if(URI.equals("/blog/Myblog.jsp")){
			URI="/Myblog.do";
		}else if(URI.equals("/blog/BMain.jsp")){
			URI="/BMain.do";
		}else if(URI.equals("/shop/SMain.jsp")){
			URI="/SMain.pn";
		}
		/*else if(URI.equals("/blog/BMain.jsp")){
			URI="/BMain.do";
		}else if(URI.equals("/blog/BMain.jsp")){
			URI="/BMain.do";
		}else if(URI.equals("/blog/BMain.jsp")){
			URI="/BMain.do";
		}*/
		
		if(!URI.equals("/")||!URI.trim().equals("/")){	 
			if(query==null || query.equals("")||query.trim()==null||query.trim().equals("")){
				uri_str = URI;
			
			}else{								
				String queryString = URLDecoder.decode(query, "UTF-8");
				uri_str = URI + "?" + queryString;
			
			}
		}else{	
			uri_str = URI;
			
		}
		
		
	}catch(Exception e){
		e.getMessage();		
		//System.out.println(URI);
	}finally{
		//out.println("<script>alert('"+uri_str+"');</script>");
		
	}
 %>