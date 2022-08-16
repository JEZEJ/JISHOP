<%@page import="vo.Id"%>
<%@page import="service.SignService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <%
 
	//인코딩
	request.setCharacterEncoding("utf-8");
 
 	// 변수 받아오기
 	String ckId = request.getParameter("ckId");  
 
 	// 디버깅
 	System.out.println("회원가입할때 중복 검사로 넘어온 값 : " + ckId);
 
 	
 	// check 용 id 객체 만들기 	
 	Id ckid = new Id();
 	ckid.setId(ckId);

 	// SignService 객체 사용
 	SignService signService = new SignService(); 	 
 	
 	//String result1 =signService.idCheck(ckId);
 	//request.getParameter("result1");
 	
 	boolean result =signService.idCheck(ckId);
 	System.out.println(result +"<-result");		
 			
 	if(result == false ){ //아이디가 있을때 false	
 	// service -> false
 	response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?errorMsg=already exists Id");
 	// 													
 	}  else {
 	// service -> true
 	response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?ckId="+ckId);											
 	}
 %>