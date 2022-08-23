<%@page import="vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import = "service.*" %>


<%
	
	// 변수받아오기
	String Pass = request.getParameter("Pass");
	String employeeId = (String)session.getAttribute("id");
	
	// 디버깅
	System.out.println("비밀번호 : " + Pass);
	System.out.println("직원아이디 : " + employeeId);
	
	
	// Employee 객체 만들기
	Employee paramEmployee = new Employee();
	paramEmployee.setEmployeeId(employeeId);
	paramEmployee.setEmployeePass(Pass);
	
	
	// EmployeeService 객체 만들기
	EmployeeService employeeService = new EmployeeService();
	employeeService.removeEmployee(paramEmployee);
	
	
	response.sendRedirect(request.getContextPath()+"/logout.jsp");
	
%>