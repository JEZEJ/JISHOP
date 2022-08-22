<%@page import="java.util.ArrayList"%>
<%@page import="vo.Customer"%>
<%@page import="java.util.List"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

//세션 관리자만 들어올수있게 하고싶음
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
</head>
<body>
	<h3>고객관리</h3>

	<div>
		<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a> <a
			href="<%=request.getContextPath()%>/admin/employeeManagement.jsp">사원관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
	</div>
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