<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- <h2 style="text-align:center">Slideshow Gallery</h2> -->

<div class="container">

  <div class="mySlides">
    <div class="numbertext">1 / 4</div>
    <img id="mainImg" src="img/home1.jpg" style="width:100%"height="100%" >
    <div class="contentText">
        <h1 id="mainTitle">TA-DAT</h1>
    <h3>타닷은 외국에 사는 한국인들을 위한 커뮤니티 시스템으로 <br>
        현지 정보 제공, 구인구직, 중고거래 서비스를 제공하고 있습니다.</h3>
    </div>
    
  </div>

  <div class="mySlides">
    <!-- <h3>나에게 딱맞는 일자리를 찾아봐요!</h3> -->
    <div class="numbertext">2 / 4</div>
    <img id="mainImg" src="img/jobb.png" style="width:100%" height="100%">
    <div class="contentText">
        <h1>혹시 지금 일자리가 필요한가요?</h1>
        <h3>나에게 딱맞는 일자리를 찾아봐요!</h3>
        <!-- <div class="contentButton"><a  href="job.html"><p>job</p></a></div>
        <div class="contentButton"><a  href="community.html"><p>Community</p></a></div> -->
    </div>

  </div>
  

  <div class="mySlides">
    <div class="numbertext">3 / 4</div>
    <img id="mainImg" src="img/home3.jpg" style="width: 100%;" height="100%">
    <div class="contentText">
        <h1>정확한 정보를 원하시나요?</h1>
        <h3>우리 지역의 소식을 가장 빨리 확인할 수 있습니다! </h3>
        <!-- <span class="contentButton"><a  href="job.html"><p>job</p></a></span>
        <span class="contentButton"><a  href="community.html"><p>Community</p></a></div> -->
    </div>
    
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 4</div>
    <img id="mainImg" src="img/home2.jpg" style="width:100%" height="100%">
    <div class="contentText">
        <h1>물건을 버리는 것도, 사는 것도 아까운사람?</h1>
    <h3>중고거래로 환경을 함께 지켜요! </h3>
    <!-- <div class="contentButton"><a  href="job.html"><p>job</p></a></div>
        <div class="contentButton"><a  href="community.html"><p>Community</p></a></div> -->
    </div>
    
  </div>
    
  <a class="prev" onclick="plusSlides(-1)">
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br>◀
    </a>
  <a class="next" onclick="plusSlides(1)">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>▶
</a>

  <div id="footer">
      <br>
    COPYRIGHTⓒ(C) MYONGJI UNIV. ALL RIGHTS RESERVED.
  </div>

  <script>
  var slideIndex = 1;
  showSlides(slideIndex);

  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  function currentSlide(n) {
    showSlides(slideIndex = n);
  }

  function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}

    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";
  }
  </script>

</body>
</html>