<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="./parcel.css">
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
        <div class ="content">
        <%
					PreparedStatement 	pstat	= null;
                    ResultSet rs = null;
                    String sql = "select * from parcelpage";
                    pstat = conn.prepareStatement(sql);
                    rs = pstat.executeQuery();
                    while (rs.next()) {
        %>
            <div class ="contents1">
                <div class ="headline">

                </div>
                <div class ="picture">
                    <img src="./fileSave/<%=rs.getString("ParcelFile") %>" class ="parcelimg">
                </div>
                <div class="introduce">
                    <table>
                       <th>
                        <tr>
                            <td>
                                <b>이름 :</b> 
                            </td>
                            <td>
                                <%=rs.getString("ParcelName") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>성별 :</b> 
                            </td>
                            <td>
                                <%=rs.getString("ParcelSex") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>나이 : </b>
                            </td>
                            <td>
                                <%=rs.getString("ParcelAge") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>성격 :</b> 
                            </td>
                            <td>
                                <%=rs.getString("ParcelChar") %>
                            </td>
                        </tr>
                       </th>
                      <% if(UserID!=null){ 
                    	%>
                       <form action ="ParcelGo.jsp">
                       		<input type ="hidden" value ="<%=rs.getString("ParcelCode")%>" name ="p_Code">
                       		<input type = "submit" value ="눈독들이기">
                       </form>
                       <% } %>
                    </table>
                </div>
            </div>
           <%} %> 
           <% if(UserID!=null){ 
                    	%>
              <div class = "contents1"> <button class = "btnAdd" onclick = "location.href ='datainput.jsp' " > + </button> </div>
            <%} %>
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