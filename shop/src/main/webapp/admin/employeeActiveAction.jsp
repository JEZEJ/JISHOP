<%@page import="service.EmployeeService"%>
<%@page import="vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");			

	String active = request.getParameter("active"); // select name= active값을 받아옴
	String employeeId = request.getParameter("employeeId"); // name값을 받아옴
	
	Employee employee = new Employee();
	EmployeeService employeeService = new EmployeeService();
	
	employee.setActive(active);
	employee.setEmployeeId(employeeId);
	
	int row = employeeService.EmployeeActive(employee);
	
	if(row != 0){
		
		response.sendRedirect(request.getContextPath()+"/admin/employeeManagement.jsp");
		
	} else {
		
		response.sendRedirect(request.getContextPath()+"/admin/employeeManagement.jsp");
	}

%>
