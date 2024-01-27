<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${IdChk > 0 }">
			<script type="text/javascript">
				alert("이미 등록된 아이디입니다");
				location.href = "signup.jsp";
			</script>
		</c:when>
		<c:when test="${result > 0 }">
			<script type="text/javascript">
				alert("회원 가입이 완료되었습니다.");
				location.href = "login.jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0 }">
			<script type="text/javascript">
				alert("회원 가입에 실패 하였습니다. 다시 시도해 주세요.");
				location.href = "signup.jsp";
			</script>
		</c:when>
	</c:choose>
</body>
</html>