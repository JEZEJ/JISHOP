<%@page import="repository.CustomerDao"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 고객들이 로그인하면 여기로 넘어옴
// 직원들은 adminIndex로 넘어감

if (session.getAttribute("user") == null) { //user값이 null이라면 (session에 값이 없다면 login하지않은것)
	response.sendRedirect(request.getContextPath() + "/loginForm.jsp"); // 그럼 로그인을 위해서 로그인form으로 넘어감   
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/customerOne.jsp?customerId=<%=session.getAttribute("id")%>">회원정보</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/noticeList.jsp">공지사항</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/customerGoodsList.jsp">상품보기</a></li>
			<li class="nav-item active"><a class="nav-link" href="">구매내역</a>
			</li>
		</ul>
	</nav>
	<br />

	<p class="text-body"><%=session.getAttribute("name")%>(<%=session.getAttribute("id")%>)님 반갑습니다.</p>
	<!-- session에 받은 값들로 출력 -->
	<!-- 내가 쿼리에서 받아준값이 name이랑 id밖에 없으니깐 세션에 두개 저장해서 두개만 출력가능 -->

</body>
</html>