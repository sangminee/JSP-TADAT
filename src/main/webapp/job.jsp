<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="company.CompanyDAO" %>
<%@ page import="company.Company" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/community.css">
<link rel="stylesheet" href="css/home.css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<title>JSP 홈페이지</title>
</head>
<body>
<% 
String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
int pageNumber = 1; // 기본 페이지
if(request.getParameter("pageNumber")!=null){
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<div class="menu-bar">     
        <div class="menu-bar-1">
            <div class="menu-bar__column">
                <span><a class="menuLink" href="home.jsp">
                    <img id="logoImg" src="img/finalLogo.png" width="100" height="50" >
                </a></span>
            </div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="community.jsp"><p>Community</p></a></span>
            </div>
            <div class="menu-bar__column"><span><p>|</p></span></div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="job.jsp"><p>Job</p></a></span>
            </div>
            <div class="menu-bar__column"><span><p>|</p></span></div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="market.jsp"><p>Market</p></a></span>
            </div>
        </div>

        <div class="menu-bar-2">
            <div class="menu-bar__column">
                <span><a class="menuLink" href="login.jsp"><p>Login</p></a></span>
            </div>
            <div class="menu-bar__column"><span><p>|</p></span></div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="join.jsp"><p>Join</p></a></span>
            </div>
            <% 
            if(userID != null){
            	
            %>
            <div class="menu-bar__column"><span><p>|</p></span></div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="myPage.jsp"><p>My</p></a></span>
            </div>
            <div class="menu-bar__column"><span><p>|</p></span></div>
            <div class="menu-bar__column">
                <span><a class="menuLink" href="logoutAction.jsp"><p>Logout</p></a></span>
            </div>
            <%
               }
            %>
        </div>  
        
    </div>
    <br><br><br>
    <div class="search-box">
            <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            <a class="search-btn" href="#">
              <!-- Seach Icon -->
              <i class="fas fa-search"></i>
            </a>
        </div>

        <header class="Community-header">
            <h1 class="Community-header_title">Job</h1>
            <p class="Community-header_text">일자리를 소개합니다!<br>
                이력서를 간편하게 등록할 수 있고, 기업정보를 쉽게 얻을 수 있습니다.</p>
                
                <input type="button" class="abcd-text" value="이력서쓰기" onclick="window.open('job1.jsp')"/>
                <input type="button" class="abcd-text" value="기업등록하기" onclick="window.open('job2.jsp')"/>
        </header>

    <!--   <div class="abcd-box">
            <input type="button" class="abcd-text" value="이력서쓰기" onclick="window.open('job1.jsp')"/>
            <input type="button" class="abcd-text" value="기업등록하기" onclick="window.open('job2.jsp')"/>
        </div> -->  
        
        <br><br>
<style>
table {
	margin: auto;
	width: 80%;
}
</style>
	<div class="containter">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">회사명</th>
						<th style="background-color: #eeeeee; text-align: center;">유저</th>
						<th style="background-color: #eeeeee; text-align: center;">모집분야</th>
						<th style="background-color: #eeeeee; text-align: center;">근무시간</th>
						
						<th style="background-color: #eeeeee; text-align: center;">월급</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">Date</th>
					</tr>
				</thead>
				<tbody>
				<% CompanyDAO companyDAO = new CompanyDAO(); 
				ArrayList<Company> list = companyDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
			
				%>
					<tr>
						<td><%= list.get(i).getCompanyID() %></td>
						<td><a href="view.jsp?companyID=<%= list.get(i).getCompanyID() %>"><%= list.get(i).getCompanyName() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getCompanyField() %></td>
						
						<td><%= list.get(i).getCompanyWorkingHours() %></td>
						<td><%= list.get(i).getCompanySalary() %></td>
						<td><%= list.get(i).getCompanyContent() %></td>
						<td><%= list.get(i).getCompanyDate().substring(0,11) 
						+ list.get(i).getCompanyDate().substring(11,13) +"시"
						+ list.get(i).getCompanyDate().substring(14,16)+"분"%></td>
					</tr>
					<% 
					}
					%>
				</tbody>
			</table>
			<%
			if(pageNumber != 1){
			
			%>
			<a href="job.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arrow-left"> 이전</a>
			<% 
			} if(companyDAO.nextPage(pageNumber+1)){

			%>
			<a href="job.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arrow-left"> 다음</a>
			<% }%>
		</div>
	</div>
        <div id="footer">
            <br>
          COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
        </div>
</body>
</html>