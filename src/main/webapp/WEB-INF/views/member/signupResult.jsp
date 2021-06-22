<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 결과</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" style="text-align:center">
		<c:choose>
			<c:when test="${sessionScope.userID != null}">
				<h1>
					${sessionScope.userID}님
					<br>
					가입을 축하드립니다.
				</h1>
				<br>
				<p>이 창은 5초후에 자동으로 닫힙니다.</p>
			</c:when>
			<c:otherwise>
				<h1>가입에 실패하였습니다.</h1>
				<br>
				<p>반복적으로 실패한 경우 관리자에게 문의해 주세요.</p>
				<p>5초후에 가입 화면으로 되돌아갑니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
<script>
$(function() {
	if (${sessionScope.userID == null})
		setTimeout($(location).attr('href', '<c:url value="/member/signupForm" />'), 5000);
	else
		setTimeout(function() { opener.location.reload(); close(); }, 5000);
});
</script>
</html>