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
		<c:when test="${result > 0 }">
			<script type="text/javascript">
				alert("눈독 들이기가 완료되었습니다.");
				location.href = "parcel.jsp";
			</script>
		</c:when>
		<c:when test="${result <= 0 }">
			<script type="text/javascript">
				alert("강아지가 뿌리쳤습니다. 다시 시도해 주세요.");
				location.href = "parcel.jsp";
			</script>
		</c:when>
	</c:choose>
</body>
</html>