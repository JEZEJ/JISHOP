<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@page import="repository.CustomerDao"%>
<%@page import="service.CustomerService"%>
<%@page import="vo.Customer"%>
    
    
<%
        //인코딩
		request.setCharacterEncoding("utf-8");

        // 변수 받아오기 <loginForm text에 입력한 아이디 & 비밀번호 값 >
        String customerId = request.getParameter("customerId");
        String customerPass = request.getParameter("customerPass");    

        // 디버깅 --> 내가 로그인폼에 로그인하려고 입력한 값이 들어감
        System.out.println("고객아이디 : " + customerId);
        System.out.println("고객비밀번호 : " + customerPass);

        // Customer 객체 만들기 -- customer vo안에있는걸 쓰겠다
        Customer myCustomer = new Customer(); // 내가 위에서 입력한 값 넣어줌
        myCustomer.setCustomerId(customerId); // 입력한값을 set해줌
        myCustomer.setCustomerPass(customerPass); // 입력한값을 set해줌

        //CustomerService 객체 만들기
        CustomerService customerService = new CustomerService();
        // action에서 service호출하기 service에서는 -> dao호출      

        // 서비스 안에있는 (로그인) select Customer 메서드 사용
        Customer loginCustomer = customerService.loginCustomer(myCustomer);

        if (loginCustomer != null) { //로그인 성공!
        	System.out.println("로그인 성공 !"); // jsp는 세션선언 안해줘도 세션에 값 저장 가능
        	
        	session.setAttribute("user", "Customer"); //세션에 넣는거 
        	session.setAttribute("id", loginCustomer.getCustomerId());
        	session.setAttribute("name", loginCustomer.getCustomerName());
        	
        	// 로그인이 성공하면 index.jsp로 이동
        	response.sendRedirect(request.getContextPath() + "/index.jsp"); // 다이렉트
			
        } else { // 로그인 실패!
        	
        	System.out.println("로그인 실패 !");
        
			// 로그인 실패시 재로그인을 위해 loginForm.jsp로 이동
        	response.sendRedirect(request.getContextPath() + "/loginForm.jsp");

        }
        %>
