<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="company.CompanyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="company" class="company.Company" scope= "page"/>
<jsp:setProperty name="company" property="companyName" />
<jsp:setProperty name="company" property="companyField" />
<jsp:setProperty name="company" property="companyWorkingHours" />
<jsp:setProperty name="company" property="companySalary" />
<jsp:setProperty name="company" property="companyContent" />
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

    		 {
    			 CompanyDAO companyDAO = new CompanyDAO();
    		    	
    		        int result = companyDAO.write(userID,
    		        		company.getCompanyName(),
    		        		company.getCompanyField(),
    		        		company.getCompanyWorkingHours(),
    		        		company.getCompanySalary(),
    		        		company.getCompanyContent());
    		        
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