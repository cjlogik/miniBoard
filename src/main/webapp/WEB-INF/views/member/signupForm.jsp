<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
	<br>
	<div class="container">
		<h2>Ajax Test</h2>
		<p>Ajax Test에 회원으로 가입합니다.</p>
		<p>입력하신 정보는 사이트 이용과는 별도의 목적으로 사용되지 않습니다.</p>
		<br>
		<br>
		<form action="<c:url value='/member/signup' />" method="post" id="form">
			<div class="form-group">
				<label for="userID">아이디:</label>
				<input type="text" class="form-control" name="userID" id="userID" placeholder="사용하실 아이디를 입력하세요." readonly>
				<div class="text-muted" id="userIDMessage">사용하실 아이디를 입력하세요.</div>
			</div>
			<div class="form-group">
				<label for="userID">E-mail:</label>
				<input type="text" class="form-control" name="eMail" id="eMail" placeholder="이메일을 입력하세요.">
				<div class="text-muted" id="eMailMessage">비밀번호를 잊으셨을 경우 입력하신 이메일로 보내드립니다.</div>
			</div>
			<div class="form-group">
				<label for="password">비밀번호:</label>
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력하세요.">
				<div class="text-muted" id="passwordMessage">비밀번호는 8자 이상 입력하세요.</div>
			</div>
			<div class="form-group">
				<label for="password">비밀번호 확인:</label>
				<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 다시 입력하세요.">
				<div class="text-muted" id="passwordCheckMessage">동일한 비밀번호를 입력하세요.</div>
			</div>
			<button type="button" class="btn btn-primary" id="signup">가입</button>
		</form>
	</div>
</body>
<script>
$(function() {
	var password = '';
	var passwordCheck = '';

	$('#password, #passwordCheck').keyup(function(event) {
		if (event.keyCode === 13)
			$('#signup').click();

		password = $('#password').val();
		passwordCheck = $('#passwordCheck').val();

		if (password.length < 8)
			$('#passwordMessage').attr('class', 'text-danger');
		else
			$('#passwordMessage').attr('class', 'text-success');

		if (password.length > 7 && password === passwordCheck)
			$('#passwordCheckMessage').attr('class', 'text-success');
		else if (password.length > 7)
			$('#passwordCheckMessage').attr('class', 'text-danger');
		else
			$('#passwordCheckMessage').attr('class', 'text-muted');
	});

	$('#signup').click(function() {
		if (!$('#userID').val())
			$('#userID').click();

		password = $('#password').val();
		passwordCheck = $('#passwordCheck').val();

		if (password.length < 8)
			$('#password').select();
		else if (password !== passwordCheck)
			$('#passwordCheck').select();
		else
			$('#form').submit();
	});

	$('#userID').click(function() {
		var width = '800';
		var height = '270';
		var left = Math.ceil((screen.width - width) / 2);
	    var top = Math.ceil((screen.height - height) / 2); 

		open(
			'<c:url value="/member/checkForm" />', '',
			'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top
		);
	});

});
</script>
</html>