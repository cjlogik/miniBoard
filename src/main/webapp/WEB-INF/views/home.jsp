<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax Test</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/navigator.jsp"%>
	<main role="main" class="container">
		<div class="starter-template">
			<h1>miniBoard에 오신 것을 환영합니다</h1>
			<p class="lead">
				Test 메시지 1번입니다.<br>
				테스트 Message 2번입니다.
			</p>
		</div>
	</main>
</body>
</html>