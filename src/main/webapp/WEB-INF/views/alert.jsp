<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경고</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>허용되지 않은 접근입니다.</h1>
			<p>로그인 후 이용해 주시기 바랍니다.</p>
		</div>
		<div class="alert alert-info">
			<strong>계정이 없으신가요?</strong> 가입하시려면 <a class="alert-link" style="cursor:pointer">회원 가입</a>
		</div>
	</div>
</body>
<script>
$(function() {
	$('.alert-link').click(function() {
		location.href="<c:url value="/" />";
		var width = '800';
		var height = '850';
		var left = Math.ceil((screen.width - width) / 2);
		var top = Math.ceil((screen.height - height) / 2);

		open('<c:url value="/member/signupForm" />', '_blank',
				'width=' + width + ', height=' + height + ', left='
						+ left + ', top=' + top);
	});
});
</script>
</html>