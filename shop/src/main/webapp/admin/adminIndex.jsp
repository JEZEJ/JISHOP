<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
		if(session.getAttribute("user") != "Employee") { 
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
			
		return;
		} 
	// 로그인한 session이 없으면 loginForm.jsp를 보여줌
	// 로그인한 session이 회원session이면 admin부분은 접근 불가
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	 
	
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			
			</li>
		</ul>
	</nav>
			<p><%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>)님 반갑습니다</p>
		
			<!-- 사원관리인 경우 관리자만 접속가능하게 설정 active권한이 Y여도 관리자(admin)가 아니면 접속 불가능 -->
	
	

</body>
</html>
