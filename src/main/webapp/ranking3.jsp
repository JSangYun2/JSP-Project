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
	
	<%=ranking[0] %>
	<%=rankingAmount[0] %>
	<%=ranking[1] %>
	<%=rankingAmount[1] %>
	<%=ranking[2] %>
	<%=ranking[3] %>

</body>
</html>