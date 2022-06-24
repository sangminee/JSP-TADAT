<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/community.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	<div class="container">
		<h2>기업 등록하기</h2>
		<form action="writeCommpanyAction.jsp" method="post">
			<div class="form-group">
			
			<label for="title">회사 명</label> 
			<input type="text"
					class="form-control" id="title" placeholder="입력(4-100)"
					name="companyName" maxlength="100" required="required" pattern=".{4,100}">
					
				<label for="title">모집 분야</label> 
			<input type="text"
					class="form-control" id="title" placeholder="입력(4-100)"
					name="companyField" maxlength="100" required="required" pattern=".{4,100}">

				<label for="title">근무시간</label> 
				<input type="text"
					class="form-control" id="title" placeholder=" 입력(4-100)"
					name="companyWorkingHours" maxlength="100" required="required" pattern=".{4,100}">

				<label for="title">월급</label> <input type="text"
					class="form-control" id="title" placeholder=" 입력(4-100)"
					name="companySalary" maxlength="100" required="required" pattern=".{4,100}">

					<label for="content">기업 소개</label>
				<textarea class="form-control" rows="5" id="content" name="companyContent"
					placeholder="기업을 소개해주세요. 허위사실이 발견 될 경우 문제가 발생할 수 있습니다."></textarea>
    
				 <input type="submit" value="등록하기" class="btn btn-primary form-control"  />
			</div>
		</form>
		</div>

<br><br><br><br><br><br><br><br><br><br>
		<div id="footer">
			<br> COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
		</div>
		
</body>
</html>