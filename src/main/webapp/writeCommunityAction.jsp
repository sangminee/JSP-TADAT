<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="community.CommunityDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="community" class="community.Community" scope= "page"/>
<jsp:setProperty name="community" property="communityTitle" />
<jsp:setProperty name="community" property="communityContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 홈페이지</title>
</head>
<body>
    <%
    String userID =null;
    if(session.getAttribute("userID") != null){
    	userID = (String) session.getAttribute("userID");
    }
    
    if(userID == null){
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('로그인을 하세요.')");
    	script.println("location.href = 'login.jsp'");
    	script.println("</script>");
    }else{
    	if(community.getCommunityTitle() == null || community.getCommunityContent() == null){
    		    	PrintWriter script = response.getWriter();
    		    	script.println("<script>");
    		    	script.println("alert('입력이 안 된 사항이 있습니다.')");
    		    	script.println("history.back()");
    		    	script.println("</script>");	
    		    	
    		 }else
    		 {
    			 CommunityDAO communityDAO = new CommunityDAO();
    		    	
    		        int result = communityDAO.write(userID,
    		        		community.getCommunityTitle(),
    		        		community.getCommunityContent());
    		        
    		        if (result == -1){
    		        	PrintWriter script = response.getWriter();
    		        	script.println("<script>");
    		        	script.println("alert('글쓰기에 실패했습니다.')");
    		        	script.println("history.back()");
    		        	script.println("</script>");
    		        }else{
    		        	PrintWriter script = response.getWriter();
    		        	script.println("<script>");
    		        	script.println("location.href = 'community.jsp'");
    		        	script.println("</script>");
    		        }
    		    }
    }
    %>
</body>
</html>