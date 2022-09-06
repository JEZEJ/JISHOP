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
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div>
		<h3>사원관리</h3>
		
		<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminIndex.jsp">홈으로</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminOrdersList.jsp">주문관리</a></li>
			<li class="nav-item active"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a>
			</li>
		</ul>
	</nav>

<table class="table">
    <thead class="thead-light">
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