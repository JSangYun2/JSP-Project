<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
			int p_Code = Integer.parseInt(request.getParameter("p_Code"));
			String userID = (String)session.getAttribute("userID");
	
                       		int result = 0;
                       		PreparedStatement 	pstat	= null;
                       		ResultSet rs = null;
                       		String sql1 = "select * from userInfo where userID = ?";
                       		String sql2 = "update mypage set parcelcode = ? where userID = ?";
                       		pstat = conn.prepareStatement(sql1);
                       		pstat.setString(1,userID);
                       		rs = pstat.executeQuery();
                       		
                       		if(rs.next()){
                       			try{
                       			pstat = conn.prepareStatement(sql2);
                       			pstat.setInt(1,p_Code);
                       			pstat.setString(2, userID);
                       			result = pstat.executeUpdate();
                       			} catch(Exception e){%>
                       			<script> alert("에러입니다!");
                       			history.go(-1);</script>
                       			<%}
                       		}
                       		
                       		request.setAttribute("result",result);
                       		
                       		rs.close();
                       		pstat.close();
                       		conn.close();
%>
<jsp:forward page = "goResult.jsp"/>
</body>
</html>