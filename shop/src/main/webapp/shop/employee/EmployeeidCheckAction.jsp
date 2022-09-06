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
 	
 	boolean result =signService.idCheck(ckId);
 	System.out.println(result +"<-result");		
 			

 	if(result == false ){
 		
 	//result값이 false일때 아이디값이 고객아이디나 직원아이디 아웃아이디에 데이터값이 남아있어서 아이디로 추가가 안됨
 	//result값이 true일때 아이디값 사용가능해서 회원가입 아이디값으로 넘어감

 	response.sendRedirect(request.getContextPath()+"/shop/employee/addEmployee.jsp?errorMsg=already exists Id");
 	// service -> false 														
 	}  else {
 	// service -> true
 	response.sendRedirect(request.getContextPath()+"/shop/employee/addEmployee.jsp?ckId="+ckId);
	
 	}
 
 
 
 
 
 %>