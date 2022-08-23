<%@page import="java.util.ArrayList"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//세션 관리자만 들어올수있게 하고싶음 <직원들 관리 페이지니깐 직원들도 못들어옴>
	if (session.getAttribute("id").equals("admin")) {
		System.out.println("관리자 접근 허용");
	} else {
		System.out.println("관리자 아님 접근 불가능");
		response.sendRedirect(request.getContextPath() + "/admin/adminIndex.jsp");
	
	}

	//페이징
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currenPage"));
	}
	final int ROW_PER_PAGE = 10;
	
	CustomerService customerService = new CustomerService();
	List<Customer> list = new ArrayList<Customer>();
	list = customerService.getCustomerList(ROW_PER_PAGE, currentPage);

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
	<h3>고객관리</h3>

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
	<br />
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>회원수정날짜</th>
				<th>회원가입날짜</th>
				<th>회원탈퇴</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Customer c : list) {
			%>
			<tr>
				<td><%=c.getCustomerId()%></td>
				<td><%=c.getCustomerName()%></td>
				<td><%=c.getCustomerAddress()%></td>
				<td><%=c.getCustomerTelephone()%></td>
				<td><%=c.getUpdateDate()%></td>
				<td><%=c.getCreateDate()%></td>
				<td><a href="<%=request.getContextPath()%>" class="button">탈퇴</a></td>
				<!-- 강제로 회원탈퇴해야함 -->
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

</body>
</html>