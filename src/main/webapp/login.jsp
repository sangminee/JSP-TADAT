<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/login.css">
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
    <br><br><br><br><br>

    <header class="Welcome-header">
        <h1 class="Welcome-header_title">로그인</h1>
    </header>
    
	<div class="Loginmain">
		<form id="login-form1" action="loginAction.jsp" method="post">
			<input type="text" placeholder="ID" name="userID"  style="width:300px;"/> 
			<input
				type="password" placeholder="Password" name="userPassword"  style="width:300px;" /> 
				<input
				type="submit" value="Login" class="btn btn-primary form-control"  style="width:300px;"/>
		</form>
	</div>


	<div class="Login">
        <div class="Login-1">
           
            <div class="Login__column">
                <span><a class="LoginLink" href="join.jsp"><p>회원가입</p></a></span>
            </div>
        </div>  
    </div>

  <div id="footer">
      <br>
    COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
  </div>
</body>
</html>