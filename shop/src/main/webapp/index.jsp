<%@page import="repository.CustomerDao"%>
<%@page import="service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     
<%
 	// 고객들이 로그인하면 여기로 넘어옴
 	// 직원들은 adminIndex로 넘어감

   if(session.getAttribute("user") == null) { //user값이 null이라면 (session에 값이 없다면 login하지않은것)
      response.sendRedirect(request.getContextPath()+"/loginForm.jsp"); // 그럼 로그인을 위해서 로그인form으로 넘어감   
      return;
   }   
%>    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   
   <%=session.getAttribute("name") %>(<%=session.getAttribute("id") %>)님 반갑습니다. <!-- session에 받은 값들로 출력 -->
   <!-- 내가 쿼리에서 받아준값이 name이랑 id밖에 없으니깐 세션에 두개 저장해서 두개만 출력가능 -->
   
   <br>
   <a href="<%=request.getContextPath()%>/logout.jsp"> 로그아웃 </a>
   <!-- 로그아웃을 누르면 logout.jsp로 이동 -->
   <a href="<%=request.getContextPath()%>/customerOne.jsp?customerId=<%=session.getAttribute("id")%>">회원정보</a>
   <!-- 회원정보는 상세보기로 이동하기때문에 customerId값이 넘어가줘야함 (session에서 받은 내 아이디값이 넘어감) -->
   <a href="<%=request.getContextPath()%>/noticeList.jsp">공지사항</a>
   <!-- 손님이 보는 공지사항이기때문에 글추가 기능이 없음 그냥 보는용 -->
   <a href="<%=request.getContextPath()%>/customerGoodsList.jsp">상품보기</a>
   <a href="">구매내역</a>
   
</body>
</html>