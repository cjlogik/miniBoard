<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<link rel="icon" href="<c:url value='/resources/img/android.svg' />">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js' />"></script>
<script src="<c:url value='/resources/js/popper.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
<br>
<div class="container">
	<h2>ID 중복 여부를 확인합니다.</h2>
	<div class="form-group">
		<label for="userID">아이디:</label>
		<input type="text" class="form-control" id="userID" placeholder="아이디를 입력하세요." autofocus>
		<div class="text-muted" id="userIDMessage">아이디를 입력하세요.</div>
	</div>
	<button type="button" class="btn btn-primary" id="check">중복확인</button>
	<button type="button" class="btn btn-primary" id="use" disabled>사용하기</button>
</div>
</body>
<script>
var userID = '';

$(function() {
	$('#use').click(function() {
		$('#userID', opener.document).val(userID);
		$('#userIDMessage', opener.document).attr('class', 'text-success');
		close();
	});

	$('#userID').keyup(function(event) {
		if (event.keyCode === 13)
			$('#check').click();
	});

	$('#check').click(function() {
		$('#use').attr('disabled', 'disabled');
		userID = $('#userID').val();
		if (userID.length < 1) {
			$('#userIDMessage').attr('class', 'text-danger');
			$('#userIDMessage').text('아이디를 입력하세요.');
			return;
		}

		$('#userIDMessage').attr('class', 'text-info');
		$('#userIDMessage').text('중복 여부를 확인중입니다.');

		$.ajax({
			url : "<c:url value='/member/check' />",
			type : "get",
			data : {
				userID : userID
			},
			success : function(result) {
				if (result) {
					$('#userIDMessage').attr('class', 'text-danger');
					$('#userIDMessage').text("사용할 수 없는 아이디입니다.");
					$('#userId').select();
				} else {
					$('#userIDMessage').attr('class', 'text-success');
					$('#userIDMessage').text("사용 가능한 아이디입니다.");
					$('#use').removeAttr('disabled');
					$('#userID').keyup(function(event) {
						if (event.keyCode === 13)
							$('#use').click();
					});
				}
			},
			error : function(e) {
				console.log(e);
			}
		});

	});
});
</script>
</html>