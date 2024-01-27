<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./intro.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
    <div class ="bkground">
        <div class ="top">  
            <a href="#">
                <img src ="./img/logo.png" class ="logo">
            </a>    
            <div class ="login">
                <img src ="./img/puppy.png" class = "puppy">
                 	<%
						String UserID = (String)session.getAttribute("userID");
					%>
                    <% if(UserID==null){ 
                    	%>
                    	<button class ="btn1" style ="top :5px; left : 80px;" onclick="location.href='login.jsp'"> 로그인 </button><br>
                    	<img src ="./img/paw.png"   class ="paw"> <button class ="btn1" style ="top :75px; left : 80px;" onclick="location.href='signup.jsp'"> 회원가입 </button>
                    	<%}else{  %>
                    		<button class ="btn1" style ="top :5px; left : 80px;" onclick="location.href='logout.jsp'"> 로그아웃 </button><br>
                    		<%=UserID %> <h2>님 어서오세요!</h2> <%
                    	}  %>
                </div>
        </div>  
        <div class = "btnzone">
            <button class ="btn2" style ="top :60px; left : 300px;" onclick="location.href='index.jsp'"> 홈 </button>
            <button class ="btn2" style ="top :60px; left : 630px;" onclick="location.href='intro.jsp'"> 소개 </button>
            <button class ="btn2" style ="top :60px; left : 960px;" onclick="location.href='parcel.jsp'"> 왈왈(분양소) </button>
        </div>
        <div class ="intro">
            <h1>소개글</h1>
            <div class ="introwriting">
                <h2> 저희 뎃꼬가!@ 에서는 사람들에게 버려지고 상처된 유기견들의 
                상처들을 치료해주고 새로운 가족을 찾아주는 일을 하고 있습니다.
                유기견들에게 손을 뻗고 싶지만 사정이 있어 안되게는 분들에게는
                기부 활동을 통해서도 도움을 받고 있으니, 저희 친구들이 새로운
                가족을 찾을 수 있도록 도움의 손길을 주시면 감사하겠습니다. </h2>
            </div>
        </div>
    </div>
    <div class = "bottom">
        <div class ="cpright">
            <h4>ⓒ2022. JeongSangYun allrights reserved</h4>
        </div>    
        <div class ="sns">
            <a href="http://facebook.com">
                <img src="./img/facebook.png">
            </a>

            <a href ="http://instagram.com">
                <img src="./img/instagram.png">
            </a>

            <a href ="http://twitter.com">
                <img src="./img/twitter.png">
            </a>
        </div>

    </div>
</body>
</html>