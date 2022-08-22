<%@page import="java.util.ArrayList"%>
<%@page import="vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="service.EmployeeService"%>
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

// 페이징
int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currenPage"));
}
final int ROW_PER_PAGE = 10;

EmployeeService employeeService = new EmployeeService();
List<Employee> list = new ArrayList<Employee>();
list = employeeService.getEmployeeList(ROW_PER_PAGE, currentPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원관리</title>
</head>
<body>
	<div>
		<h3>사원관리</h3>

		<div>
			<a href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a>
			<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a>
			<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
		</div>
		<br />
		<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>사원명</th>
					<th>사원등록일</th>
					<th>active</th>
					<th>active</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Employee e : list) {
				%>
				<tr>
					<td><%=e.getEmployeeId()%></td>
					<td><%=e.getEmployeeName()%></td>
					<td><%=e.getCreateDate()%></td>
					<td><%=e.getActive()%></td>
					<td>
						<form
							action="<%=request.getContextPath()%>/admin/employeeActiveAction.jsp"
							method="post">
							<input type="hidden" name="employeeId"
								value="<%=e.getEmployeeId()%>"> <select name="active">
								<%
								if (e.getActive().equals("N")) {
								%>
								<option>Y</option>
								<option selected="selected">N</option>
								<%
								} else {
								%>
								<option selected="selected">Y</option>
								<option>N</option>
								<%
								}
								%>
							</select>
							<button type="submit">변경</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>

		</table>
	</div>

</body>
</html>