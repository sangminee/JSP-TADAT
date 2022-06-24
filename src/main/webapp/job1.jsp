<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/community.css">
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/job1.css">
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
		<h2>이력서 작성하기</h2>
		<form action="write.jsp" method="post">
			<div class="whole">
				<div class="FORM">
					<div class="title">글 제목</div>

					<div id="abcd1">
						<input type="text" placeholder="이름" /> 
						<input type="text" placeholder="지원분야" /> 
						<input type="text" placeholder="경력" /> 
						<input type="text" placeholder="나이" /> 
						<input type="text" placeholder="학력" /> 
						<input type="text" placeholder="자격증" />
					</div>

					<div id="abcd2">
						<input type="file" value="파일 첨부" name="file" />
					</div>

					<div id="abcd3">
						<table>+ 사진 첨부</table>
					</div>

					<div id="abcd4">
						<input type="text" maxlength="100" placeholder="삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다." />
					</div>

					<div id="abcd5">
						<button type="submit" class="btn btn-default">지원하기</button>
					</div>

				</div>
			</div>
		</form>
	</div>

<br><br><br><br><br><br><br><br><br><br>

</body>
</html>