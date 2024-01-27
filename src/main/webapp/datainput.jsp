<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
    <link rel="stylesheet" href="./datainput.css">
<!DOCTYPE html>
<html>
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
            <div class ="introwriting">
                <form action ="registerParcel.jsp" method ="post" enctype ="multipart/form-data">

                        <input class="form-control form-control-user" type="file" 
                        name="P_Img" id="product_image" onchange="setThumbnail(event);">

                    <div id="image_container" style ="background-color: white;"></div>
                
                    <input type = "numeber" class = "ParcelCode" placeholder = "코드" name = "P_Code"> <br>
                    <input type = "text" class = "ParcelName" placeholder="이름" name = "P_Name"><br>
                    <input type = "text" class = "ParcelSex" placeholder= "성별" name = "P_Sex"><br>
                    <input type = "text" class = "ParcelAge" placeholder= "나이" name = "P_Age"><br>
                    <input type = "text" class = "ParcelChar" placeholder= "특징"name = "P_Char"><br>
                    <input type = "submit" value ="등록하기" class = "btnsub">
                </form>
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
<script>
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "input-image");
			document.querySelector("div#image_container").appendChild(img);
		};
		
		reader.readAsDataURL(event.target.files[0]);
	}
	</script>
</html>