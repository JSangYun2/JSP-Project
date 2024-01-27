<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		String userID		= request.getParameter("Id");
		int donateAmount = 0;
		String parcelCode = null;
		
		int result = 0;
		
		PreparedStatement 	pstat	= null;
		ResultSet			rs		= null;
		
		String sql1 = "select * from userInfo where userID = ?";
		String sql2 = "insert into mypage values (?,?,?)";
		
		
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1,userID);
		rs = pstat.executeQuery();
		
		if (rs.next()) {
			pstat = conn.prepareStatement(sql2);
			
			pstat.setString(1,userID);
			pstat.setInt(2,0);
			pstat.setString(3,null);
			
			result = pstat.executeUpdate();
		}
		rs.close();
		pstat.close();
		conn.close();
	%>
<jsp:forward page = "joinResult.jsp"/>
</body>
</html>