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
		String userName		= request.getParameter("Name");
		int userBirth		= Integer.parseInt(request.getParameter("Birth"));	
		String userID		= request.getParameter("Id");
		String userPw		= request.getParameter("Pw");
		String userEmail	= request.getParameter("Email");
		int userPhone		= Integer.parseInt(request.getParameter("Phone"));
		String userNickName	= request.getParameter("NickName");
		
		
		PreparedStatement 	pstat	= null;
		ResultSet			rs		= null;
		
		String sql1 = "select * from userInfo where userID = ?";
		String sql2 = "insert into userinfo values (?,?,?,?,?,?,?)";
		
		int IdChk	=0;
		int result	=0;
		
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1,userID);
		rs = pstat.executeQuery();
		
		if (rs.next()) {
			IdChk = 1;
		} else {
			pstat = conn.prepareStatement(sql2);
			pstat.setString(1,userName);
			pstat.setInt(2,userBirth);
			pstat.setString(3,userID);
			pstat.setString(4,userPw);
			pstat.setString(5,userEmail);
			pstat.setInt(6,userPhone);
			pstat.setString(7,userNickName);
			
			result = pstat.executeUpdate();
			
		}

		
		
		request.setAttribute("result", result);
		request.setAttribute("IdChk", IdChk);
		
		rs.close();
		pstat.close();
		conn.close();
	%>
	<% if(IdChk == 1){ %>
	<jsp:forward page = "joinResult.jsp"/>
	<%}else { %>
	<jsp:forward page = "ParcelDBC.jsp"></jsp:forward>
	<%} %>
</body>
</html>