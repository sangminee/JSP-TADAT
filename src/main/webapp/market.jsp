<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="market.ProductDAO" %>
<%@ page import="market.Product" %>
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
            <input type="text" class="search-input" placeholder="  검색어를 입력하세요.">
            <a class="search-btn" href="#">
              <!-- Seach Icon -->
              <i class="fas fa-search"></i>
            </a>
        </div>
    <header class="Community-header">
        <h1 class="Community-header_title">Market</h1>
        <p class="Community-header_text">원하는 물건을 중고거래해요!<br>
            판매하고 싶은 제품을 등록해주세요.</p>          
       <input type="button" class="abcd-text" value="글쓰기" onclick="window.open('market2.jsp')"/>
    </header>

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
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">유저</th>
						<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
						
						<th style="background-color: #eeeeee; text-align: center;">가격</th>
						<th style="background-color: #eeeeee; text-align: center;">내용</th>
						<th style="background-color: #eeeeee; text-align: center;">Date</th>
					</tr>
				</thead>
				<tbody>
				<% ProductDAO productDAO = new ProductDAO(); 
				ArrayList<Product> list = productDAO.getList(pageNumber);
				for(int i=0; i<list.size(); i++){
			
				%>
					<tr>
						<td><%= list.get(i).getProductID() %></td>
						<td><a href="view.jsp?productID=<%= list.get(i).getProductID() %>"><%= list.get(i).getProductTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getProductCategory() %></td>
						
						<td><%= list.get(i).getProductPrice() %></td>
						<td><%= list.get(i).getProductContent() %></td>
						<td><%= list.get(i).getProductDate().substring(0,11) 
						+ list.get(i).getProductDate().substring(11,13) +"시"
						+ list.get(i).getProductDate().substring(14,16)+"분"%></td>
					</tr>
					<% 
					}
					%>
				</tbody>
			</table>
			<%
			if(pageNumber != 1){
			
			%>
			<a href="market.jsp?pageNumber=<%=pageNumber-1%>" class="btn btn-success btn-arrow-left"> 이전</a>
			<% 
			} if(productDAO.nextPage(pageNumber+1)){

			%>
			<a href="market.jsp?pageNumber=<%=pageNumber+1%>" class="btn btn-success btn-arrow-left"> 다음</a>
			<% }%>
		</div>
	</div>


	<div id="footer">
        <br>
      COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
    </div>
</body>
</html>