<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./signup.css">
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
        <h1>회  원  가  입</h1>
        <div class ="middle">
            <form action="joinform.jsp" method = "post" name = "frm">
            <div class="form">
                <input type="text" name="Name" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                    이름
                    </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="text" name="Id" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        아이디
                    </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="text" name="Birth" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        생년월일 (-제외 하고 8자리 기입)
                    </span>
                </label>
            </div>
            <br><br>
            
            <div class="form">
                <input type="password" name="Pw" autocomplete="off" required />
                <label for="text" class="label-name">
                <span class="content-name">
                    비밀번호
                </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="password" name="pwcheck" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        비밀번호 확인
                    </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="text" name="Email" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        E-mail
                    </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="text" name="Phone" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        전화번호
                    </span>
                </label>
            </div>
            <br><br>
            <div class="form">
                <input type="text" name="NickName" autocomplete="off" required />
                <label for="text" class="label-name">
                    <span class="content-name">
                        닉네임
                </span>
                </label>
            </div>
            <br><br>
            <input type="submit" name="" value ="회원 가입" class="signup">
            </form>
        </div>
    </div>
    <div class = "bottom">
        <div class ="cpright">
            <h3>ⓒ2022. JeongSangYun allrights reserved</h3>
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