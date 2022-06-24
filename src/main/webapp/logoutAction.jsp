<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 홈페이지</title>
</head>
<body>
    <%
    session.invalidate();  // 세션 해지
    %>
    <script>
    alert('로그아웃되었습니다.')
    location.href='home.jsp';</script>
</body>
</html>