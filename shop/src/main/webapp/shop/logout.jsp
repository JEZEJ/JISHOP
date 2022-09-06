<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate(); // 세션에 값삭제
	// 로그아웃되니깐 세션값 삭제 후 loginForm으로 돌아감
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
%>
