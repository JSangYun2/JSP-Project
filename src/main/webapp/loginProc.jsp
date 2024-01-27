<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "swproject.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="swproject" class="swproject.userInfo" scope="page" />
<jsp:setProperty name = "swproject" property = "userID" />
<jsp:setProperty name = "swproject" property = "userPW" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
   <%
      UserDAO userDAO = new UserDAO();
      int result = userDAO.login(swproject.getUserID(), swproject.getUserPW()); 
      if (result == 1) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("location.href = 'index.jsp'");
         script.println("</script>");
         String id = request.getParameter("userID");
         session.setAttribute("userID",id);
      }
      else if (result == 0) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('비밀번호가 틀립니다.')");
         script.println("history.back()");         
         script.println("</script>");
      }
      else if (result == -1) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('존재하지 않는 아이디입니다.')");
         script.println("history.back()");         
         script.println("</script>");
      }
      else if (result == -2) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('데이터베이스 오류가 발생했습니다.')");
         script.println("history.back()");         
         script.println("</script>");
      }
   %>
</body>
</html>