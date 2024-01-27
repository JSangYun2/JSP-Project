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
		String userID		= (String)session.getAttribute("userID");
		int donateAmount  	= Integer.parseInt(request.getParameter("donateAmount"));
		
		if(userID != null){
		
		PreparedStatement 	pstat	= null;
		PreparedStatement 	pstat2	= null;
		ResultSet			rs		= null;
		ResultSet			rs2		= null;
		
		String sql1 = "select * from userinfo where userID = ?";
		String sql2 = "update mypage set donateAmount = donateAmount + ? where userID =?";
		

		int result	=0;
		
		pstat = conn.prepareStatement(sql1);
		pstat.setString(1,userID);
		rs = pstat.executeQuery();
		
		if (rs.next()) {
			pstat = conn.prepareStatement(sql2);
			pstat.setInt(1,donateAmount);
			pstat.setString(2, userID);
			
			result = pstat.executeUpdate();
		} 
		
		
		rs.close();
		pstat.close();
		conn.close();
		
	%>

			<script type="text/javascript">
				alert("기부에 성공하셨습니다!@.");
				history.back();
			</script>
<% }else {
	%> <script type="text/javascript">
				alert("로그인을 해주세요.");
				history.back();
			</script>
		
<% }%>
</body>
</html>