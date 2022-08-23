<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

		if(session.getAttribute("user") == null) { 
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
			
		return;
		} 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<h3>주문창</h3> 
	<!-- 고객이 원하는 물건을 주문할 수 있도록 만들어야함... -->
	<form action="<%=request.getContextPath()%>/customerOrdersAction.jsp" method="post">
		<table border="1">
			<tr>
				<td></td>
			</tr>
		</table>
	</form>
</body>
</html>