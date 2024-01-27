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
		String userID1 	= null;
		String userID2 	= null;
		String userID3 	= null;
		String userID4 	= null;
		String userID5 	= null;
		int	donate1		= 0;
		int	donate2		= 0;
		int	donate3		= 0;
		int	donate4		= 0;
		int	donate5		= 0;
		
		
		
		PreparedStatement 	pstat1	= null;
		PreparedStatement 	pstat2	= null;
		PreparedStatement 	pstat3	= null;
		PreparedStatement 	pstat4	= null;
		PreparedStatement 	pstat5	= null;
		ResultSet			rs1		= null;
		ResultSet			rs2		= null;
		ResultSet			rs3		= null;
		ResultSet			rs4		= null;
		ResultSet			rs5		= null;
		
		String sql1 = "select userID, donateAmount from (select donateAmount, userID, rank() over (order by donateAmount desc) as ranking from mypage) a where a.ranking = 1";
		String sql2 = "select userID, donateAmount from (select donateAmount, userID, rank() over (order by donateAmount desc) as ranking from mypage) a where a.ranking = 2";
		String sql3 = "select userID, donateAmount from (select donateAmount, userID, rank() over (order by donateAmount desc) as ranking from mypage) a where a.ranking = 3";
		String sql4 = "select userID, donateAmount from (select donateAmount, userID, rank() over (order by donateAmount desc) as ranking from mypage) a where a.ranking = 4";
		String sql5 = "select userID, donateAmount from (select donateAmount, userID, rank() over (order by donateAmount desc) as ranking from mypage) a where a.ranking = 5";
		
		
		
		
		pstat1 = conn.prepareStatement(sql1);
		rs1 = pstat1.executeQuery();
		pstat2 = conn.prepareStatement(sql1);
		rs2 = pstat2.executeQuery();
		pstat3 = conn.prepareStatement(sql1);
		rs3 = pstat3.executeQuery();
		pstat4 = conn.prepareStatement(sql1);
		rs4 = pstat4.executeQuery();
		pstat5 = conn.prepareStatement(sql1);
		rs5 = pstat5.executeQuery();
		
		if (rs1.next()) {
			String first = rs1.getString("userID");
		}
		if (rs2.next()) {
			String second = rs2.getString("userID");
		}
		if (rs3.next()) {
			String third = rs3.getString("userID");
		}
		if (rs4.next()) {
			String forth = rs4.getString("userID");
		}
		if (rs5.next()) {
			String fifth = rs5.getString("userID");
		}
		rs1.close();
		pstat1.close();
		conn.close();
	%>
<jsp:forward page = "joinResult.jsp"/>
</body>
</html>