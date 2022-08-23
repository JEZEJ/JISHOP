<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h3>공지사항 등록</h3>
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
	<form action="<%=request.getContextPath()%>/admin/insertNoticeAction.jsp"
		method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea row="5" col="30" name="content" id="content"></textarea></td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>