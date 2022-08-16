<%@page import="service.EmployeeService"%>
<%@page import="vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
	// 인코딩
	request.setCharacterEncoding("utf-8");
	
	// 변수 받아오기
	String employeeId = request.getParameter("employeeId");
	String employeePass = request.getParameter("employeePass");
	String employeeName = request.getParameter("employeeName");

	// Employee 객체 생성 후 값들 넣어주기	
	Employee paramEmployee = new Employee();
	paramEmployee.setEmployeeId(employeeId);
	paramEmployee.setEmployeePass(employeePass);
	paramEmployee.setEmployeeName(employeeName);
	
	
	// 디버깅
	System.out.println("내가 회원가입하기위해 입력한 값 : "+ paramEmployee);

	EmployeeService employeeService = new EmployeeService();
	employeeService.signInEmployee(paramEmployee);
	
	//회원가입이 완료되면 로그인폼으로 돌아가기
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");

%>