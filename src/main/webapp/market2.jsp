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
		<h2>중고거래 글쓰기</h2>
		<form method="post" action="writeAction.jsp">
			<div class="form-group">
			
			<label for="title">글 제목</label> 
			<input type="text"
					class="form-control" id="title" placeholder="입력(4-100)"
					name="productTitle" maxlength="100" required="required" pattern=".{4,100}">
					
				<label for="title">카테고리</label> 
				<input type="text"
					class="form-control" id="title" placeholder="입력(4-100)"
					name="productCategory" maxlength="100" required="required" pattern=".{4,100}">
					
					
				<label for="title">가격</label> 
				<input type="text" class="form-control"
					id="title" placeholder=" 입력(4-100)" name="productPrice" maxlength="100"
					required="required" pattern=".{4,100}"> 
				
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="productContent"
					placeholder="삭제 되고 서비스 이용이 일정 기간 제한 될 수 있습니다.
    아래는 해당 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.
    *가품 및 판매 금지품목은 게시가 제한될 수 있습니다."></textarea>
    
    <input type="submit" value="등록하기" class="btn btn-primary form-control"  />

			</div>
		</form>
	</div>

	<div id="footer">
      <br>
    COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
  </div>
</body>
</html>