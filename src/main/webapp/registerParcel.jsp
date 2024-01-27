<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import = "java.io.File" %>
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
		String folder = "/fileSave";
		String realPath = application.getRealPath(folder);
		int		max		= 10*1024*1024;
		
		request.setCharacterEncoding("utf-8");
		MultipartRequest mr = new MultipartRequest(request,realPath, max,"utf-8",new DefaultFileRenamePolicy());
		int p_Code		= Integer.parseInt(mr.getParameter("P_Code"));	
		String p_Name		= mr.getParameter("P_Name");
		String p_Sex		= mr.getParameter("P_Sex");
		int p_Age		= Integer.parseInt(mr.getParameter("P_Age"));
		String p_Char	= mr.getParameter("P_Char");
		String p_img	= mr.getFilesystemName("P_Img");
		
		PreparedStatement 	pstat	= null;
		ResultSet			rs		= null;
		
		String sql1 = "select * from parcelpage where Parcelcode = ?";
		String sql2 = "insert into parcelpage values (?,?,?,?,?,?)";
		
		int result	=0;
		
		pstat = conn.prepareStatement(sql1);
		pstat.setInt(1,p_Code);
		rs = pstat.executeQuery();
		
		if (rs.next()) {
			%>
			<script>
				alert("코드가 중복됩니다.");
				histroy.back();
			</script>
			<%
		} else {
			pstat = conn.prepareStatement(sql2);
			pstat.setInt(1,p_Code);
			pstat.setString(2,p_Name);
			pstat.setString(3,p_Sex);
			pstat.setInt(4,p_Age);
			pstat.setString(5,p_Char);
			pstat.setString(6,p_img);
			
			result = pstat.executeUpdate();
			
		}

		
		
		request.setAttribute("result", result);
		
		rs.close();
		pstat.close();
		conn.close();
	%>
	
	<jsp:forward page = "ParcelResult.jsp"></jsp:forward>
</body>
</html>