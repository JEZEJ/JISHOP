<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("user") == null) { 
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
			
		return;
	} 	
	// 로그인한 session이 없으면 loginForm.jsp를 보여줌
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<!-- 사원관리인 경우 관리자만 접속가능하게 설정 active권한이 Y여도 관리자(admin)가 아니면 접속 불가능 -->
		<%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>)님 반갑습니다
		<br>
		
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<!-- 상품목록/등록/수정/삭제(장바구니주문이 없는 경우)-->
			<li><a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li>
			<!-- 주문목록/수정 -->
			<li><a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></li>
			<!-- 고객목록/강제탈퇴/비밀번호수정(전달구현X) -->
			<li><a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a></li>
			<!-- 공지 CRUD -->
		</ul>
	</div>

</body>
</html>