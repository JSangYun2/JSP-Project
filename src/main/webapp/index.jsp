<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import =  "java.sql.*" %>
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="./index.css">
    <link rel="script" href="./slide.js">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
        <div class ="ytubelnk">
            <div class ="ytubelink">
                <iframe width="1280" height="720" src="https://www.youtube.com/embed/ABbIhWljfLc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>

                </iframe>
            </div>
            <div class="ytubelink2">
                
            </div>
        </div>
        <div class ="donateDiv">
            <div class ="donateDiv1">
                        <!--contents-->
                            <div id="popup">
                                <div id="popmenu">
                                    <form action="donateProc.jsp">
                                        <input type="text" placeholder="기부 금액을 적어주세요!" class ="donateAmount" name = "donateAmount">
                                        <input type="submit" value ="기부하기" class="donateSubmit">
                                    </form>
                                     <div class="exit">닫기</div>
                                </div>
                            </div>
                         <!--contents-->
                         <button id="contents">기부하기</button>
            </div>
            <div class ="donateDiv2">
                <img src="./img/trophy.png" class ="trophy">
            </div>
<%
		request.setCharacterEncoding("utf-8");
		int	donate1		= 0;
		int	donate2		= 0;
		int	donate3		= 0;
		int	donate4		= 0;
		int	donate5		= 0;
		String first	= null;
		String second	= null;
		String third	= null;
		String forth	= null;
		String fifth	= null;
		
		
		
		PreparedStatement 	pstat	= null;
		ResultSet			rs1		= null;
		ResultSet			rs2		= null;
		ResultSet			rs3		= null;
		ResultSet			rs4		= null;
		ResultSet			rs5		= null;
		
		
		
		ResultSet rs[] 		= {rs1,rs2,rs3,rs4,rs5};
		String ranking[] 	= {first,second, third, forth, fifth};
		int	rankingAmount[] = {donate1,donate2,donate3,donate4,donate5};
		String sql = "select userID,donateAmount from (select @rownum:=@rownum+1 as ranking, userID,donateAmount from mypage where (@rownum:=0)=0 order by donateAmount desc)a where a.ranking= ?";	
		
		for(int i = 0; i<5; i++){
			
			try{
			pstat = conn.prepareStatement(sql);
			pstat.setString(1,Integer.toString(i+1));
			rs[i] = pstat.executeQuery();
			rs[i].next();
			ranking[i] = rs[i].getString("userID");
			rankingAmount[i] = rs[i].getInt("donateAmount");
			rs[i].close();
			} catch(SQLException e){
				ranking[i] = null;
				rankingAmount[i] = 0;
			}
		}
			
		
		pstat.close();
		conn.close();
%>
	
            <div class ="donateDiv3">
                <div class="ranking1">
					<b>1위 :<%=ranking[0] %> 님</b> <b><%=rankingAmount[0] %> 원</b>
                </div>
                <div class="ranking2">
                    <b>2위 : <%=ranking[1] %> 님</b> <b><%=rankingAmount[1] %> 원</b>
                </div>
                <div class="ranking3">
                    <b>3위 : <%=ranking[2] %> 님</b> <b><%=rankingAmount[2] %> 원</b>
                </div>
                <div class="ranking4">
                    <b>4위 : <%=ranking[3] %> 님</b> <b><%=rankingAmount[3] %> 원</b>
                </div>
                <div class="ranking5">
                    <b>5위 : <%=ranking[4] %> 님</b> <b><%=rankingAmount[4] %> 원</b>
                </div>
            </div>
        </div>
        <div class ="example">
            <div class = "example1">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
      <!-- 슬라이드 쇼 -->
                            <div class="carousel-item active">
        <!--가로-->
                                <img class="d-block w-100" src="./img/dog1.jpg" alt="First slide">
                                <div class="carousel-caption d-none d-md-block">
                                     <h5>TEST</h5>
                                     <p>testtesttest</p>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/dog2.jpg" alt="Second slide">
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>TEST</h5>
                                    <p>testtesttest</p>
                               </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="./img/dog3.jpg" alt="Third slide">
                                <div class="carousel-caption d-none d-md-block">
                                     <h5>TEST</h5>
                                     <p>testtesttest</p>
                                </div>
                            </div>    
                            <!-- / 슬라이드 쇼 끝 -->

                        <!-- 왼쪽 오른쪽 화살표 버튼 -->
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <!-- <span>Previous</span> -->
                        </a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <!-- <span>Next</span> -->
                        </a>
                        <!-- / 화살표 버튼 끝 -->
    
                        <!-- 인디케이터 -->
                        <ul class="carousel-indicators">
                            <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul>
    <!-- 인디케이터 끝 -->
                        </div>
                    </div>    
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

    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>

  	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    <script>

    //<![CDATA[

    $(document).ready(function() {

        $("#contents").click(function() {

            $("#popup").fadeIn();

        });

        $(".exit").click(function() {

            $("#popup").fadeOut();

        });

    });

    //]]>

    </script>

</body>
</html>